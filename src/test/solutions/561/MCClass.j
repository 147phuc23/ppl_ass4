.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 6
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a [Z from Label2 to Label1
Label0:
Label2:
	iconst_4
	newarray boolean
	astore_1
	aload_1
	iconst_2
	aload_1
	iconst_3
	iconst_0
	dup_x2
	bastore
	dup_x2
	bastore
	pop
	aload_1
	iconst_0
	iconst_1
	dup_x2
	bastore
	pop
	aload_1
	iconst_1
	aload_1
	iconst_0
	baload
	dup
	ifgt Label3
	aload_1
	iconst_2
	baload
	dup
	ifle Label4
	aload_1
	iconst_3
	baload
	iand
Label4:
	ior
Label3:
	dup_x2
	bastore
	pop
	aload_1
	iconst_1
	baload
	invokestatic io/putBool(Z)V
	return
Label1:
.end method
