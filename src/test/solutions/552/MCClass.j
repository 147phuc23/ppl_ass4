.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static foo(I)Z
.limit stack 2
.limit locals 1
.var 0 is a I from Label2 to Label1
Label2:
Label0:
	iload_0
	iconst_0
	if_icmpne Label3
	iconst_1
	goto Label4
Label3:
	iconst_0
Label4:
	ifle Label5
	iconst_0
	ireturn
Label5:
Label6:
	iload_0
	iconst_1
	isub
	invokestatic io/putInt(I)V
	iload_0
	iconst_1
	isub
	dup
	istore_0
	pop
	iload_0
	invokestatic MCClass/foo(I)Z
	ifle Label7
	goto Label6
Label7:
	iconst_1
	ireturn
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is i I from Label2 to Label1
Label0:
Label2:
	iconst_2
	dup
	istore_1
	pop
	iload_1
	invokestatic MCClass/foo(I)Z
	pop
	return
Label1:
.end method
