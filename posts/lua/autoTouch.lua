--------------------------------------
-- Information of recording
-- Time: 2022-05-06 09:58:54
-- Resolution: 640, 1136
-- Front most app: AutoTouch
-- Orientation of front most app: Portrait;
--------------------------------------
--激活指定app
-- appActivate("me.autotouch.AutoTouch.ios8");

--运行程序
-- appRun("com.apple.mobilesafari");

-- 等待
-- usleep(3000000);


--查看指定app状态
-- local state = appState("com.apple.mobilesafari");
-- alert(string.format("State of Safari: %s", state));

--吐司提示
toast("Hello I'm a toast!", 5); -- Show message for 5 seconds.
toast("Hello again!"); -- Show message for 2 seconds.

-- 获得屏幕的方向
local o = getOrientation();
-- alert(string.format("Screen orientation is : %d", 0))

--屏幕宽高
local w, h = getScreenResolution();
-- alert(string.format("Resolution of iPhone 6 Plus: width:%d, height:%d", w, h));

--touch版本
local version = getVersion();
-- alert(string.format("Current version of AutoTouch is : %s", version));

-- 获取当前前端应用程序的标识符。
local appId = frontMostAppId();
-- alert(string.format("Current front most App is : %s", appId));

-- 获得当前最前沿应用程序的方向
local orientation = frontMostAppOrientation();
-- alert(string.format("Orientation of current front most App is : %d", orientation));

--输入
-- inputText("Let's input some text automatically without tapping the keyboard!");
-- --  Delete 3 character by inputing 3 backspaces.
-- inputText("\b\b\b"); 

-- UI
-- --标签
-- local label = {type=CONTROLLER_TYPE.LABEL, text="Would you mind to provide some personal informations?"}
-- --输入框
-- local nameInput = {type=CONTROLLER_TYPE.INPUT, title="Name:", key="Name", value="Bob"}
-- --单选框
-- local positionPicker = {type=CONTROLLER_TYPE.PICKER, title="Position:", key="Position", value="CEO", options={"CEO", "CTO", "CFO", "CXO"} }
-- --开关
-- local developerSwitch = {type=CONTROLLER_TYPE.SWITCH, title="A Developer:", key="ADeveloper", value=1}

-- -- 如果您在对话框中使用此控件，则用户可以选择记住输入的天气。
-- local remember = {type=CONTROLLER_TYPE.REMEMBER, on=false}

-- --[[ 定义按钮：
-- 类型 = CONTROLLER_TYPE.BUTTON
-- 标题 = 按钮文本
-- color = 按钮背景颜色，可选，默认0x428BCA
-- width = 按钮宽度占对话框宽度的百分比，可选，默认值为0.5，最大值为1.0。
-- flag = 整数类型的按钮标志，用于标识哪个按钮被点击。
-- collectInputs = 布尔类型，指定在点击此按钮时对话框是否应收集输入。 ]]--
-- local btn1 = {type=CONTROLLER_TYPE.BUTTON, title="Button 1", color=0x71C69E, width=0.8, flag=1, collectInputs=false}
-- local btn2 = {type=CONTROLLER_TYPE.BUTTON, title="Button 2", color=0xFF5733, flag=2, collectInputs=true}
-- local btn3 = {type=CONTROLLER_TYPE.BUTTON, title="Button 3", color=0xFFB7D0, width=1.0, flag=3, collectInputs=false}
-- local btn4 = {type=CONTROLLER_TYPE.BUTTON, title="Button 4", width=1.0, flag=4, collectInputs=true}

-- --集群
-- local controls = {label, nameInput, positionPicker, developerSwitch, btn1, btn2, remember, btn3, btn4}

-- -- 弹出对话框。 弹出后，脚本将暂停等待用户输入，直到点击任何按钮，然后返回点击按钮的标志。
-- -- 对话框的方向是什么，它是可选的
-- local orientations = { ORIENTATION_TYPE.LANDSCAPE_LEFT, ORIENTATION_TYPE.LANDSCAPE_RIGHT };
-- -- local orientations = { ORIENTATION_TYPE.PORTRAIT};

-- local result = dialog(controls, orientations);

-- if (result == 1) then
--     alert(string.format("name:%s, birthday:%s, gender:%d", nameInput.value, positionPicker.value, developerSwitch.value))
-- else
--     alert(string.format("Dialog returned: %s", result))
-- end

--标签
-- local label = {type=CONTROLLER_TYPE.LABEL, text="Would you mind to provide some personal informations?"}
--输入框
-- local nameInput = {type=CONTROLLER_TYPE.INPUT, title="Name:", key="Name", value="Bob"}
--单选框
-- local positionPicker = {type=CONTROLLER_TYPE.PICKER, title="Position:", key="Position", value="CEO", options={"CEO", "CTO", "CFO", "CXO"} }
--开关
local check1 = {type=CONTROLLER_TYPE.SWITCH, title="网络调试", key="网络调试", value=1}
local check2 = {type=CONTROLLER_TYPE.SWITCH, title="本地调试", key="本地调试", value=1}
local check3 = {type=CONTROLLER_TYPE.SWITCH, title="集中文件", key="集中文件", value=1}
local check4 = {type=CONTROLLER_TYPE.SWITCH, title="测试", key="测试", value=1}
local check5 = {type=CONTROLLER_TYPE.SWITCH, title="注销", key="注销", value=1}
local check6 = {type=CONTROLLER_TYPE.SWITCH, title="删除配置", key="删除配置", value=1}
local checkXiangMu1 = {type=CONTROLLER_TYPE.SWITCH, title="项目1", key="项目1", value=1}
local checkXiangMu2 = {type=CONTROLLER_TYPE.SWITCH, title="项目2", key="项目2", value=1}

--     "联盟任务,大号,成品号,小号,不生产,不挖粒子,抢粒子,研究,生产加速,vip8,强制金属,强制矿物,强制氯气,2级粒子,自动切换梯子,活动",
local check7 = {type=CONTROLLER_TYPE.SWITCH, title="联盟任务", key="联盟任务", value=1}
local check8 = {type=CONTROLLER_TYPE.SWITCH, title="大号", key="大号", value=1}
local check9 = {type=CONTROLLER_TYPE.SWITCH, title="成品号", key="成品号", value=1}
local check10 = {type=CONTROLLER_TYPE.SWITCH, title="小号", key="小号", value=1}
local check11 = {type=CONTROLLER_TYPE.SWITCH, title="不生产", key="不生产", value=1}
local check12 = {type=CONTROLLER_TYPE.SWITCH, title="不挖粒子", key="不挖粒子", value=1}
local check13 = {type=CONTROLLER_TYPE.SWITCH, title="抢粒子", key="抢粒子", value=1}
local check14 = {type=CONTROLLER_TYPE.SWITCH, title="研究", key="研究", value=1}
local check15 = {type=CONTROLLER_TYPE.SWITCH, title="生产加速", key="生产加速", value=1}
local check16 = {type=CONTROLLER_TYPE.SWITCH, title="vip8", key="vip8", value=1}
local check17 = {type=CONTROLLER_TYPE.SWITCH, title="强制金属", key="强制金属", value=1}
local check18 = {type=CONTROLLER_TYPE.SWITCH, title="强制矿物", key="强制矿物", value=1}
local check19 = {type=CONTROLLER_TYPE.SWITCH, title="强制氯气", key="强制氯气", value=1}
local check20 = {type=CONTROLLER_TYPE.SWITCH, title="2级粒子", key="2级粒子", value=1}
local check21 = {type=CONTROLLER_TYPE.SWITCH, title="自动切换梯子", key="自动切换梯子", value=1}
local check22 = {type=CONTROLLER_TYPE.SWITCH, title="活动", key="活动", value=1}


-- 如果您在对话框中使用此控件，则用户可以选择记住输入的天气。
local remember = {type=CONTROLLER_TYPE.REMEMBER, on=false}

--[[ 定义按钮：
类型 = CONTROLLER_TYPE.BUTTON
标题 = 按钮文本
color = 按钮背景颜色，可选，默认0x428BCA
width = 按钮宽度占对话框宽度的百分比，可选，默认值为0.5，最大值为1.0。
flag = 整数类型的按钮标志，用于标识哪个按钮被点击。
collectInputs = 布尔类型，指定在点击此按钮时对话框是否应收集输入。 ]]--
-- local btn1 = {type=CONTROLLER_TYPE.BUTTON, title="Button 1", color=0x71C69E, width=0.8, flag=1, collectInputs=false}
-- local btn2 = {type=CONTROLLER_TYPE.BUTTON, title="Button 2", color=0xFF5733, flag=2, collectInputs=true}
-- local btn3 = {type=CONTROLLER_TYPE.BUTTON, title="Button 3", color=0xFFB7D0, width=1.0, flag=3, collectInputs=false}
-- local btn4 = {type=CONTROLLER_TYPE.BUTTON, title="Button 4", width=1.0, flag=4, collectInputs=true}

--集群
local controls = {check1,check2,check3,check4,check5,check6,checkXiangMu1,checkXiangMu2,check7,check8,check9,check10,check11,check12,check13,check14,check15,check16,check17,check18,check19,check20,check21,check22,remember}

-- 弹出对话框。 弹出后，脚本将暂停等待用户输入，直到点击任何按钮，然后返回点击按钮的标志。
-- 对话框的方向是什么，它是可选的
-- local orientations = { ORIENTATION_TYPE.LANDSCAPE_LEFT, ORIENTATION_TYPE.LANDSCAPE_RIGHT };
local orientations = { ORIENTATION_TYPE.PORTRAIT};

local result = dialog(controls, orientations);

-- if (result == 1) then
--     alert(string.format("name:%s, birthday:%s, gender:%d", nameInput.value, positionPicker.value, developerSwitch.value))
-- else
--     alert(string.format("Dialog returned: %s", result))
-- end

-- w, h = getScreenSize()
-- UINew(2, "Page1,Page2", "开始", "取消", uiconfig, 0, 5, w, h, "245,245,245", "175,238,238", "", "dot", 1, 15,
--     "left")

-- UILabel("--------------------公共设置--------------------", 12, "center", "199,21,133", -1, 0, "center")
-- UICheck("check1,check2,check3,check4,check5,check6,checkXiangMu1,checkXiangMu2",
--     "网络调试,本地调试,集中文件,测试,注销,删除配置,项目1,项目2", "4@6", -1, 0, "", 1, 3) -- 多选1
-- UILabel("---------------------项目1---------------------", 12, "center", "199,21,133", -1, 0, "center")
-- UICheck("check7,check8,check9,check10,check11,check12,check13,check14,check15,check16,check17,check18,check19,check20,check21,check22",
--     "联盟任务,大号,成品号,小号,不生产,不挖粒子,抢粒子,研究,生产加速,vip8,强制金属,强制矿物,强制氯气,2级粒子,自动切换梯子,活动",
--     "3@5", -1, 0, "", 1, 3) -- 多选1
-- UILabel("---------------------项目2---------------------", 12, "center", "199,21,133", -1, 0, "center")
-- UICheck("Bcheck1,Bcheck2", "占位1,占位2", "0", -1, 0, "", 1, 3) -- 多选1

-- UILabel(2, "航母数量", 12, "left", "46,139,87", -1, 1, "center")
-- UICombo(2, "numShip", "0,1,2,3,4", "0", -1, 1, true) -- 下拉框
-- UILabel(2, "兑换批次", 12, "left", "46,139,87", -1, 1, "center")
-- UICombo(2, "numDuiHuan", "0,1,2,3,4,5,6,7,8", "0", -1, 0, true) -- 下拉框

-- UILabel(2, "目标1 无,优化,主线,挖矿,日常,挂机,开区检测,章节", 10, "left", "72,61,139", -1, 0,
--     "center") -- 标签
-- UIEdit(2, "muBiao1", "目标1", "无", 15, "left", "95,158,160", "default", 0, 0) -- 编辑框
-- UILabel(2, "目标2 无,5道具,采集,收获,技能,兑换,道具合成", 10, "left", "72,61,139", -1, 0, "center")
-- UIEdit(2, "muBiao2", "目标2", "无", 15, "left", "95,158,160", "default", 0, 0)
-- UILabel(2, "目标3 无,整理,出航,修船,研究,钱包检测,登录钱包,兑换粒子 ", 10, "left",
--     "72,61,139", -1, 0, "center")
-- UIEdit(2, "muBiao3", "目标3", "无", 15, "left", "95,158,160", "default", 0, 0)

-- UIShow()

usleep(3000000);

-- appKill("com.apple.mobilesafari");


-- keyDown(KEY_TYPE.HOME_BUTTON);
-- usleep(110395.00);
-- keyUp(KEY_TYPE.HOME_BUTTON);
-- usleep(239793.42);
-- keyUp(KEY_TYPE.HOME_BUTTON);
-- usleep(1467160.38);

-- touchDown(8, 382.01, 804.89);
-- usleep(82902.46);
-- touchUp(8, 382.01, 804.89);
-- usleep(1578969.88);

-- keyDown(KEY_TYPE.HOME_BUTTON);
-- usleep(124630.08);
-- keyUp(KEY_TYPE.HOME_BUTTON);
-- usleep(225595.17);
-- keyUp(KEY_TYPE.HOME_BUTTON);
-- usleep(1171626.71);

-- touchDown(8, 376.93, 800.83);
-- usleep(83158.21);
-- touchUp(8, 376.93, 800.83);
