.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 3
.limit locals 4
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a I from Label2 to Label1
.var 2 is b I from Label3 to Label1
.var 3 is iSum I from Label4 to Label1
Label0:
Label2:
Label3:
Label4:
	iconst_0
	dup
	istore_3
	pop
	iconst_0
	dup
	istore_1
	pop
Label7:
	iload_1
	bipush 10
	if_icmpge Label8
	iconst_1
	goto Label9
Label8:
	iconst_0
Label9:
	ifle Label6
Label10:
	iconst_0
	dup
	istore_2
	pop
Label14:
	iload_2
	iload_1
	iconst_1
	isub
	if_icmpgt Label15
	iconst_1
	goto Label16
Label15:
	iconst_0
Label16:
	ifle Label13
Label17:
	iload_1
	iload_2
	iadd
	bipush 17
	if_icmple Label19
	iconst_1
	goto Label20
Label19:
	iconst_0
Label20:
	ifle Label21
	goto Label13
Label21:
	iload_2
	iconst_2
	irem
	iconst_0
	if_icmpne Label22
	iconst_1
	goto Label23
Label22:
	iconst_0
Label23:
	ifle Label24
	goto Label12
Label24:
	iload_3
	iload_2
	iadd
	dup
	istore_3
	pop
Label18:
Label12:
	iload_2
	iconst_1
	iadd
	dup
	istore_2
	pop
	goto Label14
Label13:
	iload_3
	bipush 27
	if_icmple Label25
	iconst_1
	goto Label26
Label25:
	iconst_0
Label26:
	ifle Label27
	goto Label6
Label27:
	iload_1
	iconst_3
	irem
	iconst_0
	if_icmpeq Label28
	iconst_1
	goto Label29
Label28:
	iconst_0
Label29:
	ifle Label30
	goto Label5
Label30:
	iload_3
	iload_1
	iadd
	dup
	istore_3
	pop
Label11:
Label5:
	iload_1
	iconst_1
	iadd
	dup
	istore_1
	pop
	goto Label7
Label6:
	iload_3
	invokestatic io/putInt(I)V
	return
Label1:
.end method
