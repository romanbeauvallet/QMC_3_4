function levy_free_path(start_bead, end_bead, N_beads, beta)
    step_time = beta/N_beads
    path = zeros(N_beads)
    path[1] = start_bead
    path[end] = end_bead

    for i in 2:N_beads-1
        delta = (N_beads-i)*step_time
        mean = (delta*path[i-1] + step_time*end_bead)/(delta + step_time)
        variance = (step_time*delta)/(step_time + delta)
        dist = Normal(mean, sqrt(variance))
        path[i] = rand(dist)
    end
    return path
end