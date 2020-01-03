.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static foo(I)F
.limit stack 1
.limit locals 1
.var 0 is a I from Label2 to Label1
Label2:
Label0:
	iload_0
	i2f
	freturn
	ldc 1
	freturn
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a I from Label2 to Label1
Label0:
Label2:
	sipush 199
	dup
	istore_1
	pop
	iload_1
	invokestatic MCClass/foo(I)F
	invokestatic io/putFloat(F)V
	return
Label1:
.end method
