%directory of the dataset
directory = "C:\MEI2122\AII\midtermproject\perm";

% %function that returns a image stack (n, m, k)
[s3dImages] = ImageStack(directory);
nframes = size(s3dImages, 3);

% % ***EXERCISE 2***

% % A) Plot of the profile measured activity on line 32 (y = 32)
% img30 = s3dImages(:,:,30);
% improfile(img30, [0 , 128], [32, 32]);

% % B)
% % Center estimated for each lung: Left(51, 61) Right(85,61)
% % Loop to retrieve the activity of the center of each lung throughout the frames 
% for i=1:nframes
%     l_lung_values{i} = s3dImages(51, 61, i)
%     r_lung_values{i} = s3dImages(85, 61, i)
% end
% % Concatenates all activity values
% l_lung = cat(1,l_lung_values{1:nframes});
% r_lung = cat(1,r_lung_values{1:nframes});

% % Plot of the concatenated values of each lung
% subplot(1,2,1), plot(l_lung);
% subplot(1,2,2), plot(r_lung);

% % C)
% % Using gaussian filter didnt give good results
% H = fspecial('gaussian', 5);
% filteredImages_imfilter = imfilter(s3dImages, H);

% % Using imgaussfilt gave better results
% filteredImages_imgauss = imgaussfilt(s3dImages, 5);
% 
% subplot(1,2,1), imshow(filteredImages(:,:,30), []);
% subplot(1,2,2), imshow(s3dImages(:,:,30), []);

% % D)
% % Loop to filter using 3 point moving average filter
% for n = 2 : nframes - 1
%     g(:,:, n) = ((s3dImages(:,:, n-1) + s3dImages(:,:, n) + s3dImages(:,:, n+1))/3);
% end

% % Example to show results of using 3 point moving average filter
% img30 = s3dImages(:,:,30);
% img30_averaged_filter = g(:,:,30);

% % Plot of the example 
% subplot(1,2,1), improfile(img30, [0 , 128], [32, 32]);
% subplot(1,2,2), improfile(img30_averaged_filter, [0 , 128], [32, 32]);

% E)
% % Middle Image (img60) 
image60 = s3dImages(:,:,60);

% % Array with values higher than 10 (to exclude the background)
% val = image60 > 10;

% % Histogram of the image without background values and with 32 classes
% histogram( image60(val),32);
% 
% F)
image60 = s3dImages(:,:,60);

% % Using threshold with value 60
backgroundMask = image60 < 60;
image60(backgroundMask) = 0;

% % Creating of the structural element
se = strel('disk',11);
% % Using open to remove some noise from the lungs
Io = imopen(image60,se);

% % Reconstruct the lungs
Iobr = imreconstruct(Io, image60);

% % Using automatic threshold
% image_no_mask = imbinarize(s3dImages(:,:,60), 'adaptive');
% 
% subplot(1,2,1), imshow(Iobr, []);
% subplot(1,2,2), imshow(image_no_mask, []);

% % G) ***Por fazer***

% % H)
img = imbinarize(Iobr);

% % Creating labels for each lung
Ilabel = bwlabel(img);

% % Using regionprops to retrieve area, centroid and center of mass from each lung
info = regionprops(Ilabel);
info.Area
info.Centroid
% % Weighted centroid retrieves the center of mass
center_mass = regionprops(Ilabel, s3dImages(:,:,60), 'WeightedCentroid');

% % I)
display(Ilabel);

% % J)
imshow(Ilabel, []);
impixelinfo

% Mean activity ? 
% 
% I)
% CC = bwconncomp(bw);
% L = labelmatrix(CC);
% imshow(L, []);
% impixelinfo

% K)
% imshow(Ilabel, []);
% hold on
% imcontour(img, '-r');

% % L)
% % Using region props to get the centroid of each lung
% stat = regionprops(Ilabel,'centroid');
% hold on

% % Ploting the centroid and center of mass on each lung
% for x = 1:2
%     plot(stat(x).Centroid(1),stat(x).Centroid(2),'ro');
%     plot(center_mass(x).WeightedCentroid(1), center_mass(x).WeightedCentroid(2),'r*');
% end
