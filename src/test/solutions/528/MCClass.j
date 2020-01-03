.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	iconst_1
	i2f
	ldc 2.0
	fmul
	invokestatic io/putFloat(F)V
	ldc 2.0
	fneg
	iconst_3
	ineg
	i2f
	fmul
	invokestatic io/putFloat(F)V
	iconst_1
	i2f
	ldc 2.0
	fdiv
	invokestatic io/putFloat(F)V
	ldc 1.0
	iconst_2
	ineg
	i2f
	fdiv
	invokestatic io/putFloat(F)V
	return
Label1:
.end method
