function [b, g, r] = split_image(im)    
    
    im_size = size(im);
    
    b = im(1:im_size(1)/3,:);
    g = im(1 + im_size(1)/3: 2 * im_size(1)/3, :);
    r = im(1 + 2 * im_size(1)/3 : im_size(1),:);
    
end   