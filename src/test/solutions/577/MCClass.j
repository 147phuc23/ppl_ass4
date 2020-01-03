.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static foo()[Ljava/lang/String;
.limit stack 4
.limit locals 1
.var 0 is a [Ljava/lang/String; from Label2 to Label1
Label0:
Label2:
	iconst_1
	anewarray java/lang/String
	astore_0
	aload_0
	iconst_0
	ldc "hi"
	dup_x2
	aastore
	pop
	aload_0
	areturn
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	invokestatic MCClass/foo()[Ljava/lang/String;
	iconst_0
	aaload
	invokestatic io/putString(Ljava/lang/String;)V
	return
Label1:
.end method
