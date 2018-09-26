%% CSCI 1290: Computational Photography
%% Project 1: Color Alignment

% The stencil code for this assignment includes:
%   - calling an 'imalign' function
%   - combining the image into an RGB image
%   - writing that image out to a jpg
% 
% 
% Remember to use other images from the collection or you will 
% not get full credit!

N = 16;

in_names = cell(16,1);
in_names{1}        = '00125v.jpg';
in_names{2}        = '00149v.jpg';
in_names{3}        = '00153v.jpg';
in_names{4}        = '00154v.jpg';
in_names{5}        = '00163v.jpg';
in_names{6}        = '00270v.jpg';
in_names{7}        = '00398v.jpg';
in_names{8}        = '00458u.tif'; % Notice that some of these are tif's
in_names{9}        = '00564v.jpg';
in_names{10}       = '00911u.tif';
in_names{11}       = '01043u.tif';
in_names{12}       = '01047u.tif';
in_names{13}       = '01167v.jpg';
in_names{14}       = '01657u.tif';
in_names{15}       = '01861a.tif';
in_names{16}       =  '31421v.jpg';
img_dir = '../data';

% Write out to jpg, it's much smaller than a tif

out_names = cell(16,1);
out_names{1}        = '00125v.jpg';
out_names{2}        = '00149v.jpg';
out_names{3}        = '00153v.jpg';
out_names{4}        = '00154v.jpg';
out_names{5}        = '00163v.jpg';
out_names{6}        = '00270v.jpg';
out_names{7}        = '00398v.jpg';
out_names{8}        = '00458u.jpg';
out_names{9}        = '00564v.jpg';
out_names{10}       = '00911u.jpg';
out_names{11}       = '01043u.jpg';
out_names{12}       = '01047u.jpg';
out_names{13}       = '01167v.jpg';
out_names{14}       = '01657u.jpg';
out_names{15}       = '01861a.jpg';
out_names{16}       = '31421v.jpg';

out_dir = '.';

jpg_quality = 90;

for i=1:N
    display(in_names{i})
    
    % TODO: Read in the image in an appropriate numerical format
    x = imread(strcat('../data/',in_names{i}));
   
    %splitting images
    [blue, green, red] = split_image(x);
    
    blue = crop_image(blue, .1);
    green = crop_image(green, .1);
    red = crop_image(red, .1);
    
    % Implement an imalign function, which outputs the alignment shift vector
    green_shift = imalign(green, blue)

    red_shift = imalign(red, blue)
    
    shifted_green = shift_vec(green_shift, green);
    figure, imshow(shifted_green);
    shifted_red = shift_vec(red_shift, red);
    figure, imshow(shifted_red);
    
    % TODO: Shift the images by the output vector

    % Recombine the images into one 3-channel matrix
    out_image = im2uint8( cat(3, shifted_red, shifted_green,blue) );
    figure,imshow(out_image);

    imwrite(out_image, [ out_dir '/' out_names{i}], 'Quality', jpg_quality );
end





