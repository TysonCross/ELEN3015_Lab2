% ELEN3015 Lab 2, Question 4

clc 
clear all

% inputs
% plaintext_str = '0000000100100011010001010110011110001001101010111100110111101111'
% plaintext = plaintext_str - '0';
plaintext_str = '0123456789ABCDEF'
plaintext = hex2binary(plaintext_str);

key_str       = '0001001100110100010101110111100110011011101111001101111111110001';
key_64 = key_str - '0';
key_56 = permuter(key_64, 'parity');                      % discard parity bits and permute

%% encryption
block = permuter(plaintext,'initial');                    % initial permutation

for round_no = 1:16
    subkey = generateSubKey(key_56,round_no);
    [ L, R ] = DES(block, round_no, subkey);
    block = [L R];
end

cipherblock = permuter(block, 'final');
cipher_str = binary2hex(cipherblock)

%% decryption
out_block = permuter(cipherblock,'initial');

for round_no=1:16
    subkey = generateSubKey(key_56,17-round_no);
    [L, R] = DES(out_block, round_no, subkey);
    out_block = [L R];
end

decrypted = permuter(out_block, 'final');
decrypted_str = binary2hex(decrypted)

if isequal(decrypted_str,plaintext_str)
    disp('The decrypted block matches the plaintext block');
else
    disp('The decrypted block does NOT match the plaintext block');
end
