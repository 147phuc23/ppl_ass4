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
.limit locals 3
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a Z from Label2 to Label1
.var 2 is b Z from Label3 to Label1
Label0:
Label2:
Label3:
	iconst_1
	dup
	istore_1
	pop
	iconst_0
	dup
	istore_2
	pop
	iload_1
	invokestatic io/putBool(Z)V
	iload_2
	invokestatic io/putBool(Z)V
	return
Label1:
.end method
