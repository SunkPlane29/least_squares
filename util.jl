function mean(x::AbstractVector)::Real
    sum = 0
    for i = 1:length(x)
        sum += x[i]
    end
    return sum/length(x)
end