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

imshow(kangarooGauss);
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
    for i=1:size(sobP,1)-2
        for j=1:size(sobP,2)-2
        Gx=((2*sobP(i+2,j+1)+sobP(i+2,j)...
        +sobP(i+2,j+2))-(2*sobP(i,j+1)...
        +sobP(i,j)+sobP(i,j+2)));
        Gy=((2*sobP(i+1,j+2)+sobP(i,j+2)+sobP(i+2,j+2))...
        -(2*sobP(i+1,j)+sobP(i,j)+sobP(i+2,j)));
        
        sobP(i,j) = sqrt(Gx.^2+Gy.^2);
        end
    end
    P = max(sobP, threshold);
    P(P==round(threshold))=0;
    P = uint8(P);
    f = P;
    
    % builtin = edge(pic, 'sobel', 'nothinning'); 
    % figure, imshow(builtinK); %this is the builtin sobel filter
    % i used the above builtin to approximate the threshold values      
    
end
end

function f = nonMaxSupp(dx, dy, gradMag, lowThresh, highThresh)

end
