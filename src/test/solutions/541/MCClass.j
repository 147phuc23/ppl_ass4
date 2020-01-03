.source MCClass.java
.class public MCClass
.super java.lang.Object

.method public <clinit>()V
.limit stack 0
.limit locals 0
	return
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 2
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
Label0:
	iconst_1
	ifle Label2
.var 1 is temp I from Label5 to Label4
Label3:
Label5:
	iconst_3
	dup
	istore_1
	pop
	ldc "Hello"
	invokestatic io/putString(Ljava/lang/String;)V
Label4:
Label2:
	iconst_0
	ifle Label6
.var 1 is value F from Label9 to Label8
Label7:
Label9:
	iconst_2
	i2f
	dup
	fstore_1
	pop
	ldc "Hi"
	invokestatic io/putString(Ljava/lang/String;)V
Label8:
Label6:
	iconst_0
	ifle Label11
Label12:
	ldc "false"
	invokestatic io/putString(Ljava/lang/String;)V
Label13:
	goto Label10
Label11:
.var 1 is s Ljava/lang/String; from Label16 to Label15
Label14:
Label16:
	ldc "true"
	dup
	astore_1
	pop
	aload_1
	invokestatic io/putString(Ljava/lang/String;)V
Label15:
Label10:
	return
Label1:
.end method
