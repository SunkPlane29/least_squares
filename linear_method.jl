include("util.jl")

struct LinearModel
    xcoefficient::Real
    constant::Real
end

# refer to the wikepedia page about mean square method
function linear_fit(x::Vector{Float64}, y::Vector{Float64})::LinearModel
    xmed = mean(x)
    ymed = mean(y)

    s1 = 0
    for i = 1:length(x)
        s1 += (x[i] - xmed)*(y[i] - xmed)
    end

    s2 = 0
    for i = 1:length(x)
        s2 += (x[i] - xmed)^2
    end

    b = s1/s2
    a = ymed - b*xmed

    return LinearModel(b, a)
end

function linear_point(model::LinearModel, x::Real)::Real
    return model.constant + model.xcoefficient * x
end
