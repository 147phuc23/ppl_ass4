.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static a [I

.method public <clinit>()V
	iconst_5
	newarray int
	putstatic MCClass.a [I
.limit stack 1
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 3
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a Z from Label2 to Label1
Label0:
Label2:
	iconst_0
	dup
	istore_1
	pop
	iconst_1
	dup
	ifgt Label5
	iconst_0
	ior
Label5:
	dup
	ifgt Label4
	iconst_1
	ior
Label4:
	dup
	ifgt Label3
	iconst_1
	dup
	istore_1
	ior
Label3:
	pop
	iload_1
	invokestatic io/putBool(Z)V
	return
Label1:
.end method
