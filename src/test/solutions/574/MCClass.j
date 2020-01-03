.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static max([I)V
.limit stack 2
.limit locals 2
.var 0 is a [I from Label2 to Label1
.var 1 is max I from Label3 to Label1
Label2:
Label0:
Label3:
	iconst_1
	iconst_2
	if_icmpge Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	ifle Label6
	aload_0
	iconst_0
	iaload
	dup
	istore_1
	pop
Label6:
	return
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 1
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	sipush 200
	invokestatic io/putInt(I)V
	return
Label1:
.end method
