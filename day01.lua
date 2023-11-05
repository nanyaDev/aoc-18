local input = io.open("input.txt")
local nums = {}
for n in input:lines() do
  table.insert(nums, n)
end

local sum1 = 0
for _,n in pairs(nums) do
  sum1 = sum1 + n
end

print("Part 1:" .. sum1)

local sum2 = 0
local frequencies = { [0] = true }

while true do
  for _,n in pairs(nums) do
    sum2 = sum2 + n

    if frequencies[sum2] ~= nil then
      goto done
    else
      frequencies[sum2] = true
    end
  end
end

::done::
print("Part 2:" .. sum2)
