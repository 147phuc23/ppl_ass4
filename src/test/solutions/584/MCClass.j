.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static i I
.field static j I

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 6
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is a I from Label2 to Label1
.var 2 is b I from Label3 to Label1
.var 3 is iSum I from Label4 to Label1
Label0:
Label2:
Label3:
Label4:
	bipush 10
	dup
	putstatic MCClass.i I
	pop
.var 4 is i F from Label7 to Label6
Label5:
Label7:
	ldc 14.3
	dup
	fstore 4
	pop
.var 5 is i I from Label10 to Label9
Label8:
Label10:
	bipush 19
	dup
	istore 5
	pop
	iload 5
	invokestatic io/putInt(I)V
Label9:
	fload 4
	invokestatic io/putFloat(F)V
Label6:
	getstatic MCClass/i I
	invokestatic io/putInt(I)V
	return
Label1:
.end method
