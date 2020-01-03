.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static f(I)I
.limit stack 1
.limit locals 1
.var 0 is value I from Label2 to Label1
Label2:
Label0:
	iload_0
	ireturn
	iload_0
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
	iconst_1
	invokestatic MCClass/f(I)I
	invokestatic io/putInt(I)V
	return
Label1:
.end method
