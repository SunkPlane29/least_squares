include("least_squares.jl")
using .LeastSquaresMethods

using Plots

function test_linear_method()
    test_data_x = [139.0, 126.0, 90.0, 144.0, 163.0, 136.0, 61.0, 62.0, 41.0, 120.0]
    test_data_x = convert(Vector{Real}, test_data_x)
    test_data_y = [122.0, 114.0, 86.0, 134.0, 146.0, 107.0, 68.0, 117.0, 71.0, 98.0]
    test_data_y = convert(Vector{Real}, test_data_y)

    model = linear_fit(test_data_x, test_data_y)

    model_y_values = []

    for x in test_data_x
        append!(model_y_values, linear_point(model, x))
    end

    p = plot(test_data_x, test_data_y, seriestype = :scatter, title="Linear Method Test")
    plot!(test_data_x, model_y_values)
    savefig(p, "testplot.png")
end