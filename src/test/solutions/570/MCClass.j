.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static f(I)I
.limit stack 2
.limit locals 1
.var 0 is value I from Label2 to Label1
Label2:
Label0:
	iload_0
	iconst_2
	if_icmple Label3
	iconst_1
	goto Label4
Label3:
	iconst_0
Label4:
	ifle Label6
Label7:
	iload_0
	iconst_2
	if_icmple Label9
	iconst_1
	goto Label10
Label9:
	iconst_0
Label10:
	ifle Label12
Label13:
	iload_0
	iconst_1
	isub
	invokestatic MCClass/f(I)I
	ireturn
Label14:
	goto Label11
Label12:
Label15:
	iconst_1
	ireturn
Label16:
Label11:
Label8:
	goto Label5
Label6:
Label17:
	iconst_1
	ireturn
Label18:
Label5:
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
	invokestatic io/putInt(I)V
	iconst_3
	invokestatic MCClass/f(I)I
	pop
	return
Label1:
.end method
