.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 3
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	iconst_2
	ineg
	iconst_3
	if_icmple Label3
	iconst_1
	goto Label4
Label3:
	iconst_0
Label4:
	dup
	ifgt Label2
	iconst_1
	iconst_0
	if_icmple Label5
	iconst_1
	goto Label6
Label5:
	iconst_0
Label6:
	ior
Label2:
	ifle Label7
Label8:
	iconst_2
	iconst_3
	if_icmple Label10
	iconst_1
	goto Label11
Label10:
	iconst_0
Label11:
	invokestatic io/putBool(Z)V
Label9:
Label7:
	return
Label1:
.end method
