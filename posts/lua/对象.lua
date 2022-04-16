-- people = {
--     type = "human"
-- }
-- function people.sayhi()
--     print("hi")
-- end
-- function people:new(...)
--     local p = {}
--     people.ctor(p, ...)
--     setmetatable(p, {
--         __index = self
--     })
--     return p
-- end
-- function people:ctor(name, age)
--     self.name = name
--     self.age = age
-- end
-- zhangshan = people:new("zhangshan", 11)
-- function zhangshan:say()
--     print(self.name)
-- end
-- zhangshan:say()
-- zhangshan:sayhi()

local _class = {}
function class(super)
    local class_type = {}
    class_type.ctor = false
    class_type.super = super
    class_type.new = function(...)
        local obj = {}
        do
            local create
            create = function(c, ...)
                if c.super then
                    create(c.super, ...)
                end
                if c.ctor then
                    c.ctor(obj, ...)
                end
            end
            create(class_type, ...)
        end
        setmetatable(obj, {
            __index = _class[class_type]
        })
        return obj
    end
    local vtbl = {}
    _class[class_type] = vtbl
    setmetatable(class_type, {
        __newindex = function(t, k, v)
            vtbl[k] = v
        end
    })
    if super then
        setmetatable(vtbl, {
            _index = function(t, k)
                local ret = _class[super][k]
                vtbl[k] = ret
                return ret
            end
        })
    end
    return class_type
end

------例子1
people = class()
function people:ctor(name,age)
    self.name = name
    self.age = age
end

function people:say()
    print(self.name)
end
zs = people.new("zhangshan",11)
zs:say()

------例子2
man = class(people)
function man:ctor(name,age,jj)
    self.jj=jj
end
function sayjj()
    print(self.jj)
end
li= man:new("lisi",16,"wo you jj")
li:sayjj()