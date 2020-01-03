from Utils import *
from StaticCheck import *
from StaticError import *
from Emitter import Emitter
from Frame import Frame
from abc import ABC, abstractmethod


class CodeGenerator(Utils):
    def __init__(self):
        self.libName = "io"

    def init(self):
        return [
            Symbol("getInt", MType([], IntType()), CName(self.libName)),
            Symbol("putInt", MType([IntType()],
                                   VoidType()), CName(self.libName)),
            Symbol("putIntLn", MType([IntType()],
                                     VoidType()), CName(self.libName)),
            Symbol("getFloat", MType([], FloatType()), CName(self.libName)),
            Symbol("putFloat", MType([FloatType()],
                                     VoidType()), CName(self.libName)),
            Symbol("putFloatLn", MType(
                [FloatType()], VoidType()), CName(self.libName)),
            Symbol("putBool", MType([BoolType()],
                                    VoidType()), CName(self.libName)),
            Symbol("putBoolLn", MType([BoolType()],
                                      VoidType()), CName(self.libName)),
            Symbol("putString", MType([StringType()],
                                      VoidType()), CName(self.libName)),
            Symbol("putStringLn", MType(
                [StringType()], VoidType()), CName(self.libName)),
            Symbol("putLn", MType([], VoidType()), CName(self.libName))
        ]

    def gen(self, ast, dir_):
        #ast: AST
        #dir_: String
        gl = self.init()
        gc = CodeGenVisitor(ast, gl, dir_)
        context = Context(gl, False)
        gc.visit(ast, context)


class CName():
    def __init__(self, value):
        #value: String

        self.value = value


class Context():
    def __init__(self, sym, frame=None, is_body=False, func_param=[], return_type=None, is_main=False):
        self.sym = [*sym]
        self.frame = frame
        self.func_param = [*func_param]
        self.is_body = is_body
        self.return_type = return_type
        self.is_main = is_main

    def dup(self):
        return Context(
            self.sym,
            self.frame,
            self.is_body,
            self.func_param,
            self.return_type,
            self.is_main
        )

    def find(self, name):
        for x in reversed(self.sym):
            if x.name == name:
                return x
        return None


class CodeGenVisitor(BaseVisitor, Utils):
    def __init__(self, astTree, env, dir_):
        #astTree: AST
        #env: List[Symbol]
        #dir_: File
        self.astTree = astTree
        self.env = env
        self.className = "MCClass"
        self.path = dir_
        self.emit = Emitter(self.path + "/" + self.className + ".j")

    def visitProgram(self, ast, c):
        #ast: Program
        #c: Any

        # Create header
        self.emit.printout(self.emit.emitPROLOG(
            self.className, "java.lang.Object"))

        # Get all decl init

        for decl in ast.decl:
            if isinstance(decl, VarDecl):
                self.emit.printout(self.emit.emitATTRIBUTE(
                    decl.variable, decl.varType))
                temp = Symbol(decl.variable, decl.varType)
                c.sym.append(temp)
            else:
                temp = Symbol(decl.name.name, MType(
                    [x.varType for x in decl.param], decl.returnType), CName(self.className))
                c.sym.append(temp)

        # Initial class method (object constructor)
        init_frame = Frame('<clinit>', VoidType())
        self.emit.printout(self.emit.emitMETHOD(
            '<clinit>', MType([], VoidType()), False, init_frame))

        # generate default constructor
        for x in ast.decl:
            if isinstance(x, VarDecl) and isinstance(x.varType, ArrayType):
                self.emit.printout(self.emit.emitPUSHICONST(
                    x.varType.dimen, init_frame))
                self.emit.printout(self.emit.emitNEWARRAY(x.varType.eleType))
                self.emit.printout(self.emit.emitPUTSTATIC(
                    self.className + '.' + x.variable, x.varType, init_frame))
        self.emit.printout(self.emit.emitLIMITSTACK(
            init_frame.getMaxOpStackSize()))
        self.emit.printout(self.emit.emitLIMITLOCAL(init_frame.getMaxIndex()))
        self.emit.printout(self.emit.emitRETURN(VoidType(), init_frame))
        

        self.emit.printout(self.emit.emitENDMETHOD(init_frame))

        #start visit others
        for decl in ast.decl:
            if isinstance(decl, FuncDecl):
                self.visit(decl, c)
        self.emit.emitEPILOG()
        return

    def visitFuncDecl(self, ast, c):
        method_header = ''
        frame = None
        if (ast.name.name == 'main'):
            frame = Frame('main', VoidType())
            method_header = self.emit.emitMETHOD('main', MType(
                [ArrayPointerType(StringType())], VoidType()), True, frame)
            c.is_main = True

        else:
            c.is_main = False
            frame = Frame(ast.name.name, ast.returnType)
            method_header = self.emit.emitMETHOD(ast.name.name, MType(
                [x.varType for x in ast.param], ast.returnType), True, frame)

        self.emit.printout(method_header)
        c.frame = frame
        c.func_param = ast.param
        c.is_body = True
        c.return_type = ast.returnType
        result = self.visit(ast.body, c)

        self.emit.printout(self.emit.emitLIMITSTACK(frame.getMaxOpStackSize()))
        self.emit.printout(self.emit.emitLIMITLOCAL(frame.getMaxIndex()))

        self.emit.printout(result)
        self.emit.printout(self.emit.emitENDMETHOD(frame))

    def visitBlock(self, ast, c):
        c = c.dup()
        frame = c.frame
        frame.enterScope(c.is_body)
        result = []
        block_header = []
        start_label = frame.getStartLabel()
        end_label = frame.getEndLabel()

        # Before enter scope, params insert/init
        if (c.is_body):
            if (c.is_main):
                t = self.emit.emitVAR(frame.getNewIndex(), 'args', ArrayPointerType(
                    StringType()), start_label, end_label, frame)
                block_header.append(t)
            else:
                for decl in c.func_param:
                    t1, t2 = self.visit(decl, c)
                    block_header.append(t1)
                    result += t2

        # Inside block
        result.append(self.emit.emitLABEL(start_label, frame))
        for stmt in ast.member:
            if isinstance(stmt, VarDecl):
                head, code = self.visit(stmt, c)
                block_header.append(head)
                result += code
            elif isinstance(stmt, Expr):
                code = self.visit(stmt, c)[0]
                result += code
                if frame.getStackSize() > 0:
                    result.append(self.emit.emitPOP(c.frame))
            else:
                c1 = c.dup()
                c1.is_body = False
                x = self.visit(stmt, c1)
                result += x
        if isinstance(c.return_type, VoidType) and (c.is_body):
            result.append(self.emit.emitRETURN(c.return_type, frame))
            
        elif isinstance(c.return_type, IntType) and (c.is_body):
            result.append(self.emit.emitPUSHICONST(1, frame))
            result.append(self.emit.emitRETURN(c.return_type, frame))
        elif isinstance(c.return_type, FloatType) and (c.is_body):
            result.append(self.emit.emitPUSHFCONST(1, frame))
            result.append(self.emit.emitRETURN(c.return_type, frame))
        elif isinstance(c.return_type, BoolType) and (c.is_body):
            result.append(self.emit.emitPUSHICONST(1, frame))
            result.append(self.emit.emitRETURN(c.return_type, frame))


        result.append(self.emit.emitLABEL(end_label, frame))

        frame.exitScope()
        return ''.join(block_header + result)

    def visitVarDecl(self, ast, c):
        frame = c.frame
        new_label = frame.getNewLabel()
        index = frame.getNewIndex()
        header = self.emit.emitVAR(
            index, ast.variable, ast.varType, new_label, frame.getEndLabel(), frame)

        result = [self.emit.emitLABEL(new_label, frame)]
        c.sym.append(Symbol(ast.variable, ast.varType, index))
        if isinstance(ast.varType, ArrayType):
            result.append(self.emit.emitPUSHICONST(str(ast.varType.dimen), frame))
            result.append(self.emit.emitNEWARRAY(ast.varType.eleType))
            result.append(self.emit.emitWRITEVAR(ast.variable, ast.varType, index, frame))
        return header, result

    def visitCallExpr(self, ast, c):
        #ast: CallExpr
        #c: Any
        frame = c.frame
        symbol = c.find(ast.method.name)
        cname = symbol.value.value
        result = []
        for p, st in zip(ast.param, symbol.mtype.partype):
            code, pt = self.visit(p, c)
            result += code
            if isinstance(pt, IntType) and isinstance(st, FloatType):
                result.append(self.emit.emitI2F(frame))
        result.append(self.emit.emitINVOKESTATIC(
            str(cname) + "/" + ast.method.name, symbol.mtype, frame))
        return result, symbol.mtype.rettype

    def visitId(self, ast, c):
        frame = c.frame
        symbol = c.find(ast.name)
        result = []
        if (symbol and symbol.value is not None):
            result.append(self.emit.emitREADVAR(
                symbol.name, symbol.mtype, symbol.value, frame))
        else:
            result.append(self.emit.emitGETSTATIC(
                self.className + '/' + ast.name, symbol.mtype, frame))
        return result, symbol.mtype

    def visitIntLiteral(self, ast, c):
        frame = c.frame
        return [self.emit.emitPUSHICONST(ast.value, frame)], IntType()

    def visitFloatLiteral(self, ast, c):
        frame = c.frame
        return [self.emit.emitPUSHFCONST(ast.value, frame)], FloatType()

    def visitBooleanLiteral(self, ast, c):
        frame = c.frame
        result = self.emit.emitPUSHCONST("true" if ast.value else "false", IntType(), c.frame)
        return [result], BoolType()

    def visitStringLiteral(self, ast, c):
        frame = c.frame
        return [self.emit.emitPUSHCONST(str(ast.value), StringType(), c.frame)], StringType()

    def visitBinaryOp(self, ast, c):
        frame = c.frame
        result = []
        retType = None
        if ast.op in ['&&', '||']:
            end_label = frame.getNewLabel()
            left, leftType = self.visit(ast.left, c)
            result += left
            result.append(self.emit.emitDUP(frame))

            if ast.op == '||':
                result.append(self.emit.emitIFTRUE(end_label, frame))
            else:
                result.append(self.emit.emitIFFALSE(end_label, frame))
 
            right, rightType = self.visit(ast.right, c)
            result += right

            if ast.op == '||':
                code = self.emit.emitOROP(frame)
            else:
                code = self.emit.emitANDOP(frame)
            result.append(code)

            result.append(self.emit.emitLABEL(end_label, frame))
            retType = BoolType()

        elif ast.op in ['==','!=']:
            left, leftType = self.visit(ast.left, c)
            right, rightType = self.visit(ast.right, c)
            result += left
            result += right
            result.append(self.emit.emitREOP(ast.op, leftType, frame))
            retType = leftType

        elif ast.op in ['>=', '<=', '>', '<']:
            left, leftType = self.visit(ast.left, c)
            right, rightType = self.visit(ast.right, c)
            if isinstance(leftType, FloatType) or isinstance(rightType, FloatType):
                if isinstance(leftType, IntType):
                    result += left
                    result.append(self.emit.emitI2F(frame))
                    result += right
                elif isinstance(rightType, IntType):
                    result += left
                    result += right
                    result.append(self.emit.emitI2F(frame))
                else:
                    result += left
                    result += right
                result.append(self.emit.emitREOPFlOAT(ast.op, FloatType(), frame))
                retType = FloatType()
            else:
                result += left
                result += right
                if isinstance(leftType, IntType):
                    result.append(self.emit.emitREOP(ast.op, leftType, frame))
                else:
                    result.append(self.emit.emitREOPFlOAT(ast.op, leftType, frame))

                retType = leftType

        elif ast.op in ['%']:
            left, leftType = self.visit(ast.left, c)
            right, rightType = self.visit(ast.right, c)
            result += left
            result += right
            result.append(self.emit.emitMOD(frame))
            retType = IntType()

        elif ast.op in ['+', '-']:
            left, leftType = self.visit(ast.left, c)
            right, rightType = self.visit(ast.right, c)
            if isinstance(leftType, FloatType) or isinstance(rightType, FloatType):
                if isinstance(leftType, IntType):
                    result += left
                    result.append(self.emit.emitI2F(frame))
                    result += right
                elif isinstance(rightType, IntType):
                    result += left
                    result += right
                    result.append(self.emit.emitI2F(frame))
                else:
                    result += left
                    result += right
                result.append(self.emit.emitADDOP(ast.op, FloatType(), frame))
                retType = FloatType()
            else:
                result += left
                result += right
                result.append(self.emit.emitADDOP(ast.op, leftType, frame))
                retType = leftType
        
        elif ast.op in ['*', '/']:
            left, leftType = self.visit(ast.left, c)
            right, rightType = self.visit(ast.right, c)

            if isinstance(leftType, FloatType) or isinstance(rightType, FloatType):
                if isinstance(leftType, IntType):
                    result += left
                    result.append(self.emit.emitI2F(frame))
                    result += right
                elif isinstance(rightType, IntType):
                    result += left
                    result += right
                    result.append(self.emit.emitI2F(frame))
                else:
                    result += left
                    result += right
                result.append(self.emit.emitMULOP(ast.op, FloatType(), frame))
                retType = FloatType()
            else:
                result += left
                result += right
                result.append(self.emit.emitMULOP(ast.op, leftType, frame))
                retType = leftType

        elif ast.op in ['=']:
            if isinstance(ast.left, Id):
                right, rightType = self.visit(ast.right, c)
                result += right
                symbol = c.find(ast.left.name)
                if isinstance(rightType, IntType) and isinstance(symbol.mtype, FloatType):
                    result.append(self.emit.emitI2F(c.frame))
                result.append(self.emit.emitDUP(c.frame))
                if symbol.value is not None:
                    result.append(self.emit.emitWRITEVAR(ast.left.name, symbol.mtype, symbol.value, c.frame))
                else:
                    result.append(self.emit.emitPUTSTATIC(self.className + '.' + symbol.name, symbol.mtype, c.frame))
                retType = symbol.mtype
            elif isinstance(ast.left, ArrayCell):
                left, left_type = self.visit(ast.left.arr, c)
                result += left
                itmp, iType = self.visit(ast.left.idx, c)   
                result += itmp
                right, right_type = self.visit(ast.right, c)
                result += right
                if isinstance(right_type, IntType) and isinstance(left_type.eleType, FloatType):
                    result.append(self.emit.emitI2F(c.frame)) 
                result.append(self.emit.emitDUPX2(c.frame))
                result.append(self.emit.emitASTORE(left_type.eleType, c.frame))

                retType = left_type.eleType

        return result, retType
        
    def visitUnaryOp(self, ast, c):
        frame = c.frame
        result, valType = self.visit(ast.body, c)
        if ast.op == '-':
            result.append(self.emit.emitNEGOP(valType, frame))
        elif ast.op == '!':
            result.append(self.emit.emitNOT(valType, frame))
            c.frame.pop()

        return result, valType

    def visitArrayCell(self, ast, c):
        result = []
        tmp, ctype = self.visit(ast.arr, c)
        result += tmp
        itmp, itype = self.visit(ast.idx, c)
        result += itmp
        result.append(self.emit.emitALOAD(ctype.eleType, c.frame))
        return result, ctype.eleType

    def visitFor(self, ast, c):
        frame = c.frame
        frame.enterLoop()
        result = []

        # Before for, do expr1 
        result += self.visit(ast.expr1, c)[0]
        if c.frame.getStackSize() > 0:
            result.append(self.emit.emitPOP(c.frame))
        # Label for next loop (condition expr)
        start_label = frame.getNewLabel()
        continue_label = str(frame.getContinueLabel())
        end_label = str(frame.getBreakLabel())

        result.append(self.emit.emitLABEL(start_label, frame))

        # Code gen for expr 2
        result += self.visit(ast.expr2,c)[0]
        result.append(self.emit.emitIFFALSE(str(end_label), frame))
        
        if isinstance(ast.loop, Expr): 
            result += self.visit(ast.loop, c)[0]
            if c.frame.getStackSize() > 0:
                result.append(self.emit.emitPOP(c.frame))
        else:
            result += self.visit(ast.loop, c)
        result.append(self.emit.emitLABEL(continue_label, frame))
        result += self.visit(ast.expr3, c)[0]
        if c.frame.getStackSize() > 0:
            result.append(self.emit.emitPOP(c.frame))
        result.append(self.emit.emitGOTO(str(start_label), frame))
        result.append(self.emit.emitLABEL(end_label, frame))
        frame.exitLoop()

        return result
    
    def visitIf(self, ast, c):
        frame = c.frame
        result = []
        result += self.visit(ast.expr, c)[0]
        end_label = frame.getNewLabel()

        if (ast.elseStmt):
            else_label = frame.getNewLabel()

            result.append(self.emit.emitIFFALSE(else_label, frame))
            if isinstance(ast.thenStmt, Expr):
                result += self.visit(ast.thenStmt, c)[0]
                if c.frame.getStackSize() > 0:
                    result.append(self.emit.emitPOP(c.frame))
            else:
                result += self.visit(ast.thenStmt, c)
            
            result.append(self.emit.emitGOTO(str(end_label), frame))
            result.append(self.emit.emitLABEL(else_label, frame))

            if (ast.elseStmt): 
                if isinstance(ast.elseStmt, Expr):
                    result += self.visit(ast.elseStmt, c)[0]
                    if c.frame.getStackSize() > 0:
                        result.append(self.emit.emitPOP(c.frame))
                else:
                    result += self.visit(ast.elseStmt, c)
        else:
            result.append(self.emit.emitIFFALSE(end_label, frame))
            if isinstance(ast.thenStmt, Expr):
                result += self.visit(ast.thenStmt, c)[0]
                if c.frame.getStackSize() > 0:
                    result.append(self.emit.emitPOP(c.frame))
            else:
                result += self.visit(ast.thenStmt, c)
        result.append(self.emit.emitLABEL(end_label, frame))
        return result
    
    def visitDowhile(self, ast, c):
        frame = c.frame
        frame.enterLoop()
        result = []
        start_label = str(frame.getContinueLabel())
        end_label = str(frame.getBreakLabel())
        c.break_label = end_label
        c.continue_label = start_label
        result.append(self.emit.emitLABEL(start_label, frame))

        for stmt in ast.sl:
            if isinstance(stmt, Expr):
                result += self.visit(stmt, c)[0]
                if c.frame.getStackSize() > 0:
                    result.append(self.emit.emitPOP(c.frame))
            else:
                result += self.visit(stmt, c)
            
        result += self.visit(ast.exp, c)[0]
        result.append(self.emit.emitIFFALSE(end_label, frame))
        result.append(self.emit.emitGOTO(str(start_label), frame))
        result.append(self.emit.emitLABEL(end_label, frame))
        frame.exitLoop()
        return result
    
    def visitBreak(self, ast, c):
        frame = c.frame
        result = []
        result.append(self.emit.emitGOTO(str(frame.getBreakLabel()), c.frame))
        return result
    
    def visitContinue(self, ast, c):
        frame = c.frame
        result = []
        result.append(self.emit.emitGOTO(str(frame.getContinueLabel()), c.frame))
        return result
    
    def visitReturn(self, ast, c):
        frame = c.frame
        return_type = c.return_type
        result = []
        if not isinstance(c.return_type, VoidType):
            code, rType = self.visit(ast.expr, c)
            result += code
            if isinstance(rType, IntType) and isinstance(return_type, FloatType):
                result.append(self.emit.emitI2F(frame))
        result.append(self.emit.emitRETURN(return_type, frame))
        return result
        


