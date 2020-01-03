.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static a I
.field static b F
.field static _init F

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	bipush 12
	ineg
	dup
	putstatic MCClass.a I
	pop
	bipush 19
	i2f
	dup
	putstatic MCClass._init F
	pop
	getstatic MCClass/a I
	invokestatic io/putInt(I)V
	return
Label1:
.end method
