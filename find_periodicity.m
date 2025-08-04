function [estimated_period] = find_periodicity(x)
    N = length(x);
    found_period = 0;
    i = 1;
    while ~found_period
        if sum(x(1:N/2^i) - x(N/2^i+1:N/2^(i-1))) ~= 0
            found_period = 1;
            break;
        end
        i = i+1;
    end
    index = i;
    if index ~= 1
        estimated_period = N/i;
        disp("U is periodic with period: T=" + num2str(estimated_period))
    else
        estimated_period = 0;
        disp("U is not periodic.")
    end
end