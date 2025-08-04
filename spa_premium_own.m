function [freq_resp] = spa_premium_own(data, apply_windowing, window_size, apply_averaging, nb_groups, autocorr_func, estimate_biasedness)
    N = length(data.y);
    u = data.u;
    y = data.y;

    % Compute Auto-correlation Ruu and Ryu
    if autocorr_func == 'intcor'
        Ruu = intcor(u, u);
        Ryu = intcor(y, u);
        disp("Used intcor function for Ruu, Ryu estimates.")
    else
        Ruu = xcorr(u, u, estimate_biasedness);
        Ryu = xcorr(y, u, estimate_biasedness);
        disp("Used xcorr function for Ruu, Ryu estimates (" + estimate_biasedness + ").")
    end
        

    if apply_windowing
        freq_resp = spa(data, window_size);
        disp("Performing Windowed Spectral Analysis with Hann window of size " + num2str(window_size) + "...")
    elseif apply_averaging
        freq_resp = spa(data, N/nb_groups, [], N/nb_groups);
        disp("Performing Averaged Spectral Analysis with " + num2str(nb_groups) + " groups of size " + num2str(N/nb_groups) + "...")
    else
        Phi_uu = fft(Ruu);
        Phi_yu = fft(Ryu);
        
        G_spectral = Phi_yu ./ Phi_uu;
        
        % frequency vector
        omega_s = 2*pi/Ts;
        omegas = 0:omega_s/N:(N-1)/N*omega_s;
        freq_domain_model = frd(G_spectral, omegas);
        
        figure; hold on;
        bode(freq_domain_model)
        bode(Gd)
        legend(["Spectral Analysis" "True"], 'Location', 'southwest')
        hold off;
        freq_resp = spa(data);
        disp("Performing basic Spectral Analysis...")
    end
end