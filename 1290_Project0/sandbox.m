%this is the temp script for project 0
A = imread('data/willyoudareswing.jpg');
[m1,n1,o1] = size( A );
tic;
for k=1:1000
    for i=1:m1
        for j=1:n1
            for k = 1:o1
                if A(i,j,k) <= 10
                    A(i,j,k) = 0;
            
                end
            end
        end
    end
end
v = toc