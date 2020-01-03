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
.var 1 is a Z from Label2 to Label1
.var 2 is b Z from Label3 to Label1
Label0:
Label2:
Label3:
	iconst_1
	dup
	istore_1
	pop
	iconst_0
	dup
	istore_2
	pop
	iload_1
	dup
	ifgt Label4
	iload_2
	ior
Label4:
	invokestatic io/putBool(Z)V
	iload_1
	dup
	ifle Label5
	iload_2
	iand
Label5:
	invokestatic io/putBool(Z)V
	iload_1
	dup
	ifgt Label7
	iconst_0
	ior
Label7:
	dup
	ifle Label6
	iload_2
	dup
	ifle Label8
	iconst_1
	iand
Label8:
	iand
Label6:
	invokestatic io/putBool(Z)V
	iload_1
	dup
	ifgt Label10
	iconst_0
	ior
Label10:
	dup
	ifgt Label9
	iload_2
	dup
	ifle Label11
	iconst_1
	iand
Label11:
	ior
Label9:
	invokestatic io/putBool(Z)V
	return
Label1:
.end method
