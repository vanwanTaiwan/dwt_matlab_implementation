function [a,h,v,d] = resize_idwt_result2(ca,ch,cv,cd)
    [dim_ca, ] = size(ca);
    [dim_ch, ] = size(ch);
    [dim_cv, ] = size(cv);
    [dim_cd, ] = size(cd);
    dim_list = [dim_ca, dim_ch, dim_cv ,dim_cd];
    M = min(dim_list);
    if dim_ca > M
        temp = zeros([M,M]);
        temp = ca(1:M, 1:M);
        a = temp;
    else
        a = ca;
    end
    if dim_ch > M
        temp = zeros([M,M]);
        temp = ch(1:M, 1:M);
        h = temp;
    else
        h = ch;
    end
    if dim_cv > M
        temp = zeros([M,M]);
        temp = cv(1:M, 1:M);
        v = temp;
    else
        v = cv;
    end
    if dim_cd > M
        temp = zeros([M,M]);
        temp = cd(1:M, 1:M);
        d = temp;
    else
        d = cd;
    end
end