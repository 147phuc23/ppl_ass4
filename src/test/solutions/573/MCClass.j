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
	bipush 10
	dup
	istore_1
	pop
	sipush 200
	invokestatic io/putInt(I)V
	iload_1
	bipush 10
	if_icmpne Label3
	iconst_1
	goto Label4
Label3:
	iconst_0
Label4:
	ifle Label5
Label6:
	return
Label7:
Label5:
	bipush 100
	invokestatic io/putInt(I)V
	return
Label1:
.end method
