%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Name: Sunil Baliganahalli Narayana Murthy
% Course number: CSCI 5722 - Computer Vision
% Assignment: 1
% Instructor: Ioana Fleming
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc;

% Display a menu and get a choice
choice = menu('Choose an option', 'Exit Program', 'Load Image', ...
    'Display Image', 'Mean Filter', 'Gaussian Filter', 'Scale Nearest', ...
    'Scale Bilinear', 'Fun Filter');  % as you develop functions, add buttons for them here
 
% Choice 1 is to exit the program
while choice ~= 1
   switch choice
       case 0
           disp('Error - please choose one of the options.')
           % Display a menu and get a choice
           choice = menu('Choose an option', 'Exit Program', 'Load Image', ...
    'Display Image', 'Mean Filter', 'Gaussian Filter', 'Scale Nearest', ...
    'Scale Bilinear', 'Fun Filter');   % as you develop functions, add buttons for them here

       case 2
           % Load an image
           image_choice = menu('Choose an image', 'lena1', 'mandril1', 'sully', 'yoda', 'shrek');
           switch image_choice
               case 1
                   filename = 'lena1.jpg';
                   
               case 2
                   filename = 'mandrill1.jpg';
                   
               case 3
                   filename = 'sully.bmp';
                   
               case 4
                   filename = 'yoda.bmp';
                   
               case 5
                   filename = 'shrek.bmp';
           end
           current_img = imread(filename);
           
       case 3
           % Display image
           figure
           imagesc(current_img);
           if size(current_img,3) == 1
               colormap gray
           end
           
       case 4
           % Mean Filter
           
           % 1. Ask the user for size of kernel
           k_size = str2double(inputdlg('Enter size of kernel', 'Enter value'));
           
           % 2. Call the appropriate function
           newImage = meanFilter(current_img, k_size);
           
           % 3. Display the old and the new image using subplot
           subplot(121);
           imagesc(current_img);
           mt(1) = title('original image');
           
           subplot(122);
           imagesc(newImage);
           mt(2) = title('Mean filtered image');
           
           % 4. Save the newImage to a file
           imwrite(newImage, 'mean.jpg', 'jpg');
              
       case 5
           % Gaussian filter
           
           % 1. Ask the user for sd
           sigma = str2double(inputdlg('Enter the std. dev', 'Enter value'));;
           
           % 2. Call the appropriate function
           newImage = gaussianFilter(current_img, sigma);
           
           % 3. Display the old and the new image using subplot
           subplot(121);
           imagesc(current_img);
           mt(1) = title('original image');
           
           subplot(122);          
           imagesc(newImage);
           mt(2) = title('Gaussian filtered image');
           
           % 4. Save the newImage to a file
           imwrite(newImage, 'gauss.jpg', 'jpg');
           
       case 6
           % scale nearest
           
            % 1. Ask the user for scale factor
           factor = str2double(inputdlg('Enter scale factor', 'Enter value'));
           
           % 2. Call the appropriate function
           newImage = scaleNearest(current_img, factor);
           
           % 3. Display the old and the new image using subplot
           subplot(121);
           imagesc(current_img);
           mt(1) = title('original image');
           
           subplot(122);
           imagesc(newImage);
           mt(2) = title('Nearest neighbor scale');
           
           % 4. Save the newImage to a file
           imwrite(newImage, 'nearest.jpg', 'jpg');
           
       case 7
           % scale bilinear
           
           % 1. Ask the user for scale factor
           factor = str2double(inputdlg('Enter scale factor', 'Enter value'));
           
           % 2. Call the appropriate function
           newImage = scaleBilinear(current_img, factor);
           
           % 3. Display the old and the new image using subplot
           subplot(121);
           imagesc(current_img);
           mt(1) = title('original image');
           
           subplot(122);
           imagesc(newImage);
           mt(2) = title('Bilinear interpolated image');
           
           % 4. Save the newImage to a file
           imwrite(newImage, 'bilinear.jpg', 'jpg');
           
       case 8
           % fun filter
           newImage = funFilter(current_img);
           
           subplot(121);
           imagesc(current_img);
           mt(1) = title('original image');
           
           subplot(122);
           imagesc(newImage);
           mt(2) = title('Fun filter image');
           
           imwrite(newImage, 'funfilter.jpg', 'jpg');
   end
   % Display menu again and get user's choice
   choice = menu('Choose an option', 'Exit Program', 'Load Image', ...
    'Display Image', 'Mean Filter', 'Gaussian Filter', 'Scale Nearest', ...
    'Scale Bilinear', 'Fun Filter');   % as you develop functions, add buttons for them here
end
