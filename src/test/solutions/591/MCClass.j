.source MCClass.java
.class public MCClass
.super java.lang.Object
.field static a [F

.method public <clinit>()V
	iconst_5
	newarray float
	putstatic MCClass.a [F
.limit stack 1
.limit locals 0
	return
.end method

.method public static print([F)F
.limit stack 2
.limit locals 1
.var 0 is a [F from Label2 to Label1
Label2:
Label0:
	aload_0
	iconst_1
	faload
	invokestatic io/putFloat(F)V
	iconst_1
	i2f
	freturn
	ldc 1
	freturn
Label1:
.end method

.method public static main([Ljava/lang/String;)V
.limit stack 4
.limit locals 2
.var 0 is args [Ljava/lang/String; from Label0 to Label1
.var 1 is b [F from Label2 to Label1
Label0:
Label2:
	iconst_2
	newarray float
	astore_1
	aload_1
	dup
	putstatic MCClass.a [F
	pop
	aload_1
	iconst_1
	ldc 10220000000000.0
	dup_x2
	fastore
	pop
	getstatic MCClass/a [F
	iconst_1
	iconst_1
	i2f
	dup_x2
	fastore
	pop
	getstatic MCClass/a [F
	invokestatic MCClass/print([F)F
	pop
	return
Label1:
.end method
