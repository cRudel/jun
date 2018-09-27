function main()
red = imread('red.pgm');
plane = imread('plane.pgm');
kangaroo = imread('kangaroo.pgm');
redGauss = filter('gaussian', red);
planeGauss = filter('gaussian', plane);
kangarooGauss = filter('gaussian', kangaroo);
redSobel = filter('sobel', red, 250);
planeSobel = filter('sobel', plane, 115);
kangarooSobel = filter('sobel', kangaroo, 200);

%helppp
help = nonMaxSupp(red);
figure,imshow(nmxPlane);
%figure,imshow(imgradient(red));
end

function f=filter(type,pic,threshold)
if strcmp(type, 'gaussian')
   prompt = 'What is the sigma value? ';
   sigma = input(prompt); 
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
        Gx=((2*I(i+2,j+1)+I(i+2,j)+I(i+2,j+2))-(2*I(i,j+1)+I(i,j)+I(i,j+2)));
        Gy=((2*I(i+1,j+2)+I(i,j+2)+I(i+2,j+2))-(2*I(i+1,j)+I(i,j)+I(i+2,j)));
        grad(i,j)=sqrt(Gx.^2+Gy.^2);
    end
    end
    i = grad;
    
end

function output = nonMaxSupp(image)
    I = double(image);
    for i=1:size(I,1)-2
    for j=1:size(I,2)-2
        Gx=((2*I(i+2,j+1)+I(i+2,j)+I(i+2,j+2))-(2*I(i,j+1)+I(i,j)+I(i,j+2)));
        Gy=((2*I(i+1,j+2)+I(i,j+2)+I(i+2,j+2))-(2*I(i+1,j)+I(i,j)+I(i+2,j)));
        grad(i,j)=sqrt(Gx.^2+Gy.^2);
    end
    end
    angle = atan2(Gy,Gx)*180/pi;
    
    [height, width] = size(I);
    output = zeros(height,width);
    for i=1:height-2 % row
        for j=1:width-2 % col         
            if (angle(i,j)>=-22.5 && angle(i,j)<=22.5) || ...
                (angle(i,j)<-157.5 && angle(i,j)>=-180)
                if (grad(i,j) >= grad(i,j+1)) && ...
                   (grad(i,j) >= grad(i,j-1))
                    output(i,j)= grad(i,j);
                else
                    output(i,j)=0;
                end
            elseif (angle(i,j)>=22.5 && angle(i,j)<=67.5) || ...
                (angle(i,j)<-112.5 && angle(i,j)>=-157.5)
                if (grad(i,j) >= grad(i+1,j+1)) && ...
                   (grad(i,j) >= grad(i-1,j-1))
                    output(i,j)= grad(i,j);
                else
                    output(i,j)=0;
                end
            elseif (angle(i,j)>=67.5 && angle(i,j)<=112.5) || ...
                (angle(i,j)<-67.5 && angle(i,j)>=-112.5)
                if (grad(i,j) >= grad(i+1,j)) && ...
                   (grad(i,j) >= grad(i-1,j))
                    output(i,j)= grad(i,j);
                else
                    output(i,j)=0;
                end
            elseif (angle(i,j)>=112.5 && angle(i,j)<=157.5) || ...
                (angle(i,j)<-22.5 && angle(i,j)>=-67.5)
                if (grad(i,j) >= grad(i+1,j-1)) && ...
                   (grad(i,j) >= grad(i-1,j+1))
                    output(i,j)= grad(i,j);
                else
                    output(i,j)=0;
                end
            end
        end
    end
end

