.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static i I

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static f()I
.limit stack 1
.limit locals 0
Label0:
	sipush 200
	ireturn
	iconst_1
	ireturn
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 5
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is main I from Label2 to Label1
Label0:
Label2:
	invokestatic MCClass/f()I
	dup
	istore_1
	pop
	iload_1
	invokestatic io/putInt(I)V
.var 2 is i I from Label5 to Label4
.var 3 is main I from Label6 to Label4
.var 4 is f I from Label7 to Label4
Label3:
Label5:
Label6:
Label7:
	bipush 100
	dup
	istore_2
	dup
	istore 4
	dup
	istore_3
	pop
	iload_2
	invokestatic io/putInt(I)V
	iload_3
	invokestatic io/putInt(I)V
	iload 4
	invokestatic io/putInt(I)V
Label4:
	iload_1
	invokestatic io/putInt(I)V
	return
Label1:
.end method
