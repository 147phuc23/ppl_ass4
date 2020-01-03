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
	ldc 1.2
	ldc 1.5
	invokestatic MCClass/foo(FF)V
	return
Label1:
.end method

.method public static foo(FF)V
.limit stack 2
.limit locals 2
.var 0 is a F from Label2 to Label1
.var 1 is b F from Label3 to Label1
Label2:
Label3:
Label0:
	fload_0
	fload_1
	fadd
	invokestatic io/putFloat(F)V
	return
Label1:
.end method
