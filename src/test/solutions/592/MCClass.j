.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static a [Z

.method public <clinit>()V
	bipush 10
	newarray boolean
	putstatic MCClass.a [Z
.limit stack 1
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 4
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is b I from Label2 to Label1
.var 2 is a Z from Label3 to Label1
Label0:
Label2:
Label3:
.var 3 is c I from Label6 to Label5
Label4:
Label6:
	iconst_1
	dup
	istore_2
	pop
	iload_2
	ifgt Label7
	iconst_1
	goto Label8
Label7:
	iconst_0
Label8:
	invokestatic io/putBool(Z)V
Label5:
	return
Label1:
.end method
