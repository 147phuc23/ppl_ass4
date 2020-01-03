.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static a I
.field static b F
.field static c Z
.field static d [I
.field static s Ljava/lang/String;

.method public <clinit>()V
	iconst_5
	newarray int
	putstatic MCClass.d [I
.limit stack 1
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 4
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is sum I from Label2 to Label1
.var 2 is i I from Label3 to Label1
.var 3 is j I from Label4 to Label1
Label0:
Label2:
Label3:
Label4:
	bipush 20
	dup
	istore_1
	pop
	iconst_1
	dup
	istore_2
	pop
Label7:
	iload_2
	iload_1
	if_icmpgt Label8
	iconst_1
	goto Label9
Label8:
	iconst_0
Label9:
	ifle Label6
	iload_2
	iconst_1
	iadd
	dup
	istore_2
	pop
Label5:
	iload_2
	iconst_1
	iadd
	dup
	istore_2
	pop
	goto Label7
Label6:
	iload_2
	invokestatic io/putInt(I)V
	return
Label1:
.end method
