.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static foo()I
.limit stack 1
.limit locals 0
Label0:
Label2:
	iconst_1
	invokestatic io/putInt(I)V
Label4:
	iconst_2
	i2f
	invokestatic io/putFloat(F)V
Label5:
	ldc "abc"
	invokestatic io/putString(Ljava/lang/String;)V
Label3:
	iconst_1
	ireturn
	iconst_1
	ireturn
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 1
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	invokestatic MCClass/foo()I
	pop
	return
Label1:
.end method
