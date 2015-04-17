def numberoftwo(pow)
    if pow == 1
        return 1
    elsif pow == 2
        return 2
    else
        return numberoftwo(pow - 1) * 2
    end
end
val = numberoftwo(1000) * 2
sum = 0
while val > 0
    sum += val % 10
    val = val / 10
end
print sum
