function [ R_hex, L_hex ] = encryptBlock( inBlock, round_no, subKey )
% Performs encryption on an input 64-bit block, returns two encrypted 32-bit blocks

% conversion and length check
subKey_bin = hex2binary(subKey);
block = hex2binary(inBlock);
% if length(plainblock) < 64
%     plainblock = padarray(plainblock',64-length(plainblock),'post')';
% end

% Round
[L, R] = splitter(block);   

temp = R;
R = permuter(binary2hex(R),'expansion');
R = xor(hex2binary(R), subKey_bin);
R = substitution(R);
R = permuter(binary2hex(R),'pbox');
R = xor(hex2binary(R),L);
L = temp;
if round_no == 16
    [R,L] = deal(L,R);
else
end

R_hex = binary2hex(R);
L_hex = binary2hex(L);
end
