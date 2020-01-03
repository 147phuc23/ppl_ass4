.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static foo()[I
.limit stack 4
.limit locals 1
.var 0 is a [I from Label2 to Label1
Label0:
Label2:
	iconst_1
	newarray int
	astore_0
	aload_0
	iconst_0
	bipush 100
	dup_x2
	iastore
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
	invokestatic MCClass/foo()[I
	iconst_0
	iaload
	invokestatic io/putInt(I)V
	return
Label1:
.end method
