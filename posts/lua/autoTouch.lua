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
inputText("Let's input some text automatically without tapping the keyboard!");
--  Delete 3 character by inputing 3 backspaces.
inputText("\b\b\b"); 

-- UI
--标签
local label = {type=CONTROLLER_TYPE.LABEL, text="Would you mind to provide some personal informations?"}
--输入框
local nameInput = {type=CONTROLLER_TYPE.INPUT, title="Name:", key="Name", value="Bob"}
--单选框
local positionPicker = {type=CONTROLLER_TYPE.PICKER, title="Position:", key="Position", value="CEO", options={"CEO", "CTO", "CFO", "CXO"} }
--开关
local developerSwitch = {type=CONTROLLER_TYPE.SWITCH, title="A Developer:", key="ADeveloper", value=1}

-- 如果您在对话框中使用此控件，则用户可以选择记住输入的天气。
local remember = {type=CONTROLLER_TYPE.REMEMBER, on=false}

--[[ 定义按钮：
类型 = CONTROLLER_TYPE.BUTTON
标题 = 按钮文本
color = 按钮背景颜色，可选，默认0x428BCA
width = 按钮宽度占对话框宽度的百分比，可选，默认值为0.5，最大值为1.0。
flag = 整数类型的按钮标志，用于标识哪个按钮被点击。
collectInputs = 布尔类型，指定在点击此按钮时对话框是否应收集输入。 ]]--
local btn1 = {type=CONTROLLER_TYPE.BUTTON, title="Button 1", color=0x71C69E, width=0.8, flag=1, collectInputs=false}
local btn2 = {type=CONTROLLER_TYPE.BUTTON, title="Button 2", color=0xFF5733, flag=2, collectInputs=true}
local btn3 = {type=CONTROLLER_TYPE.BUTTON, title="Button 3", color=0xFFB7D0, width=1.0, flag=3, collectInputs=false}
local btn4 = {type=CONTROLLER_TYPE.BUTTON, title="Button 4", width=1.0, flag=4, collectInputs=true}

--集群
local controls = {label, nameInput, positionPicker, developerSwitch, btn1, btn2, remember, btn3, btn4}

-- 弹出对话框。 弹出后，脚本将暂停等待用户输入，直到点击任何按钮，然后返回点击按钮的标志。
-- 对话框的方向是什么，它是可选的
local orientations = { ORIENTATION_TYPE.LANDSCAPE_LEFT, ORIENTATION_TYPE.LANDSCAPE_RIGHT };

local result = dialog(controls, orientations);

if (result == 1) then
    alert(string.format("name:%s, birthday:%s, gender:%d", nameInput.value, positionPicker.value, developerSwitch.value))
else
    alert(string.format("Dialog returned: %s", result))
end


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
