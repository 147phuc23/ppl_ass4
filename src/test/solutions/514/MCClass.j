.source MCClass.java
.class public MCClass
.super java.lang.Object

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
	iconst_1
	iconst_2
	iadd
	iconst_3
	iadd
	invokestatic io/putInt(I)V
	iconst_1
	iconst_2
	iadd
	iconst_3
	isub
	invokestatic io/putInt(I)V
	iconst_1
	iconst_2
	iadd
	iconst_3
	ineg
	isub
	invokestatic io/putInt(I)V
	return
Label1:
.end method
