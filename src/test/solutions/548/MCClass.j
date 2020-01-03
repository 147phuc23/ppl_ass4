.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static revertArray([II)[I
.limit stack 5
.limit locals 4
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
	iconst_2
	idiv
	if_icmpge Label8
	iconst_1
	goto Label9
Label8:
	iconst_0
Label9:
	ifle Label6
.var 3 is c I from Label12 to Label11
Label10:
Label12:
	aload_0
	iload_2
	iaload
	dup
	istore_3
	pop
	aload_0
	iload_2
	aload_0
	iload_1
	iconst_1
	isub
	iload_2
	isub
	iaload
	dup_x2
	iastore
	pop
	aload_0
	iload_1
	iconst_1
	isub
	iload_2
	isub
	iload_3
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
	aload_0
	areturn
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 4
.limit locals 3
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is arr [I from Label2 to Label1
.var 2 is i I from Label3 to Label1
Label0:
Label2:
	bipush 20
	newarray int
	astore_1
Label3:
	iconst_0
	dup
	istore_2
	pop
Label6:
	iload_2
	bipush 19
	if_icmpeq Label7
	iconst_1
	goto Label8
Label7:
	iconst_0
Label8:
	ifle Label5
Label9:
	aload_1
	iload_2
	iload_2
	iconst_1
	iadd
	dup_x2
	iastore
	pop
Label10:
Label4:
	iload_2
	iconst_1
	iadd
	dup
	istore_2
	pop
	goto Label6
Label5:
	aload_1
	bipush 20
	invokestatic MCClass/revertArray([II)[I
	dup
	astore_1
	pop
	aload_1
	iconst_0
	iaload
	invokestatic io/putInt(I)V
	return
Label1:
.end method
