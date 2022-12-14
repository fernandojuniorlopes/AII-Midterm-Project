%***EXERCISE 1***

% % Directory of the dataset
directory = "insert your directory";

% % A)
% % function that returns a image stack (n, m, k)
[s3dImages] = ImageStack(directory);

% % B)
% % Number of frames in the stack
nframes = size(s3dImages, 3);

% % Dimensions of the frames
n = size(s3dImages(:,:,1));

% % C)
% % Stack to store resize images (256x256)
% s3dImages = imresize((s3dImages(:,:,1:nframes)),2);
% imshow(s3dImages(:,:,60), []);
% h = colorbar;

%D)
% % Maximum value of the stack
% max_value = max(s3dImages(:));

% % Minimum value of the stack
% min_value = min(s3dImages(:));

% % Loop the iterates through frames
% for i=1:nframes

    % % Show current image being iterated
    % imshow(s3dImages(:,:,i), []);

    % % Adding colorbar display the range of minimum and maximum values of the stack
    % h = colorbar;
    % caxis([min_value max_value]);
    % hold on

    % % pausing for .2 seconds
    % pause(.2);
% end

% % E) NOT WORKING YET
% img1 = s3dImages(:,:,1);
% img2 = s3dImages(:,:,2);
% montage({img1, img2},[]);
