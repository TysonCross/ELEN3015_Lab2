function [ outKey ] = shiftKey( inKey, round_no)
% Left-shifts (circularly) key entries, 1 or 2 places, depending on the round

if (round_no==1 || round_no==2 || round_no==9 || round_no==16)
    shift = -1;
else shift = -2;
end

outKey = circshift(inKey',[shift,0])';
end
