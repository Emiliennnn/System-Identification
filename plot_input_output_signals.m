function plot_input_output_signals(u, y)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
% All timesteps
figure;
plot(u)
xlabel("Time steps (k)")
ylabel("Input Magnitude")
title("Input signal")
xlim([0, length(u)])

% Only few
figure;
stem(u)
xlabel("Time steps (k)")
ylabel("Input Magnitude")
title("Input signal (k=0 to k=100)")
xlim([0, 100])

% Plot output signal
% All timesteps
figure;
plot(y)
xlabel("Time steps (k)")
ylabel("Output Magnitude")
title("Output signal")
xlim([0, length(y)])

% Only few
figure;
plot(y)
xlabel("Time steps (k)")
ylabel("Output Magnitude")
title("Output signal (k=0 to k=100)")
xlim([0, 100])
end