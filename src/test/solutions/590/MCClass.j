.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 5
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	iconst_1
	ldc 1.5
	bipush 10
	bipush 10
	iconst_1
	iadd
	invokestatic MCClass/foo(IFII)F
	invokestatic io/putFloat(F)V
	return
Label1:
.end method

.method public static foo(IFII)F
.limit stack 2
.limit locals 4
.var 0 is a I from Label2 to Label1
.var 1 is b F from Label3 to Label1
.var 2 is c I from Label4 to Label1
.var 3 is d I from Label5 to Label1
Label2:
Label3:
Label4:
Label5:
Label0:
	iload_0
	i2f
	fload_1
	fadd
	iload_2
	i2f
	fadd
	iload_3
	i2f
	fadd
	freturn
	ldc 1
	freturn
Label1:
.end method
