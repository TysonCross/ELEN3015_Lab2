% ELEN3015 Lab 2, Question 3

clc 
clear all

% inputs
plaintext_str = '0000000100100011010001010110011110001001101010111100110111101111';
key_str       = '0001001100110100010101110111100110011011101111001101111111110001';
plaintext = plaintext_str - '0';
key_64 = key_str - '0';
key_56 = permuter(key_64, 'parity');                      % discard parity bits and permute
block = permuter(plaintext,'initial');                    % initial permutation

round_no = 1;
subkey = generateSubKey(key_56,round_no);

% perform the encryption
[ L_block, R_block ] = DES(block, round_no, subkey);
