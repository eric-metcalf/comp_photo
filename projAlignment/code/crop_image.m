function c_im = crop_image(im, crop_factor)
    s_im = size(im);
    crop_min_ind = int64(s_im * crop_factor); 
    crop_max_ind = int64(s_im * (1 - crop_factor)); 
    
    c_im = im(crop_min_ind(1) : crop_max_ind(1), ...
        crop_min_ind(2):crop_max_ind(2));


end