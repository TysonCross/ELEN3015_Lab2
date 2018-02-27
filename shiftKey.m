function [ outKey ] = shiftKey( inKey )
% shiftKey() performs fixed order of 16 rounds of bitshifting,
% either one or two places to the left depending on a round schedule

for i=1:16
    if (i==1 || i==2 || i==9 || i==16)
        shifts = 1;
    else shifts = 2;
    end
    inKey = circshift(inKey',[-shifts,0]);
end
outKey = inKey;
end
