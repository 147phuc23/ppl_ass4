.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static foo([III)I
.limit stack 4
.limit locals 3
.var 0 is a [I from Label2 to Label1
.var 1 is index I from Label3 to Label1
.var 2 is value I from Label4 to Label1
Label2:
Label3:
Label4:
Label0:
	aload_0
	iload_1
	iload_2
	iconst_1
	iadd
	dup_x2
	iastore
	pop
	iconst_0
	ireturn
	iconst_1
	ireturn
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 3
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a [I from Label2 to Label1
Label0:
Label2:
	bipush 12
	newarray int
	astore_1
	aload_1
	iconst_2
	iconst_2
	ineg
	invokestatic MCClass/foo([III)I
	pop
	return
Label1:
.end method
