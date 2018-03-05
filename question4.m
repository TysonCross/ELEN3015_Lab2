% ELEN3015 Lab 2, Question 4

clc 
clear all

% inputs
plaintext_str = '0123456789ABCDEF';                       % test block
plaintext = hex2binary(plaintext_str);                    % convert to binary row vector
key_str = '0001001100110100010101110111100110011011101111001101111111110001';
key_64 = key_str - '0';                                   % convert to binary row vector
key_56 = permuter(key_64, 'parity');                      % discard parity bits and permute

%% encryption
block = permuter(plaintext,'initial');                    % initial permutation
for round_no = 1:16                                       % 16 rounds of DES
    subkey = generateSubKey(key_56,round_no);             % subkey generation for each round
    [ L, R ] = DES(block, round_no, subkey);              % DEA (encryption)
    block = [L R];                                        % rejoin the L and R halves
end
cipherblock = permuter(block, 'final');                   % final permutation


%% decryption
out_block = permuter(cipherblock,'initial');              % initial permutation
for round_no=1:16                                         % 16 rounds of DES
    subkey = generateSubKey(key_56,17-round_no);          % subkeys generated in reverse order
    [L, R] = DES(out_block, round_no, subkey);            % DEA (decrpytion)
    out_block = [L R];                                    % rejoin block halves
end
decrypted = permuter(out_block, 'final');                 % final permutation


% output and check
decrypted_str = binary2hex(decrypted);
cipher_str = binary2hex(cipherblock);
disp(['Input 64-bit key:     ', binary2hex(key_64)])
disp(['Encryted ciphertext:  ', cipher_str])
disp(['Original input text:  ', plaintext_str]);
disp(['Decrypted plaintext:  ', decrypted_str])
disp(' ')

% check
if isequal(decrypted_str,plaintext_str)
    disp('The decrypted block matches the plaintext block');
else
    warning('The decrypted block does NOT match the plaintext block');
end