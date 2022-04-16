people = {
    type = "human"
}
function people.sayhi()
    print("hi")
end
function people:new(...)
    local p = {}
    people.ctor(p, ...)
    setmetatable(p, {
        __index = self
    })
    return p
end
function people:ctor(name, age)
    self.name = name
    self.age = age
end
zhangshan = people.new
