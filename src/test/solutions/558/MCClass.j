.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 4
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a [Z from Label2 to Label1
Label0:
Label2:
	iconst_3
	newarray boolean
	astore_1
	aload_1
	iconst_0
	iconst_1
	dup_x2
	bastore
	pop
	aload_1
	iconst_0
	baload
	invokestatic io/putBool(Z)V
	bipush 12
	invokestatic io/putBool(Z)V
	return
Label1:
.end method
