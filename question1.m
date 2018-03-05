clc 
clear all

%% Key transformation
key_string = '1F1F1F1F0E0E0E';
key_64 = addParityBits(key_string);     % Add a 8th parity bit for every 7 bits
key_56 = permuteKey(key_64);            % discard parity bits and permute

for round_no=1:16
    key_schedule(round_no,:) = generateSubKey(key_56,round_no);
end

key_schedule


