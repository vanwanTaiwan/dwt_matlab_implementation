function x = my_idwt(ca, ch, cv, cd, h, g)
    ca = double(ca);
    ch = double(ch);
    cv = double(cv);
    cd = double(cd);
    
    %odd upsample for row
    ca = dyadup(ca, 1, 'r');
    ch = dyadup(ch, 1, 'r');
    cv = dyadup(cv, 1, 'r');
    cd = dyadup(cd, 1, 'r');
    
    [m,n] = size(ca);
    ca = ca(1:m-1, 1:n);
    ch = ch(2:m, 1:n);
    cv = cv(1:m-1, 1:n);
    cd = cd(2:m, 1:n);

    ca = filter_operation(ca, h, 1);
    ch = filter_operation(ch, g, 1);
    cv = filter_operation(cv, h, 1);
    cd = filter_operation(cd, g, 1);
    
    c1 = ca + ch;
    c2 = cv + cd;
    
    c1 = dyadup(c1, 1, 'c');
    c2 = dyadup(c2, 1, 'c');
    
    [m,n] = size(c1);
    c1 = c1(1:m, 1:n-1);
    c2 = c2(1:m, 2:n);
    
    c1 = filter_operation(c1, h, 2);
    c2 = filter_operation(c2, g, 2);
    
    x = c1 + c2;
end

