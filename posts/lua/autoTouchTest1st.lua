appID="com.apple.iBooks"
--点击
function tap(x, y)
    touchDown(0, x, y);
    usleep(1000000);
    touchUp(0, x, y);
    usleep(1000000)
end
--单点比色
function isColor(x,y,c,dim)
    color1= getColor(x, y)
    dim=dim or 25
    local r, g, b = intToRgb(color1);
    local r1, g1, b1 = intToRgb(c);
    if math.abs(r-r1)<=dim and math.abs(g-g1)<=dim and math.abs(b-b1)<=dim then
        return true
    else
        return false
    end  
end
--比色点击     
function colorTap(x,y,c,dim,x1,y1)
    color1= getColor(x, y); 
    local r, g, b = intToRgb(color1);
    local r1, g1, b1 = intToRgb(c);
    if math.abs(r-r1)<=dim and math.abs(g-g1)<=dim and math.abs(b-b1)<=dim then
        tap(x1,y1)
    end  
end
--区域单点找色
function findColorInRegionFuzzy(color,degree,x1,y1,x2,y2)
    degree = degree or 100
    local result = findColor(color, 1, {x1,y1,x2-x1,y2-y1});
    for i, v in pairs(result) do
        if v[1] >0 and v[2]>0 then
            return v[1], v[2]
        else
            return -1,-1 
        end
    end
    return -1,-1 
end
-- Get the state of Safari.
local state = appState(appID);
--alert(string.format("State of Safari: %s", state));
-- Pop up the state of Safari: "ACTIVATED"
if state=="NOT RUNNING" or state=="DEACTIVATED" then
    appRun(appID);
end

while true do
    --color= getColor(93, 1081); --0, 0x000000
    --if color ==0x000000 then
       --tap(319,1093)
    --end
    --num=num+1
    --colorTap(93,1081,0x000000,319,1093)
    --usleep(1000000)
    --colorTap(314,1083,0x000000,518,1083)
    --usleep(1000000)
    --if isColor(93,1081,0x090909,5) and isColor(296,1087,0xA2A2A2) then
        --tap(319,1093)
    --end 
    --local result = findColor(0xA2A2A2, 1, {290,1080,10,10});
    --for i, v in pairs(result) do
        --log(string.format("Found pixel: x:%f, y:%f", v[1], v[2]));
        --alert(string.format("Found pixel: x:%f, y:%f", v[1], v[2]));
        --tap(v[1], v[2])
    --end
   -- {{293,1087},{294,1088}}
    --v={293,1087}
    --v[1]=293
    --v[2]=1087
    x, y = findColorInRegionFuzzy(0xA2A2A2, 100, 290,1080,300,1090); 
    if x ~= -1 and y ~= -1 then  --如果在指定区域找到某点符合条件
        tap(x,y)
    end

end


