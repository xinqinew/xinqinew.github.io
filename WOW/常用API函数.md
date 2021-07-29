# 常用API函数
***
## 模拟鼠标
```cpp
LRESULT SendMessage(HWND hWnd，UINT Msg，WPARAM wParam，LPARAM IParam);
```
其中Msg可以为WM_LBUTTONDOWN或WM_LBUTTONUP,表示对鼠标的软件模拟操作(虽然兼容性和安全性不如硬件模拟的mouse_event，但不改变移动鼠标指针)

故一般写作SendMessage(hwnd, WM_LBUTTONUP/WM_LBUTTONDOWN, 0, Y坐标<<16+X);

Msg也可以为WM_CLOSE,表示关闭窗口,其后的两个参数传0即可.

***
## DLL注入
```c
HANDLE CreateThread(LPSECURITY_ATTRIBUTES, SIZE_T, LPTHREAD_START_ROUTINE, LPVOID, DWORD ,LPDWORD);
```
CreateThread将在主线程的基础上创建一个新线程 

```c
LPVOID VirtualAllocEx(HANDLE, LPVOID, SIZE_T, DWORD, DWORD);
```
向指定进程申请内存，其中flAllocationType取值MEM_COMMIT表示写入物理存储而非磁盘交换内存 

```c
FARPROC GetProcAddress(HMODULE hModule, LPCSTR);
```
检索指定的动态链接库(DLL)中的输出库函数地址

```c
HANDLE CreateRemoteThread(HANDLE, LPSECURITY_ATTRIBUTES, SIZE_T, LPTHREAD_START_ROUTINE, LPVOID, DWORD, LPDWORD);
```
创建一个在其它进程地址空间中运行的线程 

***
## DLL劫持

`__asm{ }`  
执行括号内的汇编代码  
JMP EAX  
将EIP跳转到EAX执行，劫持DLL后要获取真正的原函数地址，使用时要进行跳转

***
## GDI绘图
```c
HDC GetDC(HWND hWnd);
```
检索显示设备上下文环境的句柄

CDC
CDC类定义的是设备上下文对象的类

```c
CPoint CDC::MoveTo(int x,int y);
CPoint CDC::LineTo(int x,int y);
```
绘制直线
```c
BOOL CDC::Ellipse(int x1,int y1，int x2,int y2);
```
绘制圆形
```c
BOOL CRgn::CreateRectRgn(int x1,int y1,int x2,int y2);
```
建立方形区域
```c
BOOL CRgn::CreateEllipticRgn(int x1,int y1,int x2,int y2)
```
建立圆形区域
```c
int CombineRgn(CRgn pRgn1,CRgn pRgn2,int nCombineMode );
```
合并区域(圆点准心为使得中间透明采取大圆-小圆的区域)
```cpp
BOOL FillRgn(CRgn pRgn,CBrush pBrush );
```
填充形状

