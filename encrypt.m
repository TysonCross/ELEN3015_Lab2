clc 
clear all

% Plaintext
plaintext='Greetings';
plainblock = reshape([dec2bin(uint64(plaintext))-'0'],1,[]);
plainblock(64) = 0; % Padding for now

% Key transformation
key = dec2bin(uint64(6744155797363555139))- '0';
key_schedule = generateKeys(key);

% Permute
block = permuter(plainblock,'initial');
[L, R] = splitter(block);   

% Rounds
for round_no=1:16
    temp = R;
    R = permuter(R,'expansion');
    R = xor(R,key_schedule(round_no,:));
    R = substitution(R); % not working!
    R = permuter(R,'pbox');
    R = xor(R,L);
    L = temp;
    if round_no == 16
        [R,L] = deal(L,R);
    end
end

block = [R L]
block = permuter(block, 'final');

% output
disp(block);