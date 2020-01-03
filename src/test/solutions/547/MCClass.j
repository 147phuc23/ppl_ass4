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
.var 1 is a I from Label2 to Label1
Label0:
Label2:
	iconst_0
	dup
	istore_1
	pop
Label5:
	iload_1
	iconst_5
	if_icmpgt Label6
	iconst_1
	goto Label7
Label6:
	iconst_0
Label7:
	ifle Label4
Label8:
	iconst_1
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
