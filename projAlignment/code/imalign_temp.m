function [ shift_vector_fin ] = imalign(a,b)
%This functions aligns a to b.
%we are going to crop a by 1 third and then run the alignment with all
%the given images.
crop_factor = .3;
c_a = crop_image(a, crop_factor);
s_a = size(a);
s_c_a = size(c_a);
s_b = size(b);


min_dist = inf;
shift_vector = [0, 0];

for i = 1:(s_b(1) - s_c_a(1))
    for j = 1:(s_b(2)- s_c_a(2))
        
        d = b(i:s_c_a(1)+i-1,j:s_c_a(2)+j-1);
        
        dist = dist_metric(c_a , d);
        
        if min_dist > dist
            min_dist = dist;
            shift_vector = [i, j];
        end
        
    end
end
shift_vector
shift_vector_fin = [shift_vector(1) - int64(crop_factor * s_a(1)); ...
    shift_vector(2) - int64(crop_factor * s_a(2))];   
end



