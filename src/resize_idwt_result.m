function [a,h,v,d] = resize_idwt_result(ca,ch,cv,cd)
    [dim_ca, ] = size(ca);
    [dim_ch, ] = size(ch);
    [dim_cv, ] = size(cv);
    [dim_cd, ] = size(cd);
    dim_list = [dim_ca, dim_ch, dim_cv ,dim_cd];
    M = max(dim_list);
    if dim_ca < M
        temp = zeros([M,M]);
        temp(1:dim_ca, 1:dim_ca) = ca;
        a = temp;
    else
        a = ca;
    end
    if dim_ch < M
        temp = zeros([M,M]);
        temp(1:dim_ch, 1:dim_ch) = ch;
        h = temp;
    else
        h = ch;
    end
    if dim_cv < M
        temp = zeros([M,M]);
        temp(1:dim_cv, 1:dim_cv) = cv;
        v = temp;
    else
        v = cv;
    end
    if dim_cd < M
        temp = zeros([M,M]);
        temp(1:dim_cd, 1:dim_cd) = cd;
        d = temp;
    else
        d = cd;
    end
end