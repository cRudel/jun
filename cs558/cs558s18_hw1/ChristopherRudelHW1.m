function main()
red = imread('red.pgm');
plane = imread('plane.pgm');
kangaroo = imread('kangaroo.pgm');
prompt = 'What is the sigma value? ';
sigma = input(prompt);
redGauss = filter('gaussian', red, 0 ,sigma);
planeGauss = filter('gaussian', plane, 0, sigma);
kangarooGauss = filter('gaussian', kangaroo, 0, sigma);
redSobel = filter('sobel', red, 250);
planeSobel = filter('sobel', plane, 115);
kangarooSobel = filter('sobel', kangaroo, 200);
redNMS = nonMaxSupp(red);
planeNMS = nonMaxSupp(plane);
kangarooNMS = nonMaxSupp(kangaroo);
%{
figure,imshow(redGauss); title('Gaussian filter on red image');
figure,imshow(planeGauss); title('Gaussian filter on plane image');
figure,imshow(kangarooGauss); title('Gaussian filter on kangaroo image');
figure,imshow(redSobel); title('Sobel Edge Detection on red image');
figure,imshow(planeSobel); title('Sobel Edge Detection on plane image');
figure,imshow(kangarooSobel); title('Sobel Edge Detection on kangaroo image');
figure,imshow(redNMS); title('Non-Maximum Suppression on red image');
figure,imshow(planeNMS); title('Non-Maximum Suppression on plane image');
figure,imshow(kangarooNMS); title('Non-Maximum Suppression on kangaroo image');
%}
end

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

function output = nonMaxSupp(image)
    I = double(image);
%   I would have liked to call magnitude but we needed dx and dy to compute
%   the angle
    for i=1:size(I,1)-2
    for j=1:size(I,2)-2
        dx=((2*I(i+2,j+1)+I(i+2,j)+I(i+2,j+2))-(2*I(i,j+1)+I(i,j)+I(i,j+2)));
        dy=((2*I(i+1,j+2)+I(i,j+2)+I(i+2,j+2))-(2*I(i+1,j)+I(i,j)+I(i+2,j)));
        gradi(i,j)=sqrt(dx.^2+dy.^2);
        ang(i,j) = atan2(dy,dx)*180/pi;
    end
    end
    [height, width] = size(I);
    output = zeros(height,width);
    for i=2:height-3 % row
        for j=2:width-3 % col         
            if (ang(i,j)>=-22.5 && ang(i,j)<=22.5) || (ang(i,j)<-157.5 && ...
                ang(i,j)>=-180)
                if (gradi(i,j) >= gradi(i,j+1)) && (gradi(i,j) >= gradi(i,j-1))
                    output(i,j)= gradi(i,j);
                else
                    output(i,j)=0;
                end
            elseif (ang(i,j)>=22.5 && ang(i,j)<=67.5) || (ang(i,j)<-112.5 && ...
            ang(i,j)>=-157.5)
                if (gradi(i,j) >= gradi(i+1,j+1)) && (gradi(i,j) >= gradi(i-1, j-1))
                    output(i,j)= gradi(i,j); 
                else
                    output(i,j)=0;
                end
            elseif (ang(i,j)>=67.5 && ang(i,j)<=112.5) || (ang(i,j)<-67.5 && ...
                ang(i,j)>=-112.5)
                if (gradi(i,j)>=gradi(i+1,j)) && (gradi(i,j)>=gradi(i-1,j))
                    output(i,j)=gradi(i,j);
                else
                    output(i,j)=0;
                end
            elseif (ang(i,j)>=112.5 && ang(i,j)<=157.5) || (ang(i,j)<-22.5 && ...
                ang(i,j)>=-67.5)
                if (gradi(i,j) >= gradi(i+1,j-1)) && (gradi(i,j) >= gradi(i-1,j+1))
                    output(i,j)= gradi(i,j);
                else
                    output(i,j)=0;
                end
            end
        end
    end
end

