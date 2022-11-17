function [lmx, lmy , rmx, rmy] = luncmass(g)
    %Number of frames
    nFrames = size(g,3);
    for n = 8:nFrames

        %Image to be processed
        I = g(:,:,n);
        
        %Top hat to remove the background noise
        I2 = imtophat(I,strel('disk',15));
        
        %Imadjust to improve visibility of result
        I3 = imadjust(I2);
        
        %To convert to binary image
        bw = imbinarize(I3);
        
        %Open to remove connected components
        bw = bwareaopen(bw,65);

        %To compute label matrix
        Ilabel = bwlabel(bw);

        %Compute the center of mass for each coordinate of each lung
        center_mass = regionprops(Ilabel, g(:,:,n), 'WeightedCentroid');
        lmx{n} = center_mass(1).WeightedCentroid(1)
        lmy{n} = center_mass(1).WeightedCentroid(2)
        rmx{n} = center_mass(2).WeightedCentroid(1)
        rmy{n} = center_mass(2).WeightedCentroid(2)
    end
end