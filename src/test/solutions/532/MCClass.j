.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static a I

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is b F from Label2 to Label1
Label0:
Label2:
	iconst_4
	dup
	putstatic MCClass.a I
	pop
	ldc 4.5
	dup
	fstore_1
	pop
	getstatic MCClass/a I
	invokestatic io/putInt(I)V
	fload_1
	invokestatic io/putFloat(F)V
	return
Label1:
.end method
