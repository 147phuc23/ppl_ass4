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
.limit locals 3
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a I from Label2 to Label1
.var 2 is b Z from Label3 to Label1
Label0:
Label2:
	iconst_0
	dup
	istore_1
	pop
Label3:
	iload_1
	iconst_0
	if_icmpeq Label5
	iconst_1
	goto Label6
Label5:
	iconst_0
Label6:
	dup
	ifle Label4
	iconst_1
	iload_1
	idiv
	iconst_1
	if_icmpne Label7
	iconst_1
	goto Label8
Label7:
	iconst_0
Label8:
	iand
Label4:
	dup
	istore_2
	pop
	iload_2
	invokestatic io/putBool(Z)V
	return
Label1:
.end method
