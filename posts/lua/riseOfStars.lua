numLua = 19.5
toast("在线版本:" .. numLua)
local image_tsing = require("tsimg")



-- 对比颜色加强
do
    oldIsColor = isColor
    isColor = function(intX, intY, color, sim)
        windowsDecide()
        return oldIsColor(intX, intY, color, sim)
    end
end
-----------------------TT图鉴--------------------------

http = require "szocket.http"
ltn12 = require "ltn12"
-- local json = require("ttjson");

local username, password, yzmId;

ZZBase64 = {}
local string = string

ZZBase64.__code = {
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
    'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
    'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
    'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/',
};
ZZBase64.__decode = {}
for k, v in pairs(ZZBase64.__code) do
    ZZBase64.__decode[string.byte(v, 1)] = k - 1
end

function ZZBase64.encode(text)
    local len   = string.len(text)
    local left  = len % 3
    len         = len - left
    local res   = {}
    local index = 1
    for i = 1, len, 3 do
        local a = string.byte(text, i)
        local b = string.byte(text, i + 1)
        local c = string.byte(text, i + 2)
        -- num = a<<16 + b<<8 + c
        local num = a * 65536 + b * 256 + c
        for j = 1, 4 do
            --tmp = num >> ((4 -j) * 6)
            local tmp = math.floor(num / (2 ^ ((4 - j) * 6)))
            --curPos = tmp&0x3f
            local curPos = tmp % 64 + 1
            res[index] = ZZBase64.__code[curPos]
            index = index + 1
        end
    end

    if left == 1 then
        ZZBase64.__left1(res, index, text, len)
    elseif left == 2 then
        ZZBase64.__left2(res, index, text, len)
    end
    return table.concat(res)
end

function ZZBase64.__left2(res, index, text, len)
    local num1 = string.byte(text, len + 1)
    num1 = num1 * 1024 --lshift 10
    local num2 = string.byte(text, len + 2)
    num2 = num2 * 4 --lshift 2
    local num = num1 + num2

    local tmp1 = math.floor(num / 4096) --rShift 12
    local curPos = tmp1 % 64 + 1
    res[index] = ZZBase64.__code[curPos]

    local tmp2 = math.floor(num / 64)
    curPos = tmp2 % 64 + 1
    res[index + 1] = ZZBase64.__code[curPos]

    curPos = num % 64 + 1
    res[index + 2] = ZZBase64.__code[curPos]

    res[index + 3] = "="
end

function ZZBase64.__left1(res, index, text, len)
    local num = string.byte(text, len + 1)
    num = num * 16

    tmp = math.floor(num / 64)
    local curPos = tmp % 64 + 1
    res[index] = ZZBase64.__code[curPos]

    curPos = num % 64 + 1
    res[index + 1] = ZZBase64.__code[curPos]

    res[index + 2] = "="
    res[index + 3] = "="
end

function ZZBase64.decode(text)
    local len = string.len(text)
    local left = 0
    if string.sub(text, len - 1) == "==" then
        left = 2
        len = len - 4
    elseif string.sub(text, len) == "=" then
        left = 1
        len = len - 4
    end

    local res = {}
    local index = 1
    local decode = ZZBase64.__decode
    for i = 1, len, 4 do
        local a = decode[string.byte(text, i)]
        local b = decode[string.byte(text, i + 1)]
        local c = decode[string.byte(text, i + 2)]
        local d = decode[string.byte(text, i + 3)]

        --num = a<<18 + b<<12 + c<<6 + d
        local num = a * 262144 + b * 4096 + c * 64 + d

        local e = string.char(num % 256)
        num = math.floor(num / 256)
        local f = string.char(num % 256)
        num = math.floor(num / 256)
        res[index] = string.char(num % 256)
        res[index + 1] = f
        res[index + 2] = e
        index = index + 3
    end

    if left == 1 then
        ZZBase64.__decodeLeft1(res, index, text, len)
    elseif left == 2 then
        ZZBase64.__decodeLeft2(res, index, text, len)
    end
    return table.concat(res)
end

function ZZBase64.__decodeLeft1(res, index, text, len)
    local decode = ZZBase64.__decode
    local a = decode[string.byte(text, len + 1)]
    local b = decode[string.byte(text, len + 2)]
    local c = decode[string.byte(text, len + 3)]
    local num = a * 4096 + b * 64 + c

    local num1 = math.floor(num / 1024) % 256
    local num2 = math.floor(num / 4) % 256
    res[index] = string.char(num1)
    res[index + 1] = string.char(num2)
end

function ZZBase64.__decodeLeft2(res, index, text, len)
    local decode = ZZBase64.__decode
    local a = decode[string.byte(text, len + 1)]
    local b = decode[string.byte(text, len + 2)]
    local num = a * 64 + b
    num = math.floor(num / 16)
    res[index] = string.char(num)
end

local function ttImagebase64(file)
    local f = io.open(file, "rb")
    if f then
        local retbyte = f:read("*all")
        f:close()
        return ZZBase64.encode(retbyte)
    else
        print "image not found please check"
    end
end

local function ttRecoginze(user, pwd, imagefile, typeid)
    local request_body = {
        username = user, --填写账户名
        password = pwd, --填写密码
        typeid = typeid, --验证码类型(默认 3 数英混合)：16:汉字 14:图片旋转 11:计算题 7:无感学习，4:闪动GIF，3:数英混合， 2:纯英文，1:纯数字
        --返回坐标类型(默认 19 一个坐标)。 19: 1个坐标， 20: 1 ~ 4个坐标， 21: 3 ~ 5个坐标， 22: 5 ~ 8个坐标。
        image = ttImagebase64(imagefile)
    }
    request_body = json_ts.encode(request_body)
    local url = "http://api.ttshitu.com/predict";

    local response_body = {}
    local res, code, response_headers = http.request {
        url = url,
        method = "POST",
        headers = {
            ["Content-Type"] = "application/json";
            ["Content-Length"] = #request_body;
        },
        source = ltn12.source.string(request_body),
        sink = ltn12.sink.table(response_body),
    }
    if type(response_body) == "table" then
        --解析返回结果
        local strBody = table.concat(response_body);
        local bl, tbody = pcall(json_ts.decode, strBody)
        if bl then
            if tbody.success == true then
                local id, vcode = tbody.data.id, tbody.data.result
                print("id:", id); --识别结果的id
                print("suceess:", vcode); --识别的结果
                return true, id, vcode
            else
                print("error:", tbody.message);
                return false, nil, nil, tbody.message

            end
        else
            print(strBody)
            print("json error:");
            return bl, nil, nil, "json error"

        end

    else
        print("Not a table:", type(response_body))
    end
end

--识别报错
local function ttReportError(yzmid)
    local response_body = {}
    local post_data = "id=" .. yzmid;
    local res, code = http.request {
        url = "http://api.ttshitu.com/reporterror.json",
        method = "POST",
        headers = {
            ["Content-Type"] = "application/x-www-form-urlencoded",
            ["Content-Length"] = #post_data,
        },
        source = ltn12.source.string(post_data),
        sink = ltn12.sink.table(response_body)
    }
    --解析返回结果
    local strExp = "success\":true";
    local strBody = table.concat(response_body);
    local strResult = string.match(strBody, strExp);
    if (strResult ~= nil) then
        return "report success";
    else
        return "report failed";
    end
end

local function ocrImage(path, typeid)
    http.TIMEOUT = 120
    local lzRe, yzmid, jieguo, err = ttRecoginze(username, password, path, typeid)
    if lzRe then yzmId = yzmid return jieguo, yzmid else return nil, err end
end

local function info(user, pwd)
    username = user;
    password = pwd;
end

local function ttReportError2(yzmid)
    yzmid = yzmid or yzmId
    return ttReportError(yzmid)
end

tt = {}
tt.Info = info
tt.Image = ocrImage
tt.ReportError2 = ttReportError2
-- do return tt end



-----------------------公共部分--------------------------
function tap(x, y, ...)
    touchClick(x, y)
end

--全屏乱点
function screenClickNew(intX, intY, color)
    for x = 1, 113, 1 do
        for y = 1, 63, 1 do
            if isColor(intX, intY, color, 90) == false then
                return
            end
            if math.abs(intX - x * 10) <= 40 and math.abs(intY - y * 10) <= 40 then

            else
                touchSuper(x * 10, y * 10)
            end
        end
    end
end

function ttScreen(x1, y1, x2, y2, scale) --此处为触动截图方法 开发者请根据实际脚本工具自己编写
    scale = scale or 1
    local path = userPath() .. "/res/ttshu.png"
    snapshot("ttshu.png", x1, y1, x2, y2, scale)
    return path
end

-- 云打码
function yunDaMaNew(str, x1, y1, x2, y2)
    -- ocrInfo("qqchaoren", "username", "password") -- 初始化打码平台
    -- bool, bal = ocrBalance() -- 查询用户余额
    -- tiaoShi("云打码余额:" .. bal)
    -- YDMtext, YDMtid = ocrScreen(222, 12, 596, 157, 103, 60, 1)
    -- return YDMtext
    if TTtuJian == "TT图鉴" then
        tt.Info(TT_username, TT_password)
        local picPath = ttScreen(x1, y1, x2, y2) --图片的路径完整路径此处为截图获取的路径
        local res, id = tt.Image(picPath, 7) --开始识别
        -- debug(res)
        if res then
            return res
        else
            debug("识别失败")
            return false
        end
        -- print("result", res, id) --识别结果,识别id
    else
        local ret1 = ocr.cloudOcrText(str);
        if ret1.success then
            tiaoShi(ret1.text)
            return ret1.text
        else
            tiaoShi(ret1.message)
            return false
        end
    end
    -- 自动纠错
    -- local ocr = require "cloudOcr"; -- 载入扩展库
    -- local ret = ocr.cloudOcrText(op); -- 进行远程识别
    -- if ret.success then
    --     ret_1 = ocr.cloudOcrReportError(ret.id); -- 自动纠错，ret.id 从 ocr.cloudOcrText 返回值中获取
    -- end
    -- local ocr = require "cloudOcr";
    -- local ver = ocr.version(); -- 获取扩展库版本号
end

-- 变量及常量
function bianLiang()
    -----------------------公共部分--------------------------

    hScreen, wScreen = getScreenSize()
    uiconfig = "uiconfig.dat"
    json_ts = ts.json
    plist_ts = ts.plist
    isLuaStart = true -- 脚本启动
    isPause = false
    numInit = 1
    appShadowrocket = "com.liguangming.Shadowrocket"
    appWallet = "com.wemadetree.wemixwallet"
    tableFromJson = json_ts.decode(readFileString(userPath() .. "/res/" .. iphoneId .. ".json")) --将 json 格式数据转成 table 格式数据

    -- debug0( type(tableFromJson["增产粒子"]))
    -- if tableFromJson["增产粒子"] ~= nil  then
    -- debug0(tableFromJson["增产粒子"][2])
    -- end
    -- 项目ID
    appXiangMu = loadJson("项目ID")
    if appXiangMu == nil then
        appXiangMu = dialogInput("请输入项目ID", "在这里输入项目ID", "确认");
        writeJson("项目ID", appXiangMu)
    end
    apps1 = appXiangMu

    -- 火眼云打码
    HuoYan_username = loadJson("YDM_username")
    if HuoYan_username == nil then
        HuoYan_username, HuoYan_password = dialogInput("请输入云打码帐号和密钥",
            "在这里输入YDM_username #在这里输入YDM_password", "确认");
        writeJson("YDM_username", HuoYan_username)
        writeJson("YDM_password", HuoYan_password)
    end
    HuoYan_password = loadJson("YDM_password")

    -- TT云打码
    TT_username = loadJson("TT_username")
    if TT_username == nil then
        TT_username = dialogInput("请输入TT云打码帐号",
            "在这里输入TT_username", "确认");
        writeJson("TT_username", TT_username)
    end
    TT_password = loadJson("TT_password")
    if TT_password == nil then
        TT_password = dialogInput("请输入TT云打码密钥",
            "在这里输入TT_password", "确认");
        writeJson("TT_password", TT_password)
    end

    op = {
        -- 必填参数
        ["platform"] = "hyocr", -- 平台类型，具体参数参照参数表
        ["x1"] = 222, -- 需要识别区域左上角坐标
        ["y1"] = 12,
        ["x2"] = 596, -- 需要识别区域右下角坐标
        ["y2"] = 157,
        ["type"] = "4016", -- 打码类型，可在对应平台官网查询
        ["username"] = HuoYan_username, -- 打码平台账号
        ["password"] = HuoYan_password, -- 打码平台密码
        -- 选填参数
        ["length"] = 8, -- 打码长度
        ["timeout"] = 30, -- 超时时间
        ["scale"] = 100 -- 缩放比例，范围 10 - 200，在某些待识别区域过大的时候可设置此参数
    };

    -----------------------私有部分--------------------------
    RGB_NoticeBJ = "306090" -- "FFFF00"
    RGB_NoticeFont = "FFFFFF" -- "FF0000"
    strNotice = "..."

    isKaSearch = false -- 卡搜索
    isBuyLiZi = true -- 买粒子
    isLiZi = false -- 粒子
    isShengChan = true -- 生产标志
    isKillPirate = false -- 杀海盗
    isJiaSuProduce = false -- 加速生产
    isAutoNext = true -- 主动下一个建筑
    isJiDiXianKuangIntoProduce = false -- 从基地现况进入生产界面
    isJustBack = false -- 刚回基地
    isBug_LiZi = false -- bug 粒子
    isChongDianKaZiYuan = false -- 充电卡资源
    isShipBad = false -- 航母 坏
    isKaZhuXianJianZhang = false -- 卡主线--舰长
    isKaJianZhangJingYan = 3 -- 卡主线--舰长经验
    isKaShengChan = false -- 卡主线--生产
    isFalseLiZi2 = false --2级粒子挖掘失败
    isOverHelp = false --协助已完成
    isCheckLiZiNum = false --检查粒子数量

    strVpnModel = ""
    numShengJiCengShu = 0 --建筑升级条件层数
    numZiYuan = 1
    numKaiFa = 1
    numFangYu = 1
    numShengChan = 1
    numJingRui = 1
    numZhanJian = 1
    numLiZiTeam = 0 -- 在挖粒子的队伍
    numSearchLiZiSecond = 20
    -- numSearchLiZi = 0
    num5DaoJu = 0
    numDiaoXian = 0
    numChuHang = 1 -- 出航编号
    numSearch = 0 -- 搜索
    numYunDaMa = 0 -- 云打码

    nowTime = os.time();
    timeCheckLiZiNum = nowTime - 60 * 60 * 1 --定时检查粒子数量
    timeShengJiTongXingZheng = nowTime --升级通行证
    timeUpJson = nowTime - 10 * 60 --上传间隔
    timeZhengLi = nowTime - 5 * 60 --检测背包
    timeWalletWatch = nowTime - 10 * 60 -- 钱包检测
    timeBeAttack = nowTime -- 被攻击
    timeBeAttack2 = 0 -- 被攻击2
    timeOpen = nowTime -- 开服
    timeRed = nowTime - 15 * 60 -- 红点
    timeRound = nowTime - 4 * 60 * 60 -- 成品号循环 优化--主线--挖矿
    timeChongDian = nowTime - 4 * 60 * 60 -- 充电卡资源
    timeLiZi = nowTime - 3 * 60 -- 粒子在不在采集,3分钟检测一次
    timeYanJiu = nowTime - 60 -- 研究
    timeJiDi = nowTime - 10 * 60 -- 基地红点
    timeLianMengRenWu = nowTime - 60 * 60 -- 联盟任务
    timeKillPirate = nowTime - 60 * 10 -- 杀海盗
    timeXXX = nowTime -- 掉线检测
    timeInside = nowTime - 5 * 60
    timeLianMeng = nowTime - 60 * 60 * 2 -- 联盟
    timeShengChan = nowTime - 60 * 60 * 2 -- 生产

    ---------------项目2---------------
    numDead = 0
    numUpLeft = 0
    numUpRight = 0
    numDownLeft = 0
    numDownRight = 0

    isDead = false
    isCollectBug = false

    timeCollectBug = nowTime
    timeTask_ZhuXian = nowTime - 10

end

-- 新UI
function newUi()
    w, h = getScreenSize()
    UINew(3, "Page1,Page2,Page3", "开始", "取消", uiconfig, 0, 5, w, h, "245,245,245", "175,238,238", "", "dot", 1, 15,
        "left")

    UILabel("--------------------公共设置--------------------", 12, "center", "199,21,133", -1, 0, "center")
    UICheck("check1,check2,check3,check4,check5,check6,checkXiangMu1,checkXiangMu2,TTtuJian",
        "网络调试,本地调试,集中文件,测试,注销,删除配置,项目1,项目2,TT图鉴", "4@6", -1, 0, "", 1, 3) -- 多选1
    UILabel("---------------------项目1---------------------", 12, "center", "199,21,133", -1, 0, "center")
    UICheck("check7,check8,check9,check10,check11,check12,check13,check14,check15,check16,check17,check18,check19,check20,check21,check22,check23",
        "联盟任务,大号,成品号,小号,不生产,不挖粒子,抢粒子,研究,生产加速,vip8,强制金属,强制矿物,强制氯气,2级粒子,自动切换梯子,活动,60海盗",
        "3@5", -1, 0, "", 1, 3) -- 多选1
    UILabel(2, "---------------------项目2---------------------", 12, "center", "199,21,133", -1, 0, "center")
    UICheck(2, "Bcheck1,Bcheck2", "占位1,占位2", "0", -1, 0, "", 1, 3) -- 多选1
    UILabel(2, "采集点", 12, "left", "46,139,87", -1, 1, "center")
    UICombo(2, "numCollect", "1,2,3,4", "0", -1, 1, true) -- 下拉框
    UICombo(2, "numHaoLV", "小号,成品号,大号", "0", -1, 1, true) -- 下拉框


    UILabel(3, "航母数量", 12, "left", "46,139,87", -1, 1, "center")
    UICombo(3, "numShip", "0,1,2,3,4", "0", -1, 1, true) -- 下拉框
    UILabel(3, "兑换批次", 12, "left", "46,139,87", -1, 1, "center")
    UICombo(3, "numDuiHuan", "0,1,2,3,4,5,6,7,8", "0", -1, 0, true) -- 下拉框

    UILabel(3, "目标1 无,优化,主线,挖矿,日常,挂机,开区检测,章节,采集,去采集点", 10, "left", "72,61,139", -1, 0,
        "center") -- 标签
    UIEdit(3, "muBiao1", "目标1", "无", 15, "left", "95,158,160", "default", 0, 0) -- 编辑框
    UILabel(3, "目标2 无,5道具,采集,收获,技能,兑换,道具合成", 10, "left", "72,61,139", -1, 0, "center")
    UIEdit(3, "muBiao2", "目标2", "无", 15, "left", "95,158,160", "default", 0, 0)
    UILabel(3, "目标3 无,整理,出航,修船,研究,钱包检测,登录钱包,兑换粒子 ", 10, "left",
        "72,61,139", -1, 0, "center")
    UIEdit(3, "muBiao3", "目标3", "无", 15, "left", "95,158,160", "default", 0, 0)

    UIShow()

    if check12 == "不挖粒子" then
        notWaLiZi = true
    else
        notWaLiZi = false
    end

    if check10 == "小号" then
        haoLV = 1
    end
    if check9 == "成品号" then
        haoLV = 2
    end
    if check8 == "大号" then
        haoLV = 3
    end
    if checkXiangMu1 == "项目1" then
        numInit = 1
    elseif checkXiangMu2 == "项目2" then
        numInit = 1

    end
    init(numInit)
    floatingWindow()
end

-- 目标转换--新
function muBiaoZhuanHuanNew(...)
    if muBiao3 ~= mb_Wu then
        muBiao = muBiao3
        timeDingShiDianRenWu = nowTime - 60 * 60
    elseif muBiao2 ~= mb_Wu then
        muBiao = muBiao2
        timeDingShiDianRenWu = nowTime - 60 * 60
    elseif muBiao1 ~= mb_Wu then
        muBiao = muBiao1
        -- timeDingShiDianRenWu = nowTime - 60 * 60
    else
        muBiao1 = mb_GuaJi
        muBiao1Con = mm_GuaJi
        muBiao = muBiao1
        writeConfigNew("muBiao1", muBiao1)
        timeDingShiDianRenWu = nowTime - 60 * 60
    end

end

-- 改目标--新
function gaiMuBiaoNew(cs_num, cs_muBiao, ...)
    if cs_num == 1 then
        muBiao1 = cs_muBiao
        writeConfigNew("muBiao1", cs_muBiao)
        muBiaoZhuanHuanNew()
        writeJson("目标1", cs_muBiao)
    elseif cs_num == 2 then
        muBiao2 = cs_muBiao
        writeConfigNew("muBiao2", cs_muBiao)
        muBiaoZhuanHuanNew()
        writeJson("目标2", cs_muBiao)
    elseif cs_num == 3 then
        muBiao3 = cs_muBiao
        writeConfigNew("muBiao3", cs_muBiao)
        muBiaoZhuanHuanNew()
        writeJson("目标3", cs_muBiao)
    end
end

-- 更改配置文件
function writeConfigNew(id, neirong)
    local f = io.open(luaPath .. "/config/" .. uiconfig, 'r')
    local tmpString = f:read("*all")
    local tmpWeiZhi1 = string.find(tmpString, id);
    -- debug("tmpWeiZhi1:"..tmpWeiZhi1)
    local tmpWeiZhi2 = string.find(tmpString, "Edit", tmpWeiZhi1 + 9)
    local tmpQianDuan = string.sub(tmpString, 1, tmpWeiZhi1 + 9)
    local tmpHouDuan = string.sub(tmpString, tmpWeiZhi2, -1)
    f:close()
    f = io.open(luaPath .. "/config/" .. uiconfig, 'w')
    f:write(tmpQianDuan .. neirong .. "$$$" .. tmpHouDuan)
    -- str, num = string.gsub(tmpString, id .. "$$$" .. old .. "$$$", id .. "$$$" .. new .. "$$$")
    -- f:write(str)
    f:close()
end

-- loadJson
function loadJson(key)
    local valueJson = tableFromJson[key]
    if type(valueJson) == "table" then
        if valueJson[2] == 1 then
            return true
        else
            return false
        end
    elseif valueJson ~= nil then
        return valueJson
    else
        return nil
    end
end

-- writeJson
function writeJson(key, value)
    if type(value) == "boolean" then
        if value == true then
            tableFromJson[key] = { "luabool", 1 }
        else
            tableFromJson[key] = { "luabool", 0 }
        end
    else
        tableFromJson[key] = value
    end
    local jsonstring = json_ts.encode(tableFromJson);  --将 table 格式数据转成 json 格式数据
    if jsonstring ~= "" and jsonstring ~= nil then
        bool = writeFileString(userPath() .. "/res/" .. iphoneId .. ".json", jsonstring) --写入文件
    end
    ftpUpJson2()
end

-- loadPlistNew
function loadPlistNew(key)
    ts.config.open(userPath() .. "/lua/" .. xiangMu .. ".plist")
    -- 打开一个 plist 文件,如果文件不存在，将自动创建该文件，同时只允许打开一个
    -- 此函数为初始化函数，所有 config 操作第一步必须以 open 开始并且以 close 结尾
    -- ts.config.save("金币数",999)
    -- 存储 lua 中的 number string  nil boolean table类型（不允许嵌套 table）
    -- ps:键值对（key - value）是一种存储格式，一个 key 对应一 个 value
    -- 此处代表"金币数"是 key,999 是 value，将存入此键值对
    local temStr = ts.config.get(key)
    -- 获取键对应的值, 此处代表获取"金币数"所对应的值 coin = 999
    -- 但是此处暂时获取不到 coin 值，因为操作还没结束，请继续往下阅读
    ts.config.close(true)
    return temStr
end

-- writePlistNew(key,value)
function writePlistNew(key, value)
    ts.config.open(userPath() .. "/lua/" .. xiangMu .. ".plist")
    -- 打开一个 plist 文件,如果文件不存在，将自动创建该文件，同时只允许打开一个
    -- 此函数为初始化函数，所有 config 操作第一步必须以 open 开始并且以 close 结尾
    ts.config.save(key, value)
    -- 存储 lua 中的 number string  nil boolean table类型（不允许嵌套 table）
    -- ps:键值对（key - value）是一种存储格式，一个 key 对应一 个 value
    -- 此处代表"金币数"是 key,999 是 value，将存入此键值对
    -- local temStr = ts.config.get(key)
    -- 获取键对应的值, 此处代表获取"金币数"所对应的值 coin = 999
    -- 但是此处暂时获取不到 coin 值，因为操作还没结束，请继续往下阅读
    ts.config.close(true)
    ftpUpJson()

end

function threadClinet()
    if whoAmI() ~= 3 then
        os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite"); -- 避免触动大姨妈
    end
    local bool, msg = os.remove(userPath() .. "/lua/clientiPhone.lua")
    -- local bool = os.remove(userPath() .. "/lua/clientiPhone.lua")
    if bool then
        -- dialog("删除成功",5)
    else
        dialog("删除失败，失败原因：" .. msg, 5)
    end
    ftpMuLu = "ftp://xinqinew:Qwer1234@1x9722733t.iask.in/"
    local temRet = ftpDownOnce(ftpMuLu .. "Lua/clientiPhone.lua", userPath() .. "/lua/clientiPhone.lua")
    if temRet then
        toast("FTP下载clientiPhone成功", 1)
        mSleep(1000)
    else
        for i = 1, 10, 1 do
            code, msg = ts.tsDownload(userPath() .. "/lua/clientiPhone.lua", luaFile, {
                ["tstab"] = 1,
                ["mode"] = true
            })
            -- httpDown("https://cdn.jsdelivr.net/gh/xinqinew/rise-of-stars@main/clientiPhone.lua", "/var/mobile/Media/TouchSprite/lua/clientiPhone.lua")
            if code == 200 then
                toast("Github下载clientiPhone成功", 1)
                mSleep(1000)
                break
            else
                tiaoShi("下载clientiPhone失败：" .. msg)
                mSleep(1000)
            end
        end
    end
end

function expand(s)
    return string.gsub(s, "$(%w+)", _G)
end

-- => Lua is great, isn't it?  2
-- 主脚本
function main()
    if m_iRunCount == 1 then
        newUi()
        if check4 == "测试" then
            -- threadClinet()
            -- package.loaded["clientiPhone"] = nil
            -- runThread("clientiPhone")
            -- mSleep(1000)

            plistToJson()
            local file = userPath() .. "/res/" .. iphoneId .. ".json"
            local txt = readFileString(file) --读取文件内容，返回全部内容的 string
            if txt then
                tableFromJson = json_ts.decode(txt) --将 json 格式数据转成 table 格式数据
            end
            -- debug(tableFromJson["粒子总次数"])
            -- toast(tableFromJson["粒子总次数"])
        end
        if check4 == "测试" then
            baidu_APItest = tableFromJson["baidu_API"]
            debug(baidu_APItest)

        end
    end
    if checkXiangMu1 == "项目1" then
        main1()
    end
    if checkXiangMu2 == "项目2" then
        if m_iRunCount == 1 then
            apps1 = "com.stormgames.fourgodsonwemix.ios"
            zhaojunlua()
            package.loaded["zhaojun"] = nil
            require("zhaojun")
        end
        main2()
    end
end

-- 项目1主函数
function main1()
    -- nowTime1 = os.time();
    nowTime = os.time();

    windowsDecide()
    if isLuaStart == false then
        timeXXX = nowTime
        return
    end
    nowDateTime = os.date("*t")
    today = tonumber(os.date("%w", os.time()))
    muBiaoZhuanHuanNew() -- 公用 必须最优先
    -- if version ~= "2.2.4" then
    --     if getBacklightLevel() ~= 0.5 then
    --         setBacklightLevel(0.5);
    --     end
    -- end
    bid = frontAppBid()
    -- debug(bid)
    if bid == apps1 then
        -- debug("apps1")
        APP = APP1
    elseif bid == apps2 then
        -- debug("apps2")
        APP = APP2
        -- elseif bid == appWeiXin and tmpWeiXinWeiHu ~= nil and isWeiXinWeiHu == false and nowDateTime.hour >= hourWeiXin and
        --     nowDateTime.min >= minWeiXin then
    elseif bid == "com.apple.DocumentsApp" then
        setRotationLockEnable(false);
        init(1)
    elseif bid == "" then
        -- debug("哪个都没开")
        APP.isYiDengLu = 0
        autoChangeVPN("配置")
        runApp(apps1)
        APP = APP1
        mSleep(5000)
    end
    m_iRunCount = m_iRunCount + 1

    autoVpn()
    autoUnlockDevice()

    zongHe1()
    if bid == apps1 then
        zongHe_Mult()
        zongHe_Screen()
        timeJianCe()
    end
    doTarget()
    if bid == apps1 then
        checkXXX()
        everyDayInit()
    end
    resetIDLETimer();
    -- timeJianGe(debug.getinfo(1).currentline)
    -- nowTime2 = os.time();
    -- dialog(nowTime2 - nowTime1,0)
    -- lua_exit()
end

-- 项目2主函数
function main2()
    -- nowTime1 = os.time();
    nowTime = os.time();

    windowsDecide()
    if isLuaStart == false then
        timeXXX = nowTime
        return
    end
    nowDateTime = os.date("*t")
    today = tonumber(os.date("%w", os.time()))
    muBiaoZhuanHuanNew() -- 公用 必须最优先
    -- if version ~= "2.2.4" then
    --     if getBacklightLevel() ~= 0.5 then
    --         setBacklightLevel(0.5);
    --     end
    -- end
    bid = frontAppBid()
    -- debug(bid)
    if bid == apps1 then
        -- debug("apps1")
        APP = APP1
    elseif bid == apps2 then
        -- debug("apps2")
        APP = APP2
        -- elseif bid == appWeiXin and tmpWeiXinWeiHu ~= nil and isWeiXinWeiHu == false and nowDateTime.hour >= hourWeiXin and
        --     nowDateTime.min >= minWeiXin then
    elseif bid == "com.apple.DocumentsApp" then
        setRotationLockEnable(false);
        init(1)
    elseif bid == "" then
        -- debug("哪个都没开")
        APP.isYiDengLu = 0
        runApp(apps1)
        APP = APP1
        mSleep(5000)
    end
    m_iRunCount = m_iRunCount + 1

    -- autoVpn()
    autoUnlockDevice()
    zongHe2()
    zongHe_zj()
    checkDropline()
    zhiYin()

    -- zongHe_Mult()
    -- zongHe_Screen()
    doTarget2()
    -- timeChongZhi()
    -- checkXXX()
    -- everyDayInit()
    resetIDLETimer();
    -- timeJianGe(debug.getinfo(1).currentline)
    -- nowTime2 = os.time();
    -- dialog(nowTime2 - nowTime1,0)
    -- lua_exit()
end

-- oncePlist
function oncePlist()
    -----------------------公共部分--------------------------

    -- 百度识字
    -- if check4 == "测试" then
    --     baidu_API = tableFromJson["baidu_API"]
    --     debug(baidu_API)
    -- else
    baidu_API = loadJson("baidu_API")
    -- end
    if baidu_API == nil then
        -- baidu_API, baidu_Secret = dialogInput("请输入百度API和密钥",
        --     "在这里输入百度API #在这里输入百度密钥", "确认");
        baidu_API = "SywchAAQBy5TFu9X4r4xUy0S"
        baidu_Secret = "WcZ92Nm4Wmst30Wl4t7bjCoNlOZh4z42"
        writeJson("baidu_API", baidu_API)
        writeJson("baidu_Secret", baidu_Secret)
    end
    baidu_Secret = loadJson("baidu_Secret")

    -- 服务器IP
    -- serverIP = loadJson("服务器IP")
    -- if serverIP == nil then
    --     -- serverIP = dialogInput("请输入服务器IP", "在这里输入服务器IP", "确认");
    --     serverIP = "192.168.1.34"
    --     writeJson("服务器IP", serverIP)
    -- end

    -- FTP
    ftpMuLu = loadJson("FTP目录")
    if ftpMuLu == nil then
        -- ftpMuLu = dialogInput("请输入FTP目录", "在这里输入FTP目录", "确认");
        ftpMuLu = "ftp://xinqinew:Qwer1234@1x9722733t.iask.in/"
        writeJson("FTP目录", ftpMuLu)
    end

    -----------------------私有部分--------------------------

    writeJson("脚本版本", numLua)
    writeJson("系统版本", getOSVer())

    -- over章节
    isOverLesson = loadJson("over章节")
    if isOverLesson == nil then
        isOverLesson = false
        writeJson("over章节", isOverLesson)
    end

    -- 60海盗
    num60Pirate = loadJson("60海盗")
    if num60Pirate == nil then
        num60Pirate = 0
        writeJson("60海盗", num60Pirate)
    end

    -- 机器名
    strIphoneName = loadJson("机器名")
    if strIphoneName == nil then
        strIphoneName = iphoneId
        writeJson("机器名", strIphoneName)
    end

    -- 机器IP
    if whoAmI() == 3 then
        strIphoneIP = getNetIP()
        writeJson("机器IP", strIphoneIP)
    else
        local strIp = getNetInterfaces()
        if strIp.en0 then
            strIphoneIP = strIp.en0.ip
        else
            strIphoneIP = getNetIP()
        end
        writeJson("机器IP", strIphoneIP)
    end

    -- 今日闪退次数
    numTodayExit = loadJson("今日闪退次数")
    if numTodayExit == nil then
        numTodayExit = 0
        writeJson("今日闪退次数", numTodayExit)
    end

    -- 闪退总次数
    numExit = loadJson("闪退总次数")
    if numExit == nil then
        numExit = 0
        writeJson("闪退总次数", numExit)
    end

    -- 今日矿物次数
    numTodayDigKuang = loadJson("今日矿物次数")
    if numTodayDigKuang == nil then
        numTodayDigKuang = 0
        writeJson("今日矿物次数", numTodayDigKuang)
    end

    -- 矿物总次数
    numDigKuang = loadJson("矿物总次数")
    if numDigKuang == nil then
        numDigKuang = 0
        writeJson("矿物总次数", numDigKuang)
    end

    -- 今日金属次数
    numTodayDigJinShu = loadJson("今日金属次数")
    if numTodayDigJinShu == nil then
        numTodayDigJinShu = 0
        writeJson("今日金属次数", numTodayDigJinShu)
    end

    -- 金属总次数
    numDigJinShu = loadJson("金属总次数")
    if numDigJinShu == nil then
        numDigJinShu = 0
        writeJson("金属总次数", numDigJinShu)
    end

    -- 今日氯气次数
    numTodayDigLvQi = loadJson("今日氯气次数")
    if numTodayDigLvQi == nil then
        numTodayDigLvQi = 0
        writeJson("今日氯气次数", numTodayDigLvQi)
    end

    -- 氯气次数
    numDigLvQi = loadJson("氯气总次数")
    if numDigLvQi == nil then
        numDigLvQi = 0
        writeJson("氯气总次数", numDigLvQi)
    end

    -- 今日粒子次数
    numTodayDigLiZi = loadJson("今日粒子次数")
    if numTodayDigLiZi == nil then
        numTodayDigLiZi = 0
        writeJson("今日粒子次数", numTodayDigLiZi)
    end

    -- 粒子总次数
    numDigLiZi = loadJson("粒子总次数")
    if numDigLiZi == nil then
        numDigLiZi = 0
        writeJson("粒子总次数", numDigLiZi)
    end

    -- 资源传输装置兑换次数
    numZiYuanDuiHuan = loadJson("资源传输装置兑换次数")
    if numZiYuanDuiHuan == nil then
        numZiYuanDuiHuan = 0
        writeJson("资源传输装置兑换次数", numZiYuanDuiHuan)
    end

    -- 金币买钛
    numBuyTaiByCoin = loadJson("金币买钛")
    if numBuyTaiByCoin == nil then
        numBuyTaiByCoin = 0
        writeJson("金币买钛", numBuyTaiByCoin)
    end

    -- 指挥中心等级
    numLv = loadJson("指挥中心等级")
    if numLv == nil then
        numLv = 1
        writeJson("指挥中心等级", numLv)
    end

    -- 矿物
    numKuang = loadJson("矿物")
    if numKuang == nil then
        numKuang = 0
        writeJson("矿物", numKuang)
    end

    -- 金属
    numJinShu = loadJson("金属")
    if numJinShu == nil then
        numJinShu = 0
        writeJson("金属", numJinShu)
    end

    -- 氯气
    numLvQi = loadJson("氯气")
    if numLvQi == nil then
        numLvQi = 0
        writeJson("氯气", numLvQi)
    end
    -- 粒子
    numLiZi = loadJson("粒子")
    if numLiZi == nil then
        numLiZi = 0
        writeJson("粒子", numLiZi)
    end

    -- 金币
    numCoin = loadJson("金币")
    if numCoin == nil then
        numCoin = 0
        writeJson("金币", numCoin)
    end

    -- 钛
    numTai = loadJson("钛")
    if numTai == nil then
        numTai = 0
        writeJson("钛", numTai)
    end

    -- 加速生产船型
    numSpeedUp = loadJson("加速生产船型")
    if numSpeedUp == nil then
        numSpeedUp = 1
        writeJson("加速生产船型", numSpeedUp)
    end

    -- 已兑换
    isDuiHuan = loadJson("已兑换")
    if isDuiHuan == nil then
        isDuiHuan = false
        writeJson("已兑换", isDuiHuan)
    end

    -- 粒子方向
    numSearchLiZi = loadJson("粒子方向")
    if numSearchLiZi == nil then
        numSearchLiZi = 0
        writeJson("粒子方向", numSearchLiZi)
    end

    -- 广告次数
    numGuangGao = loadJson("广告次数")
    if numGuangGao == nil then
        numGuangGao = 0
        writeJson("广告次数", numGuangGao)
    end

    -- 传输次数
    numChuanShu = loadJson("传输次数")
    if numChuanShu == nil then
        numChuanShu = 0
        writeJson("传输次数", numChuanShu)
    end

    -- 交易行
    isTrade = loadJson("交易行")
    if isTrade == nil then
        isTrade = false
        writeJson("交易行", isTrade)
    end

    -- 每日5道具
    num5DaoJu = loadJson("每日5道具")
    if num5DaoJu == nil then
        num5DaoJu = 0
        writeJson("每日5道具", num5DaoJu)
    end

    -- 每日道具合成
    isMixedThing = loadJson("每日道具合成")
    if isMixedThing == nil then
        isMixedThing = false
        writeJson("每日道具合成", isMixedThing)
    end

    -- 每日3海盗
    num3Pirate = loadJson("每日3海盗")
    if num3Pirate == nil then
        num3Pirate = 0
        writeJson("每日3海盗", num3Pirate)
    end

    -- 增产
    numAddChanLiang = loadJson("增产")
    if numAddChanLiang == nil then
        numAddChanLiang = 0
        writeJson("增产", numAddChanLiang)
    end

    -- 增产粒子
    isAddChanLiangLiZi = loadJson("增产粒子")
    if isAddChanLiangLiZi == nil then
        isAddChanLiangLiZi = false
        writeJson("增产粒子", isAddChanLiangLiZi)
    end

    -- 整理背包
    isZhengLi = loadJson("整理")
    if isZhengLi == nil then
        isZhengLi = false
        writeJson("整理", isZhengLi)
    end

    -- 吃经验
    isEatEXP = loadJson("吃经验")
    if isEatEXP == nil then
        isEatEXP = false
        writeJson("吃经验", isEatEXP)
    end

    -- 再次收获22
    isAgainReward22 = loadJson("再次收获22")
    if isAgainReward22 == nil then
        isAgainReward22 = false
        writeJson("再次收获22", isAgainReward22)
    end

    -- 再次收获6
    isAgainReward6 = loadJson("再次收获6")
    if isAgainReward6 == nil then
        isAgainReward6 = false
        writeJson("再次收获6", isAgainReward6)
    end

    -- 卡优化
    isKaYouHua = loadJson("卡优化")
    if isKaYouHua == nil then
        isKaYouHua = false
        writeJson("卡优化", isKaYouHua)
    end

    -- 材料编号
    numCaiLiao = loadJson("材料编号")
    if numCaiLiao == nil then
        numCaiLiao = 1
        writeJson("材料编号", numCaiLiao)
    end

    -- 研究资源
    isYanJiuZiYuan = loadJson("研究资源")
    if isYanJiuZiYuan == nil then
        isYanJiuZiYuan = true
        writeJson("研究资源", isYanJiuZiYuan)
    end

    -- 研究开发
    isYanJiuKaiFa = loadJson("研究开发")
    if isYanJiuKaiFa == nil then
        isYanJiuKaiFa = true
        writeJson("研究开发", isYanJiuKaiFa)
    end

    -- 研究防御
    isYanJiuFangYu = loadJson("研究防御")
    if isYanJiuFangYu == nil then
        isYanJiuFangYu = true
        writeJson("研究防御", isYanJiuFangYu)
    end

    -- 研究生产
    isYanJiuShengChan = loadJson("研究生产")
    if isYanJiuShengChan == nil then
        isYanJiuShengChan = true
        writeJson("研究生产", isYanJiuShengChan)
    end

    -- 研究精锐
    isYanJiuJingRui = loadJson("研究精锐")
    if isYanJiuJingRui == nil then
        isYanJiuJingRui = true
        writeJson("研究精锐", isYanJiuJingRui)
    end

    -- 研究战舰
    isYanJiuZhanJian = loadJson("研究战舰")
    if isYanJiuZhanJian == nil then
        isYanJiuZhanJian = true
        writeJson("研究战舰", isYanJiuZhanJian)
    end

    -- 研究
    isYanJiu = loadJson("研究")
    if isYanJiu == nil then
        isYanJiu = true
        writeJson("研究", isYanJiu)
    end
end

-- onceOther
function onceOther()
    -- zhuXiaoNew()
    -- path_dm_num = "https://gitee.com/xinqinew_admin/rise-of-stars/raw/master/dm_num.txt"
    -- ts.tsDownload(userPath() .. "/res/dm_num.txt", path_dm_num, {
    --     ["tstab"] = 1,
    --     ["mode"] = false
    -- })
    -- mSleep(4000)
    -- dm_num = addDmOcrDict("dm_num.txt")
    -- mSleep(2000)

    -- by新版不支持
    -- path_by_so = "https://gitee.com/xinqinew_admin/rise-of-stars/raw/master/by.so"
    -- ts.tsDownload("/usr/bin/tsplugin/by.so", path_by_so, {
    --     ["tstab"] = 1,
    --     ["mode"] = true
    -- })
    -- by = require("by")
    -- by.SetDict(dictNum, "/User/Media/TouchSprite/res/boardNumberDM.txt")

    -- tab_lizi1 = {"600c00fffffffff$1$40$12$5", "600e00fffffffff$1$41$12$5", "6003003fffffffff@1$1$43$13$5",
    --              "3001c006003ffffffdffe$1$47$14$6", "6007003fffffffff@1$1$44$13$5", "3001c006003ffffffdfff$1$48$14$6",
    --              "7003800e003ffffffffff$1$51$14$6", "7000e0038007ffefffffff@10$1$52$15$6",
    --              "3000e001c007ffffffffffdfff@1$1$67$15$7", "7000e0038007ffffffffffdfff@1$1$68$15$7",
    --              "70007000e000fffefffffffffffe$1$71$16$7"}
    -- index_lizi1 = addTSOcrDictEx(tab_lizi1)
    tab_lizi1 = { "ffffffffffffffffffffffffffffff3fffc7fff0fffe000fc001f8003fffffffffffffffffffffffffffffffff@1$1$313$19$19",
        "ffffffffffffffffffffffffffffffffffff87fff8ffff0007f0007f0007fffffffffffffffffffffffffffffffffff$1$334$20$19",
        "ffffffffffffffffffffffffffffffffffff8ffff0ffff0ffff0007f0007f0007ffffffffffffffffffffffffffffffffffffffff$1$370$20$21",
        "fffffffffffffffffffffffffffffffffffffffffff87fffc7fffc000fe0007f0003f8001fffffffffffffffffffffffffffffffffffff@1$1$378$21$21",
        "ffffffffffffffffffffffffffffffffffffff8ffff87fffc7fffe000ff0007f8003ffffffffffffffffffffffffffffffffffffffffff@1$1$392$21$21",
        "fffffffffffffffffffffffffffffffffffffffffff87fffc7fffc000fe0007f0003f8001fffffffffffffffffffffffffffffffffffff@1$1$378$21$21",
        "fffffffffffffffffffffffffffffffffffffffffffff87fffe1ffff0001fc0007f0001fc0007fffffffffffffffffffffffffffffffffffffffffffffffff@11$1$438$22$23",
        "fffffffffffffffffffffffffffffffffffffffffffffffc3ffff0ffffe1ffffc0007f8000ff0001fe0003ffffffffffffffffffffffffffffffffffffffffffffffffffff$1$480$23$24",
        "fffffffffffffffffffffffffffffffffffffffffffffffffc3ffffc3ffff87ffff8000ff8000ff8000ff8000fffffffffffffffffffffffffffffffffffffffffffffffffffffff$1$504$24$24",
        "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0fffff0fffff87ffff80007fc0003fe0001ff0000fffffffffffffffffffffffffffffffffffffffffffffffffffffffff@1$1$549$25$25",
        "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0fffff0fffff87ffff80003fc0001fe0000ff00007ffffffffffffffffffffffffffffffffffffffffffffffffffffffff@1$1$545$25$25",
        "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff87ffffc1fffff0fffffc0001ff00007fc0001ff00007ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff@11$1$569$26$25" }
    index_lizi1 = addTSOcrDictEx(tab_lizi1)

    --内容已复制到剪贴板!
    tab_lizi2 = {
        "fffffffffffffffffffffffff1f9fc3e3f8787f1c0fe781fc013f8067f01cff0f9fffffffffffffffffffffffffffff$2$307$19$20",
        "fffffffffffffffffffffffffffffff87c7f0707f0707f1e07f1827f0027f80e7f81e7ffff7fffffffffffffffffffffffff$2$324$20$20",
        "fffffffffffffffffffffffffffffffff0fcff07c7f8383fc1c1fe780ff1807f8033fc019fe03cffc3e7fffffffffffffffffffffffffffffff@11$2$371$21$22",
        "fffffffffffffffffffffffffffffffff0fcff07c7f8383fc1c1fe780ff1807f8033fc019fe03cffc3e7fffffffffffffffffffffffffffffff@11$2$371$21$22",
        "fffffffffffffffffffffffffffffffffffffffffe1f87f83e0fe0781fc0e03f8f807f1e00fe0011fc0063fc01c7f80f8fffffbfffffffffffffffffffffffffffffffffff$2$434$23$24",
        "fffffffffffffffffffffffffffffffffffffffffffffffffffc1f87fc0f83fe0781ff0f80ff8f807fc3803fe0011ff0018ffc01c7ff03e3fffff9ffffffffffffffffffffffffffffffffffffff@1$2$506$25$25",
        "fffffffffffffffffffffffffffffffffffffffffffffc3f8ffc1f87fc0f83fe0701ff0f80ff8f807fc2023fe0011ff0018ffc03c7ff03e3fffff9ffffffffffffffffffffffffffffffffffffffffffff@11$2$523$25$26",
        "fffffffffffffffffffffffffffffffffffffffffffffffffffffe0fe1ff03e07fc0f01ff03807fc3e01ff1f047fc2011ff000c7fc0071ff003c7ff03f1fffffcffffffffffffffffffffffffffffffffffffffffffffff@11$2$563$26$27",
        "fffffffffffffffffffffffffffffff87c7f0787f0707f1e07f3807f0027f0067f01e7fc3e7ffffffffffffffffffffffffffffff$2$337$20$21",
        "ffffffffffffffffffffffffffffffffe1f8ff0f87f0783f8381fc780fe3807f0023f8031fe078ff87c7fffffffffffffffffffffffffffffff@11$2$364$21$22",
        "ffffffffffffffffffffffffffffffffffff0fe7fc1f0ff03c1fe0703fc3c07f8f00ff0009fe0033fe00e7fc07cfffff9fffffffffffffffffffffffffffffffffff@1$2$420$23$23"
    }
    index_lizi2 = addTSOcrDictEx(tab_lizi2)


    -- tab_cd_num = {"0380781c8708c08ffffff008008$4$44$12$9", "31cfbec63841841fe37be$8$45$12$7",
    --               "603e0781f83bc73fc3383$2$42$12$7", "31cfbec63841841fe37be$8$45$12$7",
    --               "ffffff0400f03b870cc07803001$K$49$12$9", "603e0f81f83bc637c3383$2$41$12$7",
    --               "0180780e8388e08c08fff008008$4$35$12$9", "400c00ffffff$1$27$12$4", "600400c00fff$1$17$12$4",
    --               "ffffff0400f03b870cc06803$K$47$12$8", "3fcffec43841841c6363e$6$43$12$7",
    --               "607c0f81f833c637c3303$2$39$12$7", "ffffff0400f03b870cc06803$K$47$12$8",
    --               "603e0780f81b833fe3783$2$40$12$7", "004fc68438818818c38fe$5$32$12$7",
    --               "fff0400e03b871ce06803$K$36$12$7", "204606c03841841ce37be$3$32$12$7",
    --               "7fcffe843841843c6363e$6$44$12$7", "7befe6843841843ffe7be$8$49$12$7", "600400c00ffffff$1$29$12$5",
    --               "fc6fc68838818838fe87e$5$42$12$7", "fffefff801e003c00600e0783c0e00ffffff$M$76$12$12",
    --               "603e0780f81b873fe3783$2$41$12$7", "603e0780f81b873fe3783$2$41$12$7",
    --               "fffffff001e003c00600e0783c0e00ffffff$M$76$12$12", "400c00ffffff$1$27$12$4",
    --               "7befe2843841843ffe73e$8$47$12$7", "7fec62843841c43e7e$6$36$12$6", "607c0f81f833c637c3303$2$39$12$7",
    --               "fff0400e03b871ce06803$K$36$12$7", "400c00ffffff$1$27$12$4", "0080380e81c8708c08ffffff008$4$44$12$9",
    --               "400c00ffffff$1$27$12$4", "fff0400e01b871ce06803$K$35$12$7", "606e06803841843ffe7be$3$39$12$7",
    --               "607c0f81f833c637c3303$2$39$12$7", "606e06803841843ff67be$3$38$12$7",
    --               "7beff6843841843ff67be$8$49$12$7", "7c4fe6c63821821c437fe3fc$9$50$12$8",
    --               "0180380e8388608c08ffffff008$4$44$12$9", "fffe3f7801f003c00700f0783c0e00ffffff$M$76$12$12",
    --               "400c00ffffff$1$27$12$4", "600400c00ffffff$1$29$12$5", "fc6fc68838818838fe87e$5$42$12$7",
    --               "fffefff801e003c00700f0783c0e00ffffff$M$78$12$12", "400400c00ffffff$1$28$12$5",
    --               "fc6fc68c38818838fe87e$5$43$12$7", "fffffff801e003c00700f0783c0e00ffffff$M$79$12$12",
    --               "0180781c8708e08ffffff008008$4$44$12$9", "607c0f81f833c637c3303$2$39$12$7",
    --               "ffffff0400e03b871ce06803$K$48$12$8", "80080180f87ebf0f80c00$7$29$12$7",
    --               "fc6fc68838818838fe87c$5$41$12$7", "80080180f83e9f0f80c00$7$27$12$7",
    --               "fc6fc68838818838fe87e$5$42$12$7", "400c00ffffff$1$27$12$4", "603e0780f81b873fe3783$2$41$12$7",
    --               "fffe3f7801f003c00700f0783c0e00ffffff$M$76$12$12", "600400c00fff$1$17$12$4", "400400c00fff$1$16$12$4",
    --               "7beff6843841843ffe7be$8$50$12$7", "fffefff801e003c00700f0783c0e00ffffff$M$78$12$12",
    --               "400400c00ffffff$1$28$12$5", "fc6fc68c38818838fe87e$5$43$12$7",
    --               "fffffff001e003c00700f0783c0e00ffffff$M$78$12$12", "400c00ffffff$1$27$12$4",
    --               "0180781c8308e08ffffff008008$4$43$12$9", "ffffff0400f03b871ce06803$K$49$12$8",
    --               "80080180f87ebf0f80c00$7$29$12$7", "fc6fc68838818838fe87c$5$41$12$7",
    --               "80080180f87e9f0f80c00$7$28$12$7", "fc6fc68838818838fe87e$5$42$12$7", "7fee06803801803ffe$0$34$12$6",
    --               "400c00ffffff$1$27$12$4", "400c00ffffff$1$27$12$4", "7c6fe6823821823ee67fe$9$45$12$7",
    --               "fffe3f7801f003c00700f0783c0e00ffffff$M$76$12$12", "400c00ffffff$1$27$12$4",
    --               "606e06803841843ce37be$3$35$12$7", "0080380e8388708c08ffffff008$4$44$12$9",
    --               "fffefff801e003c00700f0783c0e00ffffff$M$78$12$12", "400c00ffffff$1$27$12$4",
    --               "80080180f87ebf0f80c00$7$29$12$7", "fffffff001e003c00700f0783c0e00ffffff$M$78$12$12",
    --               "203607c0f81b833ce37c3$2$38$12$7", "fc6fc68c38818838fe87e$5$43$12$7",
    --               "004fc68438818818c38fe$5$32$12$7", "ffffff0400e03b871ce06803$K$48$12$8",
    --               "80080180f87ebf0f80c00$7$29$12$7", "0080380e81c8708c08ffffff008$4$44$12$9",
    --               "80080080783f9f8fc0e00$7$29$12$7", "7fcffe843841843e6663e$6$45$12$7"}
    -- index_cd_num = addTSOcrDictEx(tab_cd_num)
    -- tab_dm_num = {"C00$.$0.0.2$2", "C01800$.$0.0.4$2", "7FFC0E00C00803FFDFF0$0$0.0.43$12", "401803FFFFF$1$0.0.27$12",
    --               "400803007FFFFE$1$0.0.28$12", "600803007FFFFE$1$0.0.29$12", "600803007FF$1$0.0.17$12",
    --               "400803007FF$1$0.0.16$12", "603C0E03C0D873FC5E08$2$0.0.41$12", "60781E07C19C62F84C08$2$0.0.39$12",
    --               "60381E07C19C62F84C08$2$0.0.38$12", "202C0F03C0D8339C5F0801$2$0.0.40$12",
    --               "603C0E07C1DC73F84E08$2$0.0.42$12", "603C1E07C1DC62F84E08$2$0.0.41$12",
    --               "603C0E03C1D873F85E08$2$0.0.41$12", "004C0F00C208419C5EF98E$3$0.0.36$12",
    --               "60780600C20863FFDEF8$3$0.0.39$12", "607C0E00C208439C5EF8$3$0.0.35$12",
    --               "60780610C20C63FFDEF0$3$0.0.40$12", "0180F07A1C4E09E1BFF804008$4$0.0.39$12",
    --               "0180F072384E09FFFFF804008$4$0.0.44$12", "0080703A1C4709813FFFFF008$4$0.0.44$12",
    --               "0180F03A1C4E09813FF804008$4$0.0.35$12", "0080703E0E4709813FFFFF008010$4$0.0.46$12",
    --               "0180F07A1C4E09FFFFF804008$4$0.0.44$12", "0080703A0E4709813FFFFF008010$4$0.0.45$12",
    --               "0180703A1C4609813FFFFF008$4$0.0.44$12", "0080701E0E4709813FFFFF008010$4$0.0.45$12",
    --               "0080703A1C4709813FFFFF008010$4$0.0.45$12", "FC7F8E30C408831FE1F8$5$0.0.43$12",
    --               "FC5F8E10C408831861F80C$5$0.0.40$12", "FC7F8E20C408831FE1F8$5$0.0.42$12",
    --               "FC5F8E10C4088318E1F8$5$0.0.38$12", "3FDFFF10C208418C58F8$6$0.0.43$12",
    --               "7FF8C610C20C43CFC8F0$6$0.0.41$12", "7FFFFE10C20843CFD8F8$6$0.0.48$12",
    --               "80100203C3FBF1F03000$7$0.0.29$12", "80100201C1F9F9F83800$7$0.0.29$12",
    --               "80100201C1F8F9F83800$7$0.0.28$12", "7BFFEE10C20843FFDEF8$8$0.0.50$12",
    --               "7BFFCE10C20863FFDEF8$8$0.0.50$12", "7BFFC610C20843FFDCF8$8$0.0.47$12",
    --               "31DF7F18C20841FC5EF804$8$0.0.46$12", "7BFFFE10C20843FCDEF8$8$0.0.49$12",
    --               "01CF7F38C208419C5EF98E$8$0.0.46$12", "7C7FCE08C10823DCDFF8$9$0.0.45$12",
    --               "7C5FCF18C10821885FF9FE$9$0.0.50$12", "7C5FCE18C10821885FF8FC$9$0.0.47$12",
    --               "FFE080381DC71DC0E008$K$0.1.37$12", "FFFFFC100783B8E1B01C01$K$0.1.49$12",
    --               "FFFFFC100783B8E1B01C01$K$0.1.48$12", "FFFC7DE00F803C00C0383C3C1C03FFFFF$M$0.0.76$12",
    --               "FFFDFFE00F003C00C0383C3C1C03FFFFF$M$0.0.78$12", "FFFFFFC00F003C00C0383C3C1C03FFFFF$M$0.0.78$12",
    --               "FFFCFDE00F803E00C0383C3C1C03FFFFF$M$0.0.78$12", "FFFFFFE00F003C00C0383C3C1C03FFFFF$M$0.0.79$12",
    --               "FFFDFFE00F003C00C0383C3C1C03FFFFF$M$0.0.76$12", "FFFFFFC00F003C00C0383C3C1C03FFFFF$M$0.0.76$12",
    --               "FFFDFFE00F803C00C0383C3C1C03FFFFF$M$0.0.79$12"}
    -- index_dm_num = addTSOcrDictEx(tab_dm_num)
    -- tab_num = {"600c00fffffffff$1$40$12$5", "3fcffefffc03803c03fff7fe$0$64$12$8", "703f0fc1f83bc73fe37c3$2$49$12$7",
    --            "01c7befffce3863ce3fff7be008$8$65$12$9", "fe6fe7cc3c83cc3cffcfe038$5$58$12$8", "ff@1$.$9$3$3",
    --            "c00c00c03c1fcffff8fc0e00$7$43$12$8", "60ee0fe07c63c63ce3fff7be$3$58$12$8",
    --            "7fefffc63c43ce3e7fe7e23c$6$64$12$8", "01c07c0fc3ccf8ce0cffffff00c$4$58$12$9",
    --            "fffffffff1f03f871ee0fc07801$K$69$12$9", "fffffffc03f007e00f01f0fc7f0f80ffffff$M$93$12$12",
    --            "f@1$,$5$5$1", "3807eefefc63863c63fffffe3fc$9$71$12$9"}
    -- tab_num = {"600c00fffffffff$1$40$12$5", "3fcffefffc03803c03fff7fe$0$64$12$8", "703f0fc1f83bc73fe37c3$2$49$12$7",
    --            "01c7befffce3863ce3fff7be008$8$65$12$9", "fe6fe7cc3c83cc3cffcfe038$5$58$12$8",
    --            "c00c00c03c1fcffff8fc0e00$7$43$12$8", "60ee0fe07c63c63ce3fff7be$3$58$12$8",
    --            "7fefffc63c43ce3e7fe7e23c$6$64$12$8", "01c07c0fc3ccf8ce0cffffff00c$4$58$12$9",
    --            "3807eefefc63863c63fffffe3fc$9$71$12$9"}
    -- index_num = addTSOcrDictEx(tab_num)

    haoLV = 0

    -- current_time = os.date("%m-%d_%H.%M", os.time());
    -- snapshot(iphoneId .. "-" .. current_time .. ".png", 0, 0, 1135, 639); -- 以时间戳命名进行截图
    -- ftpUpPNG(iphoneId .. "-" .. current_time .. ".png", "PNG/")

end

-- 注销
function zhuXiaoNew(...)
    numTodayExit = numTodayExit + 1
    writeJson("今日闪退次数", numTodayExit)
    numExit = numExit + 1
    writeJson("闪退总次数", numExit)
    if check5 == "注销" then
        flag = deviceIsLock();
        if flag == 0 then
            respring()
            mSleep(1000 * 30)
            -- faEmail()
            autoUnlockDevice()
            nowTime = os.time()
            timeXXX = nowTime
        end
    end
end

-- 自动解锁
function autoUnlockDevice()
    flag = deviceIsLock()
    if flag ~= 0 then
        doublePressHomeKey()
        unlockDevice();
        -- 按一次 Home 键
        mSleep(20)
        pressHomeKey(0);
        pressHomeKey(1)
    end
end

function debug(tiaoShiNeiRong)
    if check1 == "网络调试" then
        wLog("192.168.1.34",
            iphoneId .. " 目标1: " .. muBiao1 .. " 目标2: " .. muBiao2 .. " 目标3: " .. muBiao3 .. "    操作:" ..
            tiaoShiNeiRong .. "   #" .. xiangMu .. "#   [DATE]")
    elseif check2 == "本地调试" then
        -- dialog(tiaoShiNeiRong,5)
        toast(
            "目标1: " .. muBiao1 .. " 目标2: " .. muBiao2 .. " 目标3: " .. muBiao3 .. "                操作:" ..
            tiaoShiNeiRong)
        mSleep(3000)
    end
end

function debug0(tiaoShiNeiRong)
    local temIP = "192.168.1.34"
    initLog(temIP, 2);
    wLog(temIP, "    内容:" .. tiaoShiNeiRong)
    closeLog(temIP);
end

-- 浮动窗口
function floatingWindow()
    init(numInit)
    fwShowWnd("window1", 500, 0, 500 + 50 * 2, 30, 1);
    -- 子窗口视图是以父窗口载体的（100,100）点坐标为（0,0）点坐标显示的
    -- fwShowButton("window1", "btn1", "on", "FFFFFF", "025062", "", 12, 0, 0, 50, 30);
    if haoLV == 3 then
        fwShowButton("window1", "more", "", "FFFFFF", "306090", "lizi.jpg", 12, 0, 0, 50, 30);
    else
        fwShowButton("window1", "more", strNotice, RGB_NoticeFont, RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
    end
    -- fwShowButton("window1", "more", "...", "FFFFFF", "306090", "", 12, 0, 0, 50, 30);
    mSleep(500)
end

-- 多功能窗口
function moreWindow()
    isLuaStart = false
    fwShowWnd("moreWin", 50, 50, wScreen - 50, hScreen - 50, 0);
    -- 子窗口视图是以父窗口载体的（100,100）点坐标为（0,0）点坐标显示的
    fwShowButton("moreWin", "btn_update", "更新", "FFFFFF", "025062", "", 12, 0, 0, 150, 50);
    if check1 == "网络调试" then
        fwShowButton("moreWin", "btn_tiaoShi", "调试ON", "FFFFFF", "306090", "", 12, 1 + 150, 0, 150 * 2, 50);
    else
        fwShowButton("moreWin", "btn_tiaoShi", "调试OFF", "FFFFFF", "306090", "", 12, 1 + 150, 0, 150 * 2, 50);
    end
    fwShowButton("moreWin", "btn_snapshot", "截图", "FFFFFF", "025062", "", 12, 1 + 150 * 2, 0, 150 * 3, 50);
    fwShowButton("moreWin", "btn_restart", "重载", "FFFFFF", "306090", "", 12, 1 + 150 * 3, 0, 150 * 4, 50);
    fwShowButton("moreWin", "btn_hide", "X", "FFFFFF", "9e393d", "", 12, 1 + 150 * 4, 0, 150 * 5, 50);

    fwShowTextView("moreWin", "text_MuBiao",
        "目标1 : " .. muBiao1 .. "  目标2 : " .. muBiao2 .. "  目标3 : " .. muBiao3, "left", "FFFFFF", "0C2037",
        12, 0, 0, 51, wScreen - 100, 100, 1);
    fwShowTextView("moreWin", "text_info",
        "机器名 : " .. iphoneId .. "  IP : " .. strIphoneIP, "left", "FFFFFF", "025062", 12,
        0, 0, 101, wScreen - 100, 150, 1);

    mSleep(500)
end

-- 窗口判断
function windowsDecide()
    vid, kind = fwGetPressedButton();
    if vid == "btn1" then
        fwCloseView("window1", "btn1"); -- 关闭文字视图
        fwShowButton("window1", "btn2", "off", "FFFFFF", "8a4c17", "", 12, 0, 0, 50, 30);
        mSleep(500)
        isPause = true
        -- isLuaStart = false
        repeat
            nowTime = os.time()
            timeXXX = nowTime
            mSleep(1000)
            vid, kind = fwGetPressedButton();
            if vid == "btn2" then
                fwCloseView("window1", "btn2"); -- 关闭文字视图
                fwShowButton("window1", "btn1", "on", "FFFFFF", "025062", "", 12, 0, 0, 50, 30);
                mSleep(500)
            elseif vid == "more" then
                isLuaStart = false
                fwCloseView("window1", "btn1"); -- 关闭文字视图
                fwShowButton("window1", "btn2", "off", "FFFFFF", "8a4c17", "", 12, 0, 0, 50, 30);
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "moreX", "X", "FFFFFF", "9e393d", "", 12, 0, 0, 50, 30);
                mSleep(500)
                moreWindow()
            end
        until vid == "btn2" or vid == "more"
        -- elseif vid == "btn2" then
        --     fwCloseView("window1", "btn2"); -- 关闭文字视图
        --     fwShowButton("window1", "btn1", "on", "FFFFFF", "025062", "", 12, 0, 0, 50, 30);
        --     mSleep(500)
        --     isLuaStart = true
        --     isPause = false
    elseif vid == "more" then
        isPause = true
        isLuaStart = false
        -- fwCloseView("window1", "btn1"); -- 关闭文字视图
        -- fwShowButton("window1", "btn2", "off", "FFFFFF", "8a4c17", "", 12, 0, 0, 50, 30);
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "moreX", "X", "FFFFFF", "9e393d", "", 12, 0, 0, 50, 30);
        mSleep(500)
        moreWindow()
    elseif vid == "moreX" then
        isPause = false
        isLuaStart = true
        -- fwCloseView("window1", "btn2"); -- 关闭文字视图
        -- fwShowButton("window1", "btn1", "on", "FFFFFF", "025062", "", 12, 0, 0, 50, 30);
        fwCloseView("window1", "moreX"); -- 关闭文字视图
        if haoLV == 3 then
            fwShowButton("window1", "more", "", "FFFFFF", "306090", "lizi.jpg", 12, 0, 0, 50, 30);
        else
            fwShowButton("window1", "more", strNotice, RGB_NoticeFont, RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
        end
        mSleep(500)
        fwCloseWnd("moreWin"); -- 关闭父窗口
    elseif vid == "btn_update" then
        onlineLua()
        isXunHuanLua = false
        closeFw()
    elseif vid == "btn_tiaoShi" then
        if check1 == "网络调试" then
            check1 = "网络调试"
            fwShowButton("moreWin", "btn_tiaoShi", "调试OFF", "FFFFFF", "306090", "", 12, 1 + 150, 0, 150 * 2, 50);
        else
            check1 = ""
            fwShowButton("moreWin", "btn_tiaoShi", "调试ON", "FFFFFF", "306090", "", 12, 1 + 150, 0, 150 * 2, 50);
        end
    elseif vid == "btn_snapshot" then
        fwCloseWnd("moreWin"); -- 关闭父窗口
        mSleep(1000)
        current_time = os.date("%m-%d_%H.%M", os.time());
        -- snapshot(
        --     "/private/var/mobile/Library/Mobile%20Documents/com~apple~CloudDocs/" .. iphoneId ..
        --         ".png", 0, 0, 1135, 639); -- 以时间戳命名进行截图
        snapshot(iphoneId .. "-" .. current_time .. ".png", 0, 0, 1135, 639); -- 以时间戳命名进行截图
        ftpUpPNG(iphoneId .. "-" .. current_time .. ".png", "PNG/")
        -- ftpUpTSnet2(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/PNG/" .. iphoneId .. "-" .. current_time .. ".png") --上传
        -- ftpUpTsPNG(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/PNG/" .. iphoneId .. "-" .. current_time .. ".png") --上传
        mSleep(2000)
        os.remove(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png")
        moreWindow()
    elseif vid == "btn_restart" then
        lua_restart()
    elseif vid == "btn_hide" then
        fwCloseWnd("moreWin"); -- 关闭父窗口
    end
end

-- 检测并打开vpn
function autoVpn()
    local flag = getVPNStatus()
    if flag.active == false then
        setVPNEnable(true)
    end
end

--上传json
function ftpUpJson()
    if nowTime - timeUpJson >= 10 * 60 then
        timeUpJson = nowTime
        local tb = plist_ts.read(userPath() .. "/lua/" .. xiangMu .. ".plist") --读取plist至table格式
        if tb ~= "" and tb ~= nil then
            local jsonstring = json_ts.encode(tb);  --将 table 格式数据转成 json 格式数据
            if jsonstring ~= "" and jsonstring ~= nil then
                bool = writeFileString(userPath() .. "/res/" .. iphoneId .. ".json", jsonstring) --写入文件
                if bool then
                    ftpUpPNG(iphoneId .. ".json", "JSON/") --上传
                end
            end
        end
    end
end

--上传json 2
function ftpUpJson2()
    if nowTime - timeUpJson >= 10 * 60 then
        timeUpJson = nowTime
        ftpUpPNG(iphoneId .. ".json", "JSON/") --上传
        -- ftpUpTSnet2(userPath() .. "/res/" .. iphoneId .. ".json", "/JSON/" .. iphoneId .. ".json") --上传
        -- ftpUpTsTxt(userPath() .. "/res/" .. iphoneId .. ".json", "/JSON/" .. iphoneId .. ".json") --上传
    end
end

-- FTP从本地上传图片到服务器
function ftpUpTSnet2(localFile, ftpFile)
    ftp.setTimeout(5)
    ftp.init(serverIP, ftpName, ftpPassword)
    mSleep(200)
    ret, msg = ftp.upload(localFile, ftpFile)
    if ret == 1 then
        toast("FTP上传完成", 1)
        ftp.clean()
        return true
    else
        toast("FTP上传失败", 1)
        ftp.clean()
        return false
    end
    ftp.clean()
    return false
end

-- FTP上传文本
function ftpUpTsTxt(localFile, ftpFile)
    --脚本仅供参考不可直接使用
    -- local ts = require("ts") --使用官方库前一定要在开头插入这一句
    local status = ts.ftp.connect(serverIP, ftpName, ftpPassword)
    mSleep(200)
    if status then
        toast("连接FTP成功--上传", 1)
        local upStatus = ts.ftp.upload(localFile, ftpFile, 1)
        --下载服务器上的 love.png 文件到本地 res 文件夹
        if upStatus then
            toast("FTP上传完成", 1)
            ts.ftp.close() --操作完成后，断开 FTP 服务器连接
            return true
        else
            toast("FTP上传失败", 1)
            ts.ftp.close() --操作完成后，断开 FTP 服务器连接
            return false
        end
    else
        toast("连接FTP失败", 1)
        ts.ftp.close() --操作完成后，断开 FTP 服务器连接
        return false
    end
    ts.ftp.close() --操作完成后，断开 FTP 服务器连接
    return false
end

function ftpUpTsPNG(localFile, ftpFile)
    --脚本仅供参考不可直接使用
    -- local ts = require("ts") --使用官方库前一定要在开头插入这一句
    local status = ts.ftp.connect(serverIP, ftpName, ftpPassword)
    mSleep(200)
    if status then
        toast("连接FTP成功--上传", 1)
        local upStatus = ts.ftp.upload(localFile, ftpFile, 0)
        --下载服务器上的 love.png 文件到本地 res 文件夹
        if upStatus then
            toast("FTP上传完成", 1)
            ts.ftp.close() --操作完成后，断开 FTP 服务器连接
            return true
        else
            toast("FTP上传失败", 1)
            ts.ftp.close() --操作完成后，断开 FTP 服务器连接
            return false
        end
    else
        toast("连接FTP失败", 1)
        ts.ftp.close() --操作完成后，断开 FTP 服务器连接
        return false
    end
    ts.ftp.close() --操作完成后，断开 FTP 服务器连接
    return false
end

-----------------------私有部分--------------------------

-- 综合
function zongHe1(...)
    if inside1() then
        if isColor(33, 493, 0xffffff, 95) and isColor(21, 474, 0x5ea7e8, 95) then
            debug("free")
            touchClick(33, 493)
        end
    end
    if isColor(842, 101, 0x80171a, 95) and isColor(80, 66, 0xff6600, 95) and isColor(91, 59, 0xf8a901, 95) then
        debug("点数商店--精锐怪物旗帜")
        if isColor(967, 371, 0xffe087, 95) then --5
            touchClick(967, 371)
        elseif isColor(394, 371, 0xffe087, 95) then --2
            touchClick(394, 371)
        elseif isColor(197, 371, 0xffe087, 95) then --1
            touchClick(197, 371)
        else
            touchClick(511, 603, 0x0c0c0e)
        end
    end
    if isColor(480, 471, 0x6b4500, 95) and isColor(489, 470, 0xa31c1e, 95) and isColor(527, 483, 0xd77e00, 95) and isColor(681, 385, 0x0e3d74, 95) then
        debug("购买道具--精锐怪物旗帜")
        touchClick(681, 385, 0x0e3d74) --最多
        touchClick(527, 483, 0xd77e00) --购买
    end
    if isColor(338, 45, 0xe0e0e0, 95) and isColor(575, 219, 0xbaab81, 95) and isColor(482, 485, 0x1c6db9, 95) and isColor(688, 397, 0x0d3a70, 95) then
        debug("使用道具--遗物")
        touchClick(690, 397, 0x0d3a70) --最多
        touchClick(507, 482, 0x1c6eba) --使用
    end
    if isColor(17, 23, 0xffffff, 95) and isColor(7, 23, 0xff9c00, 95) and isColor(1073, 598, 0x233a62, 95) and isColor(1063, 596, 0xd1ffff, 95) then
        debug("区域档案")
        if isColor(1089, 572, 0x9e1111, 95) then --红点
            touchClick(1073, 598)
        else
            touchClick(20, 20)
        end
    end
    if isColor(18, 24, 0xffffff, 95) and isColor(9, 24, 0xff9c00, 95) and isColor(185, 100, 0x4a9ce9, 95) and isColor(186, 622, 0x728a9d, 95) then
        debug("未确认记录")
        if isColor(263, 582, 0x116eb9, 95) then
            touchClick(263, 582)
        end
        x, y = findColorInRegionFuzzy(0x931012, 90, 130, 85, 130, 495)
        if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            touchClick(x, y + 10)
        else
            touchClick(20, 20)
        end
    end
    if isColor(17, 24, 0xafafaf, 95) and isColor(381, 588, 0x00769c, 95) and isColor(561, 425, 0x9f6800, 95) and isColor(881, 585, 0x1d6dba, 95) then
        debug("卡指引--编队--整编")
        touchClick(881, 585, 0x1d6dba)
    end
    if isColor(20, 440, 0x8ab9f2, 95) and isColor(1103, 93, 0x444545, 95) and isColor(1057, 30, 0x808080, 95) and isColor(1071, 31, 0xffffff, 95) then
        debug("提示1")
        touchClick(1071, 31)
    end
    if isColor(1071, 31, 0xffffff, 95) and isColor(1057, 31, 0x808080, 95) and isColor(28, 130, 0x444545, 95) and isColor(24, 504, 0x8ab9f2, 95) then
        debug("提示2")
        touchClick(1071, 31)
    end
    if isColor(1073, 32, 0xffffff, 95) and isColor(1058, 32, 0x808080, 95) and isColor(14, 625, 0x000000, 95) then
        debug("提示3")
        touchClick(1073, 32)
    end
    if isColor(279, 286, 0x02ff00, 95) and isColor(319, 350, 0x02ff00, 95) and isColor(23, 249, 0xff8a00, 95) then
        debug("新号--任务3绿")
        touchClick(279, 286)
    end
    if isColor(16, 23, 0xffffff, 95) and isColor(858, 593, 0xd78b02, 95) and isColor(685, 589, 0x0474d7, 95) and isColor(558, 108, 0x517fad, 95) == false then
        debug("错误的出航界面")
        touchClick(20, 20)
    end
    if isColor(76, 68, 0xff6600, 95) and isColor(387, 68, 0xff2a00, 95) and isColor(629, 607, 0x306090, 95) then
        debug("旗舰--升级")
        if isColor(1019, 254, 0x116eb9, 95) then
            touchClick(1019, 254)
            touchClick(20, 20)
        else
            touchClick(20, 20)
        end
    end
    if isColor(337, 11, 0xe0e0e0, 95) and isColor(499, 515, 0x6a3920, 95) and isColor(498, 497, 0x6b4600, 95) and
        isColor(795, 56, 0x718c9c, 95) then
        debug("高级VIP点数--金币购买--误开")
        touchClick(511, 596, 0x0c0c0e)
    end
    if isColor(291, 72, 0xf8a901, 95) and isColor(459, 502, 0x8f4d14, 95) and isColor(664, 542, 0xd87501, 95) then
        debug("布置")
        touchClick(664, 542, 0xd87501)
    end
    if isColor(472, 485, 0x114c8a, 95) and isColor(659, 505, 0x1c6fbb, 95) and isColor(772, 228, 0x5a5f65, 95) then
        debug("集结时间")
        touchClick(510, 570, 0x0c0c0e)
    end
    if isColor(834, 163, 0xff6600, 95) and isColor(667, 433, 0xd78b00, 95) and isColor(489, 421, 0x6b4600, 95) then
        debug("误开加工缩短时间")
        touchClick(510, 526, 0x0c0c0e)
    end
    if isColor(377, 211, 0xa353c5, 95) and isColor(495, 203, 0xf8ec61, 95) and isColor(632, 210, 0x4080cb, 95) then
        debug("中级装备材料选择箱子--误开")
        touchClick(515, 569, 0x3d5879)
    end
    if isColor(297, 107, 0x215da6, 95) and isColor(835, 585, 0x215da6, 95) and isColor(556, 551, 0x145da9, 95) then
        debug("未知信号")
        touchClick(511, 605, 0x0c0c0e)
    end
    if isColor(1049, 607, 0x1c68af, 95) and isColor(1045, 554, 0x1c68af, 95) and isColor(1, 1, 0xff9000, 95) then
        debug("宇宙地图")
        touchClick(511, 611, 0x0c0c0e)
    end
    if isColor(507, 519, 0x135eaa, 95) and isColor(646, 523, 0x121a22, 95) and isColor(782, 523, 0x121a22, 95) then
        debug("司令官信息")
        touchClick(511, 600, 0x0c0c0e)
    end
    if isColor(460, 430, 0x8f4d14, 95) and isColor(487, 448, 0xd3a363, 95) and isColor(291, 146, 0xf9aa01, 95) and
        isColor(781, 210, 0x85baf9, 95) then
        debug("消耗积分币完成工作")
        touchClick(511, 516, 0x0c0c0e)
    end
    if isColor(310, 314, 0xffffff, 95) and isColor(712, 309, 0x116eb9, 95) and isColor(310, 466, 0xffffff, 95) and
        isColor(719, 462, 0x116eb9, 95) then
        debug("通过以下途径获得以下道具")
        touchClick(512, 594, 0x0c0c0e)
    end
    if isColor(696, 250, 0x116eb9, 95) and isColor(823, 255, 0x126fba, 95) and isColor(460, 509, 0x8f4d14, 95) and
        isColor(465, 548, 0xd78c00, 95) then
        debug("司令官经验值")
        touchClick(465, 548, 0xd78c00)
        if isColor(487, 431, 0x1c6eb9, 95) then -- 确定
            touchClick(487, 431)
        end
    end
    if isColor(308, 424, 0x167dfb, 95) and isColor(816, 554, 0x167dfb, 95) and isColor(518, 592, 0xa5a5a5, 95) then
        debug("确认年龄")
        touchClick(308, 424, 0x167dfb)
    end
    if isColor(242, 533, 0x167dfb, 95) and isColor(717, 586, 0x167dfb, 95) and isColor(145, 42, 0x333333, 95) and
        isColor(772, 579, 0xffffff, 95) then
        debug("全部同意")
        touchClick(242, 533)
    end
    if isColor(16, 24, 0xffffff, 95) and isColor(6, 24, 0xff9c00, 95) and isColor(56, 108, 0x75ff2d, 95) and
        isColor(243, 574, 0x114c8a, 95) and isColor(447, 618, 0x115dad, 95) then
        debug("只有个建设按钮")
        touchClick(447, 618, 0x115dad)
    end
    if isColor(515, 499, 0xd77500, 95) and isColor(291, 108, 0xf8ad01, 95) and isColor(469, 479, 0x6b4500, 95) and
        isColor(329, 180, 0x787b81, 95) then
        debug("变更口号")
        touchClick(511, 554, 0x0c0c0e)
    end
    if isColor(16, 25, 0xffffff, 95) and isColor(4, 25, 0xff9c00, 95) and isColor(48, 83, 0xffffff, 95) and
        isColor(61, 103, 0x4b4a54, 95) and isColor(346, 578, 0x227bc8, 95) then
        debug("金属1/2")
        touchClick(346, 578, 0x227bc8)
    end
    if isColor(282, 66, 0xff6600, 95) and isColor(458, 513, 0x114c8a, 95) and isColor(318, 205, 0xff6600, 95) then
        debug("联盟推荐")
        -- touchClick(458, 513, 0x114c8a)
        touchClick(511, 603, 0x0c0c0e)
    end
    if isColor(773, 278, 0x5b7f98, 95) and isColor(772, 352, 0x5b7f98, 95) and isColor(1112, 314, 0x4a9ce9, 95) then
        debug("合成人物--关闭")
        touchClick(563, 595, 0x0a1829)
    end
    if isColor(504, 489, 0x1c6eba, 95) and isColor(305, 111, 0xff6600, 95) and isColor(827, 529, 0xff6600, 95) then
        debug("人物--获得")
        touchClick(504, 489, 0x1c6eba)
    end
    if isColor(849, 548, 0x8f4d14, 95) and isColor(1066, 596, 0xde7500, 95) and isColor(165, 599, 0x0c0c0e, 95) and
        isColor(157, 599, 0x3c587d, 95) then
        debug("抽奖人物")
        touchClick(885, 569, 0xd68b02)
    end
    -- if isColor(0, 0, 0xa80404, 95) and isColor(1135, 0, 0xa60101, 95) and isColor(0, 639, 0xa90304, 95) and
    --     isColor(1135, 639, 0xa60001, 95) then
    --         debug("被攻击")
    --     nowTime = os.time()
    --     timeXXX = nowTime
    -- end
    if isColor(725, 435, 0x117955, 95) and isColor(845, 460, 0x14a977, 95) and isColor(505, 614, 0x3a5475, 95) and
        isColor(272, 467, 0xffa900, 95) then
        debug("升阶--关闭")
        touchClick(510, 615, 0x0c0c0e)
    end

    if isColor(282, 186, 0xff6600, 95) and isColor(377, 462, 0xff6600, 95) and isColor(851, 177, 0x718d9f, 95) then
        debug("排队")
        nowTime = os.time()
        timeXXX = nowTime
        if isColor(503, 423, 0x1c6eba, 95) then
            debug("有蓝色的确认按钮")
            touchClick(503, 423)
        elseif isColor(511, 500, 0x597181, 95) then
            debug("有灰色关闭按钮")
            touchClick(511, 500)
        end
    end
    if isColor(271, 196, 0xf7a901, 95) and isColor(690, 355, 0x114c8a, 95) and isColor(860, 412, 0xb8b7b8, 95) then
        -- if isColor(273, 149, 0xf7a901, 95) and isColor(260, 490, 0x658090, 95) and isColor(694, 318, 0x4693cf, 95) and
        -- isColor(844, 462, 0x052b57, 95) then
        debug("认证和观看视频")
        -- touchClick(726, 433, 0x1c6dba) -- 观看视频
        touchClick(769, 381, 0xffffff) -- 认证
    end
    if isColor(310, 103, 0xf5a801, 95) and isColor(311, 159, 0x264569, 95) and isColor(691, 202, 0x116eb9, 95) and
        isColor(813, 201, 0x116eb9, 95) then
        debug("expire notice")
        touchClick(511, 540, 0x0c0c0e)
    end
    if isColor(605, 474, 0xc9a571, 95) and isColor(645, 492, 0xd77500, 95) and isColor(682, 387, 0x0b3365, 95) and
        isColor(616, 392, 0x4a5e9b, 95) then
        debug("购买道具--金币")
        touchClick(511, 551, 0x0c0c0e)
        if muBiao == mb_YouHua then
            isKaYouHua = true
            writeJson("卡优化", isKaYouHua)
            gaiMuBiaoNew(1, mb_ZhuXian, mm_ZhuXian)
            mSleep(1000)
            touchClick(511, 603, 0x0c0c0e)
            mSleep(1000)
            getOut()
        elseif muBiao == mb_ZhuXian then
            if haoLV <= 2 and isOverLesson == false and numLv >= 6 then
                gaiMuBiaoNew(1, "章节")
            else
                gaiMuBiaoNew(1, mb_WaKuang, mm_WaKuang)
            end
            timeRound = nowTime
            mSleep(1000)
            touchClick(511, 603, 0x0c0c0e)
            mSleep(1000)
            getOut()
        elseif muBiao == mb_WaKuang then
            timeRound = nowTime
            mSleep(1000)
            touchClick(511, 603, 0x0c0c0e)
            mSleep(1000)
            getOut()
        end
    end
    if isColor(639, 468, 0xd68b01, 95) and isColor(624, 473, 0x6b4500, 95) and isColor(685, 397, 0x0b305f, 95) and
        isColor(629, 392, 0xffffff, 95) then
        debug("购买道具--金币2")
        touchClick(511, 551, 0x0c0c0e)
        if muBiao == mb_YouHua then
            isKaYouHua = true
            writeJson("卡优化", isKaYouHua)
            gaiMuBiaoNew(1, mb_ZhuXian, mm_ZhuXian)
            mSleep(1000)
            touchClick(511, 603, 0x0c0c0e)
            mSleep(1000)
            getOut()
        elseif muBiao == mb_ZhuXian then
            if haoLV <= 2 and isOverLesson == false and numLv >= 6 then
                gaiMuBiaoNew(1, "章节")
            else
                gaiMuBiaoNew(1, mb_WaKuang, mm_WaKuang)
            end
            timeRound = nowTime
            mSleep(1000)
            touchClick(511, 603, 0x0c0c0e)
            mSleep(1000)
            getOut()
        elseif muBiao == mb_WaKuang then
            timeRound = nowTime
            mSleep(1000)
            touchClick(511, 603, 0x0c0c0e)
            mSleep(1000)
            getOut()
        end
    end
    if isColor(123, 125, 0xff6600, 95) and isColor(776, 515, 0xce890e, 95) and isColor(123, 268, 0x5798dc, 95) and
        isColor(999, 431, 0x413013, 95) then
        -- if isColor(123, 125, 0xff6600, 95) and isColor(147, 254, 0x5fb1ff, 95) and isColor(785, 505, 0xd78c01, 95) then
        debug("骗你充一次钱")
        touchClick(510, 607, 0x375070)
        if isColor(339, 429, 0x1c6fbb, 95) and isColor(592, 438, 0x1c6eba, 95) and isColor(282, 217, 0xff6600, 95) then
            debug("关闭礼包")
            touchClick(339, 429, 0x1c6fbb)
        end
    end

    if isColor(180, 147, 0x215da6, 95) and isColor(202, 204, 0x4c92da, 95) and isColor(503, 515, 0x233341, 95) and
        isColor(741, 516, 0x2f2a33, 95) then
        debug("外太空玩家2")
        touchClick(511, 600, 0x0c0c0e)
        touchClick(571, 467, 0x05305c)
    end
    if isColor(158, 328, 0xf57508, 95) and isColor(771, 599, 0xf57508, 95) and isColor(561, 439, 0xf1fc6a, 95) then
        debug("基地加成")
        if muBiao == mb_CaiJi then
            touchClick(561, 439)
        else
            touchClick(20, 20)
        end
    end
    if isColor(143, 57, 0xe0e0e0, 95) and isColor(500, 164, 0xd4dc39, 95) and isColor(833, 184, 0x116eb9, 95) then
        debug("加成信息--采集道具--使用")
        if muBiao == mb_CaiJi then
            touchClick(833, 184, 0x116eb9)
            if isColor(502, 437, 0x1c6dba, 95) then
                touchClick(511, 496, 0x566e7d)
            end
            gaiMuBiaoNew(2, mb_JiNeng, mm_JiNeng)
        else
            touchClick(511, 585, 0x0c0c0e)
        end
    end
    if isColor(474, 421, 0x1d6fbb, 95) and isColor(391, 306, 0x556c82, 95) and isColor(569, 304, 0x556c82, 95) then
        debug("移动坐标")
        touchClick(508, 464, 0x0c0c0e)
    end
    if isColor(24, 594, 0xe8e8e8, 95) and isColor(1078, 591, 0xc7ccd1, 95) then
        debug("广告")
        if isColor(568, 321, 0xffffff, 95) then
            touchClick(568, 321)
            mSleep(50 * 5000)
        end
    end
    if isColor(50, 598, 0x071011, 95) and isColor(50, 601, 0x666666, 95) and isColor(571, 308, 0xffffff, 95) then
        debug("广告,白色小手--点击")
        touchClick(571, 308)
    end
    if isColor(850, 434, 0x05c237, 95) and isColor(913, 207, 0x05c237, 95) and isColor(990, 336, 0xb0b5b5, 95) then
        debug("广告,绿色--继续")
        touchClick(850, 434, 0x05c237)
        mSleep(45 * 1000)
    end
    if isColor(60, 55, 0xffffff, 95) and isColor(71, 44, 0xffffff, 95) and isColor(1069, 593, 0x9f95b5, 95) then
        debug("关广告--X,白--左上")
        touchClick(60, 55)
    end
    if isColor(48, 51, 0xe8e8e8, 95) and isColor(37, 40, 0xe8e8e8, 95) and isColor(1076, 591, 0xbabec1, 95) then
        debug("关广告--X,白--左上2")
        touchClick(48, 51)
    end
    if isColor(59, 56, 0xffffff, 95) and isColor(50, 597, 0x13282b, 95) and isColor(1069, 593, 0x586c9a, 95) then
        debug("关广告--X,白--左上3")
        touchClick(59, 56)
    end
    if isColor(563, 314, 0xffffff, 95) and isColor(1103, 39, 0x666666, 95) and isColor(1059, 584, 0xb3b3b3, 95) then
        debug("关广告--X,白--小手")
        touchClick(562, 308)
        mSleep(60 * 1000)
    end
    if isColor(59, 56, 0xffffff, 95) and isColor(48, 44, 0xffffff, 95) and isColor(1104, 40, 0xffffff, 95) then
        debug("关广告--X,白--左上4")
        touchClick(59, 55, 0xffffff)
    end
    if isColor(49, 52, 0xe8e8e8, 95) and isColor(36, 39, 0xe8e8e8, 95) and isColor(31, 53, 0x567274, 95) then
        debug("关广告--X,白")
        touchClick(49, 52)
    end
    if isColor(1099, 35, 0x7c7c7c, 95) and isColor(1100, 41, 0xfafafa, 95) then
        debug("关广告--X,灰白色")
        touchClick(1099, 35, 0x7c7c7c)
    end
    if isColor(1088, 47, 0x202124, 95) and isColor(1088, 58, 0xfafafa, 95) and isColor(929, 50, 0x868686, 95) then
        debug("关广告--X,黑色")
        touchClick(1088, 47, 0x202124)
    end
    if isColor(1088, 48, 0x202124, 95) and isColor(1088, 58, 0xfafafa, 95) and isColor(930, 50, 0x000000, 95) then
        debug("关广告--X,黑色2")
        touchClick(1088, 47, 0x202124)
    end
    if isColor(1088, 48, 0xffffff, 95) and isColor(1088, 62, 0x3c4043, 95) and isColor(30, 599, 0xffffff, 95) == false then
        debug("关广告--X,白色")
        touchClick(1088, 47, 0x202124)
    end
    if isColor(1078, 57, 0xffffff, 95) and isColor(1087, 57, 0x101010, 95) and isColor(28, 604, 0xe6e6e6, 95) then
        debug("关广告--X,白色2")
        touchClick(1078, 57, 0x202124)
    end
    if isColor(1088, 52, 0xffffff, 95) and isColor(1095, 52, 0xc4c4c4, 95) then
        debug("关广告--X,白色3")
        touchClick(1088, 52)
    end
    if isColor(1078, 57, 0xffffff, 95) and isColor(30, 603, 0xe6e6e6, 95) then
        debug("关广告--X,白色4")
        touchClick(1078, 57)
    end
    if isColor(1088, 52, 0xffffff, 95) and isColor(1098, 41, 0xffffff, 95) and isColor(33, 17, 0xe6e6e6, 95) then
        debug("关广告--X,白色1--左上角")
        touchClick(1088, 52)
    end
    if isColor(1088, 47, 0xfafafa, 95) and isColor(1088, 58, 0x505050, 95) and isColor(981, 57, 0xadafb2, 95) then
        debug("广告--奖励已发放--灰底白字")
        touchClick(1088, 47, 0xfafafa)
    end
    if isColor(17, 25, 0xffffff, 95) and isColor(6, 25, 0xff9c00, 95) and isColor(792, 121, 0xe0b8ab, 95) and
        isColor(836, 102, 0xfab1cb, 95) then
        debug("奖励积分币")
        mSleep(1000)
        isJustBack = false
        x, y = findColorInRegionFuzzy(0xd78b01, 95, 71, 87, 1121, 587);
        if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            touchClick(x, y)
            -- 广告次数
            numGuangGao = numGuangGao + 1
            writeJson("广告次数", numGuangGao)
            mSleep(5 * 1000)
            if isColor(98, 272, 0x2d5996, 95) and isColor(1030, 563, 0x2d5a98, 95) and isColor(566, 195, 0xeccfc0, 95) then
                debug("已观看视频2")
                touchClick(512, 606, 0x0d0d10)
                return
            end
            if isColor(98, 272, 0x2c5995, 95) and isColor(1030, 563, 0x2d5a98, 95) and isColor(566, 195, 0xedcfc1, 95) then
                debug("已观看视频")
                touchClick(512, 606, 0x0d0d10)
                return
            end
            mSleep(55 * 1000)
            nowTime = os.time()
            timeXXX = nowTime
            if isColor(1078, 58, 0xffffff, 95) and isColor(1087, 48, 0xffffff, 95) and isColor(1087, 67, 0xffffff, 95) then
                touchClick(1078, 58)
            elseif isColor(1088, 48, 0xffffff, 95) and isColor(1096, 39, 0xffffff, 95) and
                isColor(1096, 56, 0xffffff, 95) then
                touchClick(1088, 48)
            elseif isColor(1088, 48, 0x202124, 95) and isColor(1096, 39, 0x202124, 95) and
                isColor(1096, 56, 0x202124, 95) then
                touchClick(1088, 48)
            elseif isColor(1088, 51, 0xffffff, 95) and isColor(1100, 39, 0xffffff, 95) and
                isColor(1100, 64, 0xffffff, 95) then
                touchClick(1088, 51)
            elseif isColor(1099, 35, 0x7c7c7c, 95) and isColor(1106, 29, 0x7c7c7c, 95) and
                isColor(1106, 42, 0x7c7c7c, 95) then
                touchClick(1099, 35)
            elseif isColor(1087, 51, 0xffffff, 95) and isColor(1100, 40, 0xffffff, 95) and
                isColor(1099, 62, 0xffffff, 95) then
                touchClick(1087, 51)
            end
            for i = 1, 30, 1 do
                if isPause == true then
                    return
                end
                if isColor(1078, 58, 0xffffff, 95) and isColor(1087, 48, 0xffffff, 95) and
                    isColor(1087, 67, 0xffffff, 95) then
                    touchClick(1078, 58)
                elseif isColor(1088, 48, 0xffffff, 95) and isColor(1096, 39, 0xffffff, 95) and
                    isColor(1096, 56, 0xffffff, 95) then
                    touchClick(1088, 48)
                elseif isColor(1088, 48, 0x202124, 95) and isColor(1096, 39, 0x202124, 95) and
                    isColor(1096, 56, 0x202124, 95) then
                    touchClick(1088, 48)
                elseif isColor(1088, 51, 0xffffff, 95) and isColor(1100, 39, 0xffffff, 95) and
                    isColor(1100, 64, 0xffffff, 95) then
                    touchClick(1088, 51)
                elseif isColor(1099, 35, 0x7c7c7c, 95) and isColor(1106, 29, 0x7c7c7c, 95) and
                    isColor(1106, 42, 0x7c7c7c, 95) then
                    touchClick(1099, 35)
                elseif isColor(1087, 51, 0xffffff, 95) and isColor(1100, 40, 0xffffff, 95) and
                    isColor(1099, 62, 0xffffff, 95) then
                    touchClick(1087, 51)
                else
                    break
                end
                mSleep(1000)
            end
        else
            touchClick(20, 20)
        end
    end
    if isColor(98, 272, 0x2d5996, 95) and isColor(1030, 563, 0x2d5a98, 95) and isColor(566, 195, 0xeccfc0, 95) then
        debug("已观看视频2")
        touchClick(512, 606, 0x0d0d10)
    end
    if isColor(98, 272, 0x2c5995, 95) and isColor(1030, 563, 0x2d5a98, 95) and isColor(566, 195, 0xedcfc1, 95) then
        debug("已观看视频")
        touchClick(512, 606, 0x0d0d10)
    end
    if isColor(155, 144, 0xff6600, 95) and isColor(171, 137, 0xf8a901, 95) and isColor(345, 467, 0x1d6eba, 95) and
        isColor(600, 470, 0xd78b00, 95) then
        debug("掌握--达成满级")
        touchClick(514, 530, 0x0e0f12)
    end
    if isColor(17, 25, 0xffffff, 95) and isColor(6, 25, 0xff9c00, 95) and isColor(1094, 39, 0xe8d9a3, 95) and
        isColor(1077, 19, 0xc07f20, 95) then
        debug("司令官技能--误开")
        touchClick(20, 20)
    end
    if isColor(635, 90, 0x126fba, 95) and isColor(805, 123, 0x075ea8, 95) and isColor(900, 120, 0xffffff, 95) then
        debug("云打码")
        nowTime = os.time()
        timeXXX = nowTime
        -- snapshot("yudama.png", 222, 12, 596, 157)
        current_time = os.date("%m-%d_%H.%M", os.time());
        snapshot(iphoneId .. "-" .. current_time .. ".png", 222, 12, 596, 157); -- 以时间戳命名进行截图
        -- ftpUpPNG(iphoneId .. "-" .. current_time .. ".png", "YDM/")
        -- ftpUpTSnet2(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/YDM/" .. iphoneId .. "-" .. current_time .. ".png") --上传
        mSleep(2000)
        os.remove(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png")
        if isColor(635, 90, 0x126fba, 95) and isColor(805, 123, 0x075ea8, 95) and isColor(900, 120, 0xffffff, 95) then
            closeFw() -- 关闭所有视图
            mSleep(500)
            local strDaMa = yunDaMaNew(op, 222, 12, 596, 157)
            if strDaMa ~= false then
                for i = 1, 10, 1 do
                    if isPause == true then
                        return
                    end
                    if isColor(475, 599, 0xffffff, 95) == false then -- 没有键盘,点击文本框
                        touchClick(659, 45)
                        mSleep(1000)
                    else
                        break
                    end
                    if i == 10 then
                        closeApp(appXiangMu)
                        zhuXiaoNew()
                        return
                    end
                end
                inputText(strDaMa)
                mSleep(2000)
                touchClick(717, 104, 0x1270bb)
                mSleep(1000)
                touchClick(717, 104, 0x1270bb)
                mSleep(5000)
                numYunDaMa = numYunDaMa + 1
                if numYunDaMa >= 5 then
                    -- fwCloseView("window1", "btn1"); -- 关闭文字视图
                    -- fwShowButton("window1", "btn2", "off", "FFFFFF", "8a4c17", "", 12, 0, 0, 50, 30);
                    -- mSleep(500)
                    -- isLuaStart = false
                    -- dialog("云打码超过5次", 0);
                    numYunDaMa = 0
                    zhuXiaoNew()
                    return

                    -- lua_exit();
                    -- mSleep(10)
                    -- mSleep(10)
                    -- -- lua 的机制是调用此函数之后的下一行结束，如果不希望出现此情况可以在调用函数之后加入一行无意义代码
                    -- mSleep(10)
                end
                x, y = findImage(iphoneId .. "-" .. current_time .. ".png", 221, 11, 597, 158)
                if x ~= -1 and y ~= -1 then
                    closeApp(appXiangMu)
                    zhuXiaoNew()
                    return
                end
            end
            floatingWindow()
            mSleep(500)
        end
        -- lua_exit();
        -- mSleep(10)
        -- mSleep(10)
        -- -- lua 的机制是调用此函数之后的下一行结束，如果不希望出现此情况可以在调用函数之后加入一行无意义代码
        -- mSleep(10)
    end
    if isColor(269, 510, 0xc3841e, 95) and isColor(281, 128, 0xffffff, 95) and isColor(300, 121, 0x0c345b, 95) then
        debug("vip界面")
        if isColor(271, 394, 0x116eb9, 95) then
            debug("领取奖励--可领")
            touchClick(271, 394)
        elseif isColor(942, 120, 0x9e1111, 95) then
            debug("使用VIP点数--红点")
            touchClick(821, 135, 0x268465)
        elseif isColor(807, 264, 0x1c6dba, 95) then
            debug("可使用")
            touchClick(807, 264)
        else
            touchClick(510, 591, 0x0c0c0e)
        end
    end
    if isColor(457, 454, 0xf27c00, 95) and isColor(677, 453, 0xf2d600, 95) and isColor(513, 508, 0x1c6eba, 95) and
        isColor(308, 80, 0x0b4991, 95) then
        debug("100 vip点数")
        touchClick(556, 509, 0x1c6eba)
    end
    if isColor(498, 469, 0x1d6ebb, 95) and isColor(646, 470, 0x1d6fbc, 95) and isColor(574, 247, 0x7c4c3c, 95) then
        debug("100 vip点数 单数")
        touchClick(539, 475, 0x1c6ebb)
    end

    if isColor(273, 72, 0xf5a801, 95) and isColor(270, 85, 0xe0e0e0, 95) and isColor(506, 590, 0x3f5d81, 95) and
        isColor(275, 146, 0x436c9e, 95) then
        debug("奖励目录")
        if isColor(469, 517, 0x1eb585, 95) then
            touchClick(477, 507)
        else
            touchClick(511, 589, 0x0c0c0e)
        end
    end
    if isColor(170, 165, 0xa99280, 95) and isColor(214, 315, 0x56596a, 95) and isColor(354, 228, 0x246594, 95) then
        debug("每日联盟任务")
        if isColor(146, 511, 0x1d6eb9, 95) then
            touchClick(146, 511)
        else
            touchClick(512, 612, 0x0c0c0e)
        end
    end
    if isColor(921, 44, 0x116eb9, 95) and isColor(330, 533, 0x49d9ec, 95) and isColor(83, 36, 0x30e4ff, 95) then
        debug("联盟星球")
        touchClick(877, 542)
        touchClick(511, 609, 0x3a597d)
    end
    if isColor(111, 106, 0x215da6, 95) and isColor(140, 71, 0xa9a9aa, 95) and isColor(345, 67, 0xd4d4d5, 95) then
        debug("援助联盟成员工作")
        if isColor(916, 82, 0x0d9098, 95) then
            touchClick(916, 82)
        else
            touchClick(511, 609, 0x3a597d)
        end
    end
    if isColor(126, 118, 0x00ace4, 95) and isColor(150, 109, 0xc0c0c0, 95) and isColor(313, 130, 0xe1e2e2, 95) then
        debug("联盟成员礼物")
        if isColor(902, 128, 0x0d9098, 95) then
            touchClick(902, 128)
        else
            touchClick(511, 590, 0x0c0c0e)
        end
    end
    if isColor(126, 59, 0x00ace4, 95) and isColor(116, 85, 0x215da6, 95) and isColor(519, 617, 0x3a597d, 95) then
        debug("联盟成员礼物--新")
        if isColor(900, 125, 0x0d9098, 95) then
            touchClick(900, 125)
        elseif isColor(205, 460, 0x1c6eba, 95) then
            touchClick(205, 460)
        elseif isColor(455, 458, 0x1c6dba, 95) then
            touchClick(455, 458)
        elseif isColor(430, 98, 0x9d1111, 95) then
            debug("高级红点")
            touchClick(317, 116, 0x5a3f1e)
        else
            touchClick(511, 589, 0x0c0c0e)
        end
    end
    if isColor(89, 35, 0x00ace4, 95) and isColor(91, 71, 0x215da6, 95) and isColor(125, 30, 0xc3bebe, 95) and
        isColor(231, 47, 0xafb1b4, 95) then
        debug("联盟任务")
        if isColor(228, 105, 0x931012, 95) and isColor(113, 143, 0x956b1a, 95) then
            debug("任务--红点--已选中")
            mSleep(100)
            if isColor(842, 524, 0x116eb9, 95) then
                debug("可更新")
                -- 红 0xb61d2c
                -- 橙 0xc56600
                -- 紫 0x7d079b
                -- 蓝 0x1050ac
                -- 绿 0x34b200
                if isColor(340, 171, 0xb61d2c, 95) then -- 左--红
                    touchClick(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0xb61d2c, 95) then -- 中
                    touchClick(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0xb61d2c, 95) then -- 右
                    touchClick(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0xc56600, 95) then -- 左--橙
                    touchClick(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0xc56600, 95) then -- 中
                    touchClick(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0xc56600, 95) then -- 右
                    touchClick(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0x7d079b, 95) then -- 左--紫
                    touchClick(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0x7d079b, 95) then -- 中
                    touchClick(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0x7d079b, 95) then -- 右
                    touchClick(890, 450, 0xb4cbe4)
                    -- elseif isColorPlus(340, 171, 0x1050ac, 95) then -- 左--蓝
                    --     touchClick(381, 452, 0x145ca8)
                    -- elseif isColorPlus(594, 171, 0x1050ac, 95) then -- 中
                    --     touchClick(644, 450, 0xa3bfdd)
                    -- elseif isColorPlus(848, 170, 0x1050ac, 95) then -- 右
                    --     touchClick(890, 450, 0xb4cbe4)
                    -- elseif isColorPlus(340, 171, 0x34b200, 95) then -- 左--绿
                    --     touchClick(381, 452, 0x145ca8)
                    -- elseif isColorPlus(594, 171, 0x34b200, 95) then -- 中
                    --     touchClick(644, 450, 0xa3bfdd)
                    -- elseif isColorPlus(848, 170, 0x34b200, 95) then -- 右
                    --     touchClick(890, 450, 0xb4cbe4)
                else
                    touchClick(825, 532, 0x116eb9) -- 更新
                end
            else
                debug("不可更新")
                -- 红 0xb61d2c
                -- 橙 0xc56600
                -- 紫 0x7d079b
                -- 蓝 0x1050ac
                -- 绿 0x34b200
                if isColor(340, 171, 0xb61d2c, 95) then -- 左--红
                    touchClick(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0xb61d2c, 95) then -- 中
                    touchClick(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0xb61d2c, 95) then -- 右
                    touchClick(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0xc56600, 95) then -- 左--橙
                    touchClick(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0xc56600, 95) then -- 中
                    touchClick(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0xc56600, 95) then -- 右
                    touchClick(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0x7d079b, 95) then -- 左--紫
                    touchClick(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0x7d079b, 95) then -- 中
                    touchClick(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0x7d079b, 95) then -- 右
                    touchClick(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0x1050ac, 95) then -- 左--蓝
                    touchClick(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0x1050ac, 95) then -- 中
                    touchClick(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0x1050ac, 95) then -- 右
                    touchClick(890, 450, 0xb4cbe4)
                elseif isColor(340, 171, 0x34b200, 95) then -- 左--绿
                    touchClick(381, 452, 0x145ca8)
                elseif isColor(594, 171, 0x34b200, 95) then -- 中
                    touchClick(644, 450, 0xa3bfdd)
                elseif isColor(848, 170, 0x34b200, 95) then -- 右
                    touchClick(890, 450, 0xb4cbe4)
                else
                    touchClick(512, 607, 0x0c0c0e) -- 关闭
                end
            end
        elseif isColor(218, 169, 0x9d1111, 95) and isColor(199, 182, 0xa17316, 95) then
            debug("进行--红点--已选中")
            if isColor(311, 445, 0x1db687, 95) then
                touchClick(311, 445)
            elseif isColor(558, 443, 0x1db586, 95) then
                touchClick(558, 443)
            end
        elseif isColor(227, 233, 0x931012, 95) and isColor(199, 250, 0xa07316, 95) then
            debug("协助--红点--已选中")
            if isColor(303, 449, 0x1c6dba, 95) then
                touchClick(303, 449, 0x1c6dba)
            else
                touchClick(513, 606, 0x395679)
            end
        elseif isColor(228, 105, 0x931012, 95) and isColor(213, 114, 0x1b2b3e, 95) then
            debug("任务--红点--未选中")
            touchClick(171, 140, 0x283544)
        elseif isColor(218, 169, 0x9d1111, 95) and isColor(212, 178, 0x1b2b3e, 95) then
            debug("进行--红点--未选中")
            touchClick(171, 211, 0x283544)
        elseif isColor(227, 233, 0x931012, 95) and isColor(210, 244, 0x1b2a3d, 95) then
            debug("协助--红点--未选中")
            touchClick(166, 263, 0x855f15)

        elseif isColor(315, 448, 0x1db587, 95) then
            debug("分享")
            touchClick(315, 448)
        elseif isColor(186, 262, 0x876115, 95) and isColor(323, 448, 0x1d6ebb, 95) then
            debug("协助")
            touchClick(323, 448, 0x1d6ebb)
            isOverHelp = true
            mSleep(2000)
            touchClick(510, 606, 0x0c0c0e)
        else
            touchClick(176, 198, 0x886115)
            if isColor(313, 445, 0x1db687, 95) then
                debug("分享")
                touchClick(313, 445)
            else
                touchClick(510, 608)
            end
        end
    end
    if isColor(48, 44, 0x00ace4, 95) and isColor(72, 119, 0xa17316, 95) and isColor(94, 136, 0xffffff, 95) then
        debug("联盟技术研究界面")
        if isColor(336, 264, 0x767676, 95) then -- 1-1
            touchClick(280, 193, 0xbc936a)
        elseif isColor(517, 264, 0x767676, 95) then -- 1-2
            touchClick(462, 187, 0x131410)
        elseif isColor(669, 264, 0x767676, 95) then -- 1-3
            touchClick(631, 177, 0x080a0d)
        elseif isColor(821, 263, 0x767676, 95) then -- 1-4
            touchClick(818, 184, 0x426674)
        elseif isColor(1031, 264, 0x767676, 95) then -- 1-5
            touchClick(1004, 196, 0x17160c)
        elseif isColor(336, 482, 0x767676, 95) then -- 2-1
            touchClick(276, 402, 0x30657a)
        elseif isColor(459, 482, 0x767676, 95) then -- 2-2
            touchClick(464, 408, 0x242c33)
        elseif isColor(640, 482, 0x767676, 95) then -- 2-3
            touchClick(637, 412, 0x525451)
        else
            touchClick(513, 603, 0x0c0c0e)
        end
    end
    if isColor(129, 66, 0xf5a801, 95) and isColor(146, 170, 0x30e5ff, 95) and isColor(159, 366, 0xac6c27, 95) then
        debug("研究")
        if isColor(858, 498, 0x1c6eba, 95) then -- 可研究
            -- if nowTime - timeYanJiu >= 60 then
            touchClick(858, 498, 0x1c6eba) -- 研究
            --     timeYanJiu = nowTime
            -- else
            --     debug("时间不到")
            --     touchClick(514, 597, 0x405b7c) -- 关闭
            -- end
        elseif isColor(806, 529, 0x1cb587, 95) then -- 可加速
            debug("可加速")
            touchClick(806, 529, 0x1cb587) -- 加速
            timeYanJiu = nowTime - 60 -- 研究
        elseif isColor(963, 428, 0xff8f00, 95) then
            debug("研究--需要粒子--放弃")
            touchClick(512, 598, 0x0c0c0e)
            mSleep(1000)
            numYanJiu()
        elseif isColor(543, 207, 0x3e8fee, 95) or isColor(995, 181, 0x1d426f, 95) then -- 缺少条件1
            -- touchClick(543, 207)
            debug("缺少条件1")
            touchClick(512, 598, 0x0c0c0e)
            mSleep(1000)
            numYanJiu()
        elseif isColor(543, 242, 0x3e8fee, 95) then -- 缺少条件2
            -- touchClick(543, 242)
            debug("缺少条件2")
            touchClick(512, 598, 0x0c0c0e)
            mSleep(1000)
            numYanJiu()
        elseif isColor(543, 251, 0x3e8fee, 95) then -- 缺少条件3
            -- touchClick(543, 251)
            debug("缺少条件3")
            touchClick(512, 598, 0x0c0c0e)
            mSleep(1000)
            numYanJiu()
        elseif isColor(691, 351, 0xff9900, 95) then -- 已完成
            debug("已完成")
            touchClick(512, 598, 0x0c0c0e)
            mSleep(1000)
            numYanJiu()
        else
            debug("研究--啥也不是--关闭")
            touchClick(512, 598, 0x0c0c0e)
        end
    end
    if isColor(679, 457, 0xd78b00, 95) and isColor(912, 177, 0x1c6eba, 95) and isColor(562, 198, 0x68defb, 95) then
        debug("招募公告")
        touchClick(679, 457, 0xd78b00)

    end
    if isColor(370, 469, 0x1c6db9, 95) and isColor(660, 477, 0xd78b00, 95) and isColor(368, 213, 0xabf4f7, 95) then
        debug("立即捐款")
        touchClick(370, 469, 0x1c6db9)
    end
    if isColor(380, 420, 0x1c6dba, 95) and isColor(651, 420, 0xd78b00, 95) and isColor(282, 175, 0xff6600, 95) and
        isColor(613, 409, 0x6b4500, 95) then
        debug("捐完了")
        touchClick(380, 420, 0x1c6dba) -- 取消
        touchClick(512, 541, 0x0c0c0e) -- 关闭
        touchClick(511, 528, 0x0c0c0e) -- 关闭
        touchClick(510, 602, 0x0c0c0e) -- 关闭
    end

    if isColor(69, 23, 0xff6600, 95) and isColor(92, 37, 0xb4c0ce, 95) and isColor(173, 44, 0x9eabbb, 95) then
        -- debug("基地现况界面--综合函数")
        if isColor(814, 458, 0x9e1111, 95) then
            debug("资源--免费兑换--红点")
            numBuyTaiByCoin = 0
            writeJson("金币买钛", numBuyTaiByCoin)
            touchClick(752, 488, 0x82a0c1)
        elseif isColor(557, 459, 0x9e1111, 95) then
            debug("签到奖励--红点")
            touchClick(519, 496, 0x306090)
        elseif isColor(686, 458, 0x9e1111, 95) then
            debug("补给太空船--红点")
            touchClick(624, 495, 0x306090)
        elseif isColor(1008, 179, 0x0f161f, 95) and haoLV <= 2 then
            debug("研究所可建")
            touchClick(1008, 179)
            gaiMuBiaoNew(1, mb_YouHua, mm_YouHua)
            gaiMuBiaoNew(2, mb_Wu, mm_Wu)
            gaiMuBiaoNew(3, mb_Wu, mm_Wu)
        elseif isColor(1049, 364, 0x9e1111, 95) then
            debug("维修站--红点")
            touchClick(954, 398, 0x306090)
        elseif isColor(466, 175, 0x8a4c17, 95) then
            debug("攻击舰-完毕")
            touchClick(466, 175)
        elseif isColor(685, 174, 0x8a4c17, 95) then
            debug("高速舰-完毕")
            touchClick(685, 175)
        elseif isColor(471, 253, 0x8a4c17, 95) then
            debug("运输舰-完毕")
            touchClick(471, 253)
        elseif isColor(681, 257, 0x8a4c17, 95) then
            debug("防御舰-完毕")
            touchClick(685, 257)
        elseif isColor(466, 175, 0x306090, 95) and isShengChan == true and check11 ~= "不生产" then
            debug("攻击舰-休息")
            touchClick(466, 175)
            isJiDiXianKuangIntoProduce = true
        elseif isColor(685, 174, 0x306090, 95) and isShengChan == true and check11 ~= "不生产" then
            debug("高速舰-休息")
            touchClick(685, 175)
            isJiDiXianKuangIntoProduce = true
        elseif isColor(471, 253, 0x306090, 95) and isShengChan == true and check11 ~= "不生产" then
            debug("运输舰-休息")
            touchClick(471, 253)
            isJiDiXianKuangIntoProduce = true
        elseif isColor(681, 257, 0x306090, 95) and isShengChan == true and check11 ~= "不生产" then
            debug("防御舰-休息")
            touchClick(685, 257)
            isJiDiXianKuangIntoProduce = true
            -- 474,257,0x8a4c17 完毕
            -- 518,175,0x306090 休息中
        elseif isColor(460, 175, 0x064f61, 95) and check15 == "生产加速" and numSpeedUp == 1 then
            debug("攻击舰-加速")
            touchClick(466, 175)
            numSpeedUp = numSpeedUp + 1
            writeJson("加速生产船型", numSpeedUp)
        elseif isColor(655, 174, 0x064f61, 95) and check15 == "生产加速" and numSpeedUp == 2 then
            debug("高速舰-加速")
            touchClick(685, 175)
            numSpeedUp = numSpeedUp + 1
            writeJson("加速生产船型", numSpeedUp)
        elseif isColor(469, 258, 0x064f61, 95) and check15 == "生产加速" and numSpeedUp == 3 then
            debug("运输舰-加速")
            touchClick(471, 253)
            numSpeedUp = numSpeedUp + 1
            writeJson("加速生产船型", numSpeedUp)
        elseif isColor(659, 255, 0x064f61, 95) and check15 == "生产加速" and numSpeedUp == 4 then
            debug("防御舰-加速")
            touchClick(685, 257)
            numSpeedUp = 1
            writeJson("加速生产船型", numSpeedUp)
        elseif muBiao == mb_ChuHang then
            debug("出航")
            touchClick(513, 611)
        elseif isColor(410, 490, 0x9d1111, 95) then
            debug("防卫工程--红点")
            touchClick(331, 537, 0x306090)
        elseif isColor(808, 314, 0x9d1111, 95) and isOverHelp == false then
            debug("联盟协助--红点")
            touchClick(758, 362, 0x0c2037)
        elseif isColor(558, 321, 0x9e1111, 95) then
            debug("联盟研究--红点")
            touchClick(510, 357, 0x0c2037)
        elseif isColor(686, 321, 0x9e1111, 95) and nowTime - timeLianMengRenWu >= 60 * 60 then
            debug("联盟任务--红点")
            touchClick(638, 366, 0x0c2037)
            if isColor(1020, 546, 0x744218, 95) then
                debug("联盟任务不能做")
                timeLianMengRenWu = nowTime
                timeJiDi = nowTime
            end
        elseif isColor(224, 511, 0x183453, 95) and isChongDianKaZiYuan == false then
            debug("防卫工程,电不满")
            touchClick(347, 538, 0x306090)
        elseif isColor(993, 542, 0x306090, 95) then
            debug("加工站")
            touchClick(993, 542)
        elseif isColor(996, 177, 0x306090, 95) and isYanJiu == true and check14 == "研究" then
            debug("技术研究--休息中")
            touchClick(996, 177)
            gaiMuBiaoNew(3, "研究")
        elseif muBiao1 == mb_WaKuang then

        else
            touchClick(20, 20)
        end
    end
    if isColor(553, 205, 0x345214, 90) and isColor(581, 188, 0x2a72ba, 90) then
        debug("个人活动--点数奖励")
        touchClick(512, 577, 0x0c0c0e)
    end
    if isColor(274, 160, 0xcda099, 95) and isColor(292, 81, 0x9badde, 95) and isColor(366, 330, 0x78551a, 95) then
        debug("签到奖励")
        x, y = findColorInRegionFuzzy(0x145e99, 100, 857, 133, 857, 539);
        if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            touchClick(x, y)
        else
            touchClick(508, 609)
        end
    end
    if isColor(141, 75, 0x406898, 95) and isColor(170, 67, 0xff6600, 95) and isColor(738, 504, 0xd78b01, 95) then
        debug("推荐礼包--广告")
        touchClick(471, 590)
        touchClick(907, 590)
    end
    if isColor(366, 363, 0x423113, 95) and isColor(672, 365, 0x453313, 95) and isColor(472, 527, 0xd88b00, 95) then
        debug("推荐礼包--广告2")
        touchClick(471, 590)
        touchClick(907, 590)
    end
    if isColor(110, 63, 0xff6600, 95) and isColor(449, 500, 0x8f4d14, 95) and isColor(1055, 557, 0x406898, 95) then
        debug("推荐礼包--广告3")
        touchClick(471, 590)
        touchClick(907, 590)
    end
    if isColor(98, 288, 0xffffff, 95) and isColor(1036, 286, 0xffffff, 95) and isColor(493, 522, 0xd78b00, 95) and
        isColor(897, 587, 0x425f82, 95) then
        debug("广告画廊")
        touchClick(471, 590)
        touchClick(907, 590)
    end
    if isColor(7, 23, 0xff9c00, 95) and isColor(17, 23, 0xffffff, 95) and isColor(73, 15, 0xe2e8ef, 95) and
        isColor(161, 29, 0xe1e7ed, 95) then
        debug("活动中心")
        x, y = findMultiColorInRegionFuzzy(0x9d1111, "-1|0|0xf29203", 90, 134, 120, 135, 603)
        if x ~= -1 then
            huoDongDetail()
        else
            x, y = findColorInRegionFuzzy(0x931012, 95, 135, 75, 135, 612)
            if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
                touchClick(78, y + 19)
            else
                touchMoveXY(79, 573, 79, 190)
                mSleep(1000)
                x1, y1 = findColorInRegionFuzzy(0x931012, 95, 135, 75, 135, 612)
                if x1 ~= -1 and y1 ~= -1 then -- 如果在指定区域找到某点符合条件
                    touchClick(78, y1 + 19)
                else
                    touchClick(20, 20)
                end
            end
        end
    end
    if isColor(207, 23, 0xff6600, 95) and isColor(221, 105, 0x34618e, 95) and isColor(612, 24, 0xff6600, 95) then
        debug("每日报告1")
        touchClick(510, 609)
    end
    if isColor(207, 23, 0xff6600, 95) and isColor(221, 105, 0x356290, 95) and isColor(618, 24, 0xff6600, 95) then
        debug("每日报告2")
        touchClick(510, 609)
    end
    if isColor(17, 25, 0xffffff, 95) and isColor(6, 25, 0xff9c00, 95) and isColor(73, 17, 0xe2e8ef, 95) and
        isColor(159, 24, 0x97a9be, 95) then
        debug("奖励中心")
        if isColor(253, 219, 0xf90703, 95) and isColor(281, 314, 0xd6a691, 95) then
            debug("司令官界面")
            if isColor(1001, 197, 0xf18e07, 95) then
                debug("领取")
                touchClick(1001, 197)
            elseif isColor(321, 549, 0x4157b0, 90) then
                debug("40")
                touchClick(463 - 141, 549, 0x465bb2)
            elseif isColor(464, 548, 0xf0ffff, 90) then
                debug("80")
                touchClick(463, 549, 0x465bb2)
            elseif isColor(605, 548, 0xcfffff, 90) then
                debug("120")
                touchClick(605, 550)
            elseif isColor(745, 550, 0xe2ffff, 90) then
                debug("160")
                touchClick(745, 550)
                -- elseif isColorPlus(455 + 141 * 3, 564, 0xffd973, 95) then
                --     debug("200")
                --     touchClick(463 + 141 * 3, 549, 0x465bb2)
            elseif isColor(714, 95, 0x9e1111, 95) then
                debug("新任司令官--红点")
                touchClick(714, 95)
            elseif isColor(905, 94, 0x9e1111, 95) then
                debug("成长基地--红点")
                touchClick(905, 94)
            elseif isColor(1095, 94, 0x9e1111, 95) then
                debug("内政强化")
                touchClick(1095, 94)
            elseif isColor(396, 154, 0x9e1111, 95) then
                debug("第1天")
                touchClick(428, 177)
            elseif isColor(437, 221, 0x9e1111, 95) then
                debug("第2天")
                touchClick(476, 248)
            elseif isColor(437, 358, 0x9e1111, 95) then
                debug("第4天")
                touchClick(471, 381)
            elseif isColor(396, 427, 0x9e1111, 95) then
                debug("第5天")
                touchClick(429, 454, 0xf0dfd3)
            else
                touchClick(20, 20)
            end
        elseif isColor(137, 103, 0x9e1111, 95) and isColor(117, 103, 0xa17316, 95) then
            debug("签到奖励--红点--已选")
            x, y = findColorInRegionFuzzy(0x145e99, 100, 972, 145, 972, 587);
            if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
                touchClick(x, y)
            else
                touchClick(20, 20)
            end
        elseif isColor(136, 173, 0x9e1111, 95) and isColor(116, 173, 0xa17316, 95) then
            debug("欢迎礼物--红点--已选")
            if isColor(934, 561, 0x116eb9, 95) then
                debug("第7天")
                touchClick(934, 561, 0x116eb9)
            end
            x, y = findColorInRegionFuzzy(0x116eb9, 100, 196, 338, 664, 602)
            if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
                touchClick(x, y)
            else
                touchClick(20, 20)
            end

            -- elseif isColorPlus(138, 380, 0x9e1111, 95) and isColorPlus(114, 380, 0xa17316, 95) then
            --     debug("司令官任务--红点--已选")
            --     if isColorPlus(1001, 197, 0xf18e07, 95) then
            --         debug("领取")
            --         touchClick(1001, 197)
            --     elseif isColorPlus(714, 95, 0x9e1111, 95) then
            --         debug("新任司令官--红点")
            --         touchClick(714, 95)
            --     elseif isColorPlus(905, 94, 0x9e1111, 95) then
            --         debug("成长基地--红点")
            --         touchClick(905, 94)
            --     elseif isColorPlus(1095, 94, 0x9e1111, 95) then
            --         debug("内政强化")
            --         touchClick(1095, 94)
            --     elseif isColorPlus(396, 154, 0x9e1111, 95) then
            --         debug("第1天")
            --         touchClick(428, 177)
            --     elseif isColorPlus(437, 221, 0x9e1111, 95) then
            --         debug("第2天")
            --         touchClick(476, 248)
            --     elseif isColorPlus(437, 358, 0x9e1111, 95) then
            --         debug("第4天")
            --         touchClick(471, 381)
            --     else
            --         touchClick(20, 20)
            --     end
        elseif isColor(137, 103, 0x9e1111, 95) and isColor(122, 107, 0x1b2a3d, 95) then
            debug("签到奖励--红点--未选")
            touchClick(137, 104)
        elseif isColor(137, 172, 0x9e1111, 95) and isColor(127, 189, 0x192738, 95) then
            debug("欢迎礼物--红点--未选")
            touchClick(137, 172)
        elseif isColor(137, 311, 0x9e1111, 95) and isColor(122, 311, 0x1b2b3f, 95) then
            debug("航母活动--红点--未选")
            touchClick(137, 311)
        elseif isColor(137, 380, 0x9e1111, 95) and isColor(124, 380, 0x1b2b3f, 95) then
            debug("司令官任务--红点--未选")
            touchClick(137, 380)
        elseif isColor(137, 311, 0x9e1111, 95) and isColor(114, 311, 0xa17316, 95) then
            debug("航母活动--红点--已选")
            -- x, y = findColorInRegionFuzzy(0x116eb9, 100, 202, 349, 663, 599)
            -- if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            --     touchClick(x, y)
            -- else
            --     touchClick(20, 20)
            -- end
            touchClick(20, 20)
            timeRed = nowTime
        elseif isColor(396, 339, 0x1b7b55, 95) and isColor(247, 400, 0x7d8a96, 95) then
            debug("航母活动--向上移位置了--红点--已选")
            -- x, y = findColorInRegionFuzzy(0x116eb9, 100, 202, 349, 663, 599)
            -- if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某点符合条件
            --     touchClick(x, y)
            -- else
            --     touchClick(20, 20)
            -- end
            touchClick(20, 20)
            timeRed = nowTime
        else
            x, y = findMultiColorInRegionFuzzy(0x9d1111, "-1|0|0x1a293c", 90, 128, 95, 131, 590)
            if x ~= -1 then
                touchClick(x, y)
            else
                touchClick(20, 20)
            end
        end
    end
    if isColor(312, 76, 0xf5a802, 95) and isColor(308, 98, 0x0b4992, 95) and isColor(457, 438, 0xf27c00, 95) and
        isColor(511, 504, 0x1c6db9, 95) then
        debug("道具信息--复数--使用")
        if muBiao == mb_5DaoJu then
            touchClick(458, 438, 0xf27c00) -- 1个 
            touchClick(511, 504)
            if num5DaoJu >= 5 then
                gaiMuBiaoNew(2, "道具合成")
            end
        else
            if isColor(571, 191, 0x9fa0a0, 95) then -- 灰色全用
                touchClick(511, 504)
            else -- 其它用一半
                touchClick(570, 435)
                touchClick(511, 504)
                mSleep(2000)
            end
        end
    end
    if isColor(312, 116, 0xf5a801, 95) and isColor(307, 127, 0xe0e0e0, 95) and isColor(486, 436, 0x114c8a, 95) and
        isColor(490, 455, 0x1c6ebb, 95) then
        debug("道具信息--单数--使用")
        touchClick(490, 455, 0x1c6ebb)
        if muBiao == mb_5DaoJu then
            if num5DaoJu >= 5 then
                gaiMuBiaoNew(2, "道具合成")
            end
        end
    end
    if isColor(89, 59, 0xf8a901, 95) and isColor(192, 250, 0x2d4b69, 95) and isColor(300, 421, 0x8f4d14, 95) then
        debug("补充资源")
        if isColor(1028, 113, 0xffffff, 95) then
            debug("资源充足")
            touchClick(20, 20)
            -- elseif isColor(1028, 113, 0x081b33, 95) then
        else
            debug("资源不足")
            -- ret = dmOcrText(dm_white, 836, 81, 1029, 93, "D8DADC,272523", 80)
            -- debug(ret)
            -- lua_exit();
            -- mSleep(10)
            -- mSleep(10)
            -- -- lua 的机制是调用此函数之后的下一行结束，如果不希望出现此情况可以在调用函数之后加入一行无意义代码
            -- mSleep(10)
            if isColor(313, 437, 0xd78b02, 95) then
                touchClick(313, 437)
            elseif isColor(512, 437, 0xd78b02, 95) then
                touchClick(512, 437)
            elseif isColor(702, 437, 0xd68b02, 95) then
                touchClick(702, 437)
            elseif isColor(890, 437, 0xd78b02, 95) then
                touchClick(890, 437)
            else
                touchClick(511, 603, 0x0c0c0e)
                mSleep(1000)
                getOut()
                if muBiao == mb_YouHua then
                    isKaYouHua = true
                    writeJson("卡优化", isKaYouHua)
                    gaiMuBiaoNew(1, mb_ZhuXian, mm_ZhuXian)
                elseif muBiao == mb_ZhuXian then
                    if haoLV <= 2 and isOverLesson == false and numLv >= 6 then
                        gaiMuBiaoNew(1, "章节")
                    else
                        gaiMuBiaoNew(1, mb_WaKuang, mm_WaKuang)
                    end
                    timeRound = nowTime
                elseif muBiao == mb_WaKuang then
                    isShengChan = false
                    timeShengChan = nowTime
                end
            end
            -- touchClick(313, 420)
            -- if isColor(484, 432, 0x1c6eba, 95) then
            --     debug("金币不足")
            --     touchClick(513, 493, 0x566d7c)
            --     touchClick(20, 20)
            --     getOut()
            --     if muBiao == mb_YouHua then
            --         isKaYouHua = true
            --         writeJson("卡优化", isKaYouHua)
            --         gaiMuBiaoNew(1, mb_ZhuXian, mm_ZhuXian)
            --     elseif muBiao == mb_ZhuXian then
            --         if haoLV <= 2 and isOverLesson == false and numLv >= 6 then
            --             gaiMuBiaoNew(1, "章节")
            --         else
            --             gaiMuBiaoNew(1, mb_WaKuang, mm_WaKuang)
            --         end
            --         timeRound = nowTime
            --     elseif muBiao == mb_WaKuang then
            --         isShengChan = false
            --         timeShengChan = nowTime
            --     end
            -- end

        end
    end

    if isColor(5, 25, 0xff6600, 95) and isColor(17, 25, 0xffffff, 95) and isColor(467, 518, 0x448db2, 95) then
        debug("舰长")
        if isColor(137, 102, 0x9e1111, 95) then
            debug("舰长--升级--左上角--红点--内")
            if isColor(1022, 547, 0x9e1111, 95) then
                debug("舰长--升级--右下角--红点--内")
                touchClick(1022, 547)
            elseif isColor(1023, 254, 0x116eb9, 95) then
                debug("舰长--使用")
                local maxKaJianZhangJingYan = 0
                if isColor(1019, 464, 0x116eb9, 95) then
                    maxKaJianZhangJingYan = 3
                elseif isColor(1022, 357, 0x116eb9, 95) then
                    maxKaJianZhangJingYan = 2
                elseif isColor(1021, 256, 0x116eb9, 95) then
                    maxKaJianZhangJingYan = 1
                end
                if isKaJianZhangJingYan > maxKaJianZhangJingYan then
                    isKaJianZhangJingYan = maxKaJianZhangJingYan
                end
                if isColor(819, 459, 0x00ace4, 95) and isKaJianZhangJingYan == 3 then
                    debug("3满")
                    touchClick(860, 465)
                    if isColor(494, 426, 0x1c6dba, 95) then -- 超过上限
                        isKaJianZhangJingYan = 2
                        touchClick(510, 494, 0x0c0c0e)
                    end
                elseif isColor(1020, 461, 0x116eb9, 95) and isKaJianZhangJingYan == 3 then
                    touchClick(1020, 461)
                    if isColor(494, 426, 0x1c6dba, 95) then -- 超过上限
                        isKaJianZhangJingYan = 2
                        touchClick(510, 494, 0x0c0c0e)
                    end
                elseif isColor(819, 357, 0x00ace4, 95) and isKaJianZhangJingYan == 2 then
                    debug("2满")
                    touchClick(860, 357)
                    if isColor(494, 426, 0x1c6dba, 95) then -- 超过上限
                        isKaJianZhangJingYan = 1
                        touchClick(510, 494, 0x0c0c0e)
                    end
                elseif isColor(1020, 359, 0x116eb9, 95) and isKaJianZhangJingYan == 2 then
                    touchClick(1020, 359)
                    if isColor(494, 426, 0x1c6dba, 95) then -- 超过上限
                        isKaJianZhangJingYan = 1
                        touchClick(510, 494, 0x0c0c0e)
                    end
                elseif isColor(819, 239, 0x00ace4, 95) and isKaJianZhangJingYan == 1 then
                    debug("1满")
                    touchClick(860, 261)
                    if isColor(494, 426, 0x1c6dba, 95) then -- 超过上限
                        touchClick(514, 419, 0x1c6dba)
                    end
                else
                    touchClick(1022, 254)
                    if isColor(494, 426, 0x1c6dba, 95) then -- 超过上限
                        touchClick(514, 419, 0x1c6dba)
                    end
                end
            else
                isKaJianZhangJingYan = 3
                touchClick(20, 20)
            end
        elseif isColor(135, 167, 0x9e1111, 95) then
            debug("舰长--提升星级--红点")
            touchClick(99, 179, 0x9b6f15)
            if isColor(823, 572, 0xd88b00, 95) then
                touchClick(823, 572)
            else

                touchClick(20, 20)
            end

        else
            touchClick(20, 20)
        end
    end
    if isColor(7, 24, 0xff9c00, 95) and isColor(626, 62, 0x005c8b, 95) and isColor(712, 387, 0x5798dc, 95) then
        debug("舰长列表")
        local bMultiColor = false
        for i = 0, 5, 1 do
            if zongHe_Mult() == true then
                bMultiColor = true
            end
            mSleep(100)
        end
        if bMultiColor == false then
            if isColor(1123, 95, 0x9e1111, 95) then
                debug("舰长--升级--红点--外") -- 暂时不升
                if isKaZhuXianJianZhang == true then
                    touchClick(1077, 116)
                    isKaZhuXianJianZhang = false
                else
                    getOut()
                end
            elseif isColor(1123, 95, 0xf18e07, 95) then
                debug("舰长--获得")
                touchClick(1123, 95, 0xf18e071123, 95, 0xf18e07)
            else
                if isKaZhuXianJianZhang == true then
                    touchClick(634, 554, 0x131215) -- 旗舰
                    isKaZhuXianJianZhang = false
                else
                    getOut()
                end
            end
        end
    end
    if isColor(250, 135, 0xf5a801, 95) and isColor(247, 148, 0xe0e0e0, 95) and isColor(896, 504, 0x647e8f, 95) then
        debug("主专长")
        touchClick(512, 572)
    end
    if isColor(307, 126, 0xe0e0e0, 95) and isColor(312, 116, 0xf5a801, 95) and isColor(514, 457, 0x1c6db9, 95) and
        isColor(583, 291, 0x22d5c9, 95) then
        debug("租用无人机8小时")
        touchClick(514, 457)
    end
    if isColor(8, 24, 0xff9c00, 95) and isColor(63, 333, 0xffffff, 95) and isColor(323, 447, 0x0078fe, 95) then
        debug("联盟界面")
        if check7 == "联盟任务" then
            debug("选中联盟任务")
            if isColor(781, 94, 0x931012, 95) then -- 1
                touchClick(735, 154)
            elseif isColor(937, 94, 0x931012, 95) then -- 2
                touchClick(893, 156)
            elseif isColor(1094, 94, 0x931012, 95) then -- 3
                touchClick(1052, 156)
                -- elseif isColorPlus(781, 265, 0x931012, 95) then -- 4
                --     touchClick(727, 323)
            elseif isColor(937, 265, 0x931012, 95) then -- 5
                touchClick(883, 327)
            elseif isColor(1094, 265, 0x931012, 95) then -- 6
                touchClick(1057, 327)
            elseif isColor(781, 438, 0x931012, 95) then -- 7
                touchClick(714, 496)
            elseif isColor(937, 438, 0x931012, 95) then -- 8
                touchClick(900, 498)
            elseif isColor(1094, 438, 0x931012, 95) then -- 9
                touchClick(1057, 499)
            else
                touchClick(20, 20)

            end
        else
            touchClick(20, 20)
        end
    end

    if isColor(450, 467, 0xd68b01, 95) and isColor(687, 477, 0x1d6ebb, 95) and isColor(339, 117, 0xff6600, 95) then
        debug("请手动加入联盟")
        --     -- fwCloseView("window1", "btn1"); -- 关闭文字视图
        --     -- fwShowButton("window1", "btn2", "off", "FFFFFF", "8a4c17", "", 12, 0, 0, 50, 30);
        --     -- mSleep(500)
        --     isLuaStart = false
        --     dialog("请手动加入联盟", 0);
        --     -- lua_exit();
        --     -- mSleep(10)
        --     -- mSleep(10)
        --     -- -- lua 的机制是调用此函数之后的下一行结束，如果不希望出现此情况可以在调用函数之后加入一行无意义代码
        --     -- mSleep(10)
        touchClick(512, 567, 0x0c0c0e)
    end
    if isColor(17, 24, 0xffffff, 95) and isColor(4, 24, 0xff9c00, 95) and isColor(48, 208, 0x9d96a8, 95) then
        debug("平台界面")
        if haoLV == 3 then
            touchClick(20, 20)
            return
        end
        local bMultiColor = false
        for i = 0, 5, 1 do
            if zongHe_Mult() == true then
                bMultiColor = true
            end
            mSleep(100)
        end
        if bMultiColor == false then
            if isColor(29, 252, 0xffffff, 95) and isColor(36, 252, 0x8a8a8f, 95) then
                debug("金属平台为0")
                touchClick(36, 252)
                mSleep(1000)
                touchClick(317, 596)
            elseif muBiao == mb_ZhuXian and isColor(53, 337, 0x47702b, 95) then
                debug("三氯气--有了")
                touchClick(20, 20)
                mSleep(1000)
                touchClick(346, 422, 0x47c4dd) -- 第三个平台--点击建造
                RGB_NoticeBJ = "FFFF00"
                RGB_NoticeFont = "FF0000"
                strNotice = "平台"
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", strNotice, RGB_NoticeFont, RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
                mSleep(500)
            else
                touchClick(20, 20)
            end
        else
            if muBiao == mb_ZhuXian and isColor(53, 337, 0x47702b, 95) then
                debug("三氯气--有了")
                touchClick(20, 20)
                mSleep(1000)
                touchClick(346, 422, 0x47c4dd) -- 第三个平台--点击建造
                RGB_NoticeBJ = "FFFF00"
                RGB_NoticeFont = "FF0000"
                strNotice = "平台"
                fwCloseView("window1", "more"); -- 关闭文字视图
                fwShowButton("window1", "more", strNotice, RGB_NoticeFont, RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
                mSleep(500)
            else
                touchClick(20, 20)
            end
        end
    end
    if isColor(288, 173, 0x0b4992, 95) and isColor(291, 161, 0xf5a801, 95) and isColor(491, 414, 0x45586c, 95) then
        debug("变更名称")
        touchClick(565, 272)
        mSleep(2000)
        inputText(randomString(8, 3))
        mSleep(2000)
        touchClick(960, 209)
        mSleep(2000)
        touchClick(571, 435)
        mSleep(1000)
    end
    if isColor(5, 25, 0xff9c00, 95) and isColor(104, 85, 0x30e3fe, 95) and isColor(618, 537, 0xbf7702, 95) then
        debug("传输室")
        if isColor(930, 141, 0xff6600, 95) then -- ad 0/1
            touchClick(903, 138, 0xff9900)
        elseif isColor(923, 571, 0xff0101, 95) == false then -- 有特殊传输
            touchClick(923, 571)
        elseif isColor(254, 571, 0xff9901, 95) then -- 有普通传输
            touchClick(452, 559)
        elseif isColor(205, 563, 0x07706c, 95) then -- 有免费传输
            touchClick(205, 563)
        else
            touchClick(20, 20)
            isJustBack = false
            numChuanShu = numChuanShu + 1
            writeJson("传输次数", numChuanShu)
        end

    end

    if isColor(1100, 35, 0x7c7c7c, 95) and isColor(611, 599, 0xcecece, 95) then
        debug("广告--关闭")
        touchClick(1100, 35)
    end
    if isColor(1088, 51, 0xffffff, 95) and isColor(1135, 639, 0xd8366a, 95) then
        debug("广告--关闭")
        touchClick(1088, 51)
    end
    if isColor(435, 30, 0x1b68c8, 95) and isColor(515, 53, 0xbbbec1, 95) and isColor(626, 75, 0xb6b8bb, 95) and
        isColor(510, 617, 0x0c0c0e, 95) then
        debug("传输结果")
        touchClick(510, 623)
    end
    if isColor(48, 74, 0xff4545, 95) and isColor(993, 595, 0xd77400, 95) and isColor(962, 579, 0x0780fe, 95) then
        debug("海盗界面")
        touchClick(993, 595)
        isKillPirate = false -- 杀海盗
        timeKillPirate = nowTime
    end
    if isColor(48, 74, 0xff4545, 95) and isColor(936, 558, 0x114c8a, 95) and isColor(942, 591, 0x1c6eba, 95) then
        debug("海盗--移动")
        touchClick(942, 591, 0x1c6eba)
    end
    if isColor(6, 24, 0xff9c00, 95) and isColor(76, 113, 0xaa3d3d, 95) and isColor(866, 594, 0xd68b02, 95) then
        debug("海盗--出航")
        if isColor(813, 65, 0xfbfbfb, 95) or isColor(810, 66, 0xff9999, 95) or isColor(793, 63, 0xc80305, 95) then -- 不利
            touchClick(20, 20)
            if haoLV <= 2 and muBiao == "主线" and numLv >= 6 then
                gaiMuBiaoNew(1, "章节")
            end
        elseif isColor(242, 150, 0xffffff, 95) or isColor(226, 149, 0xffffff, 95) then
            debug("无人物")
            touchClick(20, 20)
        else
            touchClick(866, 594)
            isKillPirate = false -- 杀海盗
            timeKillPirate = nowTime
        end
    end
    if isColor(282, 64, 0xff6600, 95) and isColor(476, 383, 0x116eb9, 95) and isColor(475, 539, 0xf18e07, 95) then
        debug("领取奖励")
        touchClick(476, 383)
    end
    if isColor(282, 64, 0xff6600, 95) and isColor(503, 386, 0x124067, 95) and isColor(475, 539, 0xf18e07, 95) then
        debug("领取奖励--未到时")
        touchClick(20, 20)
    end
    if isColor(16, 24, 0xffffff, 95) and isColor(4, 24, 0xff9c00, 95) and isColor(56, 217, 0x5dfe09, 95) then
        debug("建设界面")
        if isColor(46, 57, 0xffb500, 95) == false then -- 无黄色条
            touchClick(20, 20)
            return
        end
        local bMultiColor = false;
        for i = 0, 3, 1 do
            if zongHe_Mult() == true then
                bMultiColor = true
            end
            mSleep(100)
        end
        if isColor(57, 216, 0x64ff15, 95) and isColor(53, 190, 0xffffff, 95) then
            debug("升级界面")
            if haoLV <= 2 and ((isColor(63, 548, 0x31bcd8, 95) and isColor(42, 440, 0xa82400, 95)) or
                (isColor(64, 545 - 107, 0x40d1e8, 95) and isColor(53, 571 - 107, 0x5daa9f, 95))) then
                debug("指挥中心")
                -- x, y = findMultiColorInRegionFuzzy(0x32bed9, "-21|-108|0xb72700", 90, 749, 126, 772, 145)
                local numStr = ocrText(749, 126, 772, 145, 0, "012346789")
                if tonumber(numStr) >= 0 then
                    numLv = tonumber(numStr) - 1
                    writeJson("指挥中心等级", numLv)
                    toast(numLv)
                end
            end
            if haoLV >= 3 and isTrade == false and isColor(42, 331, 0xd769c2, 95) then
                debug("点击交易所")
                touchClick(42, 331)
                return
            elseif haoLV >= 3 and isCheckLiZiNum == false and isColor(42, 331, 0xd769c2, 95) then
                debug("交易所--点击兑换")
                touchClick(51, 434)
                isCheckLiZiNum = true
                return
            elseif haoLV >= 3 and numAddChanLiang <= 2 and isColor(32, 336, 0x00fc21, 95) then
                debug("点击增产")
                touchClick(42, 331)
                return
            elseif haoLV >= 3 and isAddChanLiangLiZi == false and isColor(32, 336, 0x00fc21, 95) and check16 == "vip8" then
                debug("点击粒子增产")
                touchClick(42, 331)
                return
            end
            if isKaShengChan == true then
                touchClick(45, 338, 0x28242b) -- 生产战舰
                return
            end
            if bMultiColor == false then
                -- if (m_pOp->isColorPlus(365, 504, 0x1c6dbb, 0.95))//可升级
                if isShipBad == true and isColor(41, 343, 0x938d99, 95) and isColor(38, 190, 0xffffff, 95) then
                    debug("航母开发室--升级")
                    touchClick(45, 336, 0x6f6979)
                elseif isColor(91, 625, 0xf27d12, 95) then
                    debug("正在生产战舰")
                    isShengChan = false
                    timeShengChan = nowTime
                    touchClick(48, 339, 0x060c27) -- 生产
                    isJiaSuProduce = true
                elseif isColor(431, 589, 0x1c6eba, 95) then
                    debug("可升级")
                    numShengJiCengShu = 0
                    if haoLV <= 2 then
                        if isColor(246, 604, 0xfddb81, 95) and isColor(269, 612, 0xfad275, 95) then
                            debug("免费")
                            touchClick(246, 604)
                        else
                            debug("花钱升级")
                            touchClick(442, 592)
                        end
                    else
                        getOut()
                    end
                elseif isColor(246, 604, 0xfddb81, 95) and isColor(270, 612, 0xf5c566, 95) then
                    numShengJiCengShu = 0
                    if haoLV <= 2 then
                        debug("免费")
                        touchClick(246, 604)
                    else
                        getOut()
                    end
                elseif isColor(421, 598, 0x1eb686, 95) then
                    numShengJiCengShu = 0
                    debug("建设--加速")
                    touchClick(421, 598)
                    if muBiao ~= mb_YouHua then
                        isAutoNext = false
                    end
                elseif isColor(652, 403, 0x3e8fee, 95) and (isAutoNext == true or nowTime - timeShengJiTongXingZheng >= 10) then
                    debug("2蓝")
                    if haoLV <= 2 then
                        checkShengJiCengShu()
                        touchClick(843, 390)
                    else
                        getOut()
                    end
                elseif isColor(1104, 390, 0x1a406b, 95) and (isAutoNext == true or nowTime - timeShengJiTongXingZheng >= 10) then
                    debug("2蓝")
                    if haoLV <= 2 then
                        checkShengJiCengShu()
                        touchClick(843, 390)
                    else
                        getOut()
                    end
                elseif isColor(652, 368, 0x3e8fee, 95) and (isAutoNext == true or nowTime - timeShengJiTongXingZheng >= 10) then
                    debug("1蓝")
                    if haoLV <= 2 then
                        checkShengJiCengShu()
                        touchClick(1089, 356)
                    else
                        getOut()
                    end
                elseif isColor(1104, 356, 0x1a406b, 95) and (isAutoNext == true or nowTime - timeShengJiTongXingZheng >= 10) then
                    debug("1蓝")
                    if haoLV <= 2 then
                        checkShengJiCengShu()
                        touchClick(1089, 356)
                    else
                        getOut()
                    end
                else
                    getOut()
                end
            end
        elseif isColor(62, 341, 0x0ec0d2, 95) and isColor(60, 296, 0xffffff, 95) then
            debug("生产界面")
            if bMultiColor == false then
                if isColor(579, 617, 0x9f7249, 95) then
                    debug("T5 => T4")
                    touchClick(483, 603, 0x1e3248)
                    mSleep(1000)
                elseif isKaShengChan == true then
                    debug("T2")
                    touchClick(283, 596, 0x455b72)
                    mSleep(1000)
                    isKaShengChan = false
                end
                if isColor(1090, 527, 0x1d6eba, 95) then -- 可生产
                    if isColor(851, 357, 0x15273f, 95) and isColor(851, 411, 0x15273f, 95) and
                        isColor(1087, 357, 0x15273f, 95) and isColor(1087, 411, 0x15273f, 95) then
                        -- 不缺材料
                        debug("不缺材料")
                        touchClick(1090, 527)
                    else
                        -- 缺材料
                        debug("缺少材料")
                        if haoLV == 3 then -- 大号
                            isShengChan = false
                            timeShengChan = nowTime
                            getOut()
                        elseif haoLV == 2 then
                            touchClick(1090, 527)
                        elseif haoLV == 1 then -- 小号
                            touchClick(1090, 527)
                        end
                    end
                elseif isColor(913, 532, 0x15a567, 95) then
                    debug("可加速")
                    if haoLV == 1 then -- 小号加速
                        debug("小号加速")
                        touchClick(913, 532)
                    elseif isJiaSuProduce == true then -- 临时加速
                        debug("临时加速")
                        touchClick(913, 532)
                        isJiaSuProduce = false
                    elseif isJiDiXianKuangIntoProduce == true then
                        debug("正常进入,退出")
                        getOut()
                        isJiDiXianKuangIntoProduce = false
                    elseif isJiDiXianKuangIntoProduce == false then
                        debug("任务进入,加速")
                        touchClick(913, 532)
                    end
                elseif isColor(647, 548, 0xf27d12, 95) then
                    debug("升级中")
                    if haoLV == 3 then -- 大号
                        isShengChan = false
                        timeShengChan = nowTime
                        getOut()
                    elseif haoLV == 2 then -- 成品号
                        if muBiao ~= mb_YouHua then
                            isAutoNext = false
                            touchClick(47, 230, 0x7b4c2e) -- 升级
                        end
                    end

                else
                    getOut()

                end
            end
        elseif isColor(41, 296, 0xffffff, 95) and isColor(34, 321, 0xbf9721, 95) and isColor(111, 108, 0x4c87ba, 95) then
            debug("维修界面")
            if isColor(1077, 527, 0x1eb686, 95) and isColor(993, 574, 0x237bc8, 95) then -- 重置
                debug("可修理--不缺少资源")
                touchClick(984, 589, 0x1d6ebb)
            elseif isColor(988, 525, 0x15a976, 95) and isColor(989, 588, 0x1f2830, 95) then
                debug("可修理--缺少资源")
                isReceiveEmail = true
                touchClick(20, 20)
                touchClick(698, 586, 0xb4cdf3) -- 打开邮件
            else
                touchClick(20, 20)
            end
        elseif isColor(41, 296, 0xffffff, 95) and isColor(38, 320, 0xdeb748, 95) and isColor(341, 601, 0xd77500, 95) then
            debug("指挥中心--维修界面")
            if isColor(793, 584, 0x155daa, 95) then
                touchClick(793, 584)
            else
                touchClick(48, 233, 0x325240)
            end
        elseif isColor(57, 296, 0xffffff, 95) and isColor(44, 357, 0xffe75f, 95) and isColor(45, 322, 0x0e5dd7, 95) then
            debug("资源传输装置--兑换")
            timeXXX = nowTime
            if haoLV == 3 then
                local temStr = ocrText(477, 334, 601, 360, 0, "0123456789.KM")
                local temNum = 0
                local num1 = string.find(temStr, "K")
                local num2 = string.find(temStr, "M")
                if num1 ~= nil then
                    temStr = string.gsub(temStr, "K", "")
                    temNum = tonumber(temStr)
                    if temNum ~= nil then
                        temNum = temNum * 1000
                    end
                elseif num2 ~= nil then
                    temStr = string.gsub(temStr, "M", "")
                    temNum = tonumber(temStr)
                    if temNum ~= nil then
                        temNum = temNum * 1000 * 1000
                    end
                else
                    temNum = 1
                end
                if temNum ~= nil then
                    numTai = temNum
                    writeJson("钛", numTai)
                end
            end
            if isColor(971, 427, 0x116eb9, 95) then -- 资源4
                touchClick(971, 427)
                numZiYuanDuiHuan = numZiYuanDuiHuan + 1
                writeJson("资源传输装置兑换次数", numZiYuanDuiHuan)
            elseif isColor(971, 322, 0x116eb9, 95) then -- 资源3
                touchClick(971, 322)
                numZiYuanDuiHuan = numZiYuanDuiHuan + 1
                writeJson("资源传输装置兑换次数", numZiYuanDuiHuan)
            elseif check16 == "vip8" and numBuyTaiByCoin <= 15 and isColor(1002, 426, 0xf18e07, 95) then --金币购买
                touchClick(971, 427)
                if isColor(359, 431, 0x1c6dba, 95) and isColor(429, 427, 0xeff5fa, 95) then
                    debug("可免费兑换")
                    touchClick(452, 428, 0x2266ae) --使用
                    mSleep(1000)
                    if isColor(643, 515, 0x165da9, 95) then
                        touchClick(678, 437, 0x000000) --全部
                        touchClick(521, 490, 0x1c6dba) --使用
                    else
                        touchClick(642, 470, 0x145ca9)
                    end
                else
                    touchClick(687, 444, 0xd77501) -- 金币购买
                    numZiYuanDuiHuan = numZiYuanDuiHuan + 1
                    writeJson("资源传输装置兑换次数", numZiYuanDuiHuan)
                end
                numBuyTaiByCoin = numBuyTaiByCoin + 1
                writeJson("金币买钛", numBuyTaiByCoin)
            elseif numZiYuanDuiHuan <= 5 and haoLV <= 2 then
                touchClick(1000, 321, 0xf18e07)
                if isColor(359, 431, 0x1c6dba, 95) and isColor(429, 427, 0xeff5fa, 95) then
                    debug("可免费兑换")
                    touchClick(452, 428, 0x2266ae) --使用
                    mSleep(1000)
                    touchClick(678, 437, 0x000000) --全部
                    touchClick(521, 490, 0x1c6dba) --使用
                else
                    touchClick(687, 444, 0xd77501) -- 金币购买
                    numZiYuanDuiHuan = numZiYuanDuiHuan + 1
                    writeJson("资源传输装置兑换次数", numZiYuanDuiHuan)
                end
            else
                touchClick(20, 20)
            end
        elseif isColor(59, 331, 0x25f1ea, 95) and isColor(49, 296, 0xffffff, 95) then
            nowTime = os.time()
            timeXXX = nowTime
            if isColor(249, 162, 0xa9a9a9, 95) then
                debug("研究界面")
                if check14 == "研究" then
                    if isYanJiuZiYuan == true then
                        touchClick(249, 162, 0xa9a9a9)
                    elseif isYanJiuKaiFa == true then
                        touchClick(750, 162, 0xa9a9a9)
                    elseif isYanJiuFangYu == true then
                        touchClick(291, 302, 0x151722)
                    elseif isYanJiuShengChan == true then
                        touchClick(366, 444, 0x08121c)
                    elseif isYanJiuJingRui == true then
                        touchClick(784, 448, 0x1d9aaa)
                    elseif isYanJiuZhanJian == true then
                        touchClick(865, 288, 0x2d2f35)
                    else
                        isYanJiu = false
                        writeJson("研究", isYanJiu)
                    end
                else
                    if isYanJiuZiYuan == true then
                        touchClick(249, 162, 0xa9a9a9)
                        -- elseif isYanJiuKaiFa == true then
                        --     touchClick(750, 162, 0xa9a9a9)
                        -- elseif isYanJiuFangYu == true then
                        --     touchClick(291, 302, 0x151722)
                        -- elseif isYanJiuShengChan == true then
                        --     touchClick(366, 444, 0x08121c)
                        -- elseif isYanJiuJingRui == true then
                        --     touchClick(784, 448, 0x1d9aaa)
                        -- elseif isYanJiuZhanJian == true then
                        --     touchClick(865, 288, 0x2d2f35)
                    else
                        touchClick(20, 20)
                        -- isYanJiu = false
                        -- writeJson("研究", isYanJiu)
                    end
                end
            elseif isColor(129, 230, 0xb3b4b5, 95) then
                debug("研究界面--资源")
                if isYanJiuZiYuan == false then
                    touchClick(76, 607, 0x1eb685)
                    return
                end
                if isColor(187, 145, 0xffffff, 95) then -- 1
                    if numZiYuan <= 2 then
                        numZiYuan = 2
                    end
                end
                if isColor(187, 323, 0xffffff, 95) then -- 2
                    if numZiYuan <= 3 then
                        numZiYuan = 3
                    end
                end
                if isColor(411, 234, 0xffffff, 95) then -- 3
                    if numZiYuan <= 4 then
                        numZiYuan = 4
                    end
                end
                if isColor(634, 145, 0xffffff, 95) then -- 4
                    if numZiYuan <= 5 then
                        numZiYuan = 5
                    end
                end
                if isColor(634, 323, 0xffffff, 95) then -- 5
                    if numZiYuan <= 6 then
                        numZiYuan = 6
                    end
                end
                if isColor(858, 234, 0xffffff, 95) then -- 6
                    if numZiYuan <= 7 then
                        numZiYuan = 7
                    end
                end
                if isColor(1082, 234, 0xffffff, 95) then -- 7
                    isYanJiuZiYuan = false
                    writeJson("研究资源", isYanJiuZiYuan)
                    touchClick(75, 608, 0x1db687)
                    return
                end
                if numZiYuan == 1 then -- 1
                    touchClick(150, 176)
                elseif numZiYuan == 2 then -- 2
                    touchClick(187, 323)
                elseif numZiYuan == 3 then -- 3
                    touchClick(411, 234)
                elseif numZiYuan == 4 then -- 4
                    touchClick(634, 144)
                elseif numZiYuan == 5 then -- 5
                    touchClick(634, 323)
                elseif numZiYuan == 6 then -- 6
                    touchClick(858, 234)
                elseif numZiYuan == 7 then -- 7
                    touchClick(1082, 234)
                end
            elseif isColor(137, 328, 0xc2c3c4, 95) then
                debug("研究界面--开发")
                if isYanJiuKaiFa == false then
                    touchClick(76, 607, 0x1eb685)
                    return
                end
                if isColor(187, 234, 0xffffff, 95) then -- 1
                    if numKaiFa <= 2 then
                        numKaiFa = 2
                    end
                end
                if isColor(411, 145, 0xffffff, 95) then -- 2
                    if numKaiFa <= 3 then
                        numKaiFa = 3
                    end
                end
                if isColor(411, 323, 0xffffff, 95) then -- 3
                    if numKaiFa <= 4 then
                        numKaiFa = 4
                    end
                end
                if isColor(634, 234, 0xffffff, 95) then -- 4
                    if numKaiFa <= 5 then
                        numKaiFa = 5
                    end
                end
                if isColor(858, 145, 0xffffff, 95) then -- 5
                    if numKaiFa <= 6 then
                        numKaiFa = 6
                    end
                end
                if isColor(858, 323, 0xffffff, 95) then -- 6
                    if numKaiFa <= 7 then
                        numKaiFa = 7
                    end
                end
                if isColor(1082, 234, 0xffffff, 95) then -- 7
                    isYanJiuKaiFa = false
                    writeJson("研究开发", isYanJiuKaiFa)
                    touchClick(75, 608, 0x1db687)
                    return
                end
                if numKaiFa == 1 then -- 1
                    touchClick(187, 234)
                elseif numKaiFa == 2 then -- 2
                    touchClick(411, 145)
                elseif numKaiFa == 3 then -- 3
                    touchClick(411, 323)
                elseif numKaiFa == 4 then -- 4
                    touchClick(634, 234)
                elseif numKaiFa == 5 then -- 5
                    touchClick(858, 145)
                elseif numKaiFa == 6 then -- 6
                    touchClick(858, 323)
                elseif numKaiFa == 7 then -- 7
                    touchClick(1082, 234)
                end
            elseif isColor(129, 317, 0xdadbdb, 95) then
                debug("研究界面--战舰")
                if isYanJiuZhanJian == false then
                    touchClick(76, 607, 0x1eb685)
                    return
                end
                if numZhanJian == 1 then -- 1
                    touchClick(187, 278)
                elseif numZhanJian == 2 then -- 2
                    touchClick(388, 97)
                elseif numZhanJian == 3 then -- 3
                    touchClick(393, 448)
                elseif numZhanJian == 4 then -- 4
                    touchClick(611, 179)
                elseif numZhanJian == 5 then -- 5
                    touchClick(615, 361)
                elseif numZhanJian == 6 then -- 6
                    touchClick(837, 275)
                elseif numZhanJian == 7 then -- 7
                    touchClick(1058, 96)
                elseif numZhanJian == 8 then -- 8
                    touchClick(1056, 451)
                end
            elseif isColor(138, 328, 0x9a9b9d, 95) then
                debug("研究界面--精锐怪物")
                if isYanJiuJingRui == false then
                    touchClick(76, 607, 0x1eb685)
                    return
                end
                if numJingRui == 1 then -- 1
                    touchClick(187, 278)
                elseif numJingRui == 2 then -- 2
                    touchClick(388, 177)
                elseif numJingRui == 3 then -- 3
                    touchClick(393, 353)
                elseif numJingRui == 4 then -- 4
                    touchClick(611, 269)
                elseif numJingRui == 5 then -- 5
                    touchClick(834, 192)
                elseif numJingRui == 6 then -- 6
                    touchClick(839, 366)
                elseif numJingRui == 7 then -- 7
                    touchClick(1058, 278)
                end
            elseif isColor(128, 323, 0x9c9d9d, 95) then
                debug("研究界面--生产")
                if isYanJiuShengChan == false then
                    touchClick(76, 607, 0x1eb685)
                    return
                end
                if numShengChan == 1 then -- 1
                    touchClick(187, 278)
                elseif numShengChan == 2 then -- 2
                    touchClick(388, 97)
                elseif numShengChan == 3 then -- 3
                    touchClick(393, 448)
                elseif numShengChan == 4 then -- 4
                    touchClick(611, 179)
                elseif numShengChan == 5 then -- 5
                    touchClick(615, 361)
                elseif numShengChan == 6 then -- 6
                    touchClick(837, 275)
                elseif numShengChan == 7 then -- 7
                    touchClick(1058, 96)
                elseif numShengChan == 8 then -- 8
                    touchClick(1056, 451)
                end
            elseif isColor(123, 324, 0xc6c6c7, 95) then
                debug("研究界面--防御")
                if isYanJiuFangYu == false then
                    touchClick(76, 607, 0x1eb685)
                    return
                end
                if isColor(187, 234, 0xffffff, 95) then -- 1
                    if numFangYu <= 2 then
                        numFangYu = 2
                    end
                end
                if isColor(411, 145, 0xffffff, 95) then -- 2
                    if numFangYu <= 3 then
                        numFangYu = 3
                    end
                end
                if isColor(411, 323, 0xffffff, 95) then -- 3
                    if numFangYu <= 4 then
                        numFangYu = 4
                    end
                end
                if isColor(634, 145, 0xffffff, 95) then -- 4
                    if numFangYu <= 5 then
                        numFangYu = 5
                    end
                end
                if isColor(634, 323, 0xffffff, 95) then -- 5
                    if numFangYu <= 6 then
                        numFangYu = 6
                    end
                end
                if isColor(858, 56, 0xffffff, 95) then -- 6
                    if numFangYu <= 7 then
                        numFangYu = 7
                    end
                end
                if isColor(858, 234, 0xffffff, 95) then -- 7
                    if numFangYu <= 8 then
                        numFangYu = 8
                    end
                end
                if isColor(858, 411, 0xffffff, 95) then -- 8
                    if numFangYu <= 9 then
                        numFangYu = 9
                    end
                end
                if numFangYu == 1 then -- 1
                    touchClick(187, 234)
                elseif numFangYu == 2 then -- 2
                    touchClick(411, 145)
                elseif numFangYu == 3 then -- 3
                    touchClick(411, 323)
                elseif numFangYu == 4 then -- 4
                    touchClick(634, 145)
                elseif numFangYu == 5 then -- 5
                    touchClick(634, 323)
                elseif numFangYu == 6 then -- 6
                    touchClick(858, 56)
                elseif numFangYu == 7 then -- 7
                    touchClick(858, 234)
                elseif numFangYu == 8 then -- 8
                    touchClick(858, 411)
                elseif numFangYu == 9 then -- 9
                    touchClick(1051, 281)
                end
            elseif isColor(600, 157, 0x13669a, 95) and isColor(726, 286, 0x13669a, 95) and isColor(600, 403, 0x13669a, 95) then
                debug("研究--强制")
                touchClick(600, 262, 0xb8b9d4)
                if isColor(543, 207, 0x3e8fee, 95) or isColor(995, 181, 0x1d426f, 95) then -- 缺少条件1
                    debug("缺少条件1--继续")
                    touchClick(761, 192)
                    mSleep(1000)
                elseif isColor(543, 242, 0x3e8fee, 95) then -- 缺少条件2
                    debug("缺少条件2--继续")
                    touchClick(760, 227)
                    mSleep(1000)
                elseif isColor(543, 251, 0x3e8fee, 95) then -- 缺少条件3
                    debug("缺少条件3--继续")
                    touchClick(762, 260)
                    mSleep(1000)
                end
            else
                debug("啥都不是，关闭")
                touchClick(20, 20)
            end
        elseif isColor(49, 329, 0x767676, 95) and isColor(41, 296, 0xffffff, 95) then
            debug("充电界面")
            if isColor(287, 514, 0x1f2d46, 95) then
                touchClick(543, 597)
            else
                touchClick(20, 20)
            end
        elseif isColor(42, 331, 0xd769c2, 95) and isColor(48, 296, 0xffffff, 95) then
            debug("交易界面")
            if isColor(656, 483, 0x111111, 95) and isColor(785, 510, 0x0c0c0c, 95) then
                debug("LOCK")
                touchClick(38, 224, 0x81ff29)
                return
            end
            for i = 0, 1, 1 do
                for j = 0, 3, 1 do
                    if isColor(515 + j * 167, 342 + i * 238, 0x051788, 95) or
                        isColor(504 + j * 167, 353 + i * 238, 0x33323b, 95) then
                        touchClick(515 + j * 167, 342 + i * 238)

                        if isColor(549, 491, 0xd97700, 95) then
                            touchClick(549, 491)
                            mSleep(1000)
                        end
                        if isColor(554, 473, 0xd87500, 95) then
                            touchClick(554, 473)
                            mSleep(1000)
                        end
                        if isColor(550, 478, 0xd68b02, 95) then
                            touchClick(550, 478)
                            mSleep(1000)
                        end
                        if isColor(538, 455, 0xd78b01, 95) then
                            touchClick(538, 455)
                            mSleep(1000)
                        end
                        if isColor(534, 455, 0xd78b01, 95) then
                            touchClick(534, 455)
                            mSleep(1000)
                        end
                    elseif isColor(548 + j * 167, 251 + i * 238, 0x6c28d6, 95) and isBuyLiZi == true then -- 粒子
                        touchClick(515 + j * 167, 342 + i * 238)
                        mSleep(5000)
                        if isColor(549, 491, 0xd97700, 95) then
                            touchClick(549, 491)
                            mSleep(1000)
                        end
                        if isColor(554, 473, 0xd87500, 95) then
                            touchClick(554, 473)
                            mSleep(1000)
                        end
                        if isColor(550, 478, 0xd68b02, 95) then
                            touchClick(550, 478)
                            mSleep(1000)
                        end
                        if isColor(538, 455, 0xd78b01, 95) then
                            touchClick(538, 455)
                            mSleep(1000)
                        end
                        if isColor(534, 455, 0xd78b01, 95) then
                            touchClick(534, 455)
                            mSleep(1000)
                        end
                        if isColor(197, 300, 0xb87609, 95) then -- 金币不足
                            touchClick(20, 20)
                            mSleep(1000)
                            isBuyLiZi = false
                            return
                        end
                    elseif isColor(521 + j * 167, 243 + i * 238, 0x444f4d, 95) and isColor(515 + j * 167, 182 + i * 238, 0x359e1f, 95) and check16 == "vip8" and isBuyLiZi == true then --钛
                        touchClick(515 + j * 167, 342 + i * 238)
                        mSleep(5000)
                        if isColor(549, 491, 0xd97700, 95) then
                            touchClick(549, 491)
                            mSleep(1000)
                        end
                        if isColor(554, 473, 0xd87500, 95) then
                            touchClick(554, 473)
                            mSleep(1000)
                        end
                        if isColor(550, 478, 0xd68b02, 95) then
                            touchClick(550, 478)
                            mSleep(1000)
                        end
                        if isColor(538, 455, 0xd78b01, 95) then
                            touchClick(538, 455)
                            mSleep(1000)
                        end
                        if isColor(534, 455, 0xd78b01, 95) then
                            touchClick(534, 455)
                            mSleep(1000)
                        end
                        if isColor(197, 300, 0xb87609, 95) then -- 金币不足
                            touchClick(20, 20)
                            mSleep(1000)
                            isBuyLiZi = false
                            return
                        end
                    end

                end
            end
            if isColor(484, 101, 0x00ace4, 95) then -- 免费
                touchClick(484, 101, 0x00ace4)
            elseif isColor(16, 24, 0xffffff, 95) then
                touchClick(20, 20)
                isTrade = true
                writeJson("交易行", isTrade)
            end
        elseif isColor(30, 336, 0x043f05, 95) and isColor(41, 296, 0xffffff, 95) then
            debug("金属资源地界面--增产")
            if numAddChanLiang <= 2 then
                if isColor(811, 589, 0x89898c, 95) and isColor(826, 589, 0x89898c, 95) and isColor(833, 589, 0x89898c, 95) and isColor(848, 589, 0x89898c, 95) and isColor(1057, 353, 0xff0000, 95) == false then
                    touchClick(1057, 353, 0xff0000)
                    touchClick(20, 20)
                    numAddChanLiang = numAddChanLiang + 1
                    writeJson("增产", numAddChanLiang)
                    isJustBack = false
                else
                    touchClick(20, 20)
                    numAddChanLiang = numAddChanLiang + 1
                    writeJson("增产", numAddChanLiang)
                    isJustBack = false
                end
            elseif isAddChanLiangLiZi == false and check16 == "vip8" then
                if isColor(811, 589, 0x89898c, 95) and isColor(826, 589, 0x89898c, 95) and isColor(833, 589, 0x89898c, 95) and isColor(848, 589, 0x89898c, 95) and isColor(1057, 353, 0xff0000, 95) == false then
                    touchClick(1057, 353, 0xff0000)
                    touchClick(20, 20)
                    isAddChanLiangLiZi = true
                    writeJson("增产粒子", isAddChanLiangLiZi)
                    isJustBack = false
                else
                    touchClick(20, 20)
                    isAddChanLiangLiZi = true
                    writeJson("增产粒子", isAddChanLiangLiZi)
                    isJustBack = false
                end
            else
                touchClick(20, 20)
                isJustBack = false
            end
        elseif isColor(43, 343, 0x847b84, 95) and isColor(43, 296, 0xffffff, 95) then
            debug("航母开发室--航母")
            -- if isShipBad == true then
            if isColor(505, 110, 0x3e6b96, 95) == false then
                debug("无航母")
                touchClick(20, 20)
                if muBiao == mb_FixShip then
                    gaiMuBiaoNew(3, mb_Wu, mm_Wu)
                end
                return
            end
            if isColor(505, 110, 0x3e6b96, 95) -- 1号航母存在
                and isColor(440, 263, 0xffffff, 95) == false -- 没在充电
                and isColor(410, 271, 0xffffff, 95) == false -- 没在升阶
                and isColor(440, 281, 0xffffff, 95) == false then -- 没在使用
                debug("1号来充电吧")
                touchClick(440, 263)
            elseif isColor(704, 110, 0x3e6b96, 95) -- 2号航母存在
                and isColor(639, 256, 0xffffff, 95) == false -- 没在充电
                and isColor(609, 271, 0xffffff, 95) == false -- 没在升阶
                and isColor(639, 281, 0xffffff, 95) == false then -- 没在使用
                debug("2号来充电吧")
                touchClick(639, 263)
            elseif isColor(902, 110, 0x3e6b96, 95) -- 3号航母存在
                and isColor(838, 256, 0xffffff, 95) == false -- 没在充电
                and isColor(808, 271, 0xffffff, 95) == false -- 没在升阶
                and isColor(838, 281, 0xffffff, 95) == false then -- 没在使用
                debug("3号来充电吧")
                touchClick(838, 263)
            elseif isColor(1079, 110, 0x3e6b96, 95) -- 4号航母存在
                and isColor(1036, 256, 0xffffff, 95) == false -- 没在充电
                and isColor(1006, 271, 0xffffff, 95) == false -- 没在升阶
                and isColor(1036, 281, 0xffffff, 95) == false then -- 没在使用
                debug("4号来充电吧")
                touchClick(1036, 263)
            else
                touchClick(20, 20)
                isShipBad = false
                if muBiao == mb_FixShip then
                    gaiMuBiaoNew(3, mb_Wu, mm_Wu)
                end
            end
        elseif isColor(45, 418, 0xe9b042, 95) and isColor(44, 403, 0xffffff, 95) then
            debug("加工站界面")
            if isColor(184, 345, 0x4e6374, 95) then
                debug("位置1空着")
                touchClick(184, 345)
            elseif isColor(357, 346, 0x4e6374, 95) then
                debug("位置2空着")
                touchClick(357, 345)
            elseif isColor(536, 341, 0x4e6374, 95) then
                debug("位置3空着")
                touchClick(536, 345)
            else
                touchClick(20, 20)
            end
        elseif isColor(42, 422, 0xa02ae0, 95) and isColor(38, 403, 0xffffff, 95) then
            debug("兑换界面")
            do
                local temStr = ocrText(323, 298, 385, 310, 0, "0123456789")
                if temStr ~= nil then
                    numLiZi = temStr
                    writeJson("粒子", numLiZi)
                end
            end

            snapshot("lizi1.jpg", 323, 298, 385, 310, 0.5); -- 使用 jpg 格式截图，并设置图片质量为 0.5
            snapshot("lizi2.jpg", 323, 368, 385, 381, 0.5); -- 使用 jpg 格式截图，并设置图片质量为 0.5
            local tab = { userPath() .. "/res/lizi1.jpg", userPath() .. "/res/lizi2.jpg" }
            local path = userPath() .. "/res/lizi.jpg"
            local dir = 1
            local quality = 1
            local bool, msg = image_tsing.operMerge(tab, path, dir, quality) --合并图片

            fwCloseView("window1", "more"); -- 关闭文字视图
            fwShowButton("window1", "more", "", "FFFFFF", "306090", "lizi.jpg", 12, 0, 0, 50, 30);
            mSleep(500)
            touchClick(16, 24, 0xffffff)
        else
            touchClick(20, 20)

        end
    end
    if isColor(215, 189, 0xb283ca, 95) and isColor(344, 191, 0xf7eb5e, 95) and isColor(494, 210, 0x113199, 95) then
        debug("制作材料")
        if isColor(500, 518, 0x604411, 95) then
            debug("没选材料")
            if numCaiLiao == 1 then
                touchClick(210, 205, 0x5669ba)
            elseif numCaiLiao == 2 then
                touchClick(347, 195, 0xaa8e2a)
            elseif numCaiLiao == 3 then
                touchClick(497, 207, 0x236dbd)
            elseif numCaiLiao == 4 then
                touchClick(639, 199, 0x9c7f57)
            elseif numCaiLiao == 5 then
                touchClick(778, 207, 0x3f456e)
            elseif numCaiLiao == 6 then
                touchClick(924, 203, 0x6a5c5a)
            elseif numCaiLiao == 7 then
                touchClick(208, 376, 0xabcdec)
            elseif numCaiLiao == 8 then
                touchClick(356, 384, 0x2d385f)
            elseif numCaiLiao == 9 then
                touchClick(488, 375, 0x5a5752)
            elseif numCaiLiao == 10 then
                touchClick(623, 376, 0x94aab5)
            elseif numCaiLiao == 11 then
                touchClick(785, 375, 0x73737a)
            elseif numCaiLiao == 12 then
                touchClick(918, 375, 0xc1c0d3)
            else
                touchClick(210, 205, 0x5669ba)
            end
            numCaiLiao = numCaiLiao + 1
            if numCaiLiao >= 13 then
                numCaiLiao = 1
            end
            writeJson("材料编号", numCaiLiao)
        else
            touchClick(516, 523, 0x604411)
        end
    end
    if isColor(34, 111, 0xff6600, 95) and isColor(59, 106, 0xff8400, 95) and isColor(526, 84, 0x01ace4, 95) and
        isColor(905, 134, 0x116eb9, 95) then
        debug("航母充电")
        if isColor(996, 182, 0x116eb9, 95) and isColor(1022, 181, 0xced6dd, 95) then
            debug("充电--未满")
            touchClick(996, 182)
            mSleep(1000)
            if isColor(991, 181, 0x116eb9, 95) and muBiao == mb_FixShip then -- 船没坏
                isShipBad = false
                gaiMuBiaoNew(3, mb_Wu, mm_Wu)
            end
            touchClick(495, 451, 0x1c6db9)

        else
            touchClick(511, 593, 0x0c0c0e)
            debug("muBiao  :  " .. muBiao)
            if muBiao == mb_FixShip then
                isShipBad = false
                gaiMuBiaoNew(3, mb_Wu, mm_Wu)
            end
        end
    end

    if isColor(476, 459, 0xd68b00, 95) and isColor(496, 470, 0x279fd5, 95) and isColor(469, 447, 0x8f4d14, 95) then
        debug("购买道具--矿物")
        touchClick(496, 470, 0x279fd5)
        mSleep(4000)
    end
    if isColor(476, 459, 0xd68b00, 95) and isColor(494, 474, 0x9a95a3, 95) and isColor(469, 447, 0x8f4d14, 95) then
        debug("购买道具--金属")
        touchClick(496, 470, 0x279fd5)
        mSleep(4000)
    end
    if isColor(476, 459, 0xd68b00, 95) and isColor(499, 476, 0x8644ed, 95) and isColor(469, 447, 0x8f4d14, 95) then
        debug("购买道具--粒子")
        touchClick(513, 552, 0x0c0c0e)
    end
    if isColor(476, 459, 0xd68b00, 95) and isColor(494, 464, 0xf8eea7, 95) and isColor(469, 447, 0x8f4d14, 95) then
        debug("购买道具--金币")
        touchClick(513, 552, 0x0c0c0e)
    end
    if isColor(217, 437, 0x67e5f5, 95) and isColor(399, 444, 0x837e8b, 95) and isColor(597, 444, 0xb1d272, 95) then
        debug("充电--第二步")
        touchClick(884, 187, 0x0b3466)
        touchClick(884, 271, 0x0b3466)
        touchClick(882, 349, 0x8b9fb7)
        touchClick(647, 504, 0x1a69b6)
    end
    if isColor(586, 189, 0x6375a7, 95) and isColor(776, 270, 0xffffff, 95) and isColor(587, 354, 0x5b6ea3, 95) and
        isColor(719, 507, 0x1c6eba, 95) then
        debug("充电缺少资源")
        touchClick(511, 586, 0x0c0c0e)
        isChongDianKaZiYuan = true
        getOut()
    end
    if isColor(275, 58, 0xf5a801, 95) and isColor(737, 130, 0x0d9098, 95) and isColor(290, 225, 0xffffff, 95) and
        isColor(538, 488, 0xba7b00, 95) then
        debug("使用道具界面")
        if isColor(322, 196, 0xffb30a, 95) and isColor(386, 198, 0xcdcdcd, 95) then
            debug("观看视频,缩短20分钟--灰色不可选")
            touchClick(510, 580, 0x0c0c0e)
            mSleep(1000)
            if isColor(510, 590, 0x3a587b, 95) then
                touchClick(511, 596, 0x0c0c0e)
                mSleep(1000)
            end
            getOut()
            if muBiao == "研究" then
                gaiMuBiaoNew(3, "无")
                isYanJiu = false
                writeJson("研究", isYanJiu)
            elseif muBiao == "主线" then
                if haoLV == 3 then
                    gaiMuBiaoNew(1, mb_WaKuang)
                else
                    gaiMuBiaoNew(1, "优化")
                end
            elseif muBiao == "优化" then
                gaiMuBiaoNew(1, "主线")
            end
        elseif isColor(620, 500, 0x1a61a3, 95) then
            debug("可使用")
            touchClick(599, 501)
        else
            if muBiao == mb_YouHua then
                isKaYouHua = true
                writeJson("卡优化", isKaYouHua)
                gaiMuBiaoNew(1, mb_ZhuXian, mm_ZhuXian)
                mSleep(1000)
                touchClick(511, 603, 0x0c0c0e)
                mSleep(1000)
                getOut()
            elseif muBiao == mb_ZhuXian then
                if haoLV <= 2 and isOverLesson == false and numLv >= 6 then
                    gaiMuBiaoNew(1, "章节")
                else
                    gaiMuBiaoNew(1, mb_WaKuang, mm_WaKuang)
                end
                timeRound = nowTime
                mSleep(1000)
                touchClick(511, 603, 0x0c0c0e)
                mSleep(1000)
                getOut()
            elseif muBiao == mb_WaKuang then
                timeRound = nowTime
                mSleep(1000)
                touchClick(511, 603, 0x0c0c0e)
                mSleep(1000)
                getOut()
            end
        end
    end
    if isColor(6, 24, 0xf59600, 95) and isColor(18, 24, 0xffffff, 95) and isColor(355, 86, 0x5195db, 95) then
        debug("司令官界面")
        if isColor(1113, 84, 0x9e1111, 95) then -- 战绩红点
            touchClick(1113, 84)
        else
            touchClick(20, 20)
        end
    end
    if isColor(33, 45, 0xff6600, 95) and isColor(77, 149, 0x55aeff, 95) and isColor(1094, 559, 0x6e899b, 95) then
        debug("战绩")
        if isColor(141, 490, 0xf49a16, 95) then
            touchClick(141, 490)
        else
            touchClick(511, 594, 0x0c0c0e)
        end
    end
    if isColor(291, 168, 0xf5a801, 95) and isColor(282, 175, 0xff6600, 95) and isColor(783, 235, 0x85baf9, 95) then
        debug("谷歌APP重置失败")
        if isColor(494, 420, 0x3efac6, 95) or isColor(481, 420, 0x4a9981, 95) then
            debug("加速时间比剩余的长")
            if muBiao == mb_YouHua then
                gaiMuBiaoNew(1, mb_ZhuXian, mm_ZhuXian)
                touchClick(511, 497)
                touchClick(511, 579, 0x0c0c0e)
                getOut()
            else
                touchClick(511, 497)
                touchClick(511, 579, 0x0c0c0e)
                getOut()
            end
        elseif isColor(474, 300, 0xdfe0e2, 95) and isColor(476, 430, 0x1c6eb9, 95) then
            debug("清除残迹")
            touchClick(474, 430)
        elseif isColor(587, 344, 0xff0099, 95) and isColor(486, 433, 0x1c6eba, 95) then
            debug("升级,解除护盾")
            touchClick(486, 433, 0x1c6eba)
        else
            touchClick(511, 497)
        end
    end
    if isColor(567, 80, 0x99b5cb, 95) and isColor(567, 558, 0x99b5cb, 95) and isColor(567, 572, 0x536270, 95) then
        debug("剧情图片")
        touchClick(567, 308, 0x7b726d)
    end
    if isColor(430, 206, 0xf87808, 95) and isColor(439, 206, 0x583818, 95) and isColor(567, 269, 0x59271b, 95) then
        debug("完成章节")
        touchClick(556, 614, 0x262b33)
        touchClick(556, 614, 0x262b33)
    end
    if isColor(69, 95, 0xf5a801, 95) and isColor(60, 119, 0xff6600, 95) and isColor(66, 157, 0xff6600, 95) then
        debug("第N章第N节")
        if isColor(103, 403, 0x0d9098, 95) then
            touchClick(97, 402)
        elseif isColor(256, 403, 0x0d9098, 95) then
            touchClick(256, 402)
        elseif isColor(413, 403, 0x0d9098, 95) then
            touchClick(413, 402)
        elseif isColor(566, 403, 0x0d9098, 95) then
            touchClick(566, 402)
        elseif isColor(716, 403, 0x0d9098, 95) then
            touchClick(716, 402)
        elseif isColor(891, 494, 0x1db586, 95) then
            touchClick(891, 494)
        else
            if muBiao == "章节" then
                if isColor(81, 106, 0xf26202, 95) and isColor(84, 104, 0xff6600, 95) and isColor(83, 110, 0xf36202, 95) then -- 1-6
                    if haoLV <= 2 then
                        gaiMuBiaoNew(1, "优化")
                    else
                        gaiMuBiaoNew(1, mb_WaKuang)
                    end
                    touchClick(510, 567, 0x0c0c0e)
                else
                    x, y = findMultiColorInRegionFuzzy(0x126fbb, "112|22|0x075ea8", 90, 73, 385, 836, 428)
                    if x ~= -1 then
                        touchClick(x, y)
                    end
                end
            else
                touchClick(511, 567, 0x0c0c0e)
            end
        end
    end
    if isColor(7, 25, 0xff9c00, 95) and isColor(18, 25, 0xffffff, 95) and isColor(103, 166, 0xffb500, 95) and isColor(119, 166, 0x718d9f, 95) then
        debug("高级商店")
        if isColor(102, 77, 0x9e1111, 95) then -- 免费补给箱子
            touchClick(102, 77)
            mSleep(1000)
            touchClick(20, 20)
        else
            touchClick(20, 20)
            timeRed = nowTime
        end
    end
    if isColor(17, 24, 0xffffff, 95) and isColor(5, 24, 0xff9c00, 95) and isColor(103, 75, 0xffb500, 95) then
        debug("背包界面")
        if muBiao == mb_5DaoJu and num5DaoJu <= 7 then
            if isColor(111, 127, 0x182536, 95) then
                touchClick(111, 127) -- 资源
                mSleep(1000)
            end
            for i = 0, 8, 1 do
                if isPause == true then
                    return
                end
                if isColor(215 + i * 100, 78, 0xa0a0a0, 95) or isColor(215 + i * 100, 78, 0x33a904, 95) then
                    touchClick(215 + i * 100, 117)
                    num5DaoJu = num5DaoJu + 1
                    writeJson("每日5道具", num5DaoJu)

                    break
                end
            end
        elseif muBiao == mb_5DaoJu and num5DaoJu > 7 then
            gaiMuBiaoNew(2, "道具合成")
            touchClick(20, 20, 0x5c6571)
        elseif muBiao == "道具合成" then
            if isColor(111, 317, 0x182637, 95) then
                touchClick(111, 317) -- 材料
                mSleep(1000)
            end
            --分解
            for i = 0, 8, 1 do
                if isPause == true then
                    return
                end
                if isColor(172 + i * 100, 78, 0x34b200, 95) then
                    touchClick(172 + i * 100, 78) --物品
                    touchClick(396, 471, 0x1d6ebb) --分解
                    touchClick(509, 547, 0x1cb686) --分解
                    touchClick(488, 429, 0x1c6db9) --确定
                    mSleep(2000)
                    break
                end
            end
            for i = 1, 10, 1 do
                if isPause == true then
                    return
                end
                if isColor(17, 24, 0xffffff, 95) then --没转圈
                    break
                end
                mSleep(1000)
            end
            --合成
            for i = 0, 8, 1 do
                if isPause == true then
                    return
                end
                touchClick(215 + i * 100, 78) --点击物品
                if isColor(604, 471, 0xd78b01, 95) then --有合成按钮
                    touchClick(611, 466, 0xd78b01) --合成
                    if isColor(487, 543, 0x1c6dbb, 95) then --有合成按钮
                        touchClick(509, 551, 0x1c6eba) --合成
                        touchClick(497, 433, 0x1c6eba) --确定
                        isMixedThing = true
                        writeJson("每日道具合成", isMixedThing)
                        gaiMuBiaoNew(2, mb_CaiJi)
                        break
                    else
                        touchClick(511, 551, 0x0c0c0e) --关闭
                    end
                else
                    touchClick(511, 521, 0x0c0c0e)
                end
                if i == 8 then
                    isMixedThing = true
                    writeJson("每日道具合成", isMixedThing)
                    gaiMuBiaoNew(2, mb_CaiJi)
                end
            end
        elseif isZhengLi == false then
            if isColor(122, 128, 0x182536, 95) then
                touchClick(122, 128) -- 资源
                mSleep(1000)
            end
            for i = 1, 10, 1 do
                if isPause == true then
                    return
                end
                x, y = findMultiColorInRegionFuzzy(0xd5c29f, "-9|51|0x9c683e", 90, 169, 75, 1048, 612) --金币
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x87807d, "-3|41|0x7a7d79,-26|-12|0x54ac1c", 90, 169, 75, 1048, 612) --钛
                useBagThings()
            end
            if isColor(111, 448, 0x182536, 95) then
                touchClick(111, 449) -- 其他
                mSleep(1000)
            end
            for i = 1, 20, 1 do
                if isPause == true then
                    return
                end
                x, y = findMultiColorInRegionFuzzy(0x1d232f, "-18|-20|0xcbd1d3,23|-21|0xf1f5f6", 90, 169, 75, 249, 162) -- 补给箱
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xa9a9a9, "12|0|0xa9a9a9", 90, 169, 75, 1052, 76) -- 战舰--灰
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x34b300, "12|0|0x34b300", 90, 169, 75, 1052, 76) -- 战舰--绿
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x13c8d4, "12|10|0x1a99b9,89|9|0x2cb6d2", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x425e6a, "35|32|0x0c2748,9|35|0x333b4c", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x4984a3, "32|32|0xf4eeff,7|36|0x3c314a", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x725050, "30|30|0xfff6f6,4|28|0x5e2827", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x673300, "32|31|0xfbf0ce,5|36|0x692c01", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x00b3ff, "17|20|0x0076d2,6|41|0x526256", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x93a6ca, "0|31|0x94a1c3,15|16|0x8cbeea", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x9b597a, "0|31|0xa96a87,14|14|0xad7ed1", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xab8f0a, "0|31|0xb3990a,14|14|0xb5b453", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xfc2000, "5|28|0x86210c,26|19|0xf9f6f1", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x13f3f7, "32|-7|0x0ae0e8,18|17|0x90b5b9", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x94a3c7, "-5|23|0x92acd5,12|19|0x91b3eb", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xa8527f, "-2|18|0xaa5888,17|15|0xae72b0", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xbdad0b, "0|26|0xb79b07", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x69c4d3, "49|-5|0x356167", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x6bc7d2, "45|-2|0x33696f", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0x73c5d4, "49|-2|0x356369", 90, 169, 75, 1052, 162)
                useBagThings()
                x, y = findMultiColorInRegionFuzzy(0xb16290, "2|22|0xa4628b", 90, 169, 75, 1052, 162)
                useBagThings()
            end
            isZhengLi = true
            writeJson("整理", isZhengLi)
        else

            -- if isColorPlus(137, 105, 0x9e1111, 95) then -- 资源
            --     touchClick(83, 129, 0x5c6571)
            -- end
            -- if isColorPlus(137, 169, 0x9e1111, 95) then -- 加速
            --     touchClick(83, 191, 0x5c6571)
            -- end
            -- if isColorPlus(137, 233, 0x9e1111, 95) then -- 战争
            --     touchClick(83, 258, 0x5c6571)
            -- end
            -- if isColorPlus(137, 297, 0x9e1111, 95) then -- 材料
            --     touchClick(83, 325, 0x5c6571)
            -- end
            -- if isColorPlus(137, 361, 0x9e1111, 95) then -- 装备
            --     touchClick(83, 383, 0x5c6571)
            -- end
            -- if isColorPlus(137, 425, 0x9e1111, 95) then -- 其它
            --     touchClick(83, 449, 0x5c6571)
            -- end
            touchClick(20, 20, 449, 0x5c6571)
        end
    end
    if isColor(4, 23, 0xff9c00, 95) and isColor(17, 23, 0xffffff, 95) and isColor(1001, 25, 0x0d9098, 95) then
        debug("邮件界面")
        x, y = findMultiColorInRegionFuzzy(0x931012, "-1|0|0x1c2c40", 90, 112, 98, 115, 491)
        if x ~= -1 then
            touchClick(x, y)
            mSleep(1000)
            touchClick(1054, 23, 0x0d9198)
        else
            touchClick(1017, 25)
            mSleep(1000)
            touchClick(6, 23)
        end
        -- end
    end

    if isColor(91, 156, 0xff6600, 95) and isColor(272, 156, 0x863f13, 95) then
        debug("任务界面")
        if muBiao == mb_Reward then
            touchClick(354, 135, 0xb0b0b0) -- 每日任务
        else
            if haoLV <= 2 and muBiao == mb_ZhuXian then
                if isColor(957, 226, 0xfaba00, 95) then -- 宝箱
                    touchClick(985, 213)
                elseif isColor(288, 502, 0xf18e07, 95) then -- 支线已完
                    touchClick(282, 502)
                elseif isColor(115, 513, 0xf18e07, 95) then -- 主线已完
                    touchClick(115, 513)
                elseif isColor(138, 347, 0x65ee01, 95) and isColor(156, 340, 0x61f001, 95) and isColor(183, 329, 0x52f001, 95) and isColor(115, 507, 0x116eb9, 95) then
                    debug("升级任务")
                    timeShengJiTongXingZheng = nowTime
                    touchClick(170, 510, 0x4784b8) -- 移动
                    if isColor(962, 576, 0xe59b48, 95) then -- 卡主线,点工具
                        touchClick(38, 492) -- 工具
                    end
                elseif isColor(163, 353, 0x2c507f, 95) and isColor(152, 324, 0xb9ced4, 95) and isColor(129, 511, 0x116eb9, 95) then
                    debug("使用100艘战舰")
                    if nowTime - timeZhengLi >= 5 * 60 then
                        touchClick(511, 572, 0x0c0c0e) -- 关闭
                        mSleep(1000)
                        touchClick(968, 580, 0xa95a2a) --背包
                        mSleep(1000)
                        isZhengLi = false
                        writeJson("整理", isZhengLi)
                        timeZhengLi = nowTime
                    else
                        touchClick(170, 510, 0x4784b8) -- 移动
                        if isColor(962, 576, 0xe59b48, 95) then -- 卡主线,点工具
                            touchClick(38, 492) -- 工具
                        end
                    end
                elseif isColor(198, 336, 0xbfffd8, 95) and isColor(197, 364, 0x9dffc3, 95) and
                    isColor(114, 511, 0x116eb9, 95) then
                    debug("拥有一名舰长")
                    touchClick(511, 572, 0x0c0c0e) -- 关闭
                    touchClick(782, 583, 0xf8efd1) -- 舰长
                    isKaZhuXianJianZhang = true
                elseif isColor(191, 366, 0x08507e, 95) and isColor(191, 345, 0x16c3d2, 95) and
                    isColor(114, 511, 0x116eb9, 95) then
                    debug("生产20战舰")
                    isKaShengChan = true
                    touchClick(170, 510, 0x4784b8) -- 移动
                    if isColor(962, 576, 0xe59b48, 95) then -- 卡主线,点工具
                        touchClick(38, 492) -- 工具
                    end
                elseif isColor(197, 336, 0xffe3bf, 95) and isColor(197, 367, 0xffd39b, 95) and isColor(182, 366, 0xffe59f, 95) and
                    isColor(223, 501, 0x116eb9, 95) then
                    debug("提升1次舰长星级")
                    gaiMuBiaoNew(1, mb_WaKuang)
                    touchClick(511, 572, 0x0c0c0e) -- 关闭
                    RGB_NoticeBJ = "FFFF00"
                    RGB_NoticeFont = "FF0000"
                    strNotice = "升星"
                    fwCloseView("window1", "more"); -- 关闭文字视图
                    fwShowButton("window1", "more", strNotice, RGB_NoticeFont, RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
                    mSleep(500)
                elseif isColor(185, 333, 0x33ece3, 95) and isColor(119, 506, 0x116eb9, 95) then
                    debug("研究任务")
                    touchClick(170, 510, 0x4784b8) -- 移动
                    isYanJiuZiYuan = true
                    writeJson("研究资源", isYanJiuZiYuan)
                    isYanJiuKaiFa = true
                    writeJson("研究开发", isYanJiuKaiFa)
                    isYanJiuFangYu = true
                    writeJson("研究防御", isYanJiuFangYu)
                    isYanJiuShengChan = true
                    writeJson("研究生产", isYanJiuShengChan)
                    isYanJiuJingRui = true
                    writeJson("研究精锐", isYanJiuJingRui)
                    isYanJiuZhanJian = true
                    writeJson("研究战舰", isYanJiuZhanJian)
                    isYanJiu = true
                    writeJson("研究", isYanJiu)
                elseif isColor(178, 340, 0x5da9db, 95) and isColor(121, 509, 0x116eb9, 95) then
                    debug("海盗任务")
                    if nowTime - timeZhengLi >= 5 * 60 then
                        touchClick(511, 572, 0x0c0c0e) -- 关闭
                        mSleep(1000)
                        touchClick(968, 580, 0xa95a2a) --背包
                        mSleep(1000)
                        isZhengLi = false
                        writeJson("整理", isZhengLi)
                        timeZhengLi = nowTime
                    else
                        touchClick(170, 510, 0x4784b8) -- 移动
                        if isColor(962, 576, 0xe59b48, 95) then -- 卡主线,点工具
                            touchClick(38, 492) -- 工具
                        end
                    end
                elseif isColor(148, 340, 0x1b87df, 95) and isColor(189, 341, 0x0c67b0, 95) and isColor(124, 507, 0x116eb9, 95) then
                    debug("卡主线--建资源")
                    gaiMuBiaoNew(1, mb_WaKuang)
                    touchClick(511, 572, 0x0c0c0e) -- 关闭
                    RGB_NoticeBJ = "FFFF00"
                    RGB_NoticeFont = "FF0000"
                    strNotice = "资源"
                    fwCloseView("window1", "more"); -- 关闭文字视图
                    fwShowButton("window1", "more", strNotice, RGB_NoticeFont, RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
                    mSleep(500)
                else
                    touchClick(170, 510, 0x4784b8) -- 移动
                    if isColor(962, 576, 0xe59b48, 95) then -- 卡主线,点工具
                        touchClick(38, 492) -- 工具
                    end
                end
            elseif isColor(433, 111, 0x9d1111, 95) then -- 每日任务--红点
                touchClick(354, 135, 0xb0b0b0)
            elseif isColor(957, 226, 0xfaba00, 95) then -- 宝箱
                touchClick(985, 213)
            else
                touchClick(23, 29)
            end
        end
    end
    if isColor(272, 156, 0xff6600, 95) and isColor(267, 156, 0x843c10, 95) then
        debug("每日任务界面")
        if muBiao == mb_Reward then
            if isColor(124, 507, 0xf18e07, 95) then
                touchClick(124, 507)
            elseif isColor(299, 197, 0xc5f3f9, 95) then
                touchClick(299, 197)
            elseif isColor(482, 197, 0x8cfbfc, 95) then
                touchClick(482, 197, 0x8cfbfc)
            elseif isColor(672, 197, 0xc4f3f9, 95) then
                touchClick(672, 197, 0xc4f3f9)
            elseif isColor(859, 197, 0xb8f9f7, 95) then
                touchClick(859, 197, 0xb8f9f7)
            elseif isColor(1045, 197, 0xb8f9f7, 95) then
                touchClick(1045, 197)
                mSleep(2000)
            else
                touchClick(513, 574)
                gaiMuBiaoNew(1, mb_WaKuang, mm_WaKuang)
                gaiMuBiaoNew(2, mb_Wu, mm_Wu)
            end
        else

            -- if isColor(433, 111, 0x9d1111, 95) then -- 每日任务--红点
            --     touchClick(354, 135, 0xb0b0b0)
            -- else
            touchClick(23, 29)
            -- end
        end
    end
    if isColor(314, 113, 0xf6a801, 95) and isColor(311, 143, 0xe0e0e0, 95) and isColor(311, 142, 0x0b4992, 95) then
        debug("获得道具")
        touchClick(510, 549, 0x0c0c0e)
    end
    if multiColor({ { 287, 611, 0x4eabf0 }, { 844, 451, 0xff8a00 } }) then
        debug("对话框1")
        touchClick(567, 540)
    end
    if multiColor({ { 286, 611, 0x4aa9f1 }, { 846, 449, 0xde8116 } }) then
        touchClick(567, 540)
        debug("对话框2")
    end

    if haoLV == 1 then
        -- if isColor(278, 283, 0x03f003, 95) and isColor(337, 287, 0x02ff00, 95) then
        --     debug("任务1已完成")
        --     touchClick(278, 283)
        -- end
        -- if isColor(278, 352, 0x02ff00, 95) and isColor(337, 354, 0x02ff00, 95) then
        --     debug("任务2已完成")
        --     touchClick(278, 352)
        -- end
        if isColor(109, 501, 0xf09006, 95) and isColor(228, 523, 0xf87808, 95) and isColor(984, 495, 0x106fb9, 95) and
            isColor(967, 494, 0x153557, 85) then
            debug("指引--任务--领取")
            touchClick(109, 501)
        end
    end
end

-- 综合--多点
function zongHe_Mult(...)
    if haoLV == 3 then
        return false
    end
    x, y = findMultiColorInRegionFuzzy(0xffde8c, "-43|-3|0xbd834d,-1|-44|0xc68852", 90, 0, 0, 1136, 640, {
        orient = 5
    })
    if x ~= -1 then
        -- 右下
        debug("右下")
        touchClick(x + 20, y + 20)
        return true
    end
    x, y = findMultiColorInRegionFuzzy(0xffdd85, "-1|-33|0xcfad66,-33|1|0xcc9856", 90, 0, 0, 1136, 640, {
        orient = 5
    })
    if x ~= -1 then
        debug("右下2")
        touchClick(x + 20, y + 20)
        return true

    end
    x, y = findMultiColorInRegionFuzzy(0xffdc83, "2|-41|0xe8b07c,40|-3|0xbe8e63", 90, 0, 0, 1136, 640, {
        orient = 8
    })
    if x ~= -1 then
        -- 左下
        debug("左下")
        touchClick(x - 20, y + 20)
        return true
    end
    x, y = findMultiColorInRegionFuzzy(0xffdc87, "1|-36|0xc18349,41|0|0xc68551", 90, 0, 0, 1136, 640, {
        orient = 8
    })
    if x ~= -1 then
        -- 左下
        debug("左下2")
        touchClick(x - 20, y + 20)
        return true
    end
    -- x, y = findMultiColorInRegionFuzzy(0xffdc87, "-24|0|0xecb46c,0|22|0xe8b671", 90, 0, 0, 1136, 640, {
    --     orient = 2
    -- })
    -- if x ~= -1 then
    --     -- 右上
    --     debug("右上")
    --     touchClick(x + 20, y - 20)
    --     return true
    -- end
    x, y = findMultiColorInRegionFuzzy(0xffde8b, "3|41|0xc38f60,36|2|0xc4a174", 90, 0, 0, 1136, 640, {
        orient = 1
    })
    if x ~= -1 then
        -- 左上
        debug("左上")
        touchClick(x - 20, y - 20)
        return true
    end
    x, y = findMultiColorInRegionFuzzy(0xffdc86, "1|44|0xb6855c,43|1|0xb27c4d", 90, 0, 0, 1135, 639, {
        orient = 1
    })
    if x ~= -1 then
        -- 左上
        debug("左上2")
        touchClick(x - 20, y - 20)
        return true
    end
    x, y = findMultiColorInRegionFuzzy(0xffde88, "-44|3|0xb98454,-4|44|0xb88456", 90, 0, 0, 1135, 639, {
        orient = 4
    })
    if x ~= -1 then
        debug("右上")
        touchClick(x + 20, y - 20)
        return true
    end
    return false
end

-- 综合--屏幕乱点
function zongHe_Screen()
    if isColor(18, 24, 0xafafaf, 95) and isColor(7, 24, 0xaf4600, 95) then
        screenClick(18, 24, 0xafafaf)
    end
end

-- 研究队列
function numYanJiu()
    if isYanJiuZiYuan == true then
        numZiYuan = numZiYuan + 1
        if numZiYuan == 8 then
            isYanJiuZiYuan = false
            writeJson("研究资源", isYanJiuZiYuan)
        end
    elseif isYanJiuKaiFa == true then
        numKaiFa = numKaiFa + 1
        if numKaiFa == 8 then
            isYanJiuKaiFa = false
            writeJson("研究开发", isYanJiuKaiFa)
        end
    elseif isYanJiuFangYu == true then
        numFangYu = numFangYu + 1
        if numFangYu == 10 then
            isYanJiuFangYu = false
            writeJson("研究防御", isYanJiuFangYu)
        end
    elseif isYanJiuShengChan == true then
        numShengChan = numShengChan + 1
        if numShengChan == 9 then
            isYanJiuShengChan = false
            writeJson("研究生产", isYanJiuShengChan)
        end
    elseif isYanJiuJingRui == true then
        numJingRui = numJingRui + 1
        if numJingRui == 8 then
            isYanJiuJingRui = false
            writeJson("研究精锐", isYanJiuJingRui)
        end
    elseif isYanJiuZhanJian == true then
        numZhanJian = numZhanJian + 1
        if numZhanJian == 9 then
            isYanJiuZhanJian = false
            writeJson("研究战舰", isYanJiuZhanJian)
            isYanJiu = false
            writeJson("研究", isYanJiu)
        end
    end
end

-- 使用背包道具
function useBagThings()
    if x ~= -1 then
        touchClick(x, y)
        mSleep(1000)
        if isColor(518, 498, 0x1c6eba, 95) then
            touchClick(518, 498)
            mSleep(1000)
        elseif isColor(513, 458, 0x1c6eb9, 95) then
            touchClick(513, 458)
            mSleep(1000)
        end
        mSleep(1000)
        if isColor(511, 542, 0x40658d, 95) then
            touchClick(511, 542)
        end
        if isColor(314, 113, 0xf6a801, 95) and isColor(311, 143, 0xe0e0e0, 95) and isColor(311, 142, 0x0b4992, 95) then
            debug("获得道具")
            touchClick(510, 549, 0x0c0c0e)
        end
    end
end

-- 检查红点
function checkRed1()
    -- ocrNumbers()
    if haoLV == 3 then
        -- snapshot("lizi.jpg", 956, 16, 1016, 29, 0.5); -- 使用 jpg 格式截图，并设置图片质量为 0.5
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", "", "FFFFFF", "306090", "lizi.jpg", 12, 0, 0, 50, 30);
        mSleep(500)
    end
    OCR_num()
    if isColor(1104, 130, 0x369469, 95) == false and isColor(1129, 102, 0x9e1111, 95) then
        debug("验证码--红点")
        touchClick(1096, 137, 0x191d1b)
        return true
    elseif isColor(1050, 106, 0x9e1111, 95) and isColor(1033, 115, 0x3f9fd8, 95) then
        debug("验证码--红点")
        touchClick(1033, 137)
        return true
    elseif isColor(448, 78, 0x33d6ff, 95) or isColor(448, 78, 0x814d27, 95) then
        debug("收资源1")
        touchClick(448, 78)
        return true
    elseif isColor(385, 129, 0x2ed4fc, 95) then
        debug("收资源2")
        touchClick(385, 129)
        return true
    elseif isColor(266, 171, 0x28cdf2, 95) then
        debug("收资源3")
        touchClick(266, 171)
        return true
    elseif isColor(175, 238, 0x25c9eb, 95) then
        debug("收资源4")
        touchClick(175, 238)
        return true
    elseif isColor(20, 297, 0x24c8e9, 95) or isColor(20, 295, 0x703a0d, 95) then
        debug("收资源5")
        touchClick(20, 297)
        return true
    elseif isEatEXP == false and haoLV >= 2 then
        debug("吃经验")
        touchClick(20, 20)
        mSleep(1000)
        touchClick(615, 198, 0x497aac) -- 加号
        mSleep(1000)
        if isColor(473, 529, 0xd68b01, 95) then -- 全部使用
            touchClick(473, 529)
        end
        if isColor(487, 431, 0x1c6eb9, 95) then -- 确定
            touchClick(487, 431)
        end
        -- touchClick(20, 20)
        isEatEXP = true
        writeJson("吃经验", isEatEXP)
    elseif isColor(844, 379, 0xffffff, 95) and isColor(857, 380, 0xffffff, 95) then
        debug("档案")
        touchClick(844, 379, 0xffffff)
        return true
    elseif isZhengLi == false and haoLV >= 2 then
        debug("整理")
        touchClick(967, 586, 0x2d2f2b)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and numAddChanLiang == 0 and haoLV >= 2 then
        debug("准备增产1")
        touchClick(449, 105, 0x28171d)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and numAddChanLiang == 1 and haoLV >= 2 then
        debug("准备增产2")
        touchClick(387, 153, 0x203d5a)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and numAddChanLiang == 2 and haoLV >= 2 then
        debug("准备增产3")
        touchClick(37, 321, 0x257700)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and isAddChanLiangLiZi == false and haoLV >= 2 and check16 == "vip8" then
        debug("准备粒子增产")
        touchClick(183, 259, 0x40414d)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and isTrade == false and haoLV >= 2 then
        debug("准备交易行")
        touchClick(320, 468, 0x6e1313)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and isCheckLiZiNum == false and haoLV >= 3 then
        debug("准备交易行--检查粒子数量")
        touchClick(320, 468, 0x6e1313)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and numGuangGao <= 9 and haoLV >= 2 then
        debug("看广告")
        touchClick(809, 221, 0x7aa0d8)
        return true
    elseif isColor(528, 253, 0x37664f, 95) and isJustBack == true and numChuanShu <= 4 and haoLV >= 2 then
        debug("点传输")
        touchClick(623, 497, 0xffd4a1)
        return true
    elseif isColor(233, 100, 0x9e1111, 95) and isColor(210, 108, 0x6de4e9, 95) and nowTime - timeJiDi >= 10 * 60 then
        debug("基地现况--红点")
        touchClick(209, 111, 0x61d5e9)
        return true

    elseif isColor(295, 9, 0x9d1111, 95) and isColor(310, 24, 0x9d1111, 95) then
        debug("VIP--红点")
        touchClick(285, 42, 0x68401a)
        return true
    elseif isColor(75, 213, 0x961112, 95) and isColor(90, 228, 0x9d1111, 95) and haoLV == 1 then
        debug("任务红点")
        if isColor(278, 286, 0x02ff00, 95) then -- 任务1完成
            touchClick(278, 286)
            return true
        elseif isColor(278, 351, 0x02ff00, 95) then -- 任务2完成
            touchClick(278, 351)
            return true
        elseif isColor(278, 414, 0x03f003, 95) then -- 任务3完成
            touchClick(278, 414)
            return true
        else
            touchClick(49, 187)
            return true
        end
    elseif isColor(728, 548, 0x9e1111, 95) then -- 邮件红点
        -- elseif isColor(728, 548, 0x9e1111, 95) and haoLV == 1 then -- 邮件红点
        touchClick(693, 587)
        return true
        -- elseif isColorPlus(999, 548, 0x9e1111, 95) then -- 背包红点
        --     touchClick(966, 589, 0x434641)
        -- return true
    elseif isColor(902, 541, 0x9d1111, 95) and nowTime - timeLianMeng >= 60 * 60 * 2 then -- 联盟红点
        timeLianMeng = nowTime
        touchClick(869, 582)
        return true
    elseif isColor(712, 43, 0x9d1111, 95) and isColor(643, 74, 0x7b5aa3, 95) then
        debug("联盟帮忙红点")
        touchClick(662, 68)
        -- elseif isColorPlus(902,541,0x9d1111,95) then
        --     debug("联盟红点")
        --     touchClick(881,594    )
        return true
    elseif isColor(1124, 51, 0x9e1111, 95) and nowTime - timeRed >= 15 * 60 then -- 右上角红点
        debug("右上角红点")
        touchClick(1106, 71, 0x111e2e)
        if isColor(730, 106, 0x9d1111, 95) then -- 1-1红点
            touchClick(684, 182, 0x445569)
        elseif isColor(993, 115, 0x9e1111, 95) and haoLV < 3 then -- 1-3 红点
            touchClick(937, 187, 0x263649)
        elseif isColor(858, 247, 0x9d1111, 95) then -- 2-2红点
            touchClick(816, 321, 0x1e2635)
        elseif isColor(993, 254, 0x9d1111, 95) then -- 2-3红点
            touchClick(946, 299, 0x182738)
        elseif isColor(1114, 262, 0x9d1111, 95) then --2-4红点
            touchClick(1070, 321, 0x546272)
        elseif isColor(858, 106, 0x9d1111, 95) and check22 == "活动" then -- 1-2红点
            touchClick(810, 169, 0x1c2b3d)
        elseif isColor(1120, 115, 0x9e1111, 95) then -- 1-4红点
            touchClick(1068, 182)
        elseif isColor(730, 247, 0x9d1111, 95) then -- 2-1红点
            touchClick(737, 254)
        elseif isColor(858, 106, 0x9d1111, 95) and check22 ~= "活动" then -- 1-2红点
            -- touchClick(810, 169, 0x1c2b3d)
            timeRed = nowTime
        end
        return true

    else
        return false
    end

end

-- 执行目标
function doTarget()
    if muBiao == mb_GuaJi then
        if haoLV <= 2 then
            gaiMuBiaoNew(1, mb_YouHua, mm_YouHua)
        elseif haoLV == 3 then
            gaiMuBiaoNew(1, mb_EveryDay, mm_EveryDay)
        end
    elseif muBiao == mb_YouHua then
        task_JiDi()
    elseif muBiao == mb_ZhuXian then
        task()
        zhuXian()
    elseif muBiao == mb_WaKuang then
        waKuang()
    elseif muBiao == mb_ChuHang then
        chuHang()
    elseif muBiao == mb_FixShip then
        fixShip()
    elseif muBiao == "开区检测" then
        openCheck()
    elseif muBiao == "钱包检测" then
        walletWatch()
    elseif muBiao == "登录钱包" then
        loginWallte()
    elseif muBiao == "章节" then
        task_Lesson()
    elseif muBiao1 == mb_EveryDay then
        everyDayTask()
    elseif muBiao1 == mb_ShengChan then
        gaiMuBiaoNew(1, mb_Wu, mm_Wu)
    end
end

-- 章节任务
function task_Lesson()
    if inside1() == true then
        mSleep(1000)
        touchClick(1074, 582) -- 出基地
    end
    if outside() then
        mSleep(1000)
        if isZhengLi == true then
            touchClick(1103, 68, 0x0d1828) -- 展开右上角
            if isColor(790, 276, 0xc7d4e1, 95) then
                touchClick(811, 317, 0x192838) -- 章节
            else
                touchClick(672, 310, 0x223141)
            end
            isZhengLi = false
        else
            touchClick(965, 586, 0x373c37) -- 背包
        end
    end
    if isColor(267, 521, 0xdbddec, 95) and isColor(440, 535, 0x3fe3f9, 95) then
        debug("搜索界面--章节")
        if isColor(519, 437, 0x116eb9, 95) then -- 矿
            touchClick(519, 437)
        elseif isColor(661, 435, 0x116eb9, 95) then -- 金属
            touchClick(661, 435)
        elseif isColor(803, 432, 0x116eb9, 95) then -- 三氯气
            touchClick(803, 432)
        elseif isColor(236, 430, 0x116eb9, 95) then -- 海盗
            touchClick(236, 430)
        elseif isColor(375, 435, 0x116eb9, 95) then -- 精英
            touchClick(375, 435)
        end
    end
end

-- 钱包检测
function walletWatch()
    if nowTime - timeWalletWatch >= 10 * 60 then
        debug("钱包检测10分钟一次")
        runApp(appWallet)
        mSleep(1000)
        while true do
            if isColor(1066, 78, 0xb2b2b2, 95) then -- 钱包齿轮
                gaiMuBiaoNew(3, "兑换粒子")
                return true
            elseif isColor(999, 139, 0x00bc0d, 95) then -- 微信图标
                gaiMuBiaoNew(3, "登录钱包")
                return false
            end
            mSleep(1000)
        end
    end
end

-- 登录钱包
function loginWallte()
    if isColor(828, 529, 0x3b5998, 95) and isColor(940, 530, 0x00bc0d, 95) then
        debug("钱包登录界面")
        ShadowrocketToConfigure() -- 切换至配置
        runApp(appWallet)
        mSleep(1000)
        touchClick(741, 346, 0xffffff) -- google
        mSleep(1000)
        touchClick(671, 193, 0x1182fe) -- 继续
        repeat
            mSleep(1000)
        until isColor(219, 595, 0xea4335, 95) and isColor(229, 591, 0x4285f4, 95) and isColor(239, 593, 0x34a853, 95) and
            isColor(187, 639, 0x007aff, 95) == false -- 选择账号
        touchClick(563, 432, 0xffffff)
        for i = 1, 30, 1 do
            if isColor(1066, 78, 0xb2b2b2, 95) then -- 钱包齿轮
                gaiMuBiaoNew(3, "兑换粒子")
                runApp(apps1)
                mSleep(1000)
                break
            end
            if isColor(477, 447, 0xa6a6a6, 95) and isColor(697, 293, 0x949494, 95) and isColor(477, 442, 0x000000, 95) then
                debug("Error")
                closeApp(appWallet)
                gaiMuBiaoNew(3, "钱包检测")
                runApp(appWallet)
                mSleep(1000)
                timeWalletWatch = nowTime - 10 * 60 -- 钱包检测
                break
            end
            if isColor(122, 605, 0x007aff, 95) and isColor(1092, 589, 0xcccccc, 95) and isColor(142, 490, 0x000000, 95) ==
                false then
                debug("登录失败-取消")
                touchClick(122, 605)
                break
            end
            mSleep(1000)
        end
    end
end

-- Shadowrocket 切换至配置
function ShadowrocketToConfigure()
    runApp(appShadowrocket)
    repeat
        mSleep(1000)
    until isColor(1096, 569, 0x2473bd, 95) and isColor(1096, 581, 0xf5f5f5, 95) -- 首页
    touchClick(293, 116, 0x8a8a8a) -- 全局路由
    mSleep(1000)
    touchClick(465, 378, 0xffffff) -- 配置
    mSleep(1000)
    for i = 1, 30, 1 do
        if isColor(206, 131, 0xffffff, 95) then --未连接
            touchClick(206, 131)
        end
        webdata = httpGet("https://www.google.com.hk/") -- 获取百度首页网页数据
        if webdata and webdata ~= "" then
            break
        end
        if i == 30 then
            toast("翻墙失败")
        end
        mSleep(1000)
    end
end

-- Shadowrocket 切换至场景
function ShadowrocketToScenes()
    runApp(appShadowrocket)
    repeat
        mSleep(1000)
    until isColor(1096, 569, 0x2473bd, 95) and isColor(1096, 581, 0xf5f5f5, 95) -- 首页
    touchClick(293, 116, 0x8a8a8a) -- 全局路由
    mSleep(1000)
    touchClick(721, 474, 0xffffff) -- 场景
    mSleep(1000)
    for i = 1, 30, 1 do
        if isColor(206, 131, 0xffffff, 95) then --未连接
            touchClick(206, 131)
        end
        webdata = httpGet("https://www.baidu.com/") -- 获取百度首页网页数据
        if webdata and webdata ~= "" then
            break
        end
        if i == 30 then
            toast("境内失败")
        end
        mSleep(1000)
    end
end

-- 播放音频
function playMusic()
    setVolumeLevel(1)
    local file = userPath() .. "/res/Lapislazuli.mp3"
    local bool = isFileExist(file)
    if bool == false then
        local http_mp3 = "https://cdn.jsdelivr.net/gh/xinqinew/rise-of-stars/Lapislazuli.mp3"
        for i = 1, 10, 1 do
            if isPause == true then
                return
            end
            local code, msg = ts.tsDownload(file, http_mp3, {
                ["tstab"] = 1,
                ["mode"] = true
            })
            if code == 200 then
                debug("下载成功：" .. msg)
                break
            else
                debug("下载失败：" .. msg)
            end
        end
    end
    for i = 1, 10, 1 do
        for j = 1, 5, 1 do
            vibrator(); -- 振动
            mSleep(1000);
        end
        -- mp3 文件已存放在 res 文件夹下直接写文件名称即可
        playAudio("Lapislazuli.mp3")
        mSleep(1000 * 60 * 5)
        -- iOS 停止播放
        playAudio("")
    end
end

--震动提醒
function vibratorNotice()
    if nowDateTime.hour >= 8 then
        for j = 1, 5, 1 do
            vibrator(); -- 振动
            mSleep(1000);
        end
    end
end

-- 开区检测
function openCheck()

    if isColor(62, 42, 0x215da6, 95) and isColor(62, 47, 0x0b58b2, 95) and nowDateTime.hour >= 8 then
        timeXXX = nowTime
        debug("选择宇宙")
        for i = 1, 7, 1 do
            if isPause == true then
                return
            end
            touchClick(205, 147 + 60 * (i - 1), 0x8a6315)
            mSleep(1000)
            if isColor(595, 189, 0x780b12, 95) == false and isColor(595, 182, 0x3a65ab, 95) then
                touchClick(595, 189)
                playMusic()
                dialog("开区了")
            elseif isColor(595, 283, 0x780b12, 95) == false and isColor(595, 276, 0x3965ac, 95) then
                touchClick(595, 283)
                playMusic()
                dialog("开区了")
            elseif isColor(595, 377, 0x780b12, 95) == false and isColor(595, 370, 0x3965ac, 95) then
                touchClick(595, 377)
                playMusic()
                dialog("开区了")
            elseif isColor(595, 472, 0x780b12, 95) == false and isColor(595, 464, 0x3965ac, 95) then
                touchClick(595, 472)
                playMusic()
                dialog("开区了")
            elseif isColor(966, 189, 0x780b12, 95) == false and isColor(966, 182, 0x3965ac, 95) then
                touchClick(966, 189)
                playMusic()
                dialog("开区了")
            elseif isColor(966, 283, 0x780b12, 95) == false and isColor(966, 276, 0x3965ac, 95) then
                touchClick(966, 283)
                playMusic()
                dialog("开区了")
            elseif isColor(966, 377, 0x780b12, 95) == false and isColor(966, 370, 0x3965ac, 95) then
                touchClick(966, 377)
                playMusic()
                dialog("开区了")
            elseif isColor(966, 472, 0x780b12, 95) == false and isColor(966, 464, 0x3965ac, 95) then
                touchClick(966, 472)
                playMusic()
                dialog("开区了")
            end
        end
        if nowTime - timeOpen >= 60 * 60 * 3 then
            closeApp(appXiangMu)
            mSleep(3000)
            runApp(appXiangMu)
            timeOpen = nowTime
            return
        end
    end
end

-- 修船
function fixShip()
    if inside1() then
        if isColor(528, 253, 0x37664f, 95) then
            debug("进航母")
            touchClick(1057, 215, 0x86929d)
        else
            touchClick(1074, 582) -- 出基地
        end
    end
    if outside() then
        debug("回基地--修船")
        touchClick(1074, 582) -- 回基地
        isShipBad = true
    end
end

-- 日常
function everyDayTask()
    if muBiao2 == mb_Wu then
        gaiMuBiaoNew(2, mb_5DaoJu, mm_5DaoJu)
    end
    if muBiao == mb_5DaoJu then
        openBag()
    elseif muBiao == "道具合成" then
        openBag()
    elseif muBiao == mb_CaiJi then
        task_CaiJi()
    elseif muBiao == mb_Reward then
        task_Reward()
    elseif muBiao == mb_JiNeng then
        task_JiNeng()
    end
    if outside() then
        debug("回基地--日常")
        touchClick(1074, 582) -- 回基地
        chongZhiJiDiXianKuang()
    end
end

-- 任务--主动技能
function task_JiNeng()
    if inside1() then
        debug("主动技能")
        if isColor(1093, 82, 0x577ea6, 95) and isColor(1114, 59, 0x354f6a, 95) then
            touchClick(1103, 68, 0x0d1828) -- 展开右上角
            touchClick(681, 172, 0x1c2b3b) -- 主动技能
        end
        if isColor(960, 185, 0x835523, 95) and isColor(1119, 186, 0x835523, 95) then
            debug("技能目录")
            x, y = findMultiColorInRegionFuzzy(0x375297, "14|-4|0x7c5758,14|10|0xa48e9d", 90, 533, 219, 1117, 418)
            if x ~= -1 then
                touchClick(x, y)
                mSleep(1000)
                x, y = findMultiColorInRegionFuzzy(0xf28c07, "131|28|0xf87808", 90, 388, 454, 1126, 628)
                if x ~= -1 then
                    touchClick(x, y)
                    mSleep(1000)
                end
            end

            x, y = findMultiColorInRegionFuzzy(0xc7af1f, "-7|32|0x111515,5|14|0x72303f", 90, 533, 219, 1117, 418)
            if x ~= -1 then
                touchClick(x, y)
                mSleep(1000)
                x, y = findMultiColorInRegionFuzzy(0xf28c07, "131|28|0xf87808", 90, 388, 454, 1126, 628)
                if x ~= -1 then
                    touchClick(x, y)
                    mSleep(1000)
                end
            end

            x, y = findMultiColorInRegionFuzzy(0x5d9cb7, "6|25|0x15497f,25|0|0x151b20", 90, 533, 219, 1117, 418)
            if x ~= -1 then
                touchClick(x, y)
                mSleep(1000)
                x, y = findMultiColorInRegionFuzzy(0xf28c07, "131|28|0xf87808", 90, 388, 454, 1126, 628)
                if x ~= -1 then
                    touchClick(x, y)
                    mSleep(1000)
                end
            end

            x, y = findMultiColorInRegionFuzzy(0x09baff, "13|-33|0x6796a7,26|-18|0xffff52", 90, 533, 219, 1117, 418)
            if x ~= -1 then
                touchClick(x, y)
                mSleep(1000)
                x, y = findMultiColorInRegionFuzzy(0xf28c07, "131|28|0xf87808", 90, 388, 454, 1126, 628)
                if x ~= -1 then
                    touchClick(x, y)
                    mSleep(1000)
                end
            end
            touchClick(1105, 72, 0x0b1625)
            gaiMuBiaoNew(2, mb_Reward, mm_Reward)
        end
    end

end

-- 只做基地
function task_JiDi()
    if inside1() then
        if isColor(528, 253, 0x37664f, 95) then -- 基地归位
            touchClick(583, 277, 0xffffff) -- 打开基地
        elseif isColor(17, 505, 0x3b6890, 95) then -- 1号建设中
            touchClick(44, 493, 0x3e342f)
        elseif isColor(108, 505, 0x3b6890, 95) then -- 2号建设中
            touchClick(133, 491, 0x52433d)
        else
            touchClick(1074, 582) -- 出基地
        end
    end
    if outside() then
        debug("回基地--只做基地")
        touchClick(1074, 582) -- 回基地
        chongZhiJiDiXianKuang()
    end
end

-- 收获
function task_Reward()
    if inside1() then
        debug("收获")
        touchClick(45, 188, 0x060f0f)
    end
end

-- 采集任务
function task_CaiJi()
    if inside1() then
        debug("采集任务")
        touchClick(1015, 71, 0x0d1a2c) -- 基地加成
    end
end

-- 打开背包
function openBag()
    if inside1() then
        debug("打开背包")
        touchClick(963, 591, 0x373b37)
    end
end

-- 定时检测
function timeJianCe()
    duiHuanJianCe()
    if isShengChan == false then
        if nowTime - timeShengChan >= 60 * 60 * 2 then
            isShengChan = true
            timeShengChan = nowTime
        end
        if check15 == "生产加速" then
            isShengChan = true
        end
    end
    if isChongDianKaZiYuan == true then
        if nowTime - timeChongDian >= 4 * 60 * 60 then
            timeChongDian = nowTime
            isChongDianKaZiYuan = false
        end
    end
    if isCheckLiZiNum == true then
        if nowTime - timeCheckLiZiNum >= 1 * 60 * 60 then
            timeCheckLiZiNum = nowTime
            isCheckLiZiNum = false
        end
    end
end

-- 5分钟不见某界面
function checkXXX(...)
    nowTime = os.time()
    if isColor(1020, 545, 0x744218, 95) and isColor(1123, 619, 0x744218, 95) then -- 有右下角的灰色块
        timeXXX = nowTime
    end
    if isColor(69, 23, 0xff6600, 95) and isColor(59, 579, 0x00428c, 95) then -- 左上角有基地现况
        timeXXX = nowTime
    end
    if haoLV == 3 then
        if nowTime - timeXXX >= 5 * 60 then
            if getOut() then
                current_time = os.date("%m-%d_%H.%M", os.time());
                snapshot(iphoneId .. "-" .. current_time .. ".png", 0, 0, 1135, 639); -- 以时间戳命名进行截图
                ftpUpPNG(iphoneId .. "-" .. current_time .. ".png", "OVER/")
                -- ftpUpTSnet2(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/OVER/" .. iphoneId .. "-" .. current_time .. ".png") --上传
                -- ftpUpTsPNG(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/OVER/" .. iphoneId .. "-" .. current_time .. ".png") --上传
                os.remove(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png")
                closeApp(appXiangMu)
                nowTime = os.time()
                timeXXX = nowTime
                zhuXiaoNew()
                return
            end

            -- numDiaoXian = numDiaoXian + 1
            -- writeJson( "numDiaoXian", numDiaoXian)
            -- if numDiaoXian >= 6 then
            --     numDiaoXian = 0
            --     writeJson( "numDiaoXian", numDiaoXian)
            --     numDiaoXianDengDai = numDiaoXianDengDai + 1
            --     writeJson( "numDiaoXianDengDai", numDiaoXianDengDai)
            --     -- dialog("掉线6次,等一小时",60*60)
            -- end

        end
    else
        if nowTime - timeXXX >= 10 * 60 then
            if getOut() then
                current_time = os.date("%m-%d_%H.%M", os.time());
                snapshot(iphoneId .. "-" .. current_time .. ".png", 0, 0, 1135, 639); -- 以时间戳命名进行截图
                ftpUpPNG(iphoneId .. "-" .. current_time .. ".png", "OVER/")
                -- ftpUpTSnet2(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/OVER/" .. iphoneId .. "-" .. current_time .. ".png") --上传
                -- ftpUpTsPNG(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png", "/OVER/" .. iphoneId .. "-" .. current_time .. ".png") --上传
                os.remove(userPath() .. "/res/" .. iphoneId .. "-" .. current_time .. ".png")
                closeApp(appXiangMu)
                nowTime = os.time()
                timeXXX = nowTime
                zhuXiaoNew()
                return
            end
        end
    end
end

-- 任务
function task()
    if inside1() == true then
        -- mSleep(1000)
        if checkRed1() == false then
            if haoLV == 1 then
                -- 主任务
                debug("主任务")
                -- if isColor(99, 212, 0x2a6aab, 95) and isColor(106, 219, 0x2a6aab, 95) and haoLV <= 2 then
                --     debug("展开任务栏")
                --     touchClick(107, 213)
                -- end
                touchClick(47, 187, 0x042121) -- 打开任务栏
                mSleep(1000)
                for i = 1, 10, 1 do
                    if isColor(91, 155, 0xff6600, 95) then
                        break
                    end
                    mSleep(1000)
                end
                return
            end
            if haoLV == 3 then
                gaiMuBiaoNew(1, mb_WaKuang, mm_WaKuang)
                return
            end
            if haoLV == 2 then
                if isKaYouHua == false then
                    gaiMuBiaoNew(1, mb_YouHua, mm_YouHua)
                else
                    debug("卡优化,做主任务")
                    -- if isColor(99, 212, 0x2a6aab, 95) and isColor(106, 219, 0x2a6aab, 95) and haoLV <= 2 then
                    --     debug("展开任务栏")
                    --     touchClick(107, 213)
                    -- end
                    touchClick(47, 187, 0x042121) -- 打开任务栏
                    mSleep(1000)
                    for i = 1, 10, 1 do
                        if isColor(91, 155, 0xff6600, 95) then
                            break
                        end
                        mSleep(1000)
                    end
                    return
                end
                return
            end
        end
    end
end

-- 重置基地现况
function chongZhiJiDiXianKuang()
    gaiMuBiaoNew(3, mb_Wu, mm_Wu)
    timeInside = nowTime

    numSearch = 0
    isLiZi = false -- 粒子
    isJustBack = true
    -- numSearchLiZi = 0
    numSearchLiZiSecond = 20

    if isAgainReward22 == false then
        if nowDateTime.hour >= 22 and nowDateTime.min >= 0 then
            if muBiao == mb_WaKuang then
                gaiMuBiaoNew(1, mb_EveryDay, mm_EveryDay)
                gaiMuBiaoNew(2, mb_Reward, mm_Reward)
                isAgainReward22 = true
                writeJson("再次收获22", isAgainReward22)

                numAddChanLiang = 0
                writeJson("增产", numAddChanLiang)

                isAddChanLiangLiZi = false
                writeJson("增产粒子", isAddChanLiangLiZi)
            end
        end
    end
    if isAgainReward6 == false then
        if nowDateTime.hour >= 6 and nowDateTime.min >= 0 then
            if muBiao == mb_WaKuang then
                gaiMuBiaoNew(1, mb_EveryDay, mm_EveryDay)
                gaiMuBiaoNew(2, mb_Reward, mm_Reward)
                isAgainReward6 = true
                writeJson("再次收获6", isAgainReward6)
            end
        end
    end
    if haoLV == 2 then
        if muBiao == mb_WaKuang and nowTime - timeRound >= 1 * 60 * 60 then
            gaiMuBiaoNew(1, mb_YouHua, mm_YouHua)
            timeRound = nowTime
        end
    end

end

-- 主线
function zhuXian()
    if outside() then
        mSleep(1000)
        -- if isColorPlus(121, 78, 0x3bc6e8, 95) then
        --     debug("有体力")
        --     if nowTime - timeKillPirate >= 10 * 60 then
        --         isKillPirate = true -- 杀海盗
        --         timeKillPirate = nowTime
        --     end
        -- else
        --     debug("无体力")
        --     isKillPirate = false -- 不杀海盗

        -- end
        if isColor(387, 372, 0xa43b40, 95) and isColor(501, 389, 0xa43b40, 95) and isColor(109, 371, 0x00ace4, 95) then
            debug("粒子--左")
            numSearch = numSearch + 1
            touchClick(387, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debug("粒子已在挖")
                isLiZi = true
                touchClick(172, 525) -- 搜索
            end
        elseif isColor(919, 373, 0xa43b40, 95) and isColor(1028, 386, 0xa43b40, 95) and isColor(643, 371, 0x00ace4, 95) then
            debug("粒子--右")
            numSearch = numSearch + 1
            touchClick(919, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debug("粒子已在挖")
                isLiZi = true
                touchClick(172, 525) -- 搜索
            end
        elseif isColor(497, 383, 0x00798c, 95) and isColor(116, 377, 0x00ace4, 95) then
            debug("采集--左")
            numSearch = numSearch + 1
            touchClick(407, 383)
            if isColor(358, 428, 0x1c6db9, 95) and isColor(620, 435, 0x1c6dba, 95) then
                debug("研究才能出4队")
                touchClick(513, 496, 0x0c0c0e)
                touchClick(1074, 582) -- 回基地
                chongZhiJiDiXianKuang()
            end
        elseif isColor(639, 378, 0x00ace4, 95) and isColor(1027, 380, 0x00798c, 95) then
            debug("采集--右")
            numSearch = numSearch + 1
            touchClick(1027, 383)
            if isColor(358, 428, 0x1c6db9, 95) and isColor(620, 435, 0x1c6dba, 95) then
                debug("研究才能出4队")
                touchClick(513, 496, 0x0c0c0e)
                touchClick(1074, 582) -- 回基地
                chongZhiJiDiXianKuang()
            end
        elseif numSearch >= 10 then
            debug("回基地")
            touchClick(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif isColor(1022, 457, 0xffa100, 95) then -- 4队出完
            debug("4队出完")
            touchClick(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        else
            touchClick(1074, 582) -- 回基地
        end
    end
    if isColor(267, 521, 0xdbddec, 95) and isColor(440, 535, 0x3fe3f9, 95) then
        -- if isColor(369, 535, 0x39e3f6, 95) and isColor(197, 521, 0xdbddec, 95) then
        debug("搜索界面--主线")
        if isColor(519, 437, 0x116eb9, 95) then -- 矿
            touchClick(519, 437)
        elseif isColor(661, 435, 0x116eb9, 95) then -- 金属
            touchClick(661, 435)
        elseif isColor(803, 432, 0x116eb9, 95) then -- 三氯气
            touchClick(803, 432)
            -- elseif isColor(878, 432, 0x116eb9, 95) then -- 新金属粒子
            -- touchClick(878, 432)
        elseif isColor(236, 430, 0x116eb9, 95) then -- 海盗
            touchClick(236, 430)
        elseif isColor(375, 435, 0x116eb9, 95) then -- 精英
            touchClick(375, 435)
        elseif isColor(466, 437, 0x0d67b2, 95) then -- 矿--6
            touchClick(466, 437)
        elseif isColor(593, 435, 0x116eb9, 95) then -- 金属
            touchClick(593, 435)
        elseif isColor(733, 428, 0x116eb9, 95) then -- 三氯气
            touchClick(733, 428)
        elseif isColor(878, 432, 0x116eb9, 95) then -- 新金属粒子
            touchClick(878, 432)
        elseif isColor(170, 430, 0x116eb9, 95) then -- 海盗
            touchClick(170, 430)
        elseif isColor(314, 429, 0x116eb9, 95) then -- 精英
            touchClick(314, 429)
        end
    end
    if isColor(8, 23, 0xff9c00, 95) and isColor(16, 25, 0xffffff, 95) and isColor(866, 599, 0xd78b00, 95) and
        isColor(116, 596, 0x517fad, 95) then
        debug("出航界面--主线")
        if isColor(242, 150, 0xffffff, 95) or isColor(226, 149, 0xffffff, 95) then
            debug("无人物")
            touchClick(20, 20)
        end
        if isColor(559, 122, 0x3e6b96, 95) then -- 航母
            touchClick(842, 594, 0xd78b02) -- 出航
            if isColor(508, 426, 0x1c6ebb, 95) then -- 介绍,其他司令官,继续--是
                touchClick(504, 432, 0x1c6eba)
            end
            isLiZi = true -- 粒子
            -- timeLiZi = nowTime
        elseif isColor(634, 157, 0x38b3c8, 95) and isColor(518, 160, 0xa0bfee, 95) and isColor(596, 53, 0x5f9ede, 95) then
            debug("挖粒子,没航母,航母坏了")
            isShipBad = true
            isLiZi = true -- 粒子
            touchClick(20, 20)
            mSleep(1000)
            touchClick(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
            gaiMuBiaoNew(3, mb_FixShip, mm_FixShip)
        elseif isColor(634, 157, 0x102a43, 95) then -- 普通采集 无船可出
            touchClick(20, 20)
            mSleep(1000)
            touchClick(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif isColor(634, 157, 0x38b3ca, 95) then -- 普通采集 有船可出
            touchClick(842, 594, 0xd78b02) -- 出航
            mSleep(1000)
            if isColor(508, 426, 0x1c6ebb, 95) then -- 介绍,其他司令官,继续--否
                touchClick(512, 496, 0x0c0c0e)
                touchClick(20, 20)
            elseif isColor(848, 594, 0xd68b02, 95) then -- 出航失败
                touchClick(20, 20)
            else
                numChuHang = numChuHang + 1 -- 出航编号
                if numChuHang >= 4 then
                    numChuHang = 1
                end
            end
        end
    end
end

--- 出航
function chuHang()
    if inside1() then
        touchClick(1074, 582) -- 出基地
    end

    if isColor(8, 23, 0xff9c00, 95) and isColor(16, 25, 0xffffff, 95) and isColor(866, 599, 0xd78b00, 95) and
        isColor(116, 596, 0x517fad, 95) then
        debug("出航界面--出航")
        if isColor(242, 150, 0xffffff, 95) or isColor(226, 149, 0xffffff, 95) then
            debug("无人物")
            touchClick(20, 20)
        end
        if isColor(559, 122, 0x3e6b96, 95) then -- 航母
            debug("有航母")
            isFalseLiZi2 = false
            touchClick(842, 594, 0xd78b02) -- 出航
            mSleep(1000)
            isLiZi = true -- 粒子


            numTodayDigLiZi = numTodayDigLiZi + 1
            numDigLiZi = numDigLiZi + 1

            if isColor(508, 426, 0x1c6ebb, 95) then -- 介绍,其他司令官,继续--是
                touchClick(504, 432, 0x1c6eba)
            elseif isColor(848, 594, 0xd68b02, 95) then -- 出航失败
                touchClick(20, 20)
                isLiZi = false -- 粒子
                numTodayDigLiZi = numTodayDigLiZi - 1
                numDigLiZi = numDigLiZi - 1
            end
            writeJson("今日粒子次数", numTodayDigLiZi)
            writeJson("粒子总次数", numDigLiZi)

        elseif isColor(634, 157, 0x38b3c8, 95) and isColor(518, 160, 0xa0bfee, 95) and isColor(596, 53, 0x5f9ede, 95) then
            debug("挖粒子,没航母,航母坏了")
            isFalseLiZi2 = false
            isShipBad = true
            isLiZi = true -- 粒子
            touchClick(20, 20)
            mSleep(1000)
            touchClick(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
            gaiMuBiaoNew(3, mb_FixShip, mm_FixShip)
        elseif isColor(634, 157, 0x102a43, 95) then -- 普通采集 无船可出
            debug("普通采集 无船可出")
            touchClick(20, 20)
            mSleep(1000)
            touchClick(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif isColor(634, 157, 0x38b3ca, 95) then -- 普通采集 有船可出
            debug("普通采集 有船可出")
            local temNum = 0
            if isColor(461, 595, 0x396999, 95) then -- 矿
                temNum = 1
            elseif isColor(459, 593, 0x4e4b53, 95) then -- 金属
                temNum = 2
            elseif isColor(463, 596, 0xaebd82, 95) then -- 氯气
                temNum = 3
            end
            touchClick(842, 594, 0xd78b02) -- 出航
            mSleep(1000)
            if isColor(508, 426, 0x1c6ebb, 95) then -- 介绍,其他司令官,继续--否
                touchClick(512, 496, 0x0c0c0e)
                touchClick(20, 20)
            elseif isColor(848, 594, 0xd68b02, 95) then -- 出航失败
                touchClick(20, 20)
            else
                numChuHang = numChuHang + 1 -- 出航编号
                if numChuHang >= 4 then
                    numChuHang = 1
                end
                if temNum == 1 then
                    numTodayDigKuang = numTodayDigKuang + 1
                    writeJson("今日矿物次数", numTodayDigKuang)

                    numDigKuang = numDigKuang + 1
                    writeJson("矿物总次数", numDigKuang)
                elseif temNum == 2 then

                    numTodayDigJinShu = numTodayDigJinShu + 1
                    writeJson("今日金属次数", numTodayDigJinShu)

                    numDigJinShu = numDigJinShu + 1
                    writeJson("金属总次数", numDigJinShu)

                elseif temNum == 3 then

                    numTodayDigLvQi = numTodayDigLvQi + 1
                    writeJson("今日氯气次数", numTodayDigLvQi)

                    numDigLvQi = numDigLvQi + 1
                    writeJson("氯气总次数", numDigLvQi)

                end
            end
        end
    end
    if isColor(267, 521, 0xdbddec, 95) and isColor(440, 535, 0x3fe3f9, 95) then
        -- if isColor(369, 535, 0x39e3f6, 95) and isColor(197, 521, 0xdbddec, 95) then
        debug("搜索界面--出航--无粒子")
        if isKillPirate == true then
            debug("有体力,杀海盗")
            if check23 == "60海盗" and num60Pirate <= 60 then
                num60Pirate = num60Pirate + 1
                writeJson("60海盗", num60Pirate)
                touchClick(284, 539, 0x6d5c5d) -- 海盗
                mSleep(1000)
                for i = 1, 3, 1 do
                    if isColor(235, 427, 0x116eb9, 95) then
                        touchClick(235, 427, 0x116eb9) -- 搜索
                    end
                    mSleep(1000)
                    if isColor(235, 427, 0x116eb9, 95) == false then
                        break
                    end
                    if i == 3 then
                        isKillPirate = false
                    end
                end
            elseif num3Pirate <= 4 or haoLV <= 2 then
                num3Pirate = num3Pirate + 1
                writeJson("每日3海盗", num3Pirate)
                touchClick(284, 539, 0x6d5c5d) -- 海盗
                mSleep(1000)
                for i = 1, 3, 1 do
                    if isColor(235, 427, 0x116eb9, 95) then
                        touchClick(235, 427, 0x116eb9) -- 搜索
                    end
                    mSleep(1000)
                    if isColor(235, 427, 0x116eb9, 95) == false then
                        break
                    end
                    if i == 3 then
                        isKillPirate = false
                    end
                end
            else
                touchClick(442, 536, 0x71e7ff) -- 精英
                mSleep(1000)
                for i = 1, 3, 1 do
                    if isColor(380, 429, 0x116eb9, 95) then
                        touchClick(380, 429, 0x116eb9) -- 搜索
                    end
                    mSleep(1000)
                    if isColor(380, 429, 0x116eb9, 95) == false then
                        break
                    end
                    if i == 3 then
                        isKillPirate = false
                    end
                end
            end
        else
            if haoLV == 3 and isKaSearch == false then
                local numMin = iif(numKuang <= numJinShu, numKuang, numJinShu)
                numMin = iif(numMin <= numLvQi * 6, numMin, numLvQi)
                if check17 == "强制金属" then
                    numMin = numJinShu
                elseif check18 == "强制矿物" then
                    numMin = numKuang
                elseif check19 == "强制氯气" then
                    numMin = numLvQi
                end
                if numMin == numKuang then
                    touchClick(568, 538, 0xef5870) -- 矿物
                    mSleep(1000)
                    touchClick(704, 367, 0xffffff) -- 加
                    touchClick(526, 430, 0x116eb9) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(283, 540, 0x211b1d, 95) then
                            touchClick(431, 366, 0xffffff) -- 减
                            touchClick(526, 430, 0x116eb9) -- 搜索
                            mSleep(1000)
                        else
                            break
                        end
                        if i == 3 then
                            numChuHang = 1
                            isKaSearch = true
                        end
                    end
                elseif numMin == numJinShu then
                    touchClick(711, 548, 0x75493a) -- 金属
                    mSleep(1000)
                    touchClick(846, 367, 0xffffff) -- 加
                    touchClick(661, 433, 0x116eb9) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(283, 540, 0x211b1d, 95) then
                            touchClick(571, 366, 0xffffff) -- 减
                            touchClick(661, 433, 0x116eb9) -- 搜索
                            mSleep(1000)
                        else
                            break
                        end
                        if i == 3 then
                            numChuHang = 2
                            isKaSearch = true
                        end
                    end
                else
                    touchClick(855, 547, 0x282114) -- 三氯气
                    mSleep(1000)
                    touchClick(988, 366, 0xffffff) -- 加
                    touchClick(807, 431, 0x116eb9) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(283, 540, 0x211b1d, 95) then
                            touchClick(716, 366, 0xffffff) -- 减
                            touchClick(807, 431, 0x116eb9) -- 搜索
                            mSleep(1000)
                        else
                            break
                        end
                        if i == 3 then
                            numChuHang = 3
                            isKaSearch = true
                        end
                    end
                end
            else
                if numChuHang == 1 then
                    touchClick(711, 548, 0x75493a) -- 金属
                    mSleep(1000)
                    touchClick(846, 367, 0xffffff) -- 加
                    touchClick(661, 433, 0x116eb9) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(283, 540, 0x211b1d, 95) then
                            touchClick(571, 366, 0xffffff) -- 减
                            touchClick(661, 433, 0x116eb9) -- 搜索
                            mSleep(1000)
                        else
                            isKaSearch = false
                            break
                        end
                        if i == 3 then
                            numChuHang = numChuHang + 1
                        end
                    end
                elseif numChuHang == 2 then
                    if isColor(780 + 71, 541, 0xe0e0e0, 95) then
                        numChuHang = numChuHang + 1
                    else
                        touchClick(855, 547, 0x282114) -- 三氯气
                        mSleep(1000)
                        touchClick(988, 366, 0xffffff) -- 加
                        touchClick(807, 431, 0x116eb9) -- 搜索
                        mSleep(1000)
                        for i = 1, 3, 1 do
                            if isColor(283, 540, 0x211b1d, 95) then
                                touchClick(716, 366, 0xffffff) -- 减
                                touchClick(807, 431, 0x116eb9) -- 搜索
                                mSleep(1000)
                            else
                                isKaSearch = false
                                break
                            end
                            if i == 3 then
                                numChuHang = numChuHang + 1
                            end
                        end
                    end
                elseif numChuHang == 3 then
                    touchClick(568, 538, 0xef5870) -- 矿物
                    mSleep(1000)
                    touchClick(704, 367, 0xffffff) -- 加
                    touchClick(526, 430, 0x116eb9) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(283, 540, 0x211b1d, 95) then
                            touchClick(431, 366, 0xffffff) -- 减
                            touchClick(526, 430, 0x116eb9) -- 搜索
                            mSleep(1000)
                        else
                            isKaSearch = false
                            break
                        end
                        if i == 3 then
                            numChuHang = 1
                        end
                    end
                end
            end
        end
    end
    if isColor(369, 535, 0x39e3f6, 95) and isColor(197, 521, 0xdbddec, 95) then
        debug("搜索界面--出航--有粒子")
        if check23 == "60海盗" and num60Pirate <= 60 then
            num60Pirate = num60Pirate + 1
            writeJson("60海盗", num60Pirate)
            touchClick(209, 541, 0xc0b7bf) -- 海盗
            mSleep(1000)
            for i = 1, 3, 1 do
                if isColor(167, 427, 0x116eb9, 95) then
                    touchClick(217, 429, 0x377ab4) -- 搜索
                end
                mSleep(1000)
                if isColor(303, 431, 0x116eb9, 95) == false then
                    break
                end
                if i == 3 then
                    isKillPirate = false
                end
            end
        elseif isLiZi == false then
            touchClick(925, 561, 0x1f101d) -- 粒子
            mSleep(1000)
            for i = 0, 1, 1 do
                if check20 == "2级粒子" and isFalseLiZi2 == false then
                    if isColor(838, 366, 0xffffff, 95) then --1级
                        touchClick(1059, 366) --  +  2级
                    end
                elseif check20 == "2级粒子" and isFalseLiZi2 == true then
                    if isColor(867, 366, 0xffffff, 95) then --2级
                        touchClick(785, 366) --  -  1级
                    end
                else
                    if isColor(867, 366, 0xffffff, 95) then --2级
                        touchClick(785, 366) --  -  1级
                    end
                end
                if isColor(874, 430, 0x116eb9, 95) then
                    touchClick(925, 431, 0x075ea8) -- 搜索
                end
                mSleep(1000)
                if isColor(786, 366, 0xffffff, 95) == false then
                    break
                end
                mSleep(1000 * 10)
                if i >= 0 then
                    -- isLiZi = true
                    isBug_LiZi = true -- bug 粒子
                    touchClick(20, 20)
                end
            end
        elseif isKillPirate == true then
            debug("有体力,杀海盗")
            if num3Pirate <= 4 or haoLV <= 2 then
                num3Pirate = num3Pirate + 1
                writeJson("每日3海盗", num3Pirate)
                touchClick(209, 541, 0xc0b7bf) -- 海盗
                mSleep(1000)
                for i = 1, 3, 1 do
                    if isColor(167, 427, 0x116eb9, 95) then
                        touchClick(217, 429, 0x377ab4) -- 搜索
                    end
                    mSleep(1000)
                    if isColor(303, 431, 0x116eb9, 95) == false then
                        break
                    end
                    if i == 3 then
                        isKillPirate = false
                    end
                end
            else
                touchClick(358, 537, 0xaecffa) -- 精英
                mSleep(1000)
                for i = 1, 3, 1 do
                    if isColor(307, 430, 0x116eb9, 95) then
                        touchClick(353, 432, 0x075ea8) -- 搜索
                    end
                    mSleep(1000)
                    if isColor(303, 431, 0x116eb9, 95) == false then
                        break
                    end
                    if i == 3 then
                        isKillPirate = false
                    end
                end
            end
        else
            if haoLV == 3 and isKaSearch == false then
                local numMin = iif(numKuang <= numJinShu, numKuang, numJinShu)
                numMin = iif(numMin <= numLvQi * 6, numMin, numLvQi)
                if check17 == "强制金属" then
                    numMin = numJinShu
                elseif check18 == "强制矿物" then
                    numMin = numKuang
                elseif check19 == "强制氯气" then
                    numMin = numLvQi
                end
                if numMin == numKuang then
                    touchClick(500, 545) -- 矿物
                    mSleep(1000)
                    touchClick(633, 365, 0xffffff) -- 加
                    touchClick(508, 431, 0x075ea8) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(369, 535, 0x39e3f6, 95) then
                            touchClick(359, 367, 0xe2e4e8) -- 减
                            touchClick(508, 431, 0x075ea8) -- 搜索
                            mSleep(1000)
                        else
                            break
                        end
                        if i == 3 then
                            numChuHang = 1
                            isKaSearch = true
                        end
                    end
                elseif numMin == numJinShu then
                    touchClick(643, 548) -- 金属
                    mSleep(1000)
                    touchClick(776, 365, 0xffffff) -- 加
                    touchClick(639, 434) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(369, 535, 0x39e3f6, 95) then
                            touchClick(501, 367, 0xe2e4e8) -- 减
                            touchClick(639, 434) -- 搜索
                            mSleep(1000)
                        else
                            break
                        end
                        if i == 3 then
                            numChuHang = 2
                            isKaSearch = true
                        end
                    end
                else
                    touchClick(783, 561, 0x1f101d) -- 三氯气
                    mSleep(1000)
                    touchClick(917, 365, 0xffffff) -- 加
                    touchClick(783, 431, 0x075ea8) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(369, 535, 0x39e3f6, 95) then
                            touchClick(644, 367, 0xe2e4e8) -- 减
                            touchClick(783, 431, 0x075ea8) -- 搜索
                            mSleep(1000)
                        else
                            break
                        end
                        if i == 3 then
                            numChuHang = 3
                            isKaSearch = true
                        end
                    end
                end
            else
                if numChuHang == 1 then
                    touchClick(643, 548) -- 金属
                    mSleep(1000)
                    touchClick(776, 365, 0xffffff) -- 加
                    touchClick(639, 434) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(369, 535, 0x39e3f6, 95) then
                            touchClick(501, 367, 0xe2e4e8) -- 减
                            touchClick(639, 434) -- 搜索
                            mSleep(1000)
                        else
                            break
                        end
                        if i == 3 then
                            numChuHang = numChuHang + 1
                        end
                    end
                elseif numChuHang == 2 then
                    if isColor(780, 541, 0xe0e0e0, 95) then
                        numChuHang = numChuHang + 1
                    else
                        touchClick(783, 561, 0x1f101d) -- 三氯气
                        mSleep(1000)
                        touchClick(917, 365, 0xffffff) -- 加
                        touchClick(783, 431, 0x075ea8) -- 搜索
                        mSleep(1000)
                        for i = 1, 3, 1 do
                            if isColor(369, 535, 0x39e3f6, 95) then
                                touchClick(644, 367, 0xe2e4e8) -- 减
                                touchClick(783, 431, 0x075ea8) -- 搜索
                                mSleep(1000)
                            else
                                break
                            end
                            if i == 3 then
                                numChuHang = numChuHang + 1
                            end
                        end
                    end
                elseif numChuHang == 3 then
                    touchClick(500, 545) -- 矿物
                    mSleep(1000)
                    touchClick(633, 365, 0xffffff) -- 加
                    touchClick(508, 431, 0x075ea8) -- 搜索
                    mSleep(1000)
                    for i = 1, 3, 1 do
                        if isColor(369, 535, 0x39e3f6, 95) then
                            touchClick(359, 367, 0xe2e4e8) -- 减
                            touchClick(508, 431, 0x075ea8) -- 搜索
                            mSleep(1000)
                        else
                            break
                        end
                        if i == 3 then
                            numChuHang = 1
                        end
                    end
                end
            end
        end
    end
    if outside() then
        mSleep(1000)
        if isColor(144, 72, 0x41d9ff, 95) and haoLV >= 3 then -- 30体力
            -- if isColor(147, 80, 0x37b8d8, 95) and haoLV >= 3 then -- 20体力
            -- if isColor(185, 80, 0x37b8d8, 95) and haoLV >= 3 then -- 60体力
            -- if isColorPlus(210, 79, 0x39bfe1,95) then -- 70体力
            debug("有体力")
            if nowTime - timeKillPirate >= 10 * 60 then
                isKillPirate = true -- 杀海盗
                timeKillPirate = nowTime
            end
        else
            debug("无体力")
            isKillPirate = false -- 不杀海盗
        end
        if isColor(210, 377, 0x00ace4, 95) and isColor(267, 378, 0x00798c, 95) and isColor(400, 376, 0xa43b40, 95) then
            debug("粒子--左")
            numSearch = numSearch + 1
            touchClick(387, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debug("粒子已在挖")
                if check20 == "2级粒子" and isFalseLiZi2 == false then
                    isFalseLiZi2 = true
                elseif check20 == "2级粒子" and isFalseLiZi2 == true then
                    isLiZi = true
                else
                    isLiZi = true
                end
                touchClick(172, 525) -- 搜索
            end
        elseif isColor(733, 377, 0x00ace4, 95) and isColor(798, 378, 0x00798c, 95) and isColor(934, 377, 0xa43b40, 95) then
            debug("粒子--右")
            numSearch = numSearch + 1
            touchClick(919, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debug("粒子已在挖")
                if check20 == "2级粒子" and isFalseLiZi2 == false then
                    isFalseLiZi2 = true
                elseif check20 == "2级粒子" and isFalseLiZi2 == true then
                    isLiZi = true
                else
                    isLiZi = true
                end
                touchClick(172, 525) -- 搜索
            end
        elseif isColor(125, 322, 0x6416c3, 95) and isColor(151, 305, 0x6918d9, 95) then
            debug("粒子--左")
            numSearch = numSearch + 1
            touchClick(387, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debug("粒子已在挖")
                if check20 == "2级粒子" and isFalseLiZi2 == false then
                    isFalseLiZi2 = true
                elseif check20 == "2级粒子" and isFalseLiZi2 == true then
                    isLiZi = true
                else
                    isLiZi = true
                end
                touchClick(172, 525) -- 搜索
            end
            if isColor(522, 433, 0x1d6ebc, 95) then
                debug("其他司令官")
                touchClick(522, 433)
            end
        elseif isColor(662, 320, 0x783ede, 95) and isColor(684, 302, 0x6f1bdf, 95) then
            debug("粒子--右")
            numSearch = numSearch + 1
            touchClick(919, 372)
            mSleep(1000)
            if isColor(1092, 79, 0x577ea6, 95) then
                debug("粒子已在挖")
                if check20 == "2级粒子" and isFalseLiZi2 == false then
                    isFalseLiZi2 = true
                elseif check20 == "2级粒子" and isFalseLiZi2 == true then
                    isLiZi = true
                else
                    isLiZi = true
                end
                touchClick(172, 525) -- 搜索
            end
            if isColor(522, 433, 0x1d6ebc, 95) then
                debug("其他司令官")
                touchClick(522, 433)
            end
        elseif isColor(497, 383, 0x00798c, 95) and isColor(116, 377, 0x00ace4, 95) then
            debug("采集--左")
            numSearch = numSearch + 1
            touchClick(407, 383)
            if isColor(358, 428, 0x1c6db9, 95) and isColor(620, 435, 0x1c6dba, 95) then
                debug("研究才能出4队")
                touchClick(513, 496, 0x0c0c0e)
                touchClick(1074, 582) -- 回基地
                chongZhiJiDiXianKuang()
            end
        elseif isColor(639, 378, 0x00ace4, 95) and isColor(1027, 380, 0x00798c, 95) then
            debug("采集--右")
            numSearch = numSearch + 1
            touchClick(1027, 383)
            if isColor(358, 428, 0x1c6db9, 95) and isColor(620, 435, 0x1c6dba, 95) then
                debug("研究才能出4队")
                touchClick(513, 496, 0x0c0c0e)
                touchClick(1074, 582) -- 回基地
                chongZhiJiDiXianKuang()
            end
        elseif numSearch >= 10 then
            debug("回基地")
            touchClick(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif isColor(1022, 457, 0xffa100, 95) then -- 4队出完
            debug("4队出完")
            touchClick(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        elseif isBug_LiZi == true then
            if check23 == "60海盗" and num60Pirate <= 60 and isKillPirate == true then
                touchClick(199, 522) -- 搜索
            else
                searchLiZi()
            end
        else
            if isColor(45, 517, 0xd8e4ee, 95) and isColor(282, 518, 0xe0ecf6, 95) then
                isRewardLiZi()
                if isBug_LiZi == false then
                    touchClick(199, 522) -- 搜索
                end
            elseif isColor(45, 517, 0xd8e4ee, 95) and isColor(282, 518, 0xe0ecf6, 95) == false then
                touchClick(570, 469, 0x4a6181)
            end

        end
    end
end

-- 判断是否有队伍在采集粒子
function isRewardLiZi()
    -- if nowTime - timeLiZi >= 3 * 60 then
    debug("判断是否有队伍在采集粒子--超过3分钟")
    if notWaLiZi == true then
        isLiZi = true
        return true
    end
    if haoLV <= 2 then
        isLiZi = true
        return false
    else
        numLiZiTeam = 0
        -- timeLiZi = nowTime
        if isColor(1115, 242, 0xfefefe, 95) then -- 1队有人
            touchClick(1058, 244, 0xdaa395)
            mSleep(3000)
            debug("1队有人")
            if isColor(129, 287, 0xb44aec, 95) or isColor(662, 287, 0xb44aec, 95) then
                touchClick(20, 20) -- 瞎点一下
                -- mSleep(1000)
                if isColor(9, 10, 0xff9c00, 95) then
                    debug("误开司令官")
                    touchClick(20, 20)
                    -- mSleep(1000)
                end
                numLiZiTeam = numLiZiTeam + 1
                if numLiZiTeam >= tonumber(numShip) then
                    if check16 ~= "vip8" then
                        debug("isBug_LiZi = false")
                        isBug_LiZi = false -- bug 粒子
                    end
                    debug("isLiZi = true")
                    isLiZi = true
                    return true
                end
            end
        end
        if isColor(1115, 304, 0xfefefe, 95) then -- 2队有人
            touchClick(1058, 300, 0xdaa395)
            mSleep(3000)
            debug("2队有人")
            if isColor(129, 287, 0xb44aec, 95) or isColor(662, 287, 0xb44aec, 95) then
                touchClick(20, 20) -- 瞎点一下
                -- mSleep(1000)
                if isColor(9, 10, 0xff9c00, 95) then
                    debug("误开司令官")
                    touchClick(20, 20)
                    -- mSleep(1000)
                end
                numLiZiTeam = numLiZiTeam + 1
                if numLiZiTeam >= tonumber(numShip) then
                    if check16 ~= "vip8" then
                        isBug_LiZi = false -- bug 粒子
                    end
                    isLiZi = true
                    return true
                end
            end
        end
        if isColor(1115, 367, 0xfefefe, 95) then -- 3队有人
            touchClick(1058, 364, 0xdaa395)
            mSleep(3000)
            debug("3队有人")
            if isColor(129, 287, 0xb44aec, 95) or isColor(662, 287, 0xb44aec, 95) then
                touchClick(20, 20) -- 瞎点一下
                -- mSleep(1000)
                if isColor(9, 10, 0xff9c00, 95) then
                    debug("误开司令官")
                    touchClick(20, 20)
                    -- mSleep(1000)
                end
                numLiZiTeam = numLiZiTeam + 1
                if numLiZiTeam >= tonumber(numShip) then
                    isLiZi = true
                    if check16 ~= "vip8" then
                        isBug_LiZi = false -- bug 粒子
                    end
                    return true
                end
            end
        end
        touchClick(20, 20) -- 瞎点一下
        -- mSleep(1000)
        if isColor(9, 10, 0xff9c00, 95) then
            debug("误开司令官")
            touchClick(20, 20)
            -- mSleep(1000)
        end
        if check16 ~= "vip8" then
            isBug_LiZi = true -- bug 粒子
        end
        isLiZi = false
        return false
    end
    -- else
    --     isLiZi = true
    --     return true
    -- end
    -- return false
end

-- 搜索粒子
function searchLiZi()
    for i = 1, numSearchLiZiSecond, 1 do
        if isPause == true then
            return
        end

        nowTime = os.time();
        timeXXX = nowTime

        -- debug("搜索粒子")
        if isColor(297, 107, 0x215da6, 95) and isColor(835, 585, 0x215da6, 95) and isColor(556, 551, 0x145da9, 95) then
            debug("未知信号")
            touchClick(511, 605, 0x0c0c0e)
        end
        if isColor(6, 24, 0xf59600, 95) and isColor(18, 24, 0xffffff, 95) and isColor(355, 86, 0x5195db, 95) then
            debug("司令官界面")
            touchClick(20, 20)
        end
        if isColor(45, 517, 0xd8e4ee, 95) and isColor(282, 518, 0xe0ecf6, 95) == false then
            debug("外太空")
            touchClick(571, 467, 0x05305c)
        end
        if isColor(180, 147, 0x215da6, 95) and isColor(202, 204, 0x4c92da, 95) and isColor(503, 515, 0x233341, 95) and
            isColor(741, 516, 0x2f2a33, 95) then
            debug("外太空玩家1")
            touchClick(511, 600, 0x0c0c0e)
            touchClick(571, 467, 0x05305c)
        end
        if isColor(493, 436, 0x1c6dba, 95) then
            debug("蓝色确认")
            touchClick(493, 436)
        end
        if isColor(331, 219, 0x2a6aab, 95) and isColor(337, 212, 0x2a6aab, 95) then
            debug("任务栏误开")
            touchClick(331, 219)
        end
        local intX1 = 1
        for k = 1, 50, 1 do
            if isPause == true then
                return
            end
            if isColor(1019, 544, 0x744218, 95) == false then
                debug("搜索时卡bug")
                break
            end
            x0, y0 = findColorInRegionFuzzy(0xf8c328, 95, intX1, 100, 1020, 540) -- 黄色图标
            -- debug("x0,y0 :"..x0..","..y0)
            if x0 ~= -1 then
                if check20 == "2级粒子" then
                    x, y = tsFindText(index_lizi2, "2", x0 - 1, y0 - 1, x0 + 25, y0 + 25, "FAC52A , 030303", 94) -- 竖着从左至右全屏扫
                else
                    x, y = tsFindText(index_lizi1, "1", x0 - 1, y0 - 1, x0 + 25, y0 + 25, "FAC52A , 030303", 94) -- 竖着从左至右全屏扫
                end
                if x ~= -1 then
                    touchClick(x + 48, y - 23)
                    mSleep(500)
                    -- x5, y5 = findMultiColorInRegionFuzzy(0xa43b40, "-14|0|0x00798c,119|-105|0xd7d9dc", 90, 66, 14, 1126, 529)--红攻击 不抢
                    -- x6, y6 = findMultiColorInRegionFuzzy(0xa43b40, "-14|0|0x00798c,119|-106|0xd6d8db", 90, 66, 14, 1126, 529)--红攻击 不抢
                    x1, y1 = findMultiColorInRegionFuzzy(0xa43b40, "-14|29|0x00798c,-265|-70|0x9e6eed", 80, 66, 14,
                        1126, 529) -- 红攻击 抢
                    x2, y2 = findMultiColorInRegionFuzzy(0x00798c, "-195|-69|0x8446e5,-14|0|0x00ace4", 90, 66, 14, 1126,
                        529) -- 蓝采集
                    if x1 ~= -1 then
                        debug("红色攻击")
                        if check13 == "抢粒子" then -- 抢
                            touchClick(x1, y1)
                            isBug_LiZi = false
                            -- numSearchLiZi = 0
                            numSearchLiZi = numSearchLiZi + 1
                            if numSearchLiZi == 7 then
                                numSearchLiZi = 0
                            end
                            writeJson("粒子方向", numSearchLiZi)
                            isLiZi = true
                            if isColor(490, 431, 0x1d6eb9, 95) then -- 抢
                                touchClick(490, 431)
                            end
                            return
                        else
                            x3, y3 = findColorInRegionFuzzy(0xff0000, 95, x1 + 20, y1 - 113, x1 + 124, y1 - 101) -- 红名玩家
                            if x3 ~= -1 and y3 ~= -1 then
                                debug("不打红名")
                                touchClick(20, 20) -- 瞎点一下
                                -- mSleep(1000)
                                if isColor(9, 10, 0xff9c00, 95) then
                                    debug("误开司令官")
                                    touchClick(20, 20)
                                    -- mSleep(1000)
                                end
                            else -- 白名玩家
                                debug("打白名")
                                touchClick(x1, y1)
                                isBug_LiZi = false
                                -- numSearchLiZi = 0
                                numSearchLiZi = numSearchLiZi + 1
                                if numSearchLiZi == 7 then
                                    numSearchLiZi = 0
                                end
                                writeJson("粒子方向", numSearchLiZi)
                                isLiZi = true
                                if isColor(490, 431, 0x1d6eb9, 95) then -- 抢
                                    touchClick(490, 431)
                                end
                                return
                            end
                        end
                    elseif x2 ~= -1 then
                        debug("蓝色采集")
                        touchClick(x2, y2)
                        isBug_LiZi = false
                        -- numSearchLiZi = 0
                        numSearchLiZi = numSearchLiZi + 1
                        if numSearchLiZi == 7 then
                            numSearchLiZi = 0
                        end
                        writeJson("粒子方向", numSearchLiZi)
                        isLiZi = true
                        return
                    elseif isColor(1106, 574, 0xd88b00, 95) then
                        debug("这是海盗,不是粒子")
                        mSleep(1000)
                        touchClick(20, 20)
                        mSleep(1000)
                    else
                        debug("没找到")
                        touchClick(20, 20) -- 瞎点一下
                        -- mSleep(1000)
                        if isColor(9, 10, 0xff9c00, 95) then
                            debug("误开司令官")
                            touchClick(20, 20)
                            -- mSleep(1000)
                        end
                    end
                end
                intX1 = x0 + 16

            else

                if numSearchLiZi == 0 then -- 上
                    touchMoveXY(504, 101, 511, 603 - 100)
                elseif numSearchLiZi == 1 then -- 下
                    touchMoveXY(511, 530, 504, 25 + 100)
                elseif numSearchLiZi == 2 then -- 左
                    touchMoveXY(17, 297, 874 - 200, 282)
                elseif numSearchLiZi == 3 then -- 右
                    touchMoveXY(874, 282, 17 + 200, 297)
                elseif numSearchLiZi == 4 then -- 左上
                    touchMoveXY(107, 130, 983 - 200, 503 - 100)
                elseif numSearchLiZi == 5 then -- 右上
                    touchMoveXY(885, 117, 16 + 200, 478 - 100)
                elseif numSearchLiZi == 6 then -- 右下
                    touchMoveXY(983, 503, 107 + 200, 130 + 100)
                elseif numSearchLiZi == 7 then -- 左下
                    touchMoveXY(16, 478, 885 - 200, 117 + 100)
                end
                -- mSleep(500)
                if i == numSearchLiZiSecond then
                    touchClick(568, 569, 0x0a0a0f) -- 归位
                    mSleep(1000)
                    numSearchLiZi = numSearchLiZi + 1
                    if numSearchLiZi == 7 then
                        numSearchLiZi = 0
                        isLiZi = true
                        isBug_LiZi = false
                    end
                    writeJson("粒子方向", numSearchLiZi)
                end
                break
            end
        end

        --[[
        local intX0 = 1
        for j = 1, 10, 1 do
            if isColor(1019, 544, 0x744218, 95) == false then
                debug("搜索时卡bug")
                break
            end
            -- 1: 0,0,0,0 范围坐标，请自行修改
            -- 2: "FAC52A , 030303" 偏色,多组或单组.请在偏色列表中选择
            -- 3: 90 匹配精度 【0-100】
            -- x1, y1 = tsFindText(index_lizi2, "1", 123, 145, 535 + 20, 310 + 20, "FAC52A , 030303", 94)
            -- x2, y2 = tsFindText(index_lizi2, "1", 535 - 20, 145, 1020, 310 + 20, "FAC52A , 030303", 94)
            -- x3, y3 = tsFindText(index_lizi2, "1", 5, 310 - 20, 535 + 20, 492, "FAC52A , 030303", 94)
            -- x4, y4 = tsFindText(index_lizi2, "1", 535 - 20, 310 - 20, 1020, 531, "FAC52A , 030303", 94)
            -- x, y = tsFindText(index_lizi2, "1", 123, 145, 893, 474, "FAC52A , 030303", 94)
            -- x, y = tsFindText(index_lizi1, "1", 123, 145, 893, 474, "775D13 , 4D3D0F", 90)
            local timeQian = os.time()
            x, y = tsFindText(index_lizi2, "1", intX0, 100, 1020, 540, "FAC52A , 030303", 94) -- 竖着从左至右全屏扫
            local timeQH = os.time() - timeQian
            debug("找字时间:" .. timeQH)
            if x ~= -1 then
                touchClick(x + 48, y - 23)
                mSleep(500)
                -- x5, y5 = findMultiColorInRegionFuzzy(0xa43b40, "-14|0|0x00798c,119|-105|0xd7d9dc", 90, 66, 14, 1126, 529)--红攻击 不抢
                -- x6, y6 = findMultiColorInRegionFuzzy(0xa43b40, "-14|0|0x00798c,119|-106|0xd6d8db", 90, 66, 14, 1126, 529)--红攻击 不抢
                x1, y1 = findMultiColorInRegionFuzzy(0xa43b40, "-14|29|0x00798c,-265|-70|0x9e6eed", 80, 66, 14, 1126,
                    529) -- 红攻击 抢
                x2, y2 =
                    findMultiColorInRegionFuzzy(0x00798c, "-195|-69|0x8446e5,-14|0|0x00ace4", 90, 66, 14, 1126, 529) -- 蓝采集
                if x1 ~= -1 then
                    debug("红色攻击")
                    if check13 == "抢粒子" then -- 抢
                        touchClick(x1, y1)
                        isBug_LiZi = false
                        -- numSearchLiZi = 0
                        numSearchLiZi = numSearchLiZi + 1
                        if numSearchLiZi == 7 then
                            numSearchLiZi = 0
                        end
                        writeJson( "粒子方向", numSearchLiZi)
                        isLiZi = true
                        if isColor(490, 431, 0x1d6eb9, 95) then -- 抢
                            touchClick(490, 431)
                        end
                        return
                    else
                        x3, y3 = findColorInRegionFuzzy(0xff0000, 95, x1 + 20, y1 - 113, x1 + 124, y1 - 101) -- 红名玩家
                        if x3 ~= -1 and y3 ~= -1 then
                            debug("不打红名")
                            touchClick(20, 20) -- 瞎点一下
                            -- mSleep(1000)
                            if isColor(9, 10, 0xff9c00, 95) then
                                debug("误开司令官")
                                touchClick(20, 20)
                                -- mSleep(1000)
                            end
                        else -- 白名玩家
                            debug("打白名")
                            touchClick(x1, y1)
                            isBug_LiZi = false
                            -- numSearchLiZi = 0
                            numSearchLiZi = numSearchLiZi + 1
                            if numSearchLiZi == 7 then
                                numSearchLiZi = 0
                            end
                            writeJson( "粒子方向", numSearchLiZi)
                            isLiZi = true
                            if isColor(490, 431, 0x1d6eb9, 95) then -- 抢
                                touchClick(490, 431)
                            end
                            return
                        end
                    end
                elseif x2 ~= -1 then
                    debug("蓝色采集")
                    touchClick(x2, y2)
                    isBug_LiZi = false
                    -- numSearchLiZi = 0
                    numSearchLiZi = numSearchLiZi + 1
                    if numSearchLiZi == 7 then
                        numSearchLiZi = 0
                    end
                    writeJson( "粒子方向", numSearchLiZi)
                    isLiZi = true
                    return
                elseif isColor(1106, 574, 0xd88b00, 95) then
                    debug("这是海盗,不是粒子")
                    mSleep(1000)
                    touchClick(20, 20)
                    mSleep(1000)
                else
                    debug("没找到")
                    touchClick(20, 20) -- 瞎点一下
                    -- mSleep(1000)
                    if isColor(9, 10, 0xff9c00, 95) then
                        debug("误开司令官")
                        touchClick(20, 20)
                        -- mSleep(1000)
                    end
                end
                intX0 = x + 10
            else
                if numSearchLiZi == 0 then -- 上
                    touchMoveXY(504, 101, 511, 603 - 100)
                elseif numSearchLiZi == 1 then -- 下
                    touchMoveXY(511, 530, 504, 25 + 100)
                elseif numSearchLiZi == 2 then -- 左
                    touchMoveXY(17, 297, 874 - 200, 282)
                elseif numSearchLiZi == 3 then -- 右
                    touchMoveXY(874, 282, 17 + 200, 297)
                elseif numSearchLiZi == 4 then -- 左上
                    touchMoveXY(107, 130, 983 - 200, 503 - 100)
                elseif numSearchLiZi == 5 then -- 右上
                    touchMoveXY(885, 117, 16 + 200, 478 - 100)
                elseif numSearchLiZi == 6 then -- 右下
                    touchMoveXY(983, 503, 107 + 200, 130 + 100)
                elseif numSearchLiZi == 7 then -- 左下
                    touchMoveXY(16, 478, 885 - 200, 117 + 100)
                end
                -- mSleep(500)
                if i == numSearchLiZiSecond then
                    touchClick(568, 569, 0x0a0a0f) -- 归位
                    mSleep(1000)
                    numSearchLiZi = numSearchLiZi + 1
                    if numSearchLiZi == 7 then
                        numSearchLiZi = 0
                        isLiZi = true
                        isBug_LiZi = false
                    end
                    writeJson( "粒子方向", numSearchLiZi)
                end
                break
            end
        end
        --]]
    end
end

-- 退出
function getOut()
    for i = 1, 10, 1 do
        if isPause == true then
            return
        end
        if isColor(7, 24, 0xff9c00, 95) then
            touchClick(20, 20)
            mSleep(1000)
        else
            return true
        end
    end
    return false
end

-- 找红图
function findRed()
    x, y = findImage("red.bmp", 355, 253, 403, 351);  -- 在（0,0）到（w-1,h-1）寻找刚刚截图的图片
    if x ~= -1 and y ~= -1 then -- 如果在指定区域找到某图片符合条件
        return true
    else -- 如果找不到符合条件的图片
        return false
    end
end

-- 挖矿
function waKuang()
    if inside1() == true then
        mSleep(1000)
        if checkRed1() == false then
            if isColor(212, 107, 0x5fe4e7, 95) then -- 有基地现况图标
                touchClick(213, 107)
            end
        end
    end
    if outside() then
        if muBiao == mb_ChuHang then

        else
            debug("目标挖矿,回基地")
            touchClick(1074, 582) -- 回基地
            chongZhiJiDiXianKuang()
        end
    end
    if isColor(69, 23, 0xff6600, 95) and isColor(92, 37, 0xb4c0ce, 95) and isColor(173, 44, 0x9eabbb, 95) then
        -- debug("基地现况界面--函数挖矿")
        if isColor(94, 325, 0x306090, 95) then -- 4号休息中
            debug("4号休息中,出航")
            touchClick(94, 325)
            if isColor(94, 325, 0x306090, 95) then -- 4号出航失败

            else
                gaiMuBiaoNew(3, mb_ChuHang, mm_ChuHang)
            end
        elseif isColor(338, 208, 0x306090, 95) then -- 3号休息中
            debug("3号休息中,出航")
            touchClick(338, 208, 0x306090)
            if isColor(338, 208, 0x306090, 95) then -- 3号出航失败

            else
                gaiMuBiaoNew(3, mb_ChuHang, mm_ChuHang)
            end

        elseif isColor(215, 208, 0x306090, 95) then -- 2号休息中
            debug("2号休息中,出航")
            touchClick(215, 208, 0x306090)
            if isColor(215, 208, 0x306090, 95) then -- 2号出航失败

            else
                gaiMuBiaoNew(3, mb_ChuHang, mm_ChuHang)
            end
        elseif isColor(92, 207, 0x306090, 95) then -- 1号休息中
            debug("1号休息中,出航")
            touchClick(92, 207, 0x306090)
            if isColor(92, 207, 0x306090, 95) then -- 1号出航失败

            else
                gaiMuBiaoNew(3, mb_ChuHang, mm_ChuHang)
            end

        elseif nowTime - timeInside >= 5 * 60 then
            touchClick(510, 608, 0x0c0c0e)
            timeInside = nowTime
        end
    end
end

-- 基地内
function inside1(...)
    isXiaoHao()
    if isColor(1019, 544, 0x754218, 95) and isColor(1124, 618, 0x734119, 95) and isColor(1031, 577, 0xffffff, 95) then
        -- debug("室内")
        if check21 == "自动切换梯子" and strVpnModel == "配置" then
            autoChangeVPN("场景")
            strVpnModel = "场景"
            runApp(appXiangMu)
            mSleep(1000)
        end
        if isColor(0, 0, 0x9f2d3d, 80) and isColor(1135, 639, 0x991517, 80) then
            debug("被攻击")
            if haoLV == 3 and check12 ~= "不挖粒子" then
                if timeBeAttack2 == 0 then
                    timeBeAttack2 = nowTime
                elseif nowTime - timeBeAttack2 >= 2 * 60 then
                    vibratorNotice()
                    timeBeAttack2 = 0
                end
            end
            if nowTime - timeBeAttack >= 60 then
                timeBeAttack = nowTime
                touchClick(1074, 582) -- 出基地
                return false
            end
        end
        if isColor(1104, 130, 0x369469, 95) == false and isColor(1129, 102, 0x9e1111, 95) then
            debug("验证码--红点")
            touchClick(1096, 137, 0x191d1b)
        elseif isColor(1050, 106, 0x9e1111, 95) and isColor(1033, 115, 0x3f9fd8, 95) then
            debug("验证码--红点")
            touchClick(1033, 137)
        elseif isColor(1104, 130, 0x369469, 95) and isColor(1125, 106, 0x9e1111, 95) then
            -- debug("航母--红点")
        end
        if numYunDaMa ~= 0 then
            numYunDaMa = 0
        end
        if isColor(335, 213, 0x2a6aab, 95) and isColor(335, 226, 0x2a6aab, 95) then
            debug("收缩任务栏")
            touchClick(335, 213)
        end
        -- if isColor(99, 212, 0x2a6aab, 95) and isColor(106, 219, 0x2a6aab, 95) and muBiao == mb_ZhuXian then
        --     debug("展开任务栏")
        --     touchClick(107, 213)
        -- end
        nowTime = os.time()
        timeXXX = nowTime
        return true
    else
        return false
    end
end

-- 基地外
function outside(...)
    if isColor(1019, 544, 0x754218, 95) and isColor(1124, 618, 0x734119, 95) and isColor(1039, 574, 0xf0f0f1, 95) then
        -- debug("室外")
        if check21 == "自动切换梯子" and strVpnModel == "配置" then
            autoChangeVPN("场景")
            strVpnModel = "场景"
            runApp(appXiangMu)
            mSleep(1000)
        end
        if isColor(0, 0, 0x9f2d3d, 80) and isColor(1135, 639, 0x991517, 80) then
            debug("被攻击")
            if haoLV == 3 and check12 ~= "不挖粒子" then
                if timeBeAttack2 == 0 then
                    timeBeAttack2 = nowTime
                elseif nowTime - timeBeAttack2 >= 2 * 60 then
                    vibratorNotice()
                    timeBeAttack2 = 0
                end
            end
            if nowTime - timeBeAttack >= 60 then
                timeBeAttack = nowTime
                touchClick(1074, 582) -- 回基地
                return false
            end
        end
        if isColor(1104, 130, 0x369469, 95) == false and isColor(1129, 102, 0x9e1111, 95) then
            debug("验证码--红点")
            touchClick(1096, 137, 0x191d1b)
        elseif isColor(1050, 106, 0x9e1111, 95) and isColor(1033, 115, 0x3f9fd8, 95) then
            debug("验证码--红点")
            touchClick(1033, 137)
        elseif isColor(1104, 130, 0x369469, 95) and isColor(1125, 106, 0x9e1111, 95) then
            debug("航母--红点")
        end
        if isColor(335, 213, 0x2a6aab, 95) and isColor(335, 226, 0x2a6aab, 95) then
            debug("收缩任务栏")
            touchClick(335, 213)
        end
        -- if isColor(99, 212, 0x2a6aab, 95) and isColor(106, 219, 0x2a6aab, 95) and muBiao == mb_ZhuXian then
        --     debug("展开任务栏")
        --     touchClick(107, 213)
        -- end
        if isColor(1053, 199, 0xffffff, 95) and isColor(1068, 193, 0xffffff, 95) then
            debug("收缩队伍")
            touchClick(1068, 193, 0xffffff)
        end
        nowTime = os.time()
        timeXXX = nowTime
        return true
    else
        return false
    end
end

-- 每日重置
function everyDayInit(...)
    -- if nowDateTime.day ~= nowDayNight and nowDateTime.hour >= 23 and nowDateTime.min >= 55 then
    --     debug("晚重置")
    --     nowDayNight = nowDateTime.day
    --     writeJson( "日期晚", nowDayNight)
    --     numJiaoYi = 0
    --     writeJson( "交易次数", numJiaoYi)
    --     numJiaoYiChaoShi = 0
    --     writeJson( "交易超时", numJiaoYiChaoShi)
    -- end
    -- if numQuanShu ~= 0 then
    -- local tmpXuanXiang = string.find(duoXuan1, "1")
    -- if tmpXuanXiang ~= nil then
    if nowDateTime.day ~= nowDay then
        if nowDateTime.hour >= 9 and nowDateTime.min >= 0 then
            debug("9点0分重置")

            -- closeApp(appXiangMu)

            isBuyLiZi = true
            numZiYuan = 1
            numKaiFa = 1
            numFangYu = 1
            numShengChan = 1
            numJingRui = 1
            numZhanJian = 1
            isOverHelp = false --协助已完成


            numTodayExit = 0
            writeJson("今日闪退次数", numTodayExit)

            nowDay = nowDateTime.day
            writeJson("日期", nowDay)

            numDay = numDay + 1
            writeJson("第几天", numDay)

            numGuangGao = 0
            writeJson("广告次数", numGuangGao)

            numZiYuanDuiHuan = 0
            writeJson("资源传输装置兑换次数", numZiYuanDuiHuan)

            numChuanShu = 0
            writeJson("传输次数", numChuanShu)

            isTrade = false
            writeJson("交易行", isTrade)

            num5DaoJu = 0
            writeJson("每日5道具", num5DaoJu)

            isMixedThing = false
            writeJson("每日道具合成", isMixedThing)

            numAddChanLiang = 0
            writeJson("增产", numAddChanLiang)

            isAddChanLiangLiZi = false
            writeJson("增产粒子", isAddChanLiangLiZi)

            isAgainReward22 = false
            writeJson("再次收获22", isAgainReward22)

            isAgainReward6 = false
            writeJson("再次收获6", isAgainReward6)

            num60Pirate = 0
            writeJson("60海盗", num60Pirate)

            num3Pirate = 0
            writeJson("每日3海盗", num3Pirate)

            isKaYouHua = false
            writeJson("卡优化", isKaYouHua)

            isZhengLi = false
            writeJson("整理", isZhengLi)

            isEatEXP = false
            writeJson("吃经验", isEatEXP)

            isYanJiuZiYuan = true
            writeJson("研究资源", isYanJiuZiYuan)

            isYanJiuKaiFa = true
            writeJson("研究开发", isYanJiuKaiFa)

            isYanJiuFangYu = true
            writeJson("研究防御", isYanJiuFangYu)

            isYanJiuShengChan = true
            writeJson("研究生产", isYanJiuShengChan)

            isYanJiuJingRui = true
            writeJson("研究精锐", isYanJiuJingRui)

            isYanJiuZhanJian = true
            writeJson("研究战舰", isYanJiuZhanJian)

            isYanJiu = true
            writeJson("研究", isYanJiu)

            numTodayDigKuang = 0
            writeJson("今日矿物次数", numTodayDigKuang)

            numTodayDigJinShu = 0
            writeJson("今日金属次数", numTodayDigJinShu)

            numTodayDigLvQi = 0
            writeJson("今日氯气次数", numTodayDigLvQi)

            numTodayDigLiZi = 0
            writeJson("今日粒子次数", numTodayDigLiZi)

            if haoLV == 3 then
                gaiMuBiaoNew(1, mb_EveryDay, mm_EveryDay)
                gaiMuBiaoNew(2, mb_Wu, mm_Wu)
                gaiMuBiaoNew(3, mb_Wu, mm_Wu)
            end

            -- today = tonumber(os.date("%w",os.time()))
            -- if today == 1 then --如果是星期一
            --         if APP1.isZhuZhan == 2 then
            --                 APP1.isZhuZhan = 1
            --                 writePlist(userPath() .. "/lua/"..xiangMu..".plist","助战1",APP1.isZhuZhan)
            --         end
            --         if APP2.isZhuZhan == 2 then
            --                 APP2.isZhuZhan = 1
            --                 writePlist(userPath() .. "/lua/"..xiangMu..".plist","助战2",APP2.isZhuZhan)
            --         end
            --         if APP1.isJiFenDuiHuan == 1 then
            --                 APP1.isJiFenDuiHuan = 0
            --                 writePlist(userPath() .. "/lua/"..xiangMu..".plist","积分兑换1",APP1.isJiFenDuiHuan)
            --         end
            --         if APP2.isJiFenDuiHuan == 1 then
            --                 APP2.isJiFenDuiHuan = 0
            --                 writePlist(userPath() .. "/lua/"..xiangMu..".plist","积分兑换2",APP2.isJiFenDuiHuan)
            --         end
            -- end
            -- closeApp(appXiangMu)
            -- numJiaoSe = 0
            -- writeJson( "角色", numJiaoSe)
            -- huanJiaoSeChongZhi()
            -- timeMaiLan = nowTime
            -- writeJson( "timeMaiLan", timeMaiLan)

            -- isWeiXinWeiHu = false
            -- writeJson( "微信维护", isWeiXinWeiHu)
            -- hourWeiXin = random(10, 22)
            -- minWeiXin = random(1, 50)
            -- writeJson( "时", hourWeiXin)
            -- writeJson( "分", minWeiXin)

            -- gaiMuBiaoNew(1, mb_YouHua, mm_YouHua)
        end
    end
    -- end
    -- end
end

-- 小号判定
function isXiaoHao()
    if haoLV == 1 then
        if isColor(220, 92, 0x6e8598, 95) then
            haoLV = 2
        end
    end
end

-- 识字--数字
-- function ocrNumbers()

-- 请自行更改参数
-- 1: 0,0,0,0 范围坐标，请自行修改
-- 2: "B5B6BD , 4A4A42" 偏色,多组或单组.请在偏色列表中选择
-- 3: 90 匹配精度 【0-100】

-- ret_num = tsOcrText(index_num, 947, 15, 1015, 30, "B5B6BD,4A4A42", 90)
-- debug("粒子:" .. ret_num)

-- end

-- 识数
function OCR_num()
    -- 光学识字
    -- numLiZi = ocrText(947, 15, 1005, 30, 0, "0123456789.")
    -- debug("粒子:" .. numLiZi)

    -- 大漠识字
    -- 相同字库只需要加载一次，重复加载会导致内存溢出
    -- 由于大漠工具的 11 行像素限制，对于较大文字识别效率不高，推荐使用触动字库工具配合触动文字识别函数使用效果更佳
    -- numLiZi = dmOcrText(dm_num, 947, 15, 1017, 30, "D7D7DB , 282824", 90)
    -- debug(numLiZi)

    -- by新版不支持
    -- by.UseDict(dictNum)
    -- numLiZi = by.Ocr(947, 16, 1017, 28, 0xdadade, 0x252521, 0.9) -- 粒子
    -- debug(text)
    -- return text
    -- numLiZi = shiZi(dm_num,947, 16, 1017, 28, 0xdadade,0x252521,85)
    -- debug(numLiZi)
    -- local tmpYinLiang = shiZi(dm_num,87, 522, 769, 542,0xdcdee1,0x333333,85)

    -- 触动识字
    -- numLiZi = tsOcrText(index_cd_num, 947, 15, 1015, 30, "D7D7DB , 282824", 90)
    -- debug(numLiZi)

    -- 百度识字
    -- local pic_name = userPath() .. "/res/baiduAI.jpg"
    -- snapshot(pic_name, 947, 15, 1015, 30)
    -- mSleep(1000)
    -- --tab 参数仅支持 v1.3.3 及其以上版本 TSLib
    -- local tab={
    --     language_type="ENG",
    --     detect_direction="false",
    --     detect_language="false",
    --     paragraph="false",
    --     probability="false",
    --     ocrType = 1
    -- }
    -- local code1, access_token = getAccessToken(baidu_API, baidu_Secret)
    -- if code1 then
    --     -- debug("获取成功:" .. access_token)
    --     local code2, body = baiduAI(access_token, pic_name, tab)
    --     if code2 then
    --         debug("识别成功\n" .. body)
    --     else
    --         debug("识别失败\n" .. body)
    --     end
    -- else
    --     debug("获取失败:" .. access_token)
    -- end
    if haoLV == 3 then
        do
            local temStr = ocrText(645, 14, 711, 30, 0, "0123456789.KM")
            local temNum = 0
            local num1 = string.find(temStr, "K")
            local num2 = string.find(temStr, "M")
            if num1 ~= nil then
                temStr = string.gsub(temStr, "K", "")
                temNum = tonumber(temStr)
                if temNum ~= nil then
                    temNum = temNum * 1000
                end
            elseif num2 ~= nil then
                temStr = string.gsub(temStr, "M", "")
                temNum = tonumber(temStr)
                if temNum ~= nil then
                    temNum = temNum * 1000 * 1000
                end
            else
                temNum = 1
            end
            if temNum ~= nil then
                numKuang = temNum
                writeJson("矿物", numKuang)
            end
        end

        do
            local temStr = ocrText(746, 14, 812, 30, 0, "0123456789.KM")
            local temNum = 0
            local num1 = string.find(temStr, "K")
            local num2 = string.find(temStr, "M")
            if num1 ~= nil then
                temStr = string.gsub(temStr, "K", "")
                temNum = tonumber(temStr)
                if temNum ~= nil then
                    temNum = temNum * 1000
                end
            elseif num2 ~= nil then
                temStr = string.gsub(temStr, "M", "")
                temNum = tonumber(temStr)
                if temNum ~= nil then
                    temNum = temNum * 1000 * 1000
                end
            else
                temNum = 1
            end
            if temNum ~= nil then
                numJinShu = temNum
                writeJson("金属", numJinShu)
            end
        end

        do
            local temStr = ocrText(844, 14, 914, 30, 0, "0123456789.KM")
            local temNum = 0
            local num1 = string.find(temStr, "K")
            local num2 = string.find(temStr, "M")
            if num1 ~= nil then
                temStr = string.gsub(temStr, "K", "")
                temNum = tonumber(temStr)
                if temNum ~= nil then
                    temNum = temNum * 1000
                end
            elseif num2 ~= nil then
                temStr = string.gsub(temStr, "M", "")
                temNum = tonumber(temStr)
                if temNum ~= nil then
                    temNum = temNum * 1000 * 1000
                end
            else
                temNum = 1
            end
            if temNum ~= nil then
                numLvQi = temNum
                writeJson("氯气", numLvQi)
            end
        end

        -- do
        --     local temStr = ocrText(947, 14, 1016, 30, 0, "0123456789.KM")
        --     local temNum = 0
        --     local num1 = string.find(temStr, "K")
        --     local num2 = string.find(temStr, "M")
        --     if num1 ~= nil then
        --         temStr = string.gsub(temStr, "K", "")
        --         temNum = tonumber(temStr)
        --         if temNum ~= nil then
        --             temNum = temNum * 1000
        --         end
        --     elseif num2 ~= nil then
        --         temStr = string.gsub(temStr, "M", "")
        --         temNum = tonumber(temStr)
        --         if temNum ~= nil then
        --             temNum = temNum * 1000 * 1000
        --         end
        --     else
        --         temNum = 1
        --     end
        --     if temNum ~= nil then
        --         numLiZi = temNum
        --         writeJson("粒子", numLiZi)
        --     end
        -- end

        do
            local temStr = ocrText(1050, 14, 1119, 30, 0, "0123456789")
            -- local temNum = 0
            -- local num1 = string.find(temStr, "K")
            -- local num2 = string.find(temStr, "M")
            -- if num1 ~= nil then
            --     temStr = string.gsub(temStr, "K", "")
            --     temNum = tonumber(temStr)
            --     if temNum ~= nil then
            --         temNum = temNum * 1000
            --     end
            -- elseif num2 ~= nil then
            --     temStr = string.gsub(temStr, "M", "")
            --     temNum = tonumber(temStr)
            --     if temNum ~= nil then
            --         temNum = temNum * 1000 * 1000
            --     end
            -- else
            --     temNum = 1
            -- end
            -- if temNum ~= nil then
            --     numCoin = temNum
            --     writeJson("金币", numCoin)
            -- end
            writeJson("金币", temStr)
        end
        -- toast(numKuang .. " " .. numJinShu .. " " .. numLvQi .. " " .. numLiZi .. " " .. numCoin)
    end
end

--建筑升级条件层数
function checkShengJiCengShu()
    numShengJiCengShu = numShengJiCengShu + 1
    if numShengJiCengShu >= 10 then
        if muBiao == "优化" then
            gaiMuBiaoNew(1, "主线")
        elseif muBiao == "主线" then
            gaiMuBiaoNew(1, "挖矿")
        end
        RGB_NoticeBJ = "FFFF00"
        RGB_NoticeFont = "FF0000"
        strNotice = "金属"
        fwCloseView("window1", "more"); -- 关闭文字视图
        fwShowButton("window1", "more", strNotice, RGB_NoticeFont, RGB_NoticeBJ, "", 12, 0, 0, 50, 30);
        mSleep(500)
        getOut()
        numShengJiCengShu = 0
    end
end

-- 兑换检测
function duiHuanJianCe()
    if numDuiHuan ~= "0" and isDuiHuan == false then
        if nowDateTime.hour == tonumber(numDuiHuan) or nowDateTime.hour == tonumber(numDuiHuan) + 8 or nowDateTime.hour ==
            tonumber(numDuiHuan) + 8 * 2 then
            if muBiao3 == "无" and muBiao2 == "无" then
                gaiMuBiaoNew(2, "兑换")
                gaiMuBiaoNew(3, "钱包检测")
            end
        end
    end
end

-- 兑换
function duiHuan()

end

--自动切换梯子
function autoChangeVPN(model)
    if check21 == "自动切换梯子" then
        if model == "配置" then
            ShadowrocketToConfigure()
            strVpnModel = "配置"
            timeXXX = nowTime
        elseif model == "场景" then
            ShadowrocketToScenes()
            strVpnModel = "场景"
            timeXXX = nowTime
        end
    end
end

--活动中心--细节
function huoDongDetail()
    if isColor(1084, 83, 0x9e1111, 95) then
        debug("规则")
        touchClick(1032, 103, 0x0b7148)
    elseif isColor(250, 420, 0x18407f, 95) and isColor(307, 401, 0x9e1111, 95) then
        debug("og精锐怪物狂欢")
        touchClick(250, 420)
    elseif isColor(783, 560, 0x5966f2, 95) and isColor(944, 558, 0x1a77f3, 95) then
        debug("STAKING")
        touchClick(944, 558, 0x1a77f3)
    elseif isColor(902, 175, 0x116eb9, 95) and isColor(1009, 176, 0x168961, 95) then
        debug("预定活动")
        touchClick(88, 182, 0x182637)
    elseif isColor(996, 281, 0xf18e07, 95) then
        debug("领取1--新")
        touchClick(1000, 281)
    elseif isColor(1000, 258, 0x116eb9, 95) then
        debug("领取1")
        touchClick(1000, 267)
    elseif isColor(1000, 353, 0x116eb9, 95) then
        debug("领取2")
        touchClick(1000, 360)
    elseif isColor(1000, 449, 0x116eb9, 95) then
        debug("领取3")
        touchClick(1000, 456)
    elseif isColor(1000, 544, 0x126fba, 95) then
        debug("领取4")
        touchClick(1000, 551)
    elseif isColor(1006, 419, 0x116eb9, 95) then
        debug("领取--中间")
        touchClick(1000, 419)
    elseif isColor(905, 158, 0x931012, 95) then
        debug("战斗力--红点")
        touchClick(836, 173, 0x12253a)
    elseif isColor(329, 492, 0x1c6ebb, 95) then
        debug("使用--遗物")
        touchClick(329, 492)
    elseif isColor(297, 497, 0xd68b01, 95) then
        debug("领取--黄色")
        touchClick(297, 497)
    end
end

function plistToJson()
    local tb = plist_ts.read(userPath() .. "/lua/" .. xiangMu .. ".plist") --读取plist至table格式
    if tb ~= "" and tb ~= nil then
        local jsonstring = json_ts.encode(tb);  --将 table 格式数据转成 json 格式数据
        if jsonstring ~= "" and jsonstring ~= nil then
            bool = writeFileString(userPath() .. "/res/" .. iphoneId .. ".json", jsonstring) --写入文件
        end
    end
end

-----------------------私有部分--------------------------

-- 综合2
function zongHe2()
    changePkMode()
    if isColor(8,153,0xe3d4bb,95) and isColor(260,204,0xf0e3cb,95) and isColor(27,25,0xffffff,95) then
        debug("指引--退出")
        tap(27,25,0xffffff    )
    end
    if isColor(1090,605,0xb07705,95) and isColor(1098,608,0xa26e07,95) and isColor(1017,614,0xedd293,95) then
        debug("跳过对话")
        tap(1042,418,0x807e70    )
    end
    if isColor(465, 543, 0x960000, 95) and isColor(681, 543, 0x007ea9, 95) then
        debug("受到攻击")
        tap(461, 562, 0xc4a391) --不审判
    end
    if isColor(430, 328, 0x966500, 95) and isColor(713, 329, 0x0080b2, 95) then
        debug("复活")
        tap(714, 352, 0x808b6e)
        isDead = true
        numDead = numDead + 1
        if numDead >= 5 then
            if numCollect == "1" then
                numCollect = "3"
            elseif numCollect == "3" then
                numCollect = "2"
            elseif numCollect == "2" then
                numCollect = "4"
            elseif numCollect == "4" then
                numCollect = "1"
            end
            numDead = 0
        end
        if muBiao == "采集" then
            gaiMuBiaoNew(1, "去采集点")
        elseif muBiao == "挂机" then
            gaiMuBiaoNew(1, "去挂机点")
        end
    end
    if isColor(437, 436, 0x0078a4, 95) and isColor(698, 431, 0x0078a4, 95) and isColor(447, 417, 0x00243a, 95) and isColor(687, 451, 0x002740, 95) then
        debug("增强")
        tap(574, 432, 0x90a0aa)
    end
    -- if inside2() then
    --     checkRed2()
    -- end
    if isColor(778, 576, 0x8c5900, 95) and isColor(885, 582, 0x0087a4, 95) and isColor(926, 585, 0x002a3e, 95) then
        debug("角色选择")
        touchClick(925, 578, 0x00293d)
    end
    if isColor(926, 341, 0xa3ea30, 95) and isColor(948, 353, 0x74db22, 95) and isColor(789, 540, 0x162f2e, 95) then
        debug("云打码")
        mSleep(5000)
        local strDaMa = yunDaMaNew(op, 234, 207, 855, 485)
        if strDaMa ~= false then
            debug("识别成功")
            touchClick(456, 539, 0x0e1118)
            mSleep(1000)
            inputText(strDaMa)
            mSleep(2000)
            touchClick(1027, 603, 0x000000)
            mSleep(2000)
            touchClick(760, 540, 0x253d3c)
        end
    end
end

-- 城内
function inside2()

end

-- 检查红点
function checkRed2()

end

-- 在线脚本
function zhaojunlua()
    if whoAmI() ~= 3 then
        os.execute("chown -R mobile:mobile /private/var/mobile/Media/TouchSprite"); -- 避免触动大姨妈
    end
    local bool, msg = os.remove(userPath() .. "/lua/zhaojun.lua")
    if bool then
        -- dialog("删除成功",5)
    else
        toast("删除失败，失败原因：" .. msg, 1)
    end
    ftpMuLu = "ftp://xinqinew:Qwer1234@1x9722733t.iask.in/"
    local temRet = ftpDownTSnet("/Lua/zhaojun.lua", userPath() .. "/lua/zhaojun.lua")
    if temRet then
        toast("FTP下载成功", 1)
        mSleep(1000)
    else
        for i = 1, 10, 1 do
            code, msg = ts.tsDownload(userPath() .. "/lua/zhaojun.lua", luaFile, {
                ["tstab"] = 1,
                ["mode"] = true
            })
            -- httpDown("https://cdn.jsdelivr.net/gh/xinqinew/rise-of-stars@main/riseOfStars.lua", "/var/mobile/Media/TouchSprite/lua/riseOfStars.lua")
            if code == 200 then
                toast("Github下载成功", 1)
                mSleep(1000)
                break
            else
                tiaoShi("下载失败：" .. msg)
                mSleep(1000)
            end
        end
    end
end

--doTarget2
function doTarget2()
    if muBiao == "挂机" or muBiao == "无" then
        if numHaoLV == "小号" then
            gaiMuBiaoNew(1, "主线")
        elseif numHaoLV == "成品号" then
            gaiMuBiaoNew(1, "主线")
        elseif numHaoLV == "大号" then
            gaiMuBiaoNew(1, "主线")
        end
    elseif muBiao == "主线" then
        task_zhuXian()
    elseif muBiao == "采集" then
        collect()
    elseif muBiao == "去采集点" then
        goCollectPlace()
    end
    -- debug("目标："..muBiao)
end

--主线
function task_zhuXian()
    if isOutside() then
        if nowTime - timeTask_ZhuXian >= 10 then
            timeTask_ZhuXian = nowTime
            tap(41, 170, 0x326532)
        end
    end
end

--指引
function zhiYin()
    if numHaoLV == "小号" then
        x, y = findMultiColorInRegionFuzzy(0xdecfb5, "-57|-65|0xf1e5cf,198|-11|0xe2d2b9", 90, 0, 0, 1135, 639)
        if x > 0 then
            debug("指引在上--左"..numUpLeft)
            tap(x+5, y + 30)
            numUpLeft = numUpLeft +1
            if numUpLeft >= 5 then
                screenClickNew(x, y, 0xdecfb5)
                numUpLeft = 0
            end
        end
        x, y = findMultiColorInRegionFuzzy(0xdecfb5, "-198|-64|0xefe2ca,58|-12|0xe1d1b9", 90, 0, 0, 1135, 639)
        if x > 0 then
            debug("指引在上--右"..numUpRight)
            tap(x-5, y + 30)
            numUpRight = numUpRight +1
            if numUpRight >= 5 then
                screenClickNew(x, y, 0xdecfb5)
                numUpRight = 0
            end
        end
        
        x, y = findMultiColorInRegionFuzzy(0xdeceb5, "-58|10|0xe2d2b9,198|64|0xefe2ca", 90, 0, 0, 1135, 639)
        if x > 0 then
            debug("指引在下--左"..numDownLeft)
            tap(x+5, y - 30)
            numDownLeft = numDownLeft +1
            if numDownLeft >= 5 then
                screenClickNew(x, y, 0xdeceb5)
                numDownLeft = 0
            end
        end
        x, y = findMultiColorInRegionFuzzy(0xdecfb5, "58|63|0xefe2ca,-197|11|0xe1d1b9", 90, 0, 0, 1135, 639)
        if x > 0 then
            debug("指引在下--右"..numDownRight)
            tap(x-5, y - 30)
            numDownRight = numDownRight +1
            if numDownRight >= 5 then
                screenClickNew(x, y, 0xdecfb5)
                numDownRight = 0
            end
        end
        if isColor(1000, 6, 0x528ba5, 95) and isColor(1131, 52, 0x64a0bf, 95) and isColor(1058, 22, 0xc0c0c0, 95) then
            debug("跳过任务")
            tap(1058, 22)
        end
    end
end

--采集
function collect()
    if isInside() then
        if isColor(605, 583, 0xfcfdfe, 95) == false and isColor(621, 583, 0xf6fcfd, 95) == false then
            -- debug("采集")
            tap(605, 583)
        end
        if isColor(653, 450, 0x144309, 90) then
            -- debug("采集中")
            mSleep(2000)
            if isColor(653, 450, 0x144309, 90) then
                debug("采集--卡bug")
                tap(612, 572, 0xd1d5d9)
                isCollectBug = true
                gaiMuBiaoNew(1, "去采集点")
            end
        end
        if isColor(502, 447, 0x31e605, 95) then --采集条--绿色
            timeCollectBug = nowTime
        end
        if nowTime - timeCollectBug >= 60 then
            timeCollectBug = nowTime
            debug("采集--卡bug")
            tap(612, 572, 0xd1d5d9)
            isCollectBug = true
            gaiMuBiaoNew(1, "去采集点")
        end
    end
end

--去采集点
function goCollectPlace()
    if isInside() then
        tap(1061, 95, 0x37cd12) --打开地图
        mSleep(1000)
        if numCollect == "1" then
            tap(714, 255, 0x3e454c) --采集点1
            tap(1028, 255, 0x3f4550) --移动
            numGoCollectPlace = 20
        elseif numCollect == "2" then
            tap(714, 307, 0x3e454c)
            tap(1028, 307, 0x3f4550)
            numGoCollectPlace = 15
        elseif numCollect == "3" then
            tap(714, 360, 0x3e454c)
            tap(1028, 360, 0x3f4550)
            numGoCollectPlace = 35
        elseif numCollect == "4" then
            tap(714, 411, 0x3e454c)
            tap(1028, 411, 0x3f4550)
            numGoCollectPlace = 15
        end
        tap(438, 384, 0x322709) --普通移动
        if isCollectBug == true then
            mSleep(3 * 1000)
            isCollectBug = false
        else
            mSleep(numGoCollectPlace * 1000)
        end
        gaiMuBiaoNew(1, "采集")

    end
end

--战斗界面
function isWar()
    if isColor(177, 67, 0xc8c8c8, 95) and isColor(774, 31, 0xf7f7f7, 95) then
        -- debug("战斗界面")
        return true
    else
        return false
    end
end

--副本内
function isInside()
    if isWar() then
        if isColor(767, 142, 0xf9f9f9, 95) and isColor(769, 154, 0xf1f2f1, 95) then
            -- debug("副本内")
            return true
        end
    end
end

--副本外
function isOutside()
    if isWar() then
        if isColor(767, 142, 0xf9f9f9, 95) == false and isColor(769, 154, 0xf1f2f1, 95) == false then
            -- debug("副本外")
            return true
        end
    end
end

--PK模式
function pkMode()
    if isWar() then
        if isColor(39, 48, 0xdae0e0, 95) then
            return "和平模式"
        elseif isColor(43, 41, 0xbbd8e8, 95) then
            return "审判模式"
        elseif isColor(44, 42, 0xc3b695, 95) then
            return "结义模式"
        elseif isColor(44, 16, 0xf69c81, 95) then
            return "杀戮模式"
        end
    end
end

-- 改变pk模式
function changePkMode()
    if pkMode() == "审判模式" or pkMode() == "结义模式" or pkMode() == "杀戮模式" then
        tap(40, 47) --PK模式
        mSleep(1000)
        if isColor(25, 103, 0xa25f2f, 95) == false then
            tap(40, 47) --PK模式
            mSleep(1000)
        end
        tap(130, 228, 0x6d6e75) --和平
        mSleep(1000)
        tap(40, 47) --PK模式
    end
end

--掉线检测
function checkDropline()
    if isColor(582, 261, 0x696969, 95) and isColor(920, 222, 0x500e04, 95) then
        for i = 1, 10, 1 do
            if isColor(582, 261, 0x696969, 95) == false and isColor(920, 222, 0x500e04, 95) == false then
                break
            end
            if i == 10 then
                debug("掉线")
                closeApp(appXiangMu)
            end
            mSleep(3000)
        end
    end
end
