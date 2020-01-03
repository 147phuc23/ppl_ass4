.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 3
.limit locals 4
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a F from Label2 to Label1
.var 2 is b F from Label3 to Label1
.var 3 is c F from Label4 to Label1
Label0:
Label2:
Label3:
	ldc 1.0
	dup
	fstore_2
	dup
	fstore_1
	pop
Label4:
	fload_1
	fload_2
	fadd
	dup
	fstore_3
	pop
	fload_3
	invokestatic io/putFloat(F)V
	fload_3
	fload_1
	fadd
	ldc 1.92
	iconst_2
	i2f
	fdiv
	fadd
	invokestatic io/putFloat(F)V
	fload_3
	fload_1
	fneg
	fneg
	fsub
	ldc 1.92
	iconst_2
	i2f
	fdiv
	fadd
	invokestatic io/putFloat(F)V
	return
Label1:
.end method
