.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static a [I

.method public <clinit>()V
	iconst_5
	newarray int
	putstatic MCClass.a [I
.limit stack 1
.limit locals 0
	return
.end method

.method public static check(I)Z
.limit stack 2
.limit locals 1
.var 0 is a I from Label2 to Label1
Label2:
Label0:
	bipush 100
	dup
	istore_0
	pop
	iconst_1
	ireturn
	iconst_1
	ireturn
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 4
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	getstatic MCClass/a [I
	iconst_1
	bipush 10
	dup_x2
	iastore
	pop
	iconst_0
	dup
	ifgt Label4
	iconst_0
	dup
	ifle Label6
	iconst_1
	iand
Label6:
	dup
	ifle Label5
	bipush 12
	i2f
	ldc 5325.2
	fcmpl
	iconst_0
	if_icmpge Label8
	iconst_1
	goto Label7
Label8:
	iconst_0
Label7:
	iand
Label5:
	ior
Label4:
	dup
	ifgt Label3
	getstatic MCClass/a [I
	iconst_1
	iaload
	invokestatic MCClass/check(I)Z
	iconst_0
	if_icmpeq Label9
	iconst_1
	goto Label10
Label9:
	iconst_0
Label10:
	ior
Label3:
	dup
	ifgt Label2
	getstatic MCClass/a [I
	iconst_3
	iaload
	invokestatic MCClass/check(I)Z
	iconst_1
	if_icmpne Label11
	iconst_1
	goto Label12
Label11:
	iconst_0
Label12:
	ior
Label2:
	ifle Label13
Label14:
Label15:
Label13:
	getstatic MCClass/a [I
	iconst_1
	iaload
	invokestatic io/putInt(I)V
	return
Label1:
.end method
