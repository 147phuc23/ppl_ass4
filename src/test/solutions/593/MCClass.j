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

.method public static put(I)I
.limit stack 1
.limit locals 1
.var 0 is a I from Label2 to Label1
Label2:
Label0:
	iload_0
	ireturn
	iconst_1
	ireturn
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 4
.limit locals 3
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is i I from Label2 to Label1
.var 2 is b [I from Label3 to Label1
Label0:
Label2:
Label3:
	iconst_2
	newarray int
	astore_2
	aload_2
	iconst_1
	iconst_1
	dup_x2
	iastore
	pop
	aload_2
	iconst_1
	iaload
	pop
	aload_2
	iconst_1
	iaload
	invokestatic MCClass/put(I)I
	pop
	aload_2
	iconst_1
	iaload
	invokestatic MCClass/put(I)I
	invokestatic io/putInt(I)V
	iconst_0
	dup
	istore_1
	pop
Label6:
	iload_1
	iconst_2
	if_icmpge Label7
	iconst_1
	goto Label8
Label7:
	iconst_0
Label8:
	ifle Label5
	aload_2
	iload_1
	iload_1
	dup_x2
	iastore
	pop
Label4:
	iload_1
	iconst_1
	iadd
	dup
	istore_1
	pop
	goto Label6
Label5:
	getstatic MCClass/a [I
	iconst_3
	aload_2
	iconst_1
	iaload
	invokestatic MCClass/put(I)I
	dup_x2
	iastore
	pop
	getstatic MCClass/a [I
	iconst_3
	iaload
	invokestatic io/putInt(I)V
	return
Label1:
.end method
