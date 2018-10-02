i = imread('road.png');
% figure,imshow(i);
I = double(i);
gaussRoad = filter('gaussian', I, 0, 2);
% figure,imshow(gaussRoad);
% buildi = edge(I, 'sobel', 'nothinning'); 
% figure, imshow(buildi);
sobelRoad = filter('sobel', I, 145, 0);
figure, imshow(sobelRoad);
[gx,gy] = gradient(I);
[gxx, gxy] = gradient(gx);
[gxy, gyy] = gradient(gy);
xmax = max(max(gxx));
ymax = max(max(gyy));
xymax = max(max(gxy));
maxima = gxx.*gyy-(gxy.*gxy);
% disp(maxima);




% filter
function f=filter(type,pic,threshold, sigma)
if strcmp(type, 'gaussian') 
   doubP = double(pic);
   siz = 5;
   [x, y] = meshgrid(-siz:siz, -siz:siz);
   exponent = -(x.^2 + y.^2) / (2 * (sigma^2));
   gaus = exp(exponent)/(2*pi*(sigma^2));
   
   col = size(x,1)-1;
   row = size(y,1)-1;
   
   Output = zeros(size(doubP));
   doubP = padarray(doubP, [siz,siz]);
   for i=1:size(doubP, 1)-col
      for j=1:size(doubP, 2)-row
        temp = doubP(i:i+col, j:j+col).*gaus;
        Output(i,j) = sum(temp(:));
      end
    end

Output = uint8(Output);
f = Output;

else %sobel filter
    sobP = double(pic);
    sobP = magnitude(sobP);
    P = max(sobP, threshold);
    P(P==round(threshold))=0;
    P = uint8(P);
    f = P;
    
    % builtin = edge(pic, 'sobel', 'nothinning'); 
    % figure, imshow(builtinK); %this is the builtin sobel filter
    % i used the above builtin to approximate the threshold values      
    
end
end

function i = magnitude(image)
    I = double(image);
    for i=1:size(I,1)-2
    for j=1:size(I,2)-2
        dx=((2*I(i+2,j+1)+I(i+2,j)+I(i+2,j+2))-(2*I(i,j+1)+I(i,j)+I(i,j+2)));
        dy=((2*I(i+1,j+2)+I(i,j+2)+I(i+2,j+2))-(2*I(i+1,j)+I(i,j)+I(i+2,j)));
        grad(i,j)=sqrt(dx.^2+dy.^2);
    end
    end
    i = grad;
    
end