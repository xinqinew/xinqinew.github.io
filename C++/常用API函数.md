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
**CreateThread** 将在主线程的基础上创建一个新线程 

***

```c
LPVOID VirtualAllocEx(
	HANDLE hProcess,	//申请内存所在的进程句柄。
	LPVOID lpAddress,	//保留页面的内存地址；一般用NULL自动分配 。
	SIZE_T dwSize,	//欲分配的内存大小，字节单位；注意实际分 配的内存大小是页内存大小的整数倍
	DWORD flAllocationType,	//一般用MEM_COMMIT
	DWORD flProtect	//一般用PAGE_READWRITE(读写)
);
```
**VirtualAllocEx** 向指定进程申请内存

****

```c
FARPROC GetProcAddress(HMODULE hModule, LPCSTR);
```
**GetProcAddress** 检索指定的动态链接库(DLL)中的输出库函数地址

****

```c
HANDLE CreateRemoteThread(HANDLE, LPSECURITY_ATTRIBUTES, SIZE_T, LPTHREAD_START_ROUTINE, LPVOID, DWORD, LPDWORD);
```
**CreateRemoteThread** 创建一个在其它进程地址空间中运行的线程 

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

```cpp
CPoint CDC::MoveTo(int x,int y);
CPoint CDC::LineTo(int x,int y);
```
绘制直线
```cpp
BOOL CDC::Ellipse(int x1,int y1，int x2,int y2);
```
绘制圆形
```cpp
BOOL CRgn::CreateRectRgn(int x1,int y1,int x2,int y2);
```
建立方形区域
```cpp
BOOL CRgn::CreateEllipticRgn(int x1,int y1,int x2,int y2)
```
建立圆形区域
```cpp
int CombineRgn(CRgn pRgn1,CRgn pRgn2,int nCombineMode );
```
合并区域(圆点准心为使得中间透明采取大圆-小圆的区域)
```cpp
BOOL FillRgn(CRgn pRgn,CBrush pBrush );
```
填充形状



## 其它API函数

### MoveWindow

```cpp
BOOL MoveWindow( HWND hWnd, int X, int Y, int nWidth, int nHeight, BOOL bRepaint );
```

改变指定窗口的位置和大小

### IsWindow

```cpp
BOOL IsWindow(HWND hWnd)；
```

判断是否是有效窗口句柄

### ShowWindow

```cpp
BOOL ShowWindow(HWND hWnd, int nCmdShow);
```

显示隐藏窗口

### ShowWindowAsync

```cpp
BOOL ShowWindowAsync(HWND hWnd，int nCmdshow)；
```

异步显示窗口

### IsWindowVisible

```cpp
BOOL IsWindowVisible(HWND hWnd);
```

获取窗口可视状态,即显示或隐藏

### IsZoomed

```cpp
BOOL IsZoomed(HWND hWnd)；
```

窗口是否是最大化

### IsWindowUnicode

```cpp
BOOL IswindowUnicode(HWND hwnd)；
```

判断窗口字符集 由RegisterClassA 还是RegisterClassW注册

### CloseWindow

```cpp
BOOL CloseWindow(HWND hWnd);
```

关闭窗口

### WindowFromPoint

```cpp
HWND WindowFromPoint(POINT Point)；
```

获取指定坐标处的窗口句柄

### ChildWindowFromPoint

```cpp
HWND ChildWindowFromPoint (HWND hWndParent, POINT Point);
```

获取指定窗口 坐标处子窗口句柄

### GetWindowText

```cpp
Int GetWindowText(HWND hWnd,LPTSTR lpString,Int nMaxCount);
```

获取窗口标题字符串

### GetClassName

```cpp
int GetClassName(HWND hWnd, LPTSTR IpClassName, int nMaxCount);
```

获取窗口注册的类名,由RegisterClass注册时的名字

### BringWindowToTop

```cpp
B00L BringWindowToTop(HWND hWnd);
```

窗口激活并切换到Z序顶层

### EnableWindow

```cpp
BOOL EnableWindow(HWND hWnd，BOOL bEnable);
```

是否接收键盘鼠标消息

### EnumChildWindows

```cpp
BOOL EnumChildWindows(HWND hWndParent,WNDENUMPROC lpEnumFunc, LPARAM lParam);
```

遍历子窗口

### SetWindowPos

```cpp
WINUSERAPI BOOL WINAPI SetWindowPos(HWND hWnd,HWND hWndInsertAfter,int X,int Y,int cx, int cy, UINT uFlags);
```

窗口位置设置

### SetWindowText

```cpp
BOOL SetWindowText(HWNDhwnd,LPCTSTRlpString);
```

设置窗口标题,SetWindowText也分A和W两种







