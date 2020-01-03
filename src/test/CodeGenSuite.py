import unittest
from TestUtils import TestCodeGen
from AST import *


class CheckCodeGenSuite(unittest.TestCase):
   
    # 1
    def test_simple_program(self):
        input = """
        void main()
        {
            putInt(1);
        }
        """
        expect = """1"""
        self.assertTrue(TestCodeGen.test(input,expect,500))

    # 2
    def test_put_int(self):
        input = """
        void main()
        {
            int a;
            a = 1;
            putInt(a);
        }
        """
        expect = """1"""
        self.assertTrue(TestCodeGen.test(input,expect,501))

    # 3
    def test_put_boolean(self):
        input = """
        void main()
        {
            boolean a,b,c;
            a = true;
            a = b = c = false;
            putBool(a);
        }
        """
        expect = """1.0"""
        self.assertTrue(TestCodeGen.test(input,expect,502))

    # 4
    def test_global_variable(self):
        input = """
        int a;
        float b,_init;
        void main()
        {
            a = -12;
            _init = 19;
            putInt(a);
        }
        """
        expect = """-12"""
        self.assertTrue(TestCodeGen.test(input,expect,503))

    # 5
    def test_function_with_return(self):
        input = """
        int foo(){
            return 10;
        }
        void main()
        {
            putInt(foo());
        }
        """
        expect = """10"""
        self.assertTrue(TestCodeGen.test(input,expect,504))

    # 6
    def test_funtion_with_return1(self):
        input = """
        int a;
        int foo(int a){
            if (a != 10) return 1;
            return a + 1;
        }
        void main()
        {
            int a;
            a = -10;
            {{putInt(1 + foo(a));}}
        }
        """
        expect = """2"""
        self.assertTrue(TestCodeGen.test(input,expect,505))
    
     # 7
    def test_funtion_with_return_2(self):
        input = """
        int a;
        float foo(float a){
            return a + 1.4e2;
        }
        void main()
        {
            a = 9;
            putInt(a);
            float a;
            a = 10;
            putFloat(1 + foo(foo(a)));
        }
        """
        expect = """9291.0"""
        self.assertTrue(TestCodeGen.test(input,expect,506))

    # 8
    def test_funtion_with_return_and_convert_type(self):
        input = """
        int a;
        float foo(int a){
            return a + 1;
        }
        void main()
        {
            int a ;
            a= -10;
            putFloat(1 + foo(a));
        }
        """
        expect = """-8.0"""
        self.assertTrue(TestCodeGen.test(input,expect,507))
    
    # 9
    def test_funtion_with_return_and_convert_type_1(self):
        input = """
         int index;
        float foo(int a){
            return 1.0 + 1;
        }
        void main()
        {
            int a;
            a = 2;
            index = 1;
            index = index + 3;
            putFloat(index * foo(a) + 1);
        }
        """
        expect = """9.0"""
        self.assertTrue(TestCodeGen.test(input,expect,508))

    # 10
    def test_io_function(self):
        input = """
        string c;
        void main()
        {
            putFloat(1.1+2);
            putInt(1);
            putString("abc");
            c = "LOL";
            putString(c);
        }
        """
        expect = """3.11abcLOL"""
        self.assertTrue(TestCodeGen.test(input,expect,509))

    # 11
    def test_array(self):
        input = """
        int a[10];
        void main()
        {
            putInt(a[1] + a[2]);
        }
        """
        expect = """0"""
        self.assertTrue(TestCodeGen.test(input,expect,510))

    # 12
    def test_nested_array_with_init(self):
        input = """
        int a[10];
        void main()
        { 
            a[1] = a[2] = 8;
            a[0] = 0;
            putInt(a[1] + a[2]*a[a[0]]);
        }
        """
        expect = """8"""
        self.assertTrue(TestCodeGen.test(input,expect,511))

    # 13
    def test_nested_block(self):
        input = """
        int foo() {
            {
                putInt(1);
                {
                    putFloat(2);    
                }
                putString("abc");
            }
            return 1;
        }
        void main()
        { 
            foo();
        }
        """
        expect = """12.0abc"""
        self.assertTrue(TestCodeGen.test(input,expect,512))

        # 14
    def test_array_pointer_param(self):
        input = """
        int foo(int a[], int index, int value) {
            a[index] = value + 1;
            return 0;
        }
        void main()
        { 
            int a[12];
            foo(a, 2, -2);
        }
        """
        expect = ""
        self.assertTrue(TestCodeGen.test(input,expect,513))

        # 15
    def test_int_add_op(self):
        input = """
        void main()
        { 
            putInt(1+2+3);
            putInt(1+2-3);
            putInt((1+2)-(-3));
        }
        """
        expect = """606"""
        self.assertTrue(TestCodeGen.test(input,expect,514))

    # 16
    def test_nested_block_value(self):
        input = """
        int a;
        int foo() {
            return a+1;
        }
        void main()
        { 
            a = 1;
            putInt(foo());
        }
        """
        expect = """2"""
        self.assertTrue(TestCodeGen.test(input,expect,515))

        # 17
    def test_multiple_function(self):
        input = """
        int foo(int i) {
            return foo1(i);
        }
        void main()
        { 
            putInt(foo(2));
        }
        int foo1(int a){
            return a-2;
        }
        """
        expect = """0"""
        self.assertTrue(TestCodeGen.test(input,expect,516))

        # 18
    def test_funtion_call_nested(self):
        input = """
        float a;
        int b;
        int getFloatI(){
            return b;
        }
        int foo(int i) {
            return i + b;
        }
        void main(){
            putFloat(getFloatI());
            putInt(foo(2));
        }

        """
        expect = """0.02"""
        self.assertTrue(TestCodeGen.test(input,expect,517))

        # 19
    def test_function_with_return_1(self):
        input = """
        int c;
        void add(int a) {
            c = a + c;
        }
        void main()
        {
            c = 2;
            add(10);
            putInt(c);
        }
        """
        expect = """12"""
        self.assertTrue(TestCodeGen.test(input,expect,518))

        # 20
    def test_int_add_sub_op(self):
        input = """
        void main()
        { 
            putInt(1+2+3);
            putInt(1+2-3);
            putInt((1+2)-(-3));
        }
        """
        expect = """606"""
        self.assertTrue(TestCodeGen.test(input,expect,519))
              # 21
    def test_int_op(self):
        input = """
        int a;
        void main()
        { 
            a = 19;
            putInt( a*1/a + 2 + 3);
        }
        """
        expect = """6"""
        self.assertTrue(TestCodeGen.test(input,expect,520))
              # 22
    def test_put_string(self):
        input = """
        void main()
        { 
            putString("hello world");
            putFloat(3/2 + 1);
        }
        """
        expect = """hello world2.0"""
        self.assertTrue(TestCodeGen.test(input,expect,521))
              
              # 23 
    def test_put_boolean(self):
        input = """
        void main()
        { 
            boolean a,b;
            a = true;
            b = false;
            putBool(a);
            putBool(b);
        }
        """
        expect = """truefalse"""
        self.assertTrue(TestCodeGen.test(input,expect,522))
              # 24  
    def test_boolean_and_or_op(self):
        input = """
        void main()
        { 
            boolean a,b;
            a = true;
            b = false;
            putBool(a || b);
            putBool(a && b);
            putBool( (a||false) && (b &&true) );
            putBool( (a||false) || (b &&true) );
        }
        """
        expect = """truefalsefalsetrue"""
        self.assertTrue(TestCodeGen.test(input,expect,523))
              # 25
    def test_boolean_and_or_op_array(self):
        input = """
        boolean get(boolean c[]){
            return c[0] && c[1];
        }
        void main()
        { 
            boolean list[2];
            list[0] = list[1] = true;
            putBool(get(list));
        }
        """
        expect = """true"""
        self.assertTrue(TestCodeGen.test(input,expect,524))
              # 26

    def test_boolean_not_op(self):
        input = """
        void main()
        { 
            boolean list[2];
            list[0] = !(list[1] = true);
            putBool(list[0]);
            putBool(!!list[1]);
        }
        """
        expect = """falsetrue"""
        self.assertTrue(TestCodeGen.test(input,expect,525))

    def test_boolean_op(self):
        input = """
        void main() {
           putBool(true && true);
           putBool(true && false);
           putBool(true && (true || false));
           putBool(false || (true && false));
        }
        """
        expect = "truefalsetruefalse"
        self.assertTrue(TestCodeGen.test(input, expect, 526))

    def test_float_op(self):
        input = """
        void main() {
            float a,b;
            a = b = 1.0;
            float c;
            c = a + b;
            putFloat(c);
            putFloat(c + a + 1.92/2);
            putFloat(c --- a + 1.92/2);
        }
        """
        expect = "2.03.961.96"
        self.assertTrue(TestCodeGen.test(input, expect, 527))

    def test_boolean_op(self):
        input = """
        void main() {
            putBool(-2 < -5);
            putBool(-3 <= -5);
            putBool(-3 > -5);
            putBool(-10 >= -5);
            putBool(-3 == -5);
            putBool(-3 != -5);
        }
        """
        expect = ""
        self.assertTrue(TestCodeGen.test(input, expect, 528))

    def test_boolean_op(self):
        input = """
        void main() {
            putBool(-2.5 < -5);
            putBool(-3 <= -10.2);
            putBool(-3 > -(1/8));
        }
        """
        expect = ""
        self.assertTrue(TestCodeGen.test(input, expect, 529))

    def test_boolean_op(self):
        input = """
        void main() {
            putString("a");
            putString("b");
            putString("c");
        }
        """
        expect = ""
        self.assertTrue(TestCodeGen.test(input, expect, 530))

    def test_boolean_op(self):
        input = """
        void main() {
            int a;
            int b;
            a = b = 1;
            putFloat(a);
            putFloat(b);
        }
        """
        expect = "11"
        self.assertTrue(TestCodeGen.test(input, expect, 531))

    def test_boolean_op(self):
        input = """
        void main() {
            putFloat(1.0+2.0);
            putFloat(1.0 * 2.0 + 3);
        }
        """
        expect = ""
        self.assertTrue(TestCodeGen.test(input, expect, 532))

    def test_boolean_op(self):
        input = """
        void main() {
            putFloat(1.0 + 2.0);
            putFloat(1.0 * 2.0 / 3);
        }
        """
        expect = ""
        self.assertTrue(TestCodeGen.test(input, expect, 533))

    def test_boolean_op(self):
        input = """
        void main() {
            putFloat(1.0 + 2.0);
            float value;
            value = 19 + 1.7*1.9;
            putFloat(9 + value);
        }
        """
        expect = ""
        self.assertTrue(TestCodeGen.test(input, expect, 534))

    def test_boolean_op(self):
        input = """
        void main() {
            putInt(200%2);
            putInt(200%17);
        }
        """
        expect = "013"
        self.assertTrue(TestCodeGen.test(input, expect, 535))

    def test_complex_boolean_op(self):
        input = """
        void main() {
            putBool((200%7) >= 2);
        }
        """
        expect = "true"
        self.assertTrue(TestCodeGen.test(input, expect, 536))

    def test_short_curcuit_boolean(self):
        input = """
        void main() {
            boolean v;
            v = false;
            putBool( v && (1/0-10));
        }
        """
        expect = "false"
        self.assertTrue(TestCodeGen.test(input, expect, 537))

    def test_if_stmt(self):
        input = """
        void main() {
            if (true) putBool(true);
        }
        """
        expect = "true"
        self.assertTrue(TestCodeGen.test(input, expect, 538))

    def test_if_stmt_with_else(self):
        input = """
        void main() {
            if (true)
                putBool(true);
            else
                putBool(false);
        }
        """
        expect = "true"
        self.assertTrue(TestCodeGen.test(input, expect, 539))

    def test_if_stmt_compare_int(self):
        input = """
        void main() {
            if (-2>3 || 1>0) {
                putBool(2>3);
            }
        }
        """
        expect = "false"
        self.assertTrue(TestCodeGen.test(input, expect, 540))

    def test_if_stmt_1(self):
        input = """
        void main() {
            if (true) {
                    int temp;
                    temp = 3;
                    putString("Hello");
                }
                if (false) {
                    float value;
                    value = 2;
                    putString("Hi");
                }
                if (false) {
                    putString("false");
                } else {
                    string s;
                    s = "true";
                    putString(s);
                }
            }
        }
        """
        expect = "Hellotrue"
        self.assertTrue(TestCodeGen.test(input, expect, 541))

    def test_if_stmt_nested(self):
        input = """
        void main() {
            if (true) 
                if(true){ 
                    putInt(2);

                    if (true) {
                        putInt(3);
                    } else {
                        putBool(false);
                    }
                }
            else 
                putString("hello");
        }
        """
        expect = "23"
        self.assertTrue(TestCodeGen.test(input, expect, 542))

    def test_if_stmt_with_else_2(self):
        input = """
        int foo(int v) {
                if (v > 0) {
                    return foo(v-1);
                } else {
                    return v;
                }
                return 3;
                }
        void main() {
            putInt(foo(0));
        }
        """
        expect = "0"
        self.assertTrue(TestCodeGen.test(input, expect, 543))

    def test_if_stmt_2(self):
        input = """
        int positive(int a) {
            if (a>=0) return true;
            return false;
        }
        void main() {
            int a;
            a = -20;
            putBool(positive(a));
            if (!positive(a)) a = -a;
            putInt(a);
            return;
        }
        """
        expect = "false20"
        self.assertTrue(TestCodeGen.test(input, expect, 544))

    def test_if_stmt_with_return(self):
        input = """
        void main() {
            int a;
            a = -2;
            if (a>2 || false) return;
            putInt(a);
            return;
        }
        """
        expect = "-2"
        self.assertTrue(TestCodeGen.test(input, expect, 545))

    def test_for_stmt_simple(self):
        input = """
        void main() {
            int a;
            for(a=0; a<=1; a=a+1){
                putInt(a);
            }
        }
        """
        expect = "01"
        self.assertTrue(TestCodeGen.test(input, expect, 546))

    def test_for_stmt(self):
        input = """
        void main() {
            int a;
            for(a=0; a<=5; a=a+1){
                putInt(1);
            }
        }
        """
        expect = "111111"
        self.assertTrue(TestCodeGen.test(input, expect, 547))

    def test_for_stmt_with_arr_function(self):
        input = """
        int[] revertArray(int arr[], int size){
            int i;
            for (i=0; i<(size/2); i=i+1){
                int c;
                c = arr[i];
                arr[i] = arr[size-1-i];
                arr[size-1-i] = c; 
            }
            return arr;

        }
        void main() {
            int arr[20];
            int i;
            for(i=0; i!=19; i=i+1){
                arr[i] = i + 1;
            }
            arr = revertArray(arr,20);
            putInt(arr[0]);
        }
        """
        expect = "0"
        self.assertTrue(TestCodeGen.test(input, expect, 548))

    def test_for_stmt_1(self):
        input = """
        void swap(int a, int b){
            int c;
            c = a;
            a = b;
            b = c;
        }
        void main() {
            int a;
            int i;
            int b;
            b = 1;
            a = i = 2;
            for(i=0; i<=2; i=i+1){
                if (i%2==0) {
                    swap(a,b);
                    a = a+1;
                }
                else return;
            }
            putInt(a);
        }
        """
        expect = ""
        self.assertTrue(TestCodeGen.test(input, expect, 549))

    def test_do_while_1(self):
        input = """
            void main() {
                int i;
                i = 5;
                do 
                    putInt(i);
                    {
                        int x;
                        x = i * i;
                        putInt(x);
                    }
                    i = i - 1;
                while i > 0;
            }
        """
        expect = "525416392411"
        self.assertTrue(TestCodeGen.test(input, expect, 550))

    def test_do_while_2(self):
        input = """
        void main() {
            int i;
            i = 1;
            do 
                putInt(i*i);
                {
                    int x;
                    x = i * i;
                    putInt(x-i);
                }
                i = i + 2;
            while i < 6;
        }
        """
        expect = "10962520"
        self.assertTrue(TestCodeGen.test(input, expect, 551))
    
    def test_do_while_3(self):
        input = """
        boolean foo(int a){
            if (a==0) return false;
            do
                putInt(a-1);
                a = a - 1;
            while foo(a);
            
        }
        void main() {
            int i;
            i = 2;
            foo(i);
        }
        """
        expect = "100"
        self.assertTrue(TestCodeGen.test(input, expect, 552))

    def test_break_label(self):
        input = """
            void main() {
                int i;
                for (i = 0; true; i = i +1) {
                    if (i == 5) { break; }
                    putInt(i);
                }
            }
        """
        expect = "01234"
        self.assertTrue(TestCodeGen.test(input, expect, 553))
    
    def test_break_label_2(self):
        input = """
            void main() {
                int i;
                i = 0;
                do 
                    i = i + 1;
                    putInt(i);
                    if (i == 4) break;
                while true;
            }
        """
        expect = "1234"
        self.assertTrue(TestCodeGen.test(input, expect, 554))
    
    def test_break_in_nested_loop(self):
        input = """
            void main() {
                int i,j;
                i =j =0;
                for (i =0 ;true; i = i + 1) {
                    if (i == 3)
                        break;
                    for (j = 0; true ;j = j + 1) {
                        if (j == 2) break;
                        putInt(j);
                    }
                }
            }
        """
        expect = "010101"
        self.assertTrue(TestCodeGen.test(input, expect, 555))
    
    def test_if_return(self):
        input = """
            void foo(int a[]) {
                putInt(a[0]);
            }
            void main() {
                int a[4];
                a[0] = 99;
                foo(a);
                if (1<=1) return;
                else putInt(1);
            }
        """
        expect = "99"
        self.assertTrue(TestCodeGen.test(input, expect, 556))

    def test_pass_arr_to_func(self):
        input = """
            void foo(int a[]) {
                putInt(a[0]);
            }
            void main() {
                int a[4];
                a[0] = 99;
                foo(a);
            }
        """
        expect = "99"
        self.assertTrue(TestCodeGen.test(input, expect, 557))
    
    def test_bool_array(self):
        input = """
            void main() {
                boolean a[3];
                a[0] = true;
                putBool(a[0]);
                putBool(12);
            }
        """
        expect = "truetrue"
        self.assertTrue(TestCodeGen.test(input, expect, 558))
    
    def test_continue(self):
        input = """
            void main() {
                int i;
                i = 0;
                for (i = 0; i < 10; i = i + 1) {
                    if (i % 2 == 0) continue;
                    putInt(i);  
                }
            }
        """
        expect = "13579"
        self.assertTrue(TestCodeGen.test(input, expect, 559))

    def test_var_decl(self):
        input = """
            boolean a[10];
            void main() {
                a[0] = true;
                a[1] = a[0] || (a[2] && a[3]);
                putBool(a[1]);
            }
        """
        expect = "true"
        self.assertTrue(TestCodeGen.test(input, expect, 560))
    
    def test_var_decl_local(self):
        input = """
            void main() {
                boolean a[4];
                a[2] = a[3] = false;
                a[0] = true;
                a[1] = a[0] || (a[2] && a[3]);
                putBool(a[1]);
            }
        """
        expect = "true"
        self.assertTrue(TestCodeGen.test(input, expect, 561))
    
    def test_pass_string_2_function(self):
        input = """
            float foo_1() {
                return 1;
            }
            void foo(string s, string arr[]) {
                putString(s);
                putString(arr[0]);
            } 
            void main() {
                string arr[1];
                arr[0] = "Hello";
                foo(arr[0], arr);
            }
        """
        expect = "HelloHello"
        self.assertTrue(TestCodeGen.test(input, expect, 562))

    def test_pass_string_2_function_2(self):
        input = """
            int foo_1() {
                return 1;
            }
            void foo(boolean s, boolean arr[]) {
                putBool(s);
                putBool(arr[0]);
            } 
            void main() {
                boolean arr[1];
                arr[0] = false;
                foo(arr[0], arr);
            }
        """
        expect = "falsefalse"
        self.assertTrue(TestCodeGen.test(input, expect, 563))

    def test_pass_array_to_func(self):
        input = """
            void init_array(int arr[],int size) {
                int i;
                for (i = 0; i < size; i = i + 1) {
                    arr[i] = 3;
                }
            }
            void main() {
                int a[10];
                init_array(a, 10);
                putInt(a[3]);
            }
            int foo() {
                putInt(12);
            }
        """
        expect = "3"
        self.assertTrue(TestCodeGen.test(input, expect, 564))
    
    def test_recursive_function(self):
        input = """
            int foo(int v) {
                if (v <= 1) return v;
                return foo(v-1) + foo(v-2);
            }
            void main() {
                putInt(foo(5));
            }
        """
        expect = "5"
        self.assertTrue(TestCodeGen.test(input, expect, 565))
    
    def test_float_int_multiple(self):
        input = """
            void main() {
                putFloat(1.25*3);
            }
        """
        expect = "3.75"
        self.assertTrue(TestCodeGen.test(input, expect, 566))
    
    def test_for_complex_6(self):
        input = """
            int a; 
            float b;
            boolean c;
            int d[5];
            string s;
            void main()
            {
                int sum,i,j;
                sum = 20;
                for (i=1;i<=sum;i=i+1)
                    sum = sum -i;
                putInt(sum);        
            }
        """
        expect = "5"
        self.assertTrue(TestCodeGen.test(input,expect,567))
    def test_for_complex_7(self):
        input = """
            int a; 
            float b;
            boolean c;
            int d[5];
            string s;
            void main()
            {
                int sum,i,j;
                sum = 20;
                for (i=1;i<=sum;i=i+1)
                    i=i+1;
                putInt(i);   
            }
        """
        expect = "21"
        self.assertTrue(TestCodeGen.test(input,expect,568))
    
    def test_for_continue_break(self):
        input = """
        void main() {
            int i;
            for(i=1;i<10;i=i+1)
            {
                if (i%2==0) continue;
                if (i == 7) break;
                putInt(i);
            }
        }
        """
        expect = """135"""
        self.assertTrue(TestCodeGen.test(input,expect, 569))
    
    def test_return_in_nested_if(self):
        input = """
        int f(int value) {
            if (value > 2) {
                if (value > 2) {
                    return f(value - 1);
                } else {
                    return 1;
                }
            } else {
                return 1;
            }
        }
        void main() {
            putInt(1);
            f(3);
        }
        """
        expect = """1"""
        self.assertTrue(TestCodeGen.test(input,expect, 570))
    
    def test_return_2_times(self):
        input = """
        int f(int value) {
            return value;
            return value;
        }
        void main() {
            putInt(f(1));
        }
        """
        expect = """1"""
        self.assertTrue(TestCodeGen.test(input,expect, 571))
    
    def test_convert_int_to_float(self):
        input = """
        float foo(int a)
        {
            return a;
        }
        void main()
        {
            int a;
            a = 199;
            putFloat(foo(a));
        }
        """
        expect = """199.0"""
        self.assertTrue(TestCodeGen.test(input,expect,572))
    
    def test_void_return(self):
        input = """
        void main()
        {
            int a;
            a = 10;
            putInt(200);
            if (a==10) {return;}
            putInt(100);
        }
        """
        expect = """200"""
        self.assertTrue(TestCodeGen.test(input,expect,573))
    
    def test_value_of_complex_program_No6(self):
        input = """
        void max(int a[])
        {
            int max;
            if (1 < 2) max =a[0];
        }
        void main(){
            
            putInt(200);
        }
        """
        expect = '200'
        self.assertTrue(TestCodeGen.test(input,expect,574))
    
    def test_return_array(self):
        input = """
        int[] foo()
        {
            int a[1];
            a[0] =100;
            return a;
        }
        void main()
        {
            putInt(foo()[0]);   
        }
        """
        expect = '100'
        self.assertTrue(TestCodeGen.test(input,expect,575))
    
    def test_return_bool_array(self):
        input = """
        boolean[] foo()
        {
            boolean a[1];
            a[0] = true;
            return a;
        }
        void main()
        {
            putBool(foo()[0]);   
        }
        """
        expect = 'true'
        self.assertTrue(TestCodeGen.test(input,expect,576))
    
    def test_return_string_array(self):
        input = """
        string[] foo()
        {
            string a[1];
            a[0] = "hi";
            return a;
        }
        void main()
        {
            putString(foo()[0]);   
        }
        """
        expect = 'hi'
        self.assertTrue(TestCodeGen.test(input,expect,577))
    
    def test_short_circuit(self):
        input = """
        void main()
        {
            int a;
            a = 0;
            boolean b;
            b = (a == 0) || (1/a==0) || (true);
            putBool(b); 
        }
        """
        expect = 'true'
        self.assertTrue(TestCodeGen.test(input,expect,578))
    
    def test_short_circuit_and(self):
        input = """
        void main()
        {
            int a;
            a = 0;
            boolean b;
            b = (a != 0) && (1/a==1);
            putBool(b); 
        }
        """
        expect = 'false'
        self.assertTrue(TestCodeGen.test(input,expect,579))
    
    def test_nested_for_loop(self):
        input = """
        void main()
        {
            int i,j; i=j=0;
            for (i=0; i< 3; i = i +1) {
                for (j = 0; j <=i ;j = j +1) {
                    putString("*");
                }
            }
            putBool(true)
        }
        """
        expect = '******true'
        self.assertTrue(TestCodeGen.test(input,expect,580))

    def test_dowhile_stmt_in_dowhile_stmt(self):
        input = """
        void main()
        {
            int a, b, iSum;
        
            a = b = iSum = 0;
            do
            {
                b = 0;
                a = a + 1;
                do
                {
                    b = b + 1;
                    iSum = iSum + b;
                }
                while (b < a); 
                iSum = iSum + a;
            }
            while (a < 20 );
            putInt(iSum);
        
        }
        
        """
        expect = "1750"
        self.assertTrue(TestCodeGen.test(input,expect,581))
    def test_dowhile_stmt_in_dowhile_stmt_complex(self):
        input = """
        void main()
        {
            int a, b, iSum;
        
            a = b = iSum = 0;
            do
            {
                b = 0;
                a = a + 1;
                do
                {
                    b = b + 1;
                    if (b > 10)  break;
                    if (b % 2==1)  continue;
                    iSum = iSum + b;
                }
                while (b < a );
                if (a % b ==0)  continue;
                if (a + b > 40)  break;
                iSum = iSum + a;
            }
            while (a < 20); 
            putInt(iSum);
        
        }
        
        """
        expect = "609"
        self.assertTrue(TestCodeGen.test(input,expect,582))
    def test_for_stmt_in_for_stmt(self):
        input = """void main()
        {
            int a, b, iSum;
        
            iSum = 0;
            for (a=0;a<10;a=a+1)
            {
                for (b=0;b<=a-1;b=b+1)
                {
                    if (a + b > 17)  break;
                    if (b % 2==0)  continue;
                    iSum = iSum + b;
                }
                
                    
                
                if (iSum > 27)  break;
                if (a % 3 != 0)  continue;
                iSum = iSum + a;
            }
            
                
            
            putInt(iSum);
        
        }
        
        """
        expect = "37"
        self.assertTrue(TestCodeGen.test(input,expect,583))
    def test_block_in_block(self):
        input = """
        int i, j;
        void main()
        {
            int a, b, iSum;
        
            i = 10;
            {
                float i;
                i = 14.3;
                {
                    int i;
                    i = 19;
                    putInt(i);
                }
                
                putFloat(i);
            }
            
            putInt(i);
        
        }
        
        """
        expect = "1914.310" 
        self.assertTrue(TestCodeGen.test(input,expect,584))
    def test_block_in_block_main(self):
        input = """
        int i, j;
        void main()
        {
            int a, b, iSum;
        
            i = 10;
            {
                float i;
                i = 11.8;
                putFloat(i);
            }
            
            i = 11;
        }
        
        """
        expect = "11.8"
        self.assertTrue(TestCodeGen.test(input,expect,585))
    def test_block_in_block_main1(self):
        input = """
        int i, j;
        void main()
        {
            int a, b, iSum;
        
            i = 10;
            {
                float i;
                i = 11.8;
                putFloat(i);
            }
            
            i = 11;
            putInt(i);
        
        }
        
        """
        expect = "11.811"
        self.assertTrue(TestCodeGen.test(input,expect,586))
    def test_return_simple_in_function(self):
        input = """
        void main()
        {
            foo(1.2,1.5);
        }
        void foo(float a,float b)
        {
            putFloat(a+b);
        }
        """
        expect = "2.7"
        self.assertTrue(TestCodeGen.test(input,expect,587))
    def test_return_complex_int_float(self):
        input = """
        void main()
        {
            foo(1,1.5,10,10+1);
        }
        void foo(int a,float b,int c,int d)
        {
            putFloat(a+b);
        }
        """
        expect = "2.5"
        self.assertTrue(TestCodeGen.test(input,expect,588))
    def test_return_complex_int(self):
        input = """
        void main()
        {
            int x;
            x=foo(1,1.5,10,10+1);
            putInt(x);
        }
        int foo(int a,float b,int c,int d)
        {
            return 99;
        }
        """
        expect = "99"
        self.assertTrue(TestCodeGen.test(input,expect,589))
    def test_return_complex_int_float_in_function(self):
        input = """
        void main()
        {
            putFloat(foo(1,1.5,10,10+1));
        }
        float foo(int a,float b,int c,int d)
        {
            return a+b+c+d;
        }
        """
        expect = "23.5"
        self.assertTrue(TestCodeGen.test(input,expect,590))

    def test_print_out_value_of_global_array_types_element(self):
        input = """
        float a[5];
        float print(float a[]){ putFloat(a[1]); return 1;}
        void main () {
            float b[2];
            a = b;
            b[1] = 10.22e12;
            a[1]=1;
            print(a);
        }
        """
        expect = "1.0"
        self.assertTrue(TestCodeGen.test(input,expect,591))

    def test_print_with_value_of_local_var_has_same_name_with_global_var_array(self):
        input = """boolean a[10]; void main () {int b;boolean a; {int c; a=true; putBool(!a);}}"""
        expect = "false"
        self.assertTrue(TestCodeGen.test(input,expect,592))

    def test_print_out_value_of_global_array_var_int_type(self):
        input = """
        int a[5];
        int put(int a){return a;}
        void main () {
            int i;
            int b[2];
            b[1]=1;
            b[1];
            put(b[1]);
            putInt(put(b[1]));
            for(i=0;i<2;i=i+1)
                b[i] = i;
            a[3] = put(b[1]);
            putInt(a[3]);
        }
        """
        expect = "11"
        self.assertTrue(TestCodeGen.test(input,expect,593))

    def test_print_out_value_of_var_check_and_symbol(self):
        input = """
        void main () {
            boolean a;
            a=false;
            true&&false&&true&&(a=true);
            putBool(a);
        }
        """
        expect = "false"
        self.assertTrue(TestCodeGen.test(input,expect,594))

    def test_print_out_value_of_var_check_or_symbol(self):
        input = """
        int a[5];
        void main () {
            boolean a;
            a=false;
            true||false||true||(a=true);
            putBool(a);
        }
        """
        expect = "false"
        self.assertTrue(TestCodeGen.test(input,expect,595))

    def test_print_out_value_of_var_check_and_or_with_complex_case(self):
        input = """
        int a[5];
        void main () {
            boolean a;
            a=false;
            if(false||false&&true && 12<5325.2 || (a!=false) ||(a=true)) {}
            putBool(a);
        }
        """
        expect = "true"
        self.assertTrue(TestCodeGen.test(input,expect,596))

    def test_print_out_value_of_var_check_and_or_with_function_return(self):
        input = """
        int a[5];
        boolean check(int a){a = 100; return true;}
        void main () {
            a[1] = 10;
            if(false||false&&true && 12<5325.2 || (check(a[1])!=false) ||(check(a[3])==true)) {}
            putInt(a[1]);
        }
        """
        expect = "10"
        self.assertTrue(TestCodeGen.test(input,expect,597))

    def test_print_out_value_in_complex_case(self):
        input = """
        float a[5];
        float print(float a[]){ putFloat(a[1]); return 1;}
        boolean check(int a){a = 100; return true;}
        void main () {
            float b[2];
            a = b;
            b[1] = 10.22e12;
            a[1]=1;
            print(a);
            {
                int a[5];
                a[1] = 10;
                if(false||false&&true && 12<5325.2 || (check(a[1])!=false) ||(check(a[3])==true)) {}
                putInt(a[1]);
            }
            {
                int a;
                float c;
                int b;
                b = 15111;
                c=1;
                -b;
                a = -b;
                putBool(!(a > -b||a == b+122|| false != false|| b+1>=123--a));
            }
        }
        """
        expect = "1.010false"
        self.assertTrue(TestCodeGen.test(input,expect,598))

    def test_MC_program_check_the_same_name_variable(self):
        input = """
        int i;
        int f(){
            return 200;
        }
        void main () {
            int main;
            main = f();
            putInt(main);
            {
                int i;
                int main;
                int f;
                main = f = i = 100;
                putInt(i);
                putInt(main);
                putInt(f);
            }
            putInt(main);
        }
        """
        expect = "200100100100200"
        self.assertTrue(TestCodeGen.test(input,expect,599))