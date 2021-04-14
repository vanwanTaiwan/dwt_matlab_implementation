function result = filter_operation(image, filter, axis)
    image = double(image);
    [img_row, img_column] = size(image);
    [x,F_size] = size(filter);
    %expand
    if axis == 2
        append_image = zeros([img_row, img_column + 2*(F_size - 1)]);
        append_image(:,F_size:img_column+(F_size -1)) = image;
        %syn
        append_image(:,1:F_size-1) = flip(append_image(:,F_size+1 : 2*F_size-1),2);
        append_image(:, (img_column+F_size):(img_column+2*F_size-2)) = flip(append_image(:,(img_column):(img_column+F_size-2)),2);
    elseif axis == 1
        append_image = zeros([img_row + 2*(F_size - 1), img_column]);
        append_image(F_size:img_row+(F_size -1),:) = image;
        %syn
        append_image(1:F_size-1,:) = flip(append_image(F_size+1 : 2*F_size-1,:),1);
        append_image((img_row+F_size):(img_row+2*F_size-2),:) = flip(append_image((img_row):(img_row+F_size-2),:),1);
    end
    
    result = zeros([img_row , img_column]);
    if axis == 2
        for i = 1:img_row
            for j = 1:img_column
                for k = 1:(2*F_size - 1)
                    if k <= F_size
                        result(i,j) = result(i,j) + filter(x, F_size - (k-1)) * append_image(i, j+k-1);
                    else
                        result(i,j) = result(i,j) + filter(x, (k-F_size+1) ) * append_image(i, j+k-1);
                    end
                end
            end
        end
    elseif axis == 1
         for i = 1:img_column
            for j = 1:img_row
                for k = 1:(2*F_size - 1)
                    if k <= F_size
                        result(j, i) = result(j, i) + filter(x, F_size - (k-1)) * append_image(j+k-1, i);
                    else
                        result(j, i) = result(j, i) + filter(x, (k-F_size+1) ) * append_image(j+k-1, i);
                    end
                end
            end
        end
    end
end