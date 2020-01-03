.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static positive(I)I
.limit stack 2
.limit locals 1
.var 0 is a I from Label2 to Label1
Label2:
Label0:
	iload_0
	iconst_0
	if_icmplt Label3
	iconst_1
	goto Label4
Label3:
	iconst_0
Label4:
	ifle Label5
	iconst_1
	ireturn
Label5:
	iconst_0
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
	bipush 20
	ineg
	dup
	istore_1
	pop
	iload_1
	invokestatic MCClass/positive(I)I
	invokestatic io/putBool(Z)V
	iload_1
	invokestatic MCClass/positive(I)I
	ifgt Label3
	iconst_1
	goto Label4
Label3:
	iconst_0
Label4:
	ifle Label5
	iload_1
	ineg
	dup
	istore_1
	pop
Label5:
	iload_1
	invokestatic io/putInt(I)V
	return
	return
Label1:
.end method
