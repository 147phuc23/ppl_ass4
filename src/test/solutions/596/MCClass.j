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

.method public static main([Ljava/lang/String;)V
.limit stack 4
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a Z from Label2 to Label1
Label0:
Label2:
	iconst_0
	dup
	istore_1
	pop
	iconst_0
	dup
	ifgt Label5
	iconst_0
	dup
	ifle Label7
	iconst_1
	iand
Label7:
	dup
	ifle Label6
	bipush 12
	i2f
	ldc 5325.2
	fcmpl
	iconst_0
	if_icmpge Label9
	iconst_1
	goto Label8
Label9:
	iconst_0
Label8:
	iand
Label6:
	ior
Label5:
	dup
	ifgt Label4
	iload_1
	iconst_0
	if_icmpeq Label10
	iconst_1
	goto Label11
Label10:
	iconst_0
Label11:
	ior
Label4:
	dup
	ifgt Label3
	iconst_1
	dup
	istore_1
	ior
Label3:
	ifle Label12
Label13:
Label14:
Label12:
	iload_1
	invokestatic io/putBool(Z)V
	return
Label1:
.end method
