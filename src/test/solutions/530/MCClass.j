.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 3
.limit locals 3
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a I from Label2 to Label1
.var 2 is b I from Label3 to Label1
Label0:
Label2:
Label3:
Label4:
	iconst_3
	bipush 7
	iconst_3
	idiv
	iadd
	dup
	istore_1
	dup
	istore_2
	pop
	iload_1
	invokestatic io/putIntLn(I)V
	iload_2
	invokestatic io/putIntLn(I)V
Label5:
	return
Label1:
.end method
