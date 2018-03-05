% ELEN3015 Lab 2, Question 4

clc 
clear all

% inputs
plainblock = 'AAAABBBBCCCCDDDD'             % plaintext input block
key_string = 'ABCD12349876FE';              % 56-bit key
key_64 = addParityBits(key_string);         % Add a 8th parity bit for every 7 bits 
key_56 = permuter(key_64, 'parity');        % discard parity bits and permute

%% encryption
block = permuter(plainblock,'initial');

for round_no = 1:16
    subkey = generateSubKey(key_56,round_no);
    [R, L] = encryptBlock(block, round_no, subkey);
    block = [R L];
end

cipherblock = permuter(block, 'final')

%% decryption
out_block = permuter(cipherblock,'initial');

for round_no=16:-1:1
    subkey = generateSubKey(key_56,round_no);
    [R, L] = encryptBlock(out_block, round_no, subkey);
    out_block = [R L];
end

decrypted = permuter(out_block, 'final')
