% ELEN3015 Lab 2, Question 1

clc 
clear all

% Key transformation
% key_bin = hex2binary('1F1F1F1F0E0E0E');     % 56-bit key
% key_64 = addParityBits(key_bin)            % Add a 8th parity bit for every 7 bits

key_64 = '0001001100110100010101110111100110011011101111001101111111110001' - '0';
key_56 = permuter(key_64, 'parity');        % discard parity bits and permute

for round_no=1:16
    key_schedule(round_no,:) = generateSubKey(key_56,round_no);
end

for i=1:16
    disp(['Round ', num2str(i,'%02d'), ' the subkey is: ', num2string(key_schedule(i,:))]);
end


