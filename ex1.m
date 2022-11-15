%***EXERCISE 1***

%directory of the dataset
directory = "C:\MEI2122\AII\midtermproject\perm";

%A)
% %function that returns a image stack (n, m, k)
[s3dImages] = ImageStack(directory);

%B)
% %Number of frames in the stack
% nframes = size(s3dImages, 3);

% Dimensions of the frames
% n = size(s3dImages(:,:,1));

%C)
%Stack to store resize images (256x256)
% s3dImages = imresize((s3dImages(:,:,1:nframes)),2);
% imshow(s3dImages(:,:,60), []);
% h = colorbar;

%D)
% %Maximum value of the stack
max_value = max(s3dImages(:));
% 
% %Minimum value of the stack
min_value = min(s3dImages(:));

%E) NOT WORKING YET
% img1 = s3dImages(:,:,1);
% img2 = s3dImages(:,:,2);
% montage({img1, img2},[]);