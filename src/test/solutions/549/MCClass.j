.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static swap(II)V
.limit stack 2
.limit locals 3
.var 0 is a I from Label2 to Label1
.var 1 is b I from Label3 to Label1
.var 2 is c I from Label4 to Label1
Label2:
Label3:
Label0:
Label4:
	iload_0
	dup
	istore_2
	pop
	iload_1
	dup
	istore_0
	pop
	iload_2
	dup
	istore_1
	pop
	return
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 4
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a I from Label2 to Label1
.var 2 is i I from Label3 to Label1
.var 3 is b I from Label4 to Label1
Label0:
Label2:
Label3:
Label4:
	iconst_1
	dup
	istore_3
	pop
	iconst_2
	dup
	istore_2
	dup
	istore_1
	pop
	iconst_0
	dup
	istore_2
	pop
Label7:
	iload_2
	iconst_2
	if_icmpgt Label8
	iconst_1
	goto Label9
Label8:
	iconst_0
Label9:
	ifle Label6
Label10:
	iload_2
	iconst_2
	irem
	iconst_0
	if_icmpne Label12
	iconst_1
	goto Label13
Label12:
	iconst_0
Label13:
	ifle Label15
Label16:
	iload_1
	iload_3
	invokestatic MCClass/swap(II)V
	iload_1
	iconst_1
	iadd
	dup
	istore_1
	pop
Label17:
	goto Label14
Label15:
	return
Label14:
Label11:
Label5:
	iload_2
	iconst_1
	iadd
	dup
	istore_2
	pop
	goto Label7
Label6:
	iload_1
	invokestatic io/putInt(I)V
	return
Label1:
.end method
