.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static a [I
.field static b [F

.method public <clinit>()V
	iconst_1
	newarray int
	putstatic MCClass.a [I
	iconst_1
	newarray float
	putstatic MCClass.b [F
.limit stack 1
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 6
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	getstatic MCClass/b [F
	iconst_0
	getstatic MCClass/a [I
	iconst_0
	iconst_1
	dup_x2
	iastore
	i2f
	dup_x2
	fastore
	pop
	getstatic MCClass/b [F
	iconst_0
	faload
	invokestatic io/putFloat(F)V
	return
Label1:
.end method
