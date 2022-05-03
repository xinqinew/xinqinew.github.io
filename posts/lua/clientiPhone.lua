
local host = "192.168.1.34"
local port = 1111
local sock = assert(socket.connect(host, port))--绑定
sock:settimeout(0)--超时时间

-- nLog("Press enter after input something:")
-- 译:输入想要传输的数据
toast("多线程")
assert(sock:send("Hello world!"))--发送
mSleep(3000)
sock:close()
local input, recvt, sendt, status
for i = 1, 60, 1 do
    mSleep(1000)
end
while false do
    input = dialogInput("输入内容", "按q退出", "确认")
	if input == "q" then
        assert(sock:send("q"))--发送
        break 
    end
    if #input > 0 then
        -- assert(sock:send(input .. "\n"))
        assert(sock:send(input))--发送
    end
     
    recvt, sendt, status = socket.select({sock}, nil, 1)
    while #recvt > 0 do
        local response, receive_status = sock:receive()
        if receive_status ~= "closed" then
            if response then
                toast(response)
                recvt, sendt, status = socket.select({sock}, nil, 1)
            end
        else
            break
        end
    end
end