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
	iconst_1
	ifle Label5
Label7:
	iload_1
	iconst_3
	if_icmpne Label9
	iconst_1
	goto Label10
Label9:
	iconst_0
Label10:
	ifle Label11
	goto Label5
Label11:
	iconst_0
	dup
	istore_2
	pop
Label14:
	iconst_1
	ifle Label13
Label15:
	iload_2
	iconst_2
	if_icmpne Label17
	iconst_1
	goto Label18
Label17:
	iconst_0
Label18:
	ifle Label19
	goto Label13
Label19:
	iload_2
	invokestatic io/putInt(I)V
Label16:
Label12:
	iload_2
	iconst_1
	iadd
	dup
	istore_2
	pop
	goto Label14
Label13:
Label8:
Label4:
	iload_1
	iconst_1
	iadd
	dup
	istore_1
	pop
	goto Label6
Label5:
	return
Label1:
.end method
