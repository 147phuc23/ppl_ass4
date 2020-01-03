.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static init_array([II)V
.limit stack 4
.limit locals 3
.var 0 is arr [I from Label2 to Label1
.var 1 is size I from Label3 to Label1
.var 2 is i I from Label4 to Label1
Label2:
Label3:
Label0:
Label4:
	iconst_0
	dup
	istore_2
	pop
Label7:
	iload_2
	iload_1
	if_icmpge Label8
	iconst_1
	goto Label9
Label8:
	iconst_0
Label9:
	ifle Label6
Label10:
	aload_0
	iload_2
	iconst_3
	dup_x2
	iastore
	pop
Label11:
Label5:
	iload_2
	iconst_1
	iadd
	dup
	istore_2
	pop
	goto Label7
Label6:
	return
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a [I from Label2 to Label1
Label0:
Label2:
	bipush 10
	newarray int
	astore_1
	aload_1
	bipush 10
	invokestatic MCClass/init_array([II)V
	aload_1
	iconst_3
	iaload
	invokestatic io/putInt(I)V
	return
Label1:
.end method

.method public static foo()I
.limit stack 1
.limit locals 0
Label0:
	bipush 12
	invokestatic io/putInt(I)V
	iconst_1
	ireturn
Label1:
.end method
