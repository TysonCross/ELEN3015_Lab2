clc 
clear all
% key_64 = dec2bin(uint64(6744155797363555139))- '0';
key_64=[1:64]
key_56 = transformKey(key_64);
A = initialPermutate(key_64);