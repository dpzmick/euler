def sum(num)
    num[0].chr.to_i * num[1].chr.to_i * num[2].chr.to_i * num[3].chr.to_i * num[4].chr.to_i
end

lines = Array.new
file = File.open("in")
lines = file.readlines
file.close

line = lines[0].to_s
lines = Array.new

while line.size > 5
    lines << line[0].chr + line[1].chr + line[2].chr + line[3].chr + line[4].chr
    line.slice!(0)
end
max = 0
for part in lines
    if sum(part) > max
        max = sum(part)
    end
end
puts max
