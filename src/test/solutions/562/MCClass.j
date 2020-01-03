.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static foo_1()F
.limit stack 1
.limit locals 0
Label0:
	iconst_1
	i2f
	freturn
	ldc 1
	freturn
Label1:
.end method

.method public static foo(Ljava/lang/String;[Ljava/lang/String;)V
.limit stack 2
.limit locals 2
.var 0 is s Ljava/lang/String; from Label2 to Label1
.var 1 is arr [Ljava/lang/String; from Label3 to Label1
Label2:
Label3:
Label0:
	aload_0
	invokestatic io/putString(Ljava/lang/String;)V
	aload_1
	iconst_0
	aaload
	invokestatic io/putString(Ljava/lang/String;)V
	return
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 4
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is arr [Ljava/lang/String; from Label2 to Label1
Label0:
Label2:
	iconst_1
	anewarray java/lang/String
	astore_1
	aload_1
	iconst_0
	ldc "Hello"
	dup_x2
	aastore
	pop
	aload_1
	iconst_0
	aaload
	aload_1
	invokestatic MCClass/foo(Ljava/lang/String;[Ljava/lang/String;)V
	return
Label1:
.end method
