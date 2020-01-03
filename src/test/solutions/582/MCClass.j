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
	dup
	istore_2
	dup
	istore_1
	pop
Label5:
Label7:
	iconst_0
	dup
	istore_2
	pop
	iload_1
	iconst_1
	iadd
	dup
	istore_1
	pop
Label9:
Label11:
	iload_2
	iconst_1
	iadd
	dup
	istore_2
	pop
	iload_2
	bipush 10
	if_icmple Label13
	iconst_1
	goto Label14
Label13:
	iconst_0
Label14:
	ifle Label15
	goto Label10
Label15:
	iload_2
	iconst_2
	irem
	iconst_1
	if_icmpne Label16
	iconst_1
	goto Label17
Label16:
	iconst_0
Label17:
	ifle Label18
	goto Label9
Label18:
	iload_3
	iload_2
	iadd
	dup
	istore_3
	pop
Label12:
	iload_2
	iload_1
	if_icmpge Label19
	iconst_1
	goto Label20
Label19:
	iconst_0
Label20:
	ifle Label10
	goto Label9
Label10:
	iload_1
	iload_2
	irem
	iconst_0
	if_icmpne Label21
	iconst_1
	goto Label22
Label21:
	iconst_0
Label22:
	ifle Label23
	goto Label5
Label23:
	iload_1
	iload_2
	iadd
	bipush 40
	if_icmple Label24
	iconst_1
	goto Label25
Label24:
	iconst_0
Label25:
	ifle Label26
	goto Label6
Label26:
	iload_3
	iload_1
	iadd
	dup
	istore_3
	pop
Label8:
	iload_1
	bipush 20
	if_icmpge Label27
	iconst_1
	goto Label28
Label27:
	iconst_0
Label28:
	ifle Label6
	goto Label5
Label6:
	iload_3
	invokestatic io/putInt(I)V
	return
Label1:
.end method
