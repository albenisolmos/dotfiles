local function extend_table(t1, t2)
	if type(t2) ~= 'table' then
		return t2
	end

	for k, v in pairs(t2) do
		if t1[k] then
			t1[k] = extend_table(t1[k], v)
		else
			t1[k] = v
		end
	end

	return t1
end

local ta1 = {
	loco = {
		map1 = 'map1',
		map2 = 'map2',
		map3 = 'map3',
	},
	loco2 = {
		foo1 = 'fo1',
		foo2 = 'fo2',
		foo3 = 'fo3',
	}
}
local t2 = {
	loco = {
		map1 = 'map1',
		map2 = 'map200',
		map3 = 'map3',
	}, loco2 = {
		foo1 = 'fo1',
		foo2 = 'fo200',
		papo = 'POAPUI'
	}
}
local unpack = table.unpack or unpack
print(unpack(extend_table(ta1,t2)))
