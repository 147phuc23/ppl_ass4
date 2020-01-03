.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 1
.limit locals 1
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	iconst_1
	ifle Label2
	iconst_1
	ifle Label4
Label5:
	iconst_2
	invokestatic io/putInt(I)V
	iconst_1
	ifle Label8
Label9:
	iconst_3
	invokestatic io/putInt(I)V
Label10:
	goto Label7
Label8:
Label11:
	iconst_0
	invokestatic io/putBool(Z)V
Label12:
Label7:
Label6:
	goto Label3
Label4:
	ldc "hello"
	invokestatic io/putString(Ljava/lang/String;)V
Label3:
Label2:
	return
Label1:
.end method
