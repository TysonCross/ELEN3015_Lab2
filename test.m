clc 
clear all
format short g


clc 
clear all

% Key transformation
key_string = binary2hex(['0001001100110100010101110111100110011011101111001101111111110001'] - '0');
% key_string = '1F1F1F1F0E0E0E';              % 56-bit key
% key_64 = addParityBits(key_string);         % Add a 8th parity bit for every 7 bits
key_56 = permuter(key_string, 'parity');        % discard parity bits and permute
num2str(hex2binary(key_56));

str_key = num2str(hex2binary(key_56));

str_key(isspace(str_key)) = '';

% [L, R] = splitter(hex2binary(key_56));
% 
% num2str(L);
% num2str(R);
% 
% i =16;
% 
% for round_no=1:i
% disp(num2str(round_no))
% L = shiftKey(L,round_no);                            
% R = shiftKey(R,round_no);
% str_L=num2str(L);
% str_R=num2str(R);
% str_L(isspace(str_L)) = ''
% str_R(isspace(str_R)) = ''
% 
% disp(' ')
% disp(' ')
% end
    


for round_no=1:16
    key_schedule(round_no,:) = generateSubKey(key_56,round_no);
end

for i=1:16
    i
    str = num2str(hex2binary(key_schedule(i,:)));
    str(isspace(str)) = ''

end

%% CONFIRMED KEYGEN is working!




