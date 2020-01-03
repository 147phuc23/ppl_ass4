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
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is i I from Label2 to Label1
Label0:
Label2:
	iconst_1
	dup
	istore_1
	pop
Label5:
	iload_1
	bipush 10
	if_icmpge Label6
	iconst_1
	goto Label7
Label6:
	iconst_0
Label7:
	ifle Label4
Label8:
	iload_1
	iconst_2
	irem
	iconst_0
	if_icmpne Label10
	iconst_1
	goto Label11
Label10:
	iconst_0
Label11:
	ifle Label12
	goto Label3
Label12:
	iload_1
	bipush 7
	if_icmpne Label13
	iconst_1
	goto Label14
Label13:
	iconst_0
Label14:
	ifle Label15
	goto Label4
Label15:
	iload_1
	invokestatic io/putInt(I)V
Label9:
Label3:
	iload_1
	iconst_1
	iadd
	dup
	istore_1
	pop
	goto Label5
Label4:
	return
Label1:
.end method
