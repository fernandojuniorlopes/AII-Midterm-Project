%This function recieves the directory of the frames and returns a stack of
%images (n,m,k)
function [s3dImages] = ImageStack(directory)
    %Returns the list of files with extension .dcm contained on the folder
    a = dir(directory+'/*.dcm');

    %Returns the number of files inside the list
    nFrames = numel(a);

    %Loop to read all images usim dicomread
    for i = 1:nFrames
        FrameNames = "Perm"+(i)+".dcm";
        fullFrameNames = fullfile(directory, FrameNames);
        sFrames{i} = dicomread(fullFrameNames);
    end

    %concatenates all frames into a stack
    s3dImages = cat(3,sFrames{1:nFrames});
end 