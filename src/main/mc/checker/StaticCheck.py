
"""
 * @author Dang Hoang Phuc 1712657
"""
from AST import *
from Visitor import *
from Utils import Utils
from StaticError import *
from copy import deepcopy as dc

class MType:
    def __init__(self, partype, rettype):
        self.partype = partype
        self.rettype = rettype

    def __str__(self):
        return str(self.partype) + ' ' + str(self.rettype)


class Symbol:
    def __init__(self, name, mtype, value=None, called=None, init=False):
        self.name = name
        self.mtype = mtype
        self.value = value
        self.called = called
        self.init = init

    def __str__(self):
        return self.name + ' ' + str(self.mtype) + ' ' + str(self.value)


class StaticChecker(BaseVisitor, Utils):
    def calculate(self, op, a, b):
        if op == '+':
            return a+b
        if op == '-':
            return a-b
        if op == '*':
            return a*b
        if op == '/':
            return a/b
        if op == '%':
            return a % b

    def __init__(self, ast):
        self.ast = ast
        # print(ast)
        self.global_envi = [
            Symbol("getInt", MType([], IntType()), called=True),
            Symbol("putIntLn", MType([IntType()], VoidType()), called=True),
            Symbol("putInt", MType([IntType()], VoidType()), called=True),
            Symbol("getFloat", MType([], FloatType()), called=True),
            Symbol("putFloat", MType([FloatType()], VoidType()), called=True),
            Symbol("putFloatLn", MType(
                [FloatType()], VoidType()), called=True),
            Symbol("putBool", MType([BoolType()], VoidType()), called=True),
            Symbol("putBoolLn", MType([BoolType()], VoidType()), called=True),
            Symbol("putString", MType(
                [StringType()], VoidType()), called=True),
            Symbol("putStringLn", MType(
                [StringType()], VoidType()), called=True),
            Symbol("putLn", MType([], VoidType()), called=True),
        ]
        # print(self.global_envi)
        self.lookup = Utils().lookup

    def check(self):
        self.visit(self.ast, self.global_envi)
        return ""

    def checkUnreachableStmt(self, ast, c):
        if c['isReturned'] or (c['inLoop'] and c['outLoop']):
            raise UnreachableStatement(ast)
        self.visit(ast, c)

    def initialValue(self, varType: Type):
        ret = None
        if isinstance(varType, IntType):
            ret = 0
        elif isinstance(varType, FloatType):
            ret = 0.0
        elif isinstance(varType, BoolType):
            ret = False
        elif isinstance(varType, ArrayType):
            ret = [self.initialValue(varType.eleType)
                   for i in range(0, varType.dimen)]
        return ret

    def visitProgram(self, ast, c):
        '''
            preProcess
        '''
        haveMain = False
        for decl in ast.decl:
            if isinstance(decl, VarDecl):
                for symbol in c:
                    if symbol.name == decl.variable:
                        raise Redeclared(Variable(), decl.variable)
                sym = Symbol(decl.variable, decl.varType,
                             self.initialValue(decl.varType), init=True)
                c.append(sym)
            else:
                if decl.name.name == 'main':
                    haveMain = True
                for symbol in c:
                    if symbol.name == decl.name.name:
                        raise Redeclared(Function(), decl.name.name)
                sym = Symbol(decl.name.name, MType(
                    [p.varType for p in decl.param], decl.returnType))
                c.append(sym)
        if not haveMain:
            raise NoEntryPoint()
        '''
            inProcess
        '''

        for x in ast.decl:
            if isinstance(x, FuncDecl):
                self.visit(x, c)
        '''
            afterProcess
        '''
        for s in c:
            if isinstance(s.mtype, MType):
                if s.name != 'main' and not s.called:
                    raise UnreachableFunction(s.name)

    def visitVarDecl(self, ast, c):
        s = self.lookup(ast.variable, c['inner'], lambda x: x.name)
        if s:
            raise Redeclared(Variable(), ast.variable)
        else:
            symbol = Symbol(ast.variable, ast.varType)
            c['inner'].append(symbol)

    def visitFuncDecl(self, ast, c):
        '''
            preProcess
        '''
        env = {
            'global': c,
            'outter': [],
            'inner': [],
            'inLoop': False,
            'outLoop': False,
            'funcType': ast.returnType,
            'isReturned': False,
            'funcName': ast.name.name
        }
        for p in ast.param:
            s = self.lookup(p.variable, env['inner'], lambda x: x.name)
            if s:
                raise Redeclared(Parameter(), p.variable)
            sym = Symbol(p.variable, p.varType, init=True)
            env['inner'].append(sym)

        '''
            inProcess
        '''
        for member in ast.body.member:
            if isinstance(member, VarDecl):
                s = self.lookup(member.variable,
                                env['inner'], lambda x: x.name)
                if s:
                    raise Redeclared(Variable(), member.variable)
                else:
                    symbol = Symbol(member.variable, member.varType)
                    env['inner'].append(symbol)
            else:
                self.checkUnreachableStmt(member, env)
        '''
            afterProcess : update env_?
        '''
        if not env['isReturned'] and not isinstance(ast.returnType, VoidType):
            raise FunctionNotReturn(ast.name.name)

    def visitBlock(self, ast, c):
        #pre
        env = {
            'global': c['global'],
            'outter': c['inner'] + c['outter'],
            'inner': [],
            'inLoop': c['inLoop'],
            'outLoop': c['outLoop'],
            'funcType': c['funcType'],
            'isReturned': c['isReturned'],
            'funcName': c['funcName'],
        }

        #in
        for member in ast.member:
            self.checkUnreachableStmt(member, env)

        #after
        c['inner'] = env['outter'][0:len(c['inner'])]
        c['inLoop'] = env['inLoop']
        c['outLoop'] = env['outLoop']
        c['funcType'] = env['funcType']
        c['isReturned'] = env['isReturned']

    def visitBinaryOp(self, ast, c):
        basic = ('+', '-', '*', '/', '%')
        boolean = ('<', '<=', '>', '>=', '==', '!=')
        equal = ('==', '!=')
        assign = ('=')
        andor = ('&&', '||')
        # take an onject type ex: IntType() as argument
        if 'inCell' in c.keys():
            left = self.visit(ast.left, c)
            right = self.visit(ast.right, c)
            if type(left) is IntLiteral and type(right) is IntLiteral:
                if ast.op not in basic:
                    raise TypeMismatchInExpression(ast)
                # left = self.visit(ast.left, c)
                # right = self.visit(ast.right, c)
                return IntLiteral(value=self.calculate(ast.op, left.value, right.value))
            

        if ast.op is assign:
            typeRight = self.visit(ast.right, c) 
            typeLeft = self.visit(ast.left, (c,False)) if type(ast.left) is Id else self.visit(ast.left, c)
        else:
            typeLeft = self.visit(ast.left, c)
            typeRight = self.visit(ast.right, c)
        if isinstance(typeLeft, IntLiteral):
            typeLeft = IntType()
        if isinstance(typeRight, IntLiteral):
            typeRight = IntType()

        def isSameType(left, right):
            return type(left) == type(right)

        def checkType(left, right, op):
            if op in basic:
                if type(left) not in (FloatType, IntType):
                    raise TypeMismatchInExpression(ast)
                if type(right) not in (FloatType, IntType):
                    raise TypeMismatchInExpression(ast)
                if isSameType(left, right):
                    if type(left) is IntType:
                        return IntType()
                if op is '%':
                    raise TypeMismatchInExpression(ast)
                return FloatType()

            if op in assign:
                if not isinstance(ast.left, LHS):
                    raise NotLeftValue(ast.left)
                if type(left) in (VoidType, ArrayPointerType, ArrayType):
                    raise TypeMismatchInExpression(ast)

                if type(left) is FloatType:
                    if type(right) not in (IntType, FloatType):
                        raise TypeMismatchInExpression(ast)
                    return FloatType()
                if isSameType(left, right):
                    return left
                raise TypeMismatchInExpression(ast)

            if op in boolean:
                if op in equal:
                    if isSameType(left, right):
                        if type(left) in (IntType, BoolType):
                            return BoolType()
                    raise TypeMismatchInExpression(ast)
                if type(left) not in (IntType, FloatType):
                    raise TypeMismatchInExpression(ast)
                if type(right) not in (IntType, FloatType):
                    raise TypeMismatchInExpression(ast)
                return BoolType()
            if op in andor:
                if type(left) is BoolType and isSameType(left, right):
                    return BoolType()
                raise TypeMismatchInExpression(ast)

        return checkType(typeLeft, typeRight, ast.op)

    def visitUnaryOp(self, ast, c):
        if 'inCell' in c.keys():
            if type(ast.body) is IntLiteral:
                if ast.op is '-':
                    return IntLiteral(-ast.body.value)
        t = self.visit(ast.body, c)
        if ast.op is '-':
            if type(t) not in (FloatType, IntType):
                raise TypeMismatchInExpression(ast)
            return type(t)()
        if ast.op is '!':
            if type(t) is not BoolType:
                raise TypeMismatchInExpression(ast)
            return BoolType()

    def visitIntLiteral(self, ast, c):
        if 'inCell' in c.keys(): return IntLiteral(ast.value)
        return IntType()

    def visitFloatLiteral(self, ast, c):
        return FloatType()

    def visitStringLiteral(self, ast, c):
        return StringType()

    def visitBooleanLiteral(self, ast, c):
        return BoolType()

    def visitId(self, ast, c):
        if type(c) is dict:
            env = c
            s = self.lookup(ast.name, env['inner'] + env['outter'] +
                            env['global'], lambda x: x.name)
            if s:
                if type(s.mtype) in (IntType, FloatType, StringType, BoolType):
                    if not s.init: 
                        raise UninitializedVariable(s.name)
                return s.mtype
            else:
                raise Undeclared(Identifier(), ast.name)
        elif c[1]:
            env = c[0]
            s = self.lookup(ast.name, env['inner'] + env['outter'] +
                            env['global'], lambda x: x.name)
            if s:
                if (env['funcName'] != s.name):
                    s.called = True
                return s.mtype
            else:
                raise Undeclared(Function(), ast.name)
        else:
            env = c[0]
            s = self.lookup(ast.name, env['inner'] + env['outter'] +
                            env['global'], lambda x: x.name)
            if s:
                if type(s.mtype) in (IntType, FloatType, StringType, BoolType):
                    s.init = True
                return s.mtype
            else:
                raise Undeclared(Identifier(), ast.name)

    def visitCallExpr(self, ast, c):
        res = self.visitId(ast.method, (c,True))
        if not isinstance(res, MType):
            raise TypeMismatchInExpression(ast)
        if len(res.partype) != len(ast.param):
            raise TypeMismatchInExpression(ast)

        def checkType(par, exp):

            if type(par) in (ArrayPointerType, ArrayType):
                if type(exp) not in (ArrayType, ArrayPointerType) or type(par.eleType) is not type(exp.eleType):
                    raise TypeMismatchInExpression(ast)

            elif type(par) is FloatType:
                if type(exp) not in (IntType, FloatType):
                    
                    raise TypeMismatchInExpression(ast)

            elif type(par) is not type(exp):
                raise TypeMismatchInExpression(ast)

        paramList = [self.visit(x, c) for x in ast.param]
        for item in list(zip(res.partype, paramList)):
            checkType(item[0], item[1])
        return res.rettype

    def visitArrayCell(self, ast, c):
        
        typeId = self.visit(ast.arr, c)
        if 'inCell' in c.keys():
            backup = c['inCell']
        else: backup = None
        c['inCell'] = True
        typeIdx = self.visit(ast.idx, c)
        if isinstance(typeIdx, IntLiteral) and isinstance(typeId, ArrayType):
            if typeIdx.value < 0 or typeIdx.value >= typeId.dimen:
                raise IndexOutOfRange(ast)
        if type(typeId) not in (ArrayPointerType, ArrayType) or type(typeIdx) not in (IntLiteral, IntType):
            raise TypeMismatchInExpression(ast)

        if backup is None: del c['inCell']
        else: 
            c['inCell'] = backup
        return typeId.eleType

    def visitIf(self, ast, c):
        backupReturn = c['isReturned']
        backupOutLoop = c['outLoop']
        c['isReturned'] = False
        expr = self.visit(ast.expr, c)
        if type(expr) is not BoolType:
            raise TypeMismatchInStatement(ast)
        self.visit(ast.thenStmt, c)

        if ast.elseStmt:
            backupReturn1 = c['isReturned']
            backupOutLoop1 = c['outLoop']

            c['isReturned'] = False
            c['outLoop'] = False
            self.visit(ast.elseStmt, c)
            if (backupReturn1 and c['outLoop']) or (backupOutLoop1 and c['isReturned']):
                c['outLoop'] = True
                c['isReturned'] =False
                return
            c['isReturned'] = backupReturn or (
                backupReturn1 and c['isReturned'])
            c['outLoop'] = backupOutLoop or (backupOutLoop1 and c['outLoop'])

        else:
            c['isReturned'] = backupReturn
            c['outLoop'] = backupOutLoop

    def visitFor(self, ast, c):
        backup = c['isReturned']
        backupIn = c['inLoop']
        c['inLoop'] = True
        backup = c['isReturned']
        expr1 = self.visit(ast.expr1, c)
        expr2 = self.visit(ast.expr2, c)
        expr3 = self.visit(ast.expr3, c)
        if type(expr1) is not IntType or type(expr3) is not IntType or type(expr2) is not BoolType:
            raise TypeMismatchInStatement(ast)
        _ = self.visit(ast.loop, c)
        c['isReturned'] = backup
        c['inLoop'] = backupIn
        c['outLoop'] = False

    def visitDowhile(self, ast, c):
        backupIn = c['inLoop']
        c['inLoop'] = True

        _ = [self.checkUnreachableStmt(stmt, c) for stmt in ast.sl]
        expr = self.visit(ast.exp, c)
        if type(expr) is not BoolType:
            raise TypeMismatchInStatement(ast)
        c['inLoop'] = backupIn
        c['outLoop'] = False

    def visitBreak(self, ast, c):
        if not c['inLoop']:
            raise BreakNotInLoop()
        c['outLoop'] = True

    def visitContinue(self, ast, c):
        if not c['inLoop']:
            raise ContinueNotInLoop()
        c['outLoop'] = True

    def visitReturn(self, ast, c):
        require = c['funcType']
        if type(require) is VoidType:
            if ast.expr:
                raise TypeMismatchInStatement(ast)
        elif not ast.expr:
            raise TypeMismatchInStatement(ast)
        else:
            expr = self.visit(ast.expr, c)
            if type(require) is not type(expr):
                if type(require) is FloatType:
                    if type(expr) not in (IntType, FloatType):
                        raise TypeMismatchInStatement(ast)
                elif type(require) is ArrayPointerType:
                    if type(expr) not in (ArrayType, ArrayPointerType):
                        raise TypeMismatchInStatement(ast)
                    if type(expr.eleType) is not type(require.eleType):
                        raise TypeMismatchInStatement(ast)
                else:
                    raise TypeMismatchInStatement(ast)
            elif type(require) is ArrayPointerType:
                if type(expr.eleType) is not type(require.eleType):
                    raise TypeMismatchInStatement(ast)
        c['isReturned'] = True
