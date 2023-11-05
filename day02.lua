local input = io.open("input.txt")
local ids = {}
for n in input:lines() do
  table.insert(ids, n)
end

local twice = 0;
local thrice = 0;
for _, id in pairs(ids) do
  local freqs = {}
  for ch in id:gmatch "." do
    if freqs[ch] ~= nil then
      freqs[ch] = freqs[ch] + 1
    else
      freqs[ch] = 1
    end
  end

  local hasTwice = false
  local hasThrice = false
  for _, freq in pairs(freqs) do
    if freq == 2 then hasTwice = true end
    if freq == 3 then hasThrice = true end
  end

  if hasTwice then twice = twice + 1 end
  if hasThrice then thrice = thrice + 1 end
end

local checksum = twice * thrice
print("Part 1:" .. checksum)

for _, id1 in pairs(ids) do
  for _, id2 in pairs(ids) do
    if id1 == id2 then
      goto continue
    end

    local mismatch = 0
    local mismatch_i = nil
    for i = 1, #id1 do
      if id1:sub(i, i) ~= id2:sub(i, i) then
        mismatch = mismatch + 1
        mismatch_i = i
      end
    end

    if mismatch == 1 then
      print("Part 2:" .. id1:sub(1, mismatch_i - 1) .. id1:sub(mismatch_i + 1))
      goto done
    end

    ::continue::
  end
end
::done::
