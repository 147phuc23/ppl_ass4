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
	ldc "hello world"
	invokestatic io/putString(Ljava/lang/String;)V
	iconst_3
	iconst_2
	idiv
	iconst_1
	iadd
	i2f
	invokestatic io/putFloat(F)V
	return
Label1:
.end method
