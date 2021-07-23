# WOW部分功能代码
## 获取角色名字
```cpp
// pcall5(对象地址,0,1,0,0);//返回名字地址
void CPAGE1::OnBnClickedButton()
{
	// TODO: 在此添加控件通知处理程序代码
	UINT64 pBase64 = (UINT_PTR) LoadLibraryA("Wow.exe");
	UINT64 pRoleObj = R8(R8(pBase64+0x2387c88)+0x200);//角色对象
	TPCALL5 pcall5 =(TPCALL5)(pBase64+0xA7640);
	// TPCALL5 pcall5 = (TPCALL5)((UINT_PTR) LoadLibraryA("Wow.exe")+0xA7640);
	char szpAscii[256]={0};
	// char* utf8ToAscii(IN char*szpUtf8,OUT char*szpAscii);

	char *putf8Name =(char*) pcall5(pRoleObj,0,1,0,0);
	utf8ToAscii(putf8Name,szpAscii);
	m_edt_strA=szpAscii;
	UpdateData(FALSE);//把变量的数据更新到窗口
}
```
## 遍历怪物列表
```cpp
void 遍历怪物列表()
{
	UINT64 exeBase = (UINT64)LoadLibraryA("Wow.exe");
	for (UINT i=0;i<=0x7F;i++)//7F可能不是 对象数量 对象的分类编号
	{
		// UINT64 vrax=0;
		UINT64 vrax = R8(R8(R8(exeBase+0x2387C88)+0x30)+0x10+i*3*8);
		if (vrax == 0 )
		{
			break;
		}
		// else//vrdx !=0
		// {
		// 	vrax = vrdx;
		// }
		UINT64 vrcx = (UINT64)R4(R8(R8(exeBase+0x2387C88)+0x30)+i*3*8);//+28

		while((vrax&1)==0)
		{
			//遍历同类链表
			//rcx = dword([[wow.exe+0x2387C88]+0x30]+i*3*8) //0x28
			
			//+198]+20 //float x,y,z
			UINT64 pNode198 = R8(vrax+0x198);
			float x = R4F(pNode198+0x20);
			float y = R4F(pNode198+0x24);
			float z = R4F(pNode198+0x28); 

			char buf[2048];
			char asciiObjName[2048]={0};
			char *pObjName=GetObjName(vrax);
			if (pObjName&&pNode198)
			{
				utf8ToAscii(pObjName,asciiObjName);
			}
			sprintf_s(buf,"yjx:[%d] vrax=%p (%f,%f,%f) vrcx=%llx name=%p %s\r\n",i,vrax,x,y,z,vrcx,pObjName,asciiObjName);
			MessageBoxA(0,buf,"while",0);
			vrax = R8(vrcx+vrax+8);	//链表
		}
	}
}

```
## 获取对象名字
```cpp
char* GetObjName(UINT64 vrcx)
{
	char *putf8Name=NULL;
	__try
	{
		UINT64 pBase64 = (UINT_PTR)LoadLibraryA("Wow.exe");
		UINT64 pRoleObj = R8(R8(pBase64+0x2387C88)+0x200);
		TPCALL5 pcall5 = (TPCALL5)(pBase64+0x8AE040);
		char szpAscii[256]={0};

		putf8Name = (char*)pcall5(vrcx,0,1,0,0);
	}__except(1)
	{

	}
	return putf8Name;
}
```
## 使用技能
```cpp
void TGCALL::UseActionCall(UINT32 SkillID,UINT64* argBuf40,UINT64 *TargetID16)
{
	typedef UINT64 (*TPCALL4)(UINT64 arg1,UINT64* arg2,UINT64 arg3,UINT64* arg4);
	TPCALL4 pcall=(TPCALL4)(GameBase::GetExeBase()+0x77DC40);
	__try
	{
		pcall(SkillID,argBuf40,0,TargetID16);
	}__except(1)
	{
		MessageBoxA(0,"ERROR 0x77DC40","错误",MB_OK);
	}
	return;
}

```


### 火球术
```cpp
void CPAGE1::OnBnClickedButtonFire()
{
	// TODO: 在此添加控件通知处理程序代码
	
	UINT64 arg2buf[50]={0};  //疑似 坐标 方向 
	UINT64 ID16[50]={0,0};   // 0x006FCC00007B4493 /*ID1*/,0x204D880000001140 /*ID2*/};//目标怪物的ID
	TGCALL::UseActionCall(0x00000085,arg2buf,ID16);
}
```

### 霜甲术
```cpp
void CPAGE1::OnBnClickedButtonIce()
{
	// TODO: 在此添加控件通知处理程序代码
	UINT64 arg2buf[50]={0};  //疑似 坐标 方向 
	UINT64 ID16[50]={0/*ID1*/,0/*ID2*/};  //目标怪物的ID
	TGCALL::UseActionCall(0x000000A8,arg2buf,ID16);
}
```
## 捡物
```cpp
void CPAGE1::OnBnClickedButtonPick()
{
	// TODO: 在此添加控件通知处理程序代码
	TPCALL4 pcall4 = (TPCALL4)(GameBase::GetExeBase()+0xF2A620);
	pcall4(0,0,0,0);
	pcall4(1,0,0,0);
	pcall4(2,0,0,0);
}
```

## 搜索选中怪身上的物品
```c
void CPAGE1::OnBnClickedButtonSeachgoods()
{
	// TODO: 在此添加控件通知处理程序代码
	UINT64 pBase = R8(GameBase::GetExeBase()+0x21E2858);

	UINT64 ID1 = R8(pBase+0x30);
	UINT64 ID2 = R8(pBase+0x38);
	UINT64 arg1[40] = {ID1,ID2,0,0};
	//通过选中对象ID 查找对象
	TPCALL4 pcallGetObj1=(TPCALL4)(GameBase::GetExeBase()+0xB66AB0);
	UINT64 vrax = pcallGetObj1((UINT64)arg1,0,0,0);//一个参数
	char buf[1024];
	sprintf_s(buf,"vrax=%llx \r\n",vrax);

	TPCALL4 pcall =(TPCALL4)(R8(R8(vrax)+0x2C0));//2C0 右键单击 打开搜索物品的窗口
	pcall(vrax,0,0,0);
 
}
```

## 获取角色对象地址
```c
UINT64 GameBase::GetRoleObj()//返回角色对象地址
{
	// return R8(R8(GetExeBase()+0x2387C88)+0x200);
	TPCALL2 pcall2 = (TPCALL2)(GameBase::GetExeBase()+0x1127550);
	const char *vrcx = "player";
	return pcall2((UINT64)vrcx,0);
}
```