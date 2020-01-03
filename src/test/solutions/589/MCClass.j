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
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is x I from Label2 to Label1
Label0:
Label2:
	iconst_1
	ldc 1.5
	bipush 10
	bipush 10
	iconst_1
	iadd
	invokestatic MCClass/foo(IFII)I
	dup
	istore_1
	pop
	iload_1
	invokestatic io/putInt(I)V
	return
Label1:
.end method

.method public static foo(IFII)I
.limit stack 1
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
	bipush 99
	ireturn
	iconst_1
	ireturn
Label1:
.end method
