.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static c Ljava/lang/String;

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
	ldc 1.1
	iconst_2
	i2f
	fadd
	invokestatic io/putFloat(F)V
	iconst_1
	invokestatic io/putInt(I)V
	ldc "abc"
	invokestatic io/putString(Ljava/lang/String;)V
	ldc "LOL"
	dup
	putstatic MCClass.c Ljava/lang/String;
	pop
	getstatic MCClass/c Ljava/lang/String;
	invokestatic io/putString(Ljava/lang/String;)V
	return
Label1:
.end method
