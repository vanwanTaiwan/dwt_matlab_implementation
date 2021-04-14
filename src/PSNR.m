function psnr = PSNR(xi , rec3)
    [m,n] = size(xi);
    MSE = 0;
    max = 0;
    for i = 1:m
        for j = 1:n
            if max < xi(i,j) max = xi(i,j); end
            MSE = MSE + (xi(i,j)-rec3(i,j))^2;
        end
    end
    MSE = double(MSE)/double(m*n);
    psnr = 10*log10((max^2)/MSE);
end

