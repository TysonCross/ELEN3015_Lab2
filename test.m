clc 
clear all

% Key transformation
key = dec2bin(uint64(6744155797363555139))- '0';
key = generateKey(key);

% output
disp(mat2str(key));
length(key)