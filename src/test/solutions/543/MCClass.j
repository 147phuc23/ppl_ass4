.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static foo(I)I
.limit stack 2
.limit locals 1
.var 0 is v I from Label2 to Label1
Label2:
Label0:
	iload_0
	iconst_0
	if_icmple Label3
	iconst_1
	goto Label4
Label3:
	iconst_0
Label4:
	ifle Label6
Label7:
	iload_0
	iconst_1
	isub
	invokestatic MCClass/foo(I)I
	ireturn
Label8:
	goto Label5
Label6:
Label9:
	iload_0
	ireturn
Label10:
Label5:
	iconst_3
	ireturn
	iconst_1
	ireturn
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 1
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	iconst_0
	invokestatic MCClass/foo(I)I
	invokestatic io/putInt(I)V
	return
Label1:
.end method
