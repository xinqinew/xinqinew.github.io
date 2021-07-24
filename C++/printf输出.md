# printf输出
函式原型：  int printf ( const char * format, ... ); 

引數說明： %[flags][width][.precision][length]specifier
                %[旗標][寬度][.精度][長度修飾]資料型態

 

## 1. 資料型態 ( %[旗標][寬度][.精度][長度修飾]資料型態 ) 必填欄位 

### (1.1) 字元/字串

   %c, %C : 字元,  char c;
       %s : 字元陣列, char buffer[MAX_PATH];
       %S : 字元陣列(Unicode), wchar buffer[MAX_PATH];

[註] %C / %S 並未被收在標準函式庫裡，屬 MSVC 特殊支援。

### (1.2) 整數


    %d, %i : 10進制整數  , int x; [lemma] 
        %u : 10進制無號數, unsigned int x;
        %o : 8進制無號數,  unsigned int x;
     %x, %X : 16進制無號數, 小寫x輸出為"abcdef", 大寫 X 輸出為 "ABCDEF", 
              unsigned x;
%lld, %I64d : long long int, __int64 輸出型態
             (註：vc6.0 下只有 __int64，沒有long long int)
%llu, %I64u : unsigned long long int  輸出型態

[lemma] %d : dec; %i : integer，於 scanf 時有部份差異 (%d 只接受10進位, %i 可接受指定進位，如 0x23, 045)，但於 printf 時 %d, %i 並無顯著差異 (感謝 Jacob Lee 補充指導)

 

### (1.3) 浮點數

   %e, %E : 浮點數使用科學符號表示之,指數將帶正負號, float x,doubley;
       %f : 單精度浮點數(預設輸出精度6位), float x;
            (註 : 對 printf 而言, %f/%lf 可適用於 double / float)
      %lf : 倍精度浮點數(預設輸出精度6位), double x;
%llf, %LF : 雙倍精度浮點數(預設輸出精度6位), long double x;
   %g, %G : 由系統決定是否採科學符號表示。

### (1.4) 特殊 原創：edisonx.pixnet.net

       %p : 變數位置。 ex:
            int a=0, printf("%p", &a);  即 printf("%08x", &a);
       %n : 輸出至緩衝區之長度, ex:
            char str[]="test", int len, printf("%s%n", a, &len);
            輸出4bytes,len = 4

### (1.5) C99新增 < 建議 k spec. 最清楚 >

(註 : C99 新增了一些資料型態在 inttypes.h / stdint.h 裡面，有興趣搜尋 n1256.pdf 下載下來 K 標準， in section 7.8 。當然 MSVC 不支援 C99 是眾所皆知的事。)

部份原則還是掌握了 %i, %u, %d, %x，另由於這部份在 printf 會顯得很亂，故直接做範例對應。掌握一原則：新的資料型態在 printf 前三個字母一定是 PRI。

   "%" PRIdN , "%" PRIiN: 以十進位有號數顯示 intN_t 系列之數值。ex : 

         int8_t i8  = 8  ; <----> printf( "i8 = %" PRId8  " \n", i8);
         int8_t i16 = 16 ; <----> printf( "i16= %" PRIi16 " \n", i16);
         int8_t i32 = 32 ; <----> printf( "i32= %" PRId32 " \n", i32); 
         int8_t i64 = 64 ; <----> printf( "i64= %" PRIi64 " \n", i64); 

 

另上述將 PRIdN / PRIiN ，換成 PRIoN / PRIuN / PRIxN / PRIXN ，便可轉對 uintN_t 資料型態做輸出，分別為 ( 8 進位、10進位、16進位小寫、16進位大寫)，有空自己試試，不贅述。 

 

   "%" PRIdLEASTN , "%" PRIiLEASTN: 以十進位有號數顯示 int_leastN_t 系列之數值。ex : 

         int_least8_t  i8  = 8  ; <----> printf( "i8 = %" PRIdLEAST8  " \n", i8);
         int_least16_t i16 = 16 ; <----> printf( "i16= %" PRIiLEAST16 " \n", i16);
         int_least32_t i32 = 32 ; <----> printf( "i32= %" PRIdLEAST32 " \n", i32); 
         int_least64_t i64 = 64 ; <----> printf( "i64= %" PRIiLEAST64 " \n", i64); 

 

 另上述將 PRIdLEASTN / PRIiLEASTN ， 換成 PRIoLEASTN/ PRIuLEASTN/ PRIxLEASTN/ PRIXLEASTN， 便可轉對 uint_leastN_t 資料型態做輸出，分別為 ( 8 進位、10進位、16進位小寫、16進位大寫)，有空自己試試，不贅述。 

 

    "%" PRIdFASTN , "%" PRIiFASTN: 以十進位有號數顯示 int_fastN_t 系列之數值。ex : 

         int_fast8_t  i8  = 8  ; <----> printf( "i8 = %" PRIdFAST8  " \n", i8);
         int_fast16_t i16 = 16 ; <----> printf( "i16= %" PRIiFAST16 " \n", i16);
         int_fast32_t i32 = 32 ; <----> printf( "i32= %" PRIdFAST32 " \n", i32); 
         int_fast64_t i64 = 64 ; <----> printf( "i64= %" PRIiFAST64 " \n", i64); 


 

 另上述將 PRIdFASTN / PRIiFASTN ，換成 PRIoFASTN/ PRIuFASTN/ PRIxFASTN/ PRIXFASTN，便可轉對 uint_leastN_t 資料型態做輸出，分別為 ( 8 進位、10進位、16進位小寫、16進位大寫)，有空自己試試，不贅述。 

 

   "%" PRIdMAX , "%" PRIdPTR : 分別顯示整數最大值與指標型態。

 

[註 : 特別注意 inttypes.h 裡面之型態，printf 引數和 scanf 引數差很多，一樣掌握一原則，新的資料型態在 scanf 前三個字母一定是 SCN， 如 intN_t  系列，scanf 用的是 "%" SCNdN / "%" SCNiN ； uintN_t 系列，scanf 用的是 "%" SCNoN / "%" SCNuN / "%" SCNxN / "%" SCNXN ； int_fastN_t / int_leastN_t 等系列資料型態便不贅述。 )

 

## 2. 寬度 ( %[旗標][寬度][.精度][長度修飾]資料型態 ) 選填欄位net

      %m : 指定輸出之寬度。ex:
           int a=2, b=10;
           printf("%d%5d", a, b);
           輸出為   "2   10"  (2與10之間有3個空白，因10為5個文字寬度)。
      %* : 以引數方式代入指定輸出之寬度。ex:
           int a=2, width=10;
           printf("%*d",width, a);
           輸出為   "         2"  (10個文字寬度)。

## 3. 長度修飾 ( %[旗標][寬度][.精度][長度修飾]資料型態 ) 選填欄位

 

      %h : 將數字視為 short int (%hd) 或 unsigned int (%hu),
           此修飾只對整數型態之 %hi, %hd, %ho, %hu, %hx, %hX 有效。
           且針對 char 可用 %hhd，unsigned char 可用 %hhu。

     (註 : MSVC 認得 %hd / %hu / %hhd / %hhu , 但在 gcc 下會發出認不得的警告 )

      %l : 將數字視為 long  int (%ld) 或 unsigned long int (%lu), 
           此修飾只對整數型態之 %li, %ld, %lo, %lu, %lx, %lX 有效。
      %L : 此修飾只對浮點數型態之 long double 有效, 可用於修飾
           %Le, %LE, %Lf, %Lg, %LG。

## 4. 精度 ( %[旗標][寬度][.精度][長度修飾]資料型態 ) 選填欄位 

     %.n : 欲輸出小數點後幾位數,即顯示之精度,此修飾只對浮點數資料型態有效(f,F,e,E,g),
           若使用其它整數型態 (i, d, o, u, x, X) 則將 n 視為 0, 即不輸出小數位數。ex:
           double a=2.1234, printf("%.2lf", a);
           輸出則為  "2.12" 。
     %.* : 和 %.n 相似，但其 n 值可用變數引入。ex:
           double a=1.3456, int preci=2, printf("%.*lf",preci, a);
           輸出則為  "1.35" 。
     %m.n: 這是寬度和精度合用之方法, 代表輸出會有小數點後 n 位，
           且整個輸出文字寬 m 個字(包含小數點、正負號及數字)。ex:
           double c = -102.34567, printf("%10.3lf", c);
           結果會輸出  "  -102.346" ，前面將會保留二個空白，使得整體寬度為 10 。
     %*.*: 和上一說明一樣, 但寬度與精度可用引數決定。ex:
           double c = -102.34567, int m=10, int n=3;
           printf("%*.*lf", m, n, c);
           結果會輸出  "  -102.346" ，前面將會保留二個空白，使得整體寬度為 10 。

## 5. 旗標 ( %[旗標][寬度][.精度][長度修飾]資料型態 ) 選填欄位 

       %- : 原本輸出預設為向右對齊，使用後輸出向左對齊, 需與[寬度]配合使用。ex:
            char buf[] = "Test";
            printf("%-10s");
            輸出結果為 "Test      "， Test 後面將保留6個空白。             
       %+ : 需為數值型之資料型態，強制輸出正負號，可與 '-' 旗標合用。 ex:
            double a = 3.4567:
            printf("%-+8.2lf", a);
            // '-'使輸出靠左對齊, '+'強調輸出正負號, 整體寬度為8, 小數點顯示2位。
            輸出結果為 "+3.46   "
       %0 : 若輸出之左半部為空白處, 則進行補0, (所以這不能和 '-' 合用) ex:
            unsigned int x = 122;
            printf("%05u", x); 
            // 寬度為5, 前半空白補零
            輸出結果為 "00122"
       %# : 對進制加上前綴符號, 只對 %o, %x 有用, 
            %#o為8進制,前綴符號為 0,
            %#x為16進制,前綴符號為 0x, %#X前綴符號則為 0X。ex:
            unsigned int a = 15;
            printf("%u %#o %#X", a, a, a);
            輸出結果為 "15 017 0XF" 
   %(空白): 若數字為正號, 則會在該數字前面加上一空白，(故不可與 '+' 合用)。 ex:
            int a=10;
            printf("% -5d"); // 寬度5, 向左對齊, 保留正號位置
            輸出結果為 " 10  "
			

