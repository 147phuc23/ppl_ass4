.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static a I

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static foo(I)I
.limit stack 2
.limit locals 1
.var 0 is a I from Label2 to Label1
Label2:
Label0:
	iload_0
	bipush 10
	if_icmpeq Label3
	iconst_1
	goto Label4
Label3:
	iconst_0
Label4:
	ifle Label5
	iconst_1
	ireturn
Label5:
	iload_0
	iconst_1
	iadd
	ireturn
	iconst_1
	ireturn
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a I from Label2 to Label1
Label0:
Label2:
	bipush 10
	ineg
	dup
	istore_1
	pop
Label3:
Label5:
	iconst_1
	iload_1
	invokestatic MCClass/foo(I)I
	iadd
	invokestatic io/putInt(I)V
Label6:
Label4:
	return
Label1:
.end method
