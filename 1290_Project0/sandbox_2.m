A = imread('data/willyoudareswing.jpg');
tic;
for i = 1:1000
    A(A <= 10) = 0;
end
a = toc