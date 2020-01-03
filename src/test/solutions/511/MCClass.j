.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static a [I

.method public <clinit>()V
	bipush 10
	newarray int
	putstatic MCClass.a [I
.limit stack 1
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 6
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	getstatic MCClass/a [I
	iconst_1
	getstatic MCClass/a [I
	iconst_2
	bipush 8
	dup_x2
	iastore
	dup_x2
	iastore
	pop
	getstatic MCClass/a [I
	iconst_0
	iconst_0
	dup_x2
	iastore
	pop
	getstatic MCClass/a [I
	iconst_1
	iaload
	getstatic MCClass/a [I
	iconst_2
	iaload
	getstatic MCClass/a [I
	getstatic MCClass/a [I
	iconst_0
	iaload
	iaload
	imul
	iadd
	invokestatic io/putInt(I)V
	return
Label1:
.end method
