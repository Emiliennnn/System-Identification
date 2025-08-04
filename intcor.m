function [R_uy,hh] = intcor(u,y)
    M = length(u);
    R_uy = zeros(M,1);
    hh = 0:1:M-1;
    for h = 0:1:M-1
        for k = 1:1:M
            % Taking care of periodicity
            index = k-h;
            if index <= 0
                index = M + index;
            end
            R_uy(h+1) = R_uy(h+1) + u(k)*y(index)/M;
        end
    end
    R_uy = [flip(R_uy(2:end)); R_uy]';
    hh = [flip(-hh(2:end)),hh];
end