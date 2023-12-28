# Renders an animated simulation of a simple pendulum.

using OrdinaryDiffEq
using GLMakie

# Activate the GLMakie back end and ensure we're not in `inline` display mode
# (we want the plots to be rendered in a separate window so the animation will work)
GLMakie.activate!(inline=false)

# Define some physical constants
g = 9.81
l = 1.0

# Initial conditions
θ₀ = π/2
dθ₀ = 0

function simple_pendulum!(d²θ, dθ, θ, p, t)
    @. d²θ = -g/l * sin(θ)
end

figure = Figure(size = (600, 400))
ax = Axis(figure[1, 1], limits = ((-2, 2), (-2, 1)), title = "Simple pendulum")

hidespines!(ax)
hidedecorations!(ax)

linesegments!(ax, [(0., 0.), (1., 0.)], color = :black)
scatter!(ax, [(1.0, 0.0)], markersize = 20, color = :blue)

display(figure)

# points = Observable(Point2f[randn(2)])

# fig, ax = scatter(points)
# limits!(ax, -4, 4, -4, 4)

# display(fig)

# fps = 60
# nframes = 120

# for i = 1:nframes
#     new_point = Point2f(randn(2))
#     points[] = push!(points[], new_point)
#     sleep(1/fps) # refreshes the display!
# end

# TODO: draw a line and a filled-in disk
