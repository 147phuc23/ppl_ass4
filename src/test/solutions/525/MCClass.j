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
	ifgt Label3
	iconst_1
	goto Label4
Label3:
	iconst_0
Label4:
	dup_x2
	bastore
	pop
	aload_1
	iconst_0
	baload
	invokestatic io/putBool(Z)V
	aload_1
	iconst_1
	baload
	ifgt Label5
	iconst_1
	goto Label6
Label5:
	iconst_0
Label6:
	ifgt Label7
	iconst_1
	goto Label8
Label7:
	iconst_0
Label8:
	invokestatic io/putBool(Z)V
	return
Label1:
.end method
