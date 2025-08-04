function [freq_resp] = spa_premium(data, apply_windowing, window_size, apply_averaging, nb_groups)
    N = length(data.y);
    if apply_windowing
        freq_resp = spa(data, window_size);
        disp("Performing Windowed Spectral Analysis with Hann window of size " + num2str(window_size) + "...")
    elseif apply_averaging
        freq_resp = spa(data, N/nb_groups, [], N/nb_groups);
        disp("Performing Averaged Spectral Analysis with " + num2str(nb_groups) + " groups of size " + num2str(N/nb_groups) + "...")
    else
        freq_resp = spa(data);
        disp("Performing basic Spectral Analysis...")
    end
end