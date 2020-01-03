.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static a I

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	bipush 19
	dup
	putstatic MCClass.a I
	pop
	getstatic MCClass/a I
	iconst_1
	imul
	getstatic MCClass/a I
	idiv
	iconst_2
	iadd
	iconst_3
	iadd
	invokestatic io/putInt(I)V
	return
Label1:
.end method
