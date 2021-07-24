# deque 用法与示例
本篇將介紹如何使用 C++ std deque 以及用法與範例，C++ std::deque 是一個雙向佇列(double-ended queue)，在頭尾兩端插入及刪除十分快速，在中間插入刪除元素比較費時。 

std::deque 是 **d**ouble-**e**nded **que**ue 而不是 double linked list，底層實做是用間接索引的方式實現的，類似一個 map 索引到若干個固定大小的資料區塊(連續記憶體空間)，利用兩次索引達成跟 vector 一樣的隨機訪問功能。 

以下將依序介紹幾個 std::deque 容器常用的用法範例，分別為 

-   deque 常用功能 
-   範例1. 基本的 push_back, pop_front, push_front, pop_back 的用法範例 
-   範例2. push_back 自定義類別 
-   範例3. 用 for 迴圈遍歷 deque 容器 
-   範例4. 用 while 迴圈在 deque 容器裡搜尋/尋找 
-   deque 的優點與缺點 

要使用 deque 容器的話，**需要引入的標頭檔**: `<deque>`

## deque 常用功能

以下為 std::deque 內常用的成員函式  
修改器  
`push_back`: 把一個元素添加到尾端  
`push_front`: 把一個元素插入到頭端  
`pop_back`: 移除最後一個元素(尾端)  
`pop_front`: 移除第一個元素(頭端)  
`insert`: 插入元素  
`erase`: 移除某個位置元素, 也可以移除某一段範圍的元素  
`clear`: 清空容器裡所有元素  
容量  
`empty`: 回傳是否為空  
`size`: 回傳目前長度  
元素存取  
`[i]`: 隨機存取索引值為i的元素  
`back`: 取得最後一個元素  
`front`: 取得第一個的元素  
迭代器  
`begin`:回傳指向第一個元素(頭端)的迭代器  
`cbegin`:回傳指向第一個元素(頭端)的迭代器(const)  
`end`:回傳指向最後一個元素(尾端)的迭代器  
`cend`:回傳指向最後一個元素(尾端)的迭代器(const)  
`rbegin`:回傳指向最後一個元素(尾端)的反向迭代器  
`crbegin`:回傳指向最後一個元素(尾端)的反向迭代器(const)  
`rend`:回傳指向第一個元素(頭端)的反向迭代器  
`crend`:回傳指向第一個元素(頭端)的反向迭代器(const) 

## 範例1. 基本的 push_back, pop_front, push_front, pop_back 的用法範例

以下範例為push_back(), pop_front(), push_front(), pop_back() 用法，  
其中 push_back() 與 pop_front() 應該是最常用到的函式了。 

另外使用 deque 相對於 queue 的好處是deque可以使用隨機訪問的功能 `[i]`。  

std-deque.cpp
```cpp
// g++ std-deque.cpp -o a.out -std=c++11  
#include <iostream>  
#include <deque>  
  
using namespace std;  
  
int main() {  
 deque<int> d = {1, 2, 3, 4};  // [1, 2, 3, 4]  
  
 d.push_back(5); // [1, 2, 3, 4, 5]  
 d.pop_front(); // [2, 3, 4, 5]  
 d.push_front(0); // [0, 2, 3, 4, 5]  
 d.pop_back(); // [0, 2, 3, 4]  
  
 // 印出 deque 內所有內容, c++11 才支援  
 for (int &i : d) {  
 cout << i << " ";  
 }  
 cout << "\n";  
  
 cout << d[0] << " " << d[1] << " " << d[2] << "\n";  
  
 return 0;  
}  
```
輸出內容如下：  

>
0 2 3 4  
0 2 3  

## 範例2. push_back 自定義類別

以下範例為 std::deque 容器使用 push_back() 來推放 Student 自定義類別的範例，使用 push_back() 來放進 deque 的最尾端，這個範例限制 deque 最多塞3個，多的會用 pop_front() 給 pop 掉，最後再將 deque 容器的所有的元素印出來。  

```cpp
// g++ std-deque2.cpp -o a.out -std=c++11  
#include <iostream>  
#include <deque>  
  
using namespace std;  
  
class Student {  
public:  
 Student(int id) { this->id = id; }  
  
 int id;  
};  
  
std::deque<Student> d;  
  
void deque_push_back(Student a) {  
 d.push_back(a);  
 if (d.size() > 3) {  
 d.pop_front();  
 }  
}  
  
int main() {  
 Student a1(1), a2(2), a3(3), a4(4);  
 deque_push_back(a1);  
 deque_push_back(a2);  
 deque_push_back(a3);  
 deque_push_back(a4);  
  
 // 印出 deque 內所有內容, c++11 才支援  
 for (auto &i : d) {  
 cout << i.id << " ";  
 }  
 cout << "\n";  
  
 return 0;  
}  
```
## 範例3. 用 for 迴圈遍歷 deque 容器

以下範例是用 for 迴圈配合 deque 容器的迭代器，去遍歷 deque 並且把值印出來，前兩種是從頭印到尾，後兩種是從尾印到頭。從頭端印到最尾端就是使用 begin() 搭配 end() ，從最尾端印到頭端就是使用 rbegin() 搭配 rend() 。 

這裡的 begin() / end() 與 cbegin() / cend() 有什麼不同呢？begin() / end() 是回傳 iterator，而 cbegin() / cend() 是回傳 const_iterator，iterator 可以修改元素值，const_iterator 則不可修改，簡單說就是回傳的東西能不能被修改的差異，要用哪種就自行判斷要用哪種了。 

cbegin(), cend(), crbegin(), crend() 是 C++11 新增的，要使用時記得編譯器要加入`-std=c++11`選項。 

第一個 for 迴圈裡面的迭代器使用懶人快速寫法`auto it = d.begin();`，其全名為`std::deque<int>::iterator it = d.begin();`，如果不想寫這麼長的話，就可以像我一樣用 `auto` 的懶人快速寫法。  

```cpp

// g++ std-deque3.cpp -o a.out -std=c++11  
#include <iostream>  
#include <deque>  
  
using namespace std;  
  
int main() {  
 deque<int> d = {1, 2, 3, 4};  
  
 // 從頭到尾  
 //for (std::deque<int>::iterator it = d.begin(); it != d.end(); ++it) {  
 for (auto it = d.begin(); it != d.end(); ++it) {  
 cout << *it << " ";  
 }  
 cout << "\n";  
  
 // 從頭到尾  
 for (auto it = d.cbegin(); it != d.cend(); ++it) {  
 cout << *it << " ";  
 }  
 cout << "\n";  
  
 // 從尾到頭  
 for (auto it = d.rbegin(); it != d.rend(); ++it) {  
 cout << *it << " ";  
 }  
 cout << "\n";  
  
 // 從尾到頭  
 for (auto it = d.crbegin(); it != d.crend(); ++it) {  
 cout << *it << " ";  
 }  
 cout << "\n";  
  
 return 0;  
}  
```
輸出  
>
1 2 3 4  
1 2 3 4  
4 3 2 1  
4 3 2 1  

## 範例4. 用 while 迴圈在 deque 容器裡搜尋/尋找

以下範例是用 while 迴圈在 deque 容器裡搜尋/尋找數字為3，這裡的 `auto` 懶人快速寫法如上範例解釋相同就不贅述了。 

在 while 迴圈裡如果有找到就印個有找到的訊息，假如整個 while 迴圈都沒找到，最後可以判斷 `it == d.end()` 代表整個 deque 容器都遍歷過了也沒有找到，就印個沒找到的訊息。  
```cpp
// g++ std-deque4.cpp -o a.out -std=c++11  
#include <iostream>  
#include <deque>  
  
using namespace std;  
  
int main() {  
 deque<int> d = {1, 2, 3, 4};  
  
 // 從頭到尾  
 int find_num = 3;  
 //std::deque<int>::iterator it = d.begin();  
 auto it = d.begin();  
 while (it != d.end()) {  
 if (*it == find_num) {  
 cout << "Found " << find_num << endl;  
 break;  
 }  
 it++;  
 }  
 if (it == d.end()) {  
 cout << "Not found " << find_num << endl;  
 }  
  
 return 0;  
}  
```
輸出  


>Found 3  

如果將 find_num 變數改成 5 去搜尋/尋找的話則會找不到，輸出結果會變成  

  

>Not found 5  

## deque 的優點與缺點

deque 的優點 

-   可以再兩端進行 push 和 pop 操作 
-   支持隨機訪問[i] 

deque 的缺點 

-   佔用記憶體較多