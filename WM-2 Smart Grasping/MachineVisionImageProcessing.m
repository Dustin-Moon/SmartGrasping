function MachineVisionImageProcessing(coordinator)

    I2 = imread('Figure.png');
    I1 = imcrop(I2, [489,239,115,160]);
    imwrite(I1,'I1.png');
    I = imread('I1.png');

    Ibw = ~im2bw(I,graythresh(I));
    Ifill = imfill(Ibw,'holes');
    Iarea = bwareaopen(Ifill,100);
    Ifinal = bwlabel(Iarea);

    stat = regionprops(Ifinal,'boundingbox');
    hold on;
    Coordinates = [];
    for cnt = 1 : numel(stat)
        bb = stat(cnt).BoundingBox;
        rectangle('position',bb,'edgecolor','r','linewidth',2);
        Coordinates = cat(1, Coordinates, bb);
    end

    coordinator.Coordinates = Coordinates;

    coordinator.FlowChart.coordsMath;
end
