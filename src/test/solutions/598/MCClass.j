.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static a [F

.method public <clinit>()V
	iconst_5
	newarray float
	putstatic MCClass.a [F
.limit stack 1
.limit locals 0
	return
.end method

.method public static print([F)F
.limit stack 2
.limit locals 1
.var 0 is a [F from Label2 to Label1
Label2:
Label0:
	aload_0
	iconst_1
	faload
	invokestatic io/putFloat(F)V
	iconst_1
	i2f
	freturn
	ldc 1
	freturn
Label1:
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
.limit locals 5
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is b [F from Label2 to Label1
Label0:
Label2:
	iconst_2
	newarray float
	astore_1
	aload_1
	dup
	putstatic MCClass.a [F
	pop
	aload_1
	iconst_1
	ldc 10220000000000.0
	dup_x2
	fastore
	pop
	getstatic MCClass/a [F
	iconst_1
	iconst_1
	i2f
	dup_x2
	fastore
	pop
	getstatic MCClass/a [F
	invokestatic MCClass/print([F)F
	pop
.var 2 is a [I from Label5 to Label4
Label3:
Label5:
	iconst_5
	newarray int
	astore_2
	aload_2
	iconst_1
	bipush 10
	dup_x2
	iastore
	pop
	iconst_0
	dup
	ifgt Label8
	iconst_0
	dup
	ifle Label10
	iconst_1
	iand
Label10:
	dup
	ifle Label9
	bipush 12
	i2f
	ldc 5325.2
	fcmpl
	iconst_0
	if_icmpge Label12
	iconst_1
	goto Label11
Label12:
	iconst_0
Label11:
	iand
Label9:
	ior
Label8:
	dup
	ifgt Label7
	aload_2
	iconst_1
	iaload
	invokestatic MCClass/check(I)Z
	iconst_0
	if_icmpeq Label13
	iconst_1
	goto Label14
Label13:
	iconst_0
Label14:
	ior
Label7:
	dup
	ifgt Label6
	aload_2
	iconst_3
	iaload
	invokestatic MCClass/check(I)Z
	iconst_1
	if_icmpne Label15
	iconst_1
	goto Label16
Label15:
	iconst_0
Label16:
	ior
Label6:
	ifle Label17
Label18:
Label19:
Label17:
	aload_2
	iconst_1
	iaload
	invokestatic io/putInt(I)V
Label4:
.var 2 is a I from Label22 to Label21
.var 3 is c F from Label23 to Label21
.var 4 is b I from Label24 to Label21
Label20:
Label22:
Label23:
Label24:
	sipush 15111
	dup
	istore 4
	pop
	iconst_1
	i2f
	dup
	fstore_3
	pop
	iload 4
	ineg
	pop
	iload 4
	ineg
	dup
	istore_2
	pop
	iload_2
	iload 4
	ineg
	if_icmple Label28
	iconst_1
	goto Label29
Label28:
	iconst_0
Label29:
	dup
	ifgt Label27
	iload_2
	iload 4
	bipush 122
	iadd
	if_icmpne Label30
	iconst_1
	goto Label31
Label30:
	iconst_0
Label31:
	ior
Label27:
	dup
	ifgt Label26
	iconst_0
	iconst_0
	if_icmpeq Label32
	iconst_1
	goto Label33
Label32:
	iconst_0
Label33:
	ior
Label26:
	dup
	ifgt Label25
	iload 4
	iconst_1
	iadd
	bipush 123
	iload_2
	ineg
	isub
	if_icmplt Label34
	iconst_1
	goto Label35
Label34:
	iconst_0
Label35:
	ior
Label25:
	ifgt Label36
	iconst_1
	goto Label37
Label36:
	iconst_0
Label37:
	invokestatic io/putBool(Z)V
Label21:
	return
Label1:
.end method
