function MachineVisionCoordsMath(coordinator)

Coords = coordinator.Coordinates;

XVals = [];
YVals = [];
ZVals = [];

for xval = 1:+1:size(Coords,1)
    XVals = cat(1, XVals, floor(Coords(xval,1)));
end


for yval = 1:+1:size(Coords,1)
    YVals = cat(1, YVals, floor(Coords(yval,2)));
end


for num = 1:+1:size(XVals,1)
    temp = XVals(num,1);
    temp = (temp/100);
    temp = (temp*44);
    temp = (temp + 18);
    temp = floor(temp);
    temp = (temp/100);
    XVals(num,1) = temp;
end

for num = 1:+1:size(YVals,1)
    temp = YVals(num,1);
    if temp >= 72
        temp = (temp/144);
        temp = (temp*64);
        temp = (temp - 32);
        temp = floor(temp);
        temp = (temp/100);
    else
        temp = (temp/144);
        temp = (temp*64);
        temp = (temp - 31);
        temp = floor(temp);
        temp = (temp/100);
    end
    YVals(num,1) = (-(temp));
end

for num = 1:+1:size(XVals,1)
    ZVals(num,1) = (0.26);
end

    NewCoords = cat(2,XVals,YVals,ZVals);

for num = 1:+1:size(XVals,1)
    ReturnCoords = trvec2tform([NewCoords(num,1), NewCoords(num,2), NewCoords(num,3)]);
    coordinator.Parts{num}.centerPoint = tform2trvec(ReturnCoords);
end

end
