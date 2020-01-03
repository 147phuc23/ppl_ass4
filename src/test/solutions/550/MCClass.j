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
Label0:
Label2:
	iconst_5
	dup
	istore_1
	pop
Label3:
	iload_1
	invokestatic io/putInt(I)V
.var 2 is x I from Label7 to Label6
Label5:
Label7:
	iload_1
	iload_1
	imul
	dup
	istore_2
	pop
	iload_2
	invokestatic io/putInt(I)V
Label6:
	iload_1
	iconst_1
	isub
	dup
	istore_1
	pop
	iload_1
	iconst_0
	if_icmple Label8
	iconst_1
	goto Label9
Label8:
	iconst_0
Label9:
	ifle Label4
	goto Label3
Label4:
	return
Label1:
.end method
