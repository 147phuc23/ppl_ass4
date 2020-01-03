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
.var 1 is i I from Label2 to Label1
Label0:
Label2:
	iconst_0
	dup
	istore_1
	pop
Label3:
	iload_1
	iconst_1
	iadd
	dup
	istore_1
	pop
	iload_1
	invokestatic io/putInt(I)V
	iload_1
	iconst_4
	if_icmpne Label5
	iconst_1
	goto Label6
Label5:
	iconst_0
Label6:
	ifle Label7
	goto Label4
Label7:
	iconst_1
	ifle Label4
	goto Label3
Label4:
	return
Label1:
.end method
