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
.limit locals 3
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is i I from Label2 to Label1
.var 2 is j I from Label3 to Label1
Label0:
Label2:
Label3:
	iconst_0
	dup
	istore_2
	dup
	istore_1
	pop
	iconst_0
	dup
	istore_1
	pop
Label6:
	iload_1
	iconst_3
	if_icmpge Label7
	iconst_1
	goto Label8
Label7:
	iconst_0
Label8:
	ifle Label5
Label9:
	iconst_0
	dup
	istore_2
	pop
Label13:
	iload_2
	iload_1
	if_icmpgt Label14
	iconst_1
	goto Label15
Label14:
	iconst_0
Label15:
	ifle Label12
Label16:
	ldc "*"
	invokestatic io/putString(Ljava/lang/String;)V
Label17:
Label11:
	iload_2
	iconst_1
	iadd
	dup
	istore_2
	pop
	goto Label13
Label12:
Label10:
Label4:
	iload_1
	iconst_1
	iadd
	dup
	istore_1
	pop
	goto Label6
Label5:
	iconst_1
	invokestatic io/putBool(Z)V
	return
Label1:
.end method
