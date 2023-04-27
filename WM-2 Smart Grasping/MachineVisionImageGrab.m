function MachineVisionImageGrab(coordinator)


    printImage(coordinator);
    UnInvisibleObjects(coordinator);

    % Trigger Stateflow chart Event
    coordinator.FlowChart.imageCreated;

end

