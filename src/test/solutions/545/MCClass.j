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
	iconst_2
	ineg
	dup
	istore_1
	pop
	iload_1
	iconst_2
	if_icmple Label4
	iconst_1
	goto Label5
Label4:
	iconst_0
Label5:
	dup
	ifgt Label3
	iconst_0
	ior
Label3:
	ifle Label6
	return
Label6:
	iload_1
	invokestatic io/putInt(I)V
	return
	return
Label1:
.end method
