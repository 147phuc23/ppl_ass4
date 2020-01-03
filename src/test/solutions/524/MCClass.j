.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static get([Z)Z
.limit stack 3
.limit locals 1
.var 0 is c [Z from Label2 to Label1
Label2:
Label0:
	aload_0
	iconst_0
	baload
	dup
	ifle Label3
	aload_0
	iconst_1
	baload
	iand
Label3:
	ireturn
	iconst_1
	ireturn
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 6
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is list [Z from Label2 to Label1
Label0:
Label2:
	iconst_2
	newarray boolean
	astore_1
	aload_1
	iconst_0
	aload_1
	iconst_1
	iconst_1
	dup_x2
	bastore
	dup_x2
	bastore
	pop
	aload_1
	invokestatic MCClass/get([Z)Z
	invokestatic io/putBool(Z)V
	return
Label1:
.end method
