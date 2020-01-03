.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static foo([I)V
.limit stack 2
.limit locals 1
.var 0 is a [I from Label2 to Label1
Label2:
Label0:
	aload_0
	iconst_0
	iaload
	invokestatic io/putInt(I)V
	return
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 4
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a [I from Label2 to Label1
Label0:
Label2:
	iconst_4
	newarray int
	astore_1
	aload_1
	iconst_0
	bipush 99
	dup_x2
	iastore
	pop
	aload_1
	invokestatic MCClass/foo([I)V
	iconst_1
	iconst_1
	if_icmpgt Label3
	iconst_1
	goto Label4
Label3:
	iconst_0
Label4:
	ifle Label6
	return
	goto Label5
Label6:
	iconst_1
	invokestatic io/putInt(I)V
Label5:
	return
Label1:
.end method
