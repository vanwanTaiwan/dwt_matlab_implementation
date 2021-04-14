function [cA, cH, cV, cD] = my_dwt(image, h, g, fixed_mode, length)
    if nargin<4
        fixed_mode = 0;
        length = 0;
    elseif nargin<5
        length = 8;
    end
    
    if fixed_mode == 1
        image = fi(image, 1, length);
    end
    
    Li = filter_operation(image, h, 2);
    Hi = filter_operation(image, g, 2);
    
    if fixed_mode == 1
        Li = fi(Li, 1, length);
        Hi = fi(Hi, 1, length);
    end

    Li = dyaddown(Li,0, 'c'); %odd downsample for LOW
    Hi = dyaddown(Hi,1, 'c'); %even downsample for HIGH

    cA = filter_operation(Li, h, 1);
    cH = filter_operation(Li, g, 1);
    cV = filter_operation(Hi, h, 1);
    cD = filter_operation(Hi, g, 1);
    
    if fixed_mode == 1
        cA = fi(cA, 1, length);
        cH = fi(cH, 1, length);
        cV = fi(cV, 1, length);
        cD = fi(cD, 1, length);
    end

    cA = dyaddown(cA,0, 'r'); %odd downsample for LOW
    cH = dyaddown(cH,1, 'r'); %even downsample for HIGH
    cV = dyaddown(cV,0, 'r'); %odd downsample for LOW
    cD = dyaddown(cD,1, 'r'); %even downsample for HIGH
    
    cA = double(cA);
    cH = double(cH);
    cV = double(cV);
    cD = double(cD);
end

