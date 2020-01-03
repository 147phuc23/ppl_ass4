.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static a [Z

.method public <clinit>()V
	bipush 10
	newarray boolean
	putstatic MCClass.a [Z
.limit stack 1
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 6
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	getstatic MCClass/a [Z
	iconst_0
	iconst_1
	dup_x2
	bastore
	pop
	getstatic MCClass/a [Z
	iconst_1
	getstatic MCClass/a [Z
	iconst_0
	baload
	dup
	ifgt Label2
	getstatic MCClass/a [Z
	iconst_2
	baload
	dup
	ifle Label3
	getstatic MCClass/a [Z
	iconst_3
	baload
	iand
Label3:
	ior
Label2:
	dup_x2
	bastore
	pop
	getstatic MCClass/a [Z
	iconst_1
	baload
	invokestatic io/putBool(Z)V
	return
Label1:
.end method
