.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static a Z
.field static b Z

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
	imul
	invokestatic io/putInt(I)V
	iconst_2
	ineg
	iconst_3
	ineg
	imul
	invokestatic io/putInt(I)V
	iconst_1
	iconst_2
	idiv
	invokestatic io/putInt(I)V
	iconst_1
	iconst_2
	ineg
	idiv
	invokestatic io/putInt(I)V
	return
Label1:
.end method
