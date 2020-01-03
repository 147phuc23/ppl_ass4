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
.limit stack 3
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	getstatic MCClass/a [I
	iconst_1
	iaload
	getstatic MCClass/a [I
	iconst_2
	iaload
	iadd
	invokestatic io/putInt(I)V
	return
Label1:
.end method
