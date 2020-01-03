.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static foo_1()I
.limit stack 1
.limit locals 0
Label0:
	iconst_1
	ireturn
	iconst_1
	ireturn
Label1:
.end method

.method public static foo(Z[Z)V
.limit stack 2
.limit locals 2
.var 0 is s Z from Label2 to Label1
.var 1 is arr [Z from Label3 to Label1
Label2:
Label3:
Label0:
	iload_0
	invokestatic io/putBool(Z)V
	aload_1
	iconst_0
	baload
	invokestatic io/putBool(Z)V
	return
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 4
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is arr [Z from Label2 to Label1
Label0:
Label2:
	iconst_1
	newarray boolean
	astore_1
	aload_1
	iconst_0
	iconst_0
	dup_x2
	bastore
	pop
	aload_1
	iconst_0
	baload
	aload_1
	invokestatic MCClass/foo(Z[Z)V
	return
Label1:
.end method
