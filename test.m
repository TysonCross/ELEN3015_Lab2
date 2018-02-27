clc 
clear all
format short g

%% Key transformation
key = 6744155797363555139;
plaintext='Greetings';
cipher = encrypt(plaintext, key);
output = encrypt(cipher, key);

% M=[]
% translate = reshape(output(2:end),[9,7])
% for i = 1:9
% 	translate = num2str(translate)
%     translate = char(bin2dec(translate(i,1:3:end)))
% end
% 
% recovered = char(bin2dec(num2str(translate)))'
% 
% 
% str_64 = typecast(uint64(plaintext),'uint64')
% plainblock = reshape(dec2bin(str_64) -'0',1,[]);
% if length(plainblock) < 64
%     plainblock = padarray(plainblock',64-length(plainblock),'pre')';
% end


% output
disp(num2str(cipher))
disp(num2str(output))



