red = imread('red.pgm');
plane = imread('plane.pgm');
kangaroo = imread('kangaroo.pgm');

%           Gaussian problem 1          %

prompt = 'What is the sigma value?';
sigma = input(prompt); 
% sigma = 3;

doubleR = double(red);
doubleP = double(plane);
doubleK = double(kangaroo);

siz = 5;

[x, y] = meshgrid(-siz:siz, -siz:siz);
exponent = -(x.^2 + y.^2) / (2 * (sigma^2));
gaus = exp(exponent)/(2*pi*(sigma^2));

col = size(x,1)-1;
row = size(y,1)-1;

output = zeros(size(doubleR));
doubleR = padarray(doubleR, [siz,siz]);
doubleP = padarray(doubleP, [siz,siz]);
doubleK = padarray(doubleK, [siz,siz]);

for i=1:size(doubleR, 1)-col
    for j=1:size(doubleR, 2)-row
        temp = doubleR(i:i+col, j:j+col).*gaus;
        Output0(i,j) = sum(temp(:));
    end
end

Output0 = uint8(Output0);
figure,imshow(Output0);

for i=1:size(doubleP, 1)-col
    for j=1:size(doubleP, 2)-row
        temp = doubleP(i:i+col, j:j+col).*gaus;
        Output1(i,j) = sum(temp(:));
    end
end

Output1 = uint8(Output1);
figure,imshow(Output1);

for i=1:size(doubleK, 1)-col
    for j=1:size(doubleK, 2)-row
        temp = doubleK(i:i+col, j:j+col).*gaus;
        Output2(i,j) = sum(temp(:));
    end
end

Output2 = uint8(Output2);
figure,imshow(Output2);





%               Sobel Problem 2             %

R = red;
P = plane;
K = kangaroo;
sobR = double(red);
sobP = double(plane);
sobK = double(kangaroo);

for i=1:size(sobR,1)-2
    for j=1:size(sobR,2)-2
        Gx=((2*sobR(i+2,j+1)+sobR(i+2,j)...
        +sobR(i+2,j+2))-(2*sobR(i,j+1)...
        +sobR(i,j)+sobR(i,j+2)));
        Gy=((2*sobR(i+1,j+2)+sobR(i,j+2)+sobR(i+2,j+2))...
        -(2*sobR(i+1,j)+sobR(i,j)+sobR(i+2,j)));
        
        R(i,j) = sqrt(Gx.^2+Gy.^2);
    end
end

% figure,imshow(R);
% builtinR = edge(red, 'sobel', 'nothinning'); 
% figure, imshow(builtinR); %this is the builtin sobel filter
threshR = 250; %calculated this by comparing built in to computed filter
R = max(R, threshR);
R(R==round(threshR))=0;
R = uint8(R);
figure, imshow(R); %this is what was computed 


for i=1:size(sobP,1)-2
    for j=1:size(sobP,2)-2
        Gx=((2*sobP(i+2,j+1)+sobP(i+2,j)...
        +sobP(i+2,j+2))-(2*sobP(i,j+1)...
        +sobP(i,j)+sobP(i,j+2)));
        Gy=((2*sobP(i+1,j+2)+sobP(i,j+2)+sobP(i+2,j+2))...
        -(2*sobP(i+1,j)+sobP(i,j)+sobP(i+2,j)));
        
        P(i,j) = sqrt(Gx.^2+Gy.^2);
    end
end

% builtinP = edge(plane, 'sobel', 'nothinning'); 
% figure, imshow(builtinP); %this is the builtin sobel filter
threshP = 115;
P = max(P, threshP);
P(P==round(threshP))=0;
P = uint8(P);
figure, imshow(P); %this is what was computed


for i=1:size(sobK,1)-2
    for j=1:size(sobK,2)-2
        Gx=((2*sobK(i+2,j+1)+sobK(i+2,j)...
        +sobK(i+2,j+2))-(2*sobK(i,j+1)...
        +sobK(i,j)+sobK(i,j+2)));
        Gy=((2*sobK(i+1,j+2)+sobK(i,j+2)+sobK(i+2,j+2))...
        -(2*sobK(i+1,j)+sobK(i,j)+sobK(i+2,j)));
        
        K(i,j) = sqrt(Gx.^2+Gy.^2);
    end
end
% builtinK = edge(kangaroo, 'sobel', 'nothinning'); 
% figure, imshow(builtinK); %this is the builtin sobel filter
threshK = 200;
K = max(K, threshK);
K(K==round(threshK))=0;
K = uint8(K);
figure, imshow(K); %this is what was computed




%               Non Maximum Suppression Problem 3       %



