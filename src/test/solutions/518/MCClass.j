.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static c I

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static add(I)V
.limit stack 2
.limit locals 1
.var 0 is a I from Label2 to Label1
Label2:
Label0:
	iload_0
	getstatic MCClass/c I
	iadd
	dup
	putstatic MCClass.c I
	pop
	return
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	iconst_2
	dup
	putstatic MCClass.c I
	pop
	bipush 10
	invokestatic MCClass/add(I)V
	getstatic MCClass/c I
	invokestatic io/putInt(I)V
	return
Label1:
.end method
