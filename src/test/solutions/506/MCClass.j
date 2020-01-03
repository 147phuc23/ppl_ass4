.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static a I

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static foo(F)F
.limit stack 2
.limit locals 1
.var 0 is a F from Label2 to Label1
Label2:
Label0:
	fload_0
	ldc 140.0
	fadd
	freturn
	ldc 1
	freturn
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a F from Label2 to Label1
Label0:
	bipush 9
	dup
	putstatic MCClass.a I
	pop
	getstatic MCClass/a I
	invokestatic io/putInt(I)V
Label2:
	bipush 10
	i2f
	dup
	fstore_1
	pop
	iconst_1
	i2f
	fload_1
	invokestatic MCClass/foo(F)F
	invokestatic MCClass/foo(F)F
	fadd
	invokestatic io/putFloat(F)V
	return
Label1:
.end method
