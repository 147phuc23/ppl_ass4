.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static foo()[Z
.limit stack 4
.limit locals 1
.var 0 is a [Z from Label2 to Label1
Label0:
Label2:
	iconst_1
	newarray boolean
	astore_0
	aload_0
	iconst_0
	iconst_1
	dup_x2
	bastore
	pop
	aload_0
	areturn
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	invokestatic MCClass/foo()[Z
	iconst_0
	baload
	invokestatic io/putBool(Z)V
	return
Label1:
.end method
