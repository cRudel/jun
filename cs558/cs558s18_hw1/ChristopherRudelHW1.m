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
nmxPlane = nonMaxSupp(magnitude(plane), direction(plane)); 
figure,imshow(nmxPlane);
figure,imshow(imgradient(red));
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

function i = direction(image)
    I = double(image);
    for i=1:size(I,1)-2
    for j=1:size(I,2)-2
        Gx=((2*I(i+2,j+1)+I(i+2,j)+I(i+2,j+2))-(2*I(i,j+1)+I(i,j)+I(i,j+2)));
        Gy=((2*I(i+1,j+2)+I(i,j+2)+I(i+2,j+2))-(2*I(i+1,j)+I(i,j)+I(i+2,j)));
        theta(i,j) = atand(Gy/Gx);
    end
    end
    i=theta;
end


 function [ marks ] = nonMaxSupp( mag,dir )
    [m,n]=size(mag);
    marks=uint8(ones(size(mag)));
    for i=2:m-1
        for j=2:n-1
            if mag(i,j) ~=0
               angle=dir(i,j)+180;
               if (angle>=340 || angle<=22.5) || (angle>=157.5 && angle<=202.5)  %horizontal
                if (mag(i,j+1)>mag(i,j)) || (mag(i,j-1)>mag(i,j))
                    marks(i,j)=0;
                end

            elseif (angle>22.5 && angle<=67.5) || (angle>202.5 && angle<=247.5) %45
                 if (mag(i+1,j+1)>mag(i,j)) || (mag(i-1,j-1)>mag(i,j))
                    marks(i,j)=0;
                 end
            elseif (angle>67.5 && angle<=112.5) || (angle>247.5 && angle<=292.5) %vertical
                 if (mag(i-1,j)>mag(i,j)) ||(mag(i+1,j)>mag(i,j))
                    marks(i,j)=0;
                end
            else %135
                 if (mag(i-1,j+1)>mag(i,j)) || (mag(i+1,j-1)>mag(i,j))
                    marks(i,j)=0;
                 end
               end
            end
        end 
    end

end