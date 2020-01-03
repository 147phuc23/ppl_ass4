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
	if_icmpne Label6
	iconst_1
	goto Label7
Label6:
	iconst_0
Label7:
	dup
	ifgt Label5
	iconst_1
	iload_1
	idiv
	iconst_0
	if_icmpne Label8
	iconst_1
	goto Label9
Label8:
	iconst_0
Label9:
	ior
Label5:
	dup
	ifgt Label4
	iconst_1
	ior
Label4:
	dup
	istore_2
	pop
	iload_2
	invokestatic io/putBool(Z)V
	return
Label1:
.end method
