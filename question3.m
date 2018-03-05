% ELEN3015 Lab 2, Question 3

clc 
clear all

% inputs
plaintext = 'AAAABBBBCCCCDDDD';             % plaintext input block 
key_string = 'ABCD12349876FE';              % 56-bit key
key_64 = addParityBits(key_string);         % Add a 8th parity bit for every 7 bits
key_56 = permuter(key_64, 'parity');        % discard parity bits and permute
round_no = 10;

% perform the encryption
subkey = generateSubKey(key_56,round_no);
[R_block, L_block] = encryptBlock(plaintext, round_no, subkey)