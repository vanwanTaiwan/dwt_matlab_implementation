clear;
%part a
image = importdata('Lenna.dat');
h = [0.852698679009, 0.377402855613, -0.110624404418, -0.023849465020, 0.037828455507];
g = [-0.788485616406, 0.418092273222, 0.040689417609, -0.064538882629];

%3-level dwt
[cA0, cH0, cV0, cD0] = my_dwt(image, h, g);
[cA1, cH1, cV1, cD1] = my_dwt(cA0, h, g);
[cA2, cH2, cV2, cD2] = my_dwt(cA1, h, g);

figure; imshow(uint8(image));
title('Origin Image');
cA2_res = rescale(cA2, 0, 255);
figure; imshow(uint8(cA2_res));
title('3level-dwt Result');


q = [0.788485616406, 0.418092273222, -0.040689417609, -0.064538882629];
p = [-0.852698679009, 0.377402855613, 0.110624404418, -0.023849465020, -0.037828455507];

x1 = my_idwt(cA2, cH2, cV2, cD2, q, p);
x2 = my_idwt(x1, cH1, cV1, cD1, q, p);
x3 = my_idwt(x2, cH0, cV0, cD0, q, p);
figure; imshow(uint8(x3));
title('3level-idwt Result');

%part b
[m,n] = size(cA0);
zero_m = zeros([m,n]);
x1 = my_idwt(cA2, cH2, cV2, cD2, q, p);
x2 = my_idwt(x1, cH1, cV1, cD1, q, p);
x3 = my_idwt(x2, zero_m, zero_m, zero_m, q, p);
figure; imshow(uint8(x3));
title('3level-idwt(with all zero) Result');

%part c
point_size = 4;
[cA0, cH0, cV0, cD0] = my_dwt(image, h, g, 1, point_size);
[cA1, cH1, cV1, cD1] = my_dwt(cA0, h, g, 1, point_size);
[cA2, cH2, cV2, cD2] = my_dwt(cA1, h, g, 1, point_size);

x1 = my_idwt(cA2, cH2, cV2, cD2, q, p);
x2 = my_idwt(x1, cH1, cV1, cD1, q, p);
x3 = my_idwt(x2, cH0, cV0, cD0, q, p);
figure; imshow(uint8(x3));
title('3level-idwt with 8-fixed-point Result');

peaksnr = PSNR(image, x3);
fprintf('\n The Question for %d fixed point PSNR value is %0.4f\n', point_size, peaksnr);
