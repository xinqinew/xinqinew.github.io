----------------------------------------------------
	------------铁血武林辅助脚本----------------	
	------------智能化菲佣版 V0.1beta-----------
----------------------------------------------------
	------------版权所无，敬请复制--------------
	------------您可以随意使用代码--------------
----------------------------------------------------
	------------脚本制作人：菲佣----------------
	------------创建时间：2015-11-21------------
	------------邮箱：roiff@126.com ------------
----------------------------------------------------
PAGE = {}
PAGE["首页"] = {}
	PAGE["首页"]["多人对战"] = {Unit = 1,Pixelpoint = {  822,  263, 0xf14734}}
	PAGE["首页"]["勇气大陆"] = {Unit = 1,Pixelpoint = {  816,  389, 0xdd5faf}}
	PAGE["首页"]["经典模式"] = {Unit = 1,Pixelpoint = {  792,  534, 0xffb222}}
	PAGE["首页"]["邮箱"] = {Unit = 0,Pixelpoint = {  964,   33, 0x1b6ca8}}
	PAGE["首页"]["买钻石"] = {Unit = 0,Pixelpoint = {  804,   32, 0xddf7fc}}

	PAGE["首页"]["勇气大陆2"] = {Unit = 2,Pixelpoint = {  863,  311, 0xcb0395}}
	PAGE["首页"]["冒险大陆"] = {Unit = 2,Pixelpoint = {  861,  505, 0x0d809e}}
	PAGE["首页"]["返回"] = {Unit = 2,Pixelpoint = {  646,  408, 0x108cf9}}

PAGE["冒险大陆"] = {}
	PAGE["冒险大陆"]["萌之岛"] = {Unit = 0,Pixelpoint = {  267,  286, 0xb25a1b}}
	PAGE["冒险大陆"]["刀锋都市"] = {Unit = 0,Pixelpoint = {  713,  284, 0xba7f54}}
	PAGE["冒险大陆"]["神秘海域"] = {Unit = 0,Pixelpoint = {  419,  552, 0xac501a}}
	PAGE["冒险大陆"]["魔法石"] = {Unit = 0,Pixelpoint = {  861,  707, 0xb93e3b}}

PAGE["开始游戏"] = {}
	PAGE["开始游戏"]["开始游戏"] = {Unit = 0,Pixelpoint = {  799,  659, 0xf0d72a}}
	PAGE["开始游戏"]["坐骑"] = {Unit = 0,Pixelpoint = {  656,  548, 0xfeead1}}
	PAGE["开始游戏"]["角色"] = {Unit = 0,Pixelpoint = {  751,  554, 0x0ba5d5}}
	PAGE["开始游戏"]["宠物"] = {Unit = 0,Pixelpoint = {  848,  551, 0x16a5cb}}

PAGE["游戏中"] = {}
	PAGE["游戏中"]["暂停游戏"] = {Unit = 0,Pixelpoint = {  969,   51, 0x223b5e}}
	PAGE["游戏中"]["下滑"] = {Unit = 0,Pixelpoint = {  100,  651, 0xe4edf2}}
	PAGE["游戏中"]["跳跃"] = {Unit = 0,Pixelpoint = {  915,  649, 0xeaf1f5}}

	PAGE["游戏中"]["宝箱0"] = {Unit = 1,Pixelpoint = {  883,   43, 0x243f65}}

	PAGE["游戏中"]["宝箱1"] = {Unit = 2,Pixelpoint = {  882,   44, 0xeeddb3}}

PAGE["暂停游戏"] = {}
	PAGE["暂停游戏"]["冒险大陆"] = {Unit = 0,Pixelpoint = {  239,  574, 0x1f96ba}}
	PAGE["暂停游戏"]["重新开始"] = {Unit = 0,Pixelpoint = {  521,  570, 0x48959f}}
	PAGE["暂停游戏"]["继续游戏"] = {Unit = 0,Pixelpoint = {  812,  567, 0xdfa11f}}

--等待页面并点击，page:需要等待出现的页面，sleeptime:等待间隔，timeout:等待超时时间,fuzzy:找色相似度
function WaitingAndClick(waitpage,clickicon,unit,timeout,sleeptime,fuzzy)
	sleeptime = sleeptime or 1000 --默认重复判断等待时间为1000毫秒
	timeout = timeout or 3000 --默认超时时间3000毫秒
	fuzzy = fuzzy or 90 --默认相似度90%
	unit = unit or 0 --内面内部部件，默认标签为0
	
	--单点模糊比色
	local function IsColor(pixelpoint,fuzzy)
    local fl,abs = math.floor,math.abs
    fuzzy = fl(0xff*(100-fuzzy)*0.01)
    local r,g,b = fl(pixelpoint[3]/0x10000),fl(pixelpoint[3]%0x10000/0x100),fl(pixelpoint[3]%0x100)
    local rr,gg,bb = getColorRGB(pixelpoint[1],pixelpoint[2])
    if abs(r-rr)<fuzzy and abs(g-gg)<fuzzy and abs(b-bb)<fuzzy then
        return true
    end
	end
	
	if waitpage[clickicon].Unit ~= unit and waitpage[clickicon].Unit ~=0 then
		nLog("标签错误，请仔细核对")
		return
	end
	
	local curtime = 0
	local mismatching = 0
	while true do
		for k,v in pairs(waitpage) do
			if v.Pixelpoint and (v.Unit == unit or v.Unit == 0) and  not IsColor(v.Pixelpoint,fuzzy) then
				nLog("图标：<"..k..">不匹配")
				mismatching = 1
				break
			end
		end	
		if mismatching == 0 then break end
		mismatching = 0
		if curtime >= timeout then
			nLog("超时未找到页面")
			return 
		end
		mSleep(sleeptime)
        curtime = curtime + sleeptime
    end
	
	touchDown(0,waitpage[clickicon].Pixelpoint[1],waitpage[clickicon].Pixelpoint[2])
	mSleep(100)
	touchUp(0,waitpage[clickicon].Pixelpoint[1],waitpage[clickicon].Pixelpoint[2])
	return true
end
init ("0",1)

WaitingAndClick(PAGE["首页"],"勇气大陆",1)
WaitingAndClick(PAGE["首页"],"冒险大陆",2)
WaitingAndClick(PAGE["冒险大陆"],"刀锋都市")

for i = 1,3 do
	WaitingAndClick(PAGE["开始游戏"],"开始游戏",0,15000)
	WaitingAndClick(PAGE["游戏中"],"暂停游戏",2,60000)
	WaitingAndClick(PAGE["暂停游戏"],"重新开始",0)
end