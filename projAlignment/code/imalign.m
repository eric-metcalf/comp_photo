function [ shift_vector ] = imalign(a,b)

scale = 1/16;
a = imresize(a,scale);
b = imresize(b,scale);

BW_A = edge(a);
BW_B = edge(b);

%first thing is create the ranges we want to shif the images over;
min_shift = [-15, -15];
max_shift = [15, 15];
min_dist = inf;
for i = min_shift(1):max_shift(1)
    for j = min_shift(2):max_shift(2)
        
        a_shifted = shift_vec([i,j], BW_A);
        dist = dist_metric(a_shifted, BW_B);
        
        if min_dist > dist
            min_dist = dist
            shift_vector = [(1/scale) *i, (1/scale)*j];
        end
    
    end
end

end



