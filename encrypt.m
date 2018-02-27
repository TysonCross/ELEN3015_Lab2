function [ cipherblock ] = encrypt( plaintext, key )
% Performs non-linear S-Box substitution on inBlock

% Plaintext
% str_64 = typecast(uint64(plaintext),'uint64')
plainblock = reshape(dec2bin(plaintext) -'0',1,[]);
if length(plainblock) < 64
    plainblock = padarray(plainblock',64-length(plainblock),'post')';
end

% Key transformation
key_bin = dec2bin(uint64(key),64)- '0';
key_schedule = generateKeys(key_bin);

% Permute
block = permuter(plainblock,'initial');
[L, R] = splitter(block);   

% Rounds
for round_no=1:16
    temp = R;
    R = permuter(R,'expansion');
    R = xor(R,key_schedule(round_no,:));
    R = substitution(R);
    R = permuter(R,'pbox');
    R = xor(R,L);
    L = temp;
    if round_no == 16
        [R,L] = deal(L,R);
    end
end

block = [R L];
cipherblock = permuter(block, 'final');

% clear temp round_no key_schedule R L plainblock R block
end
