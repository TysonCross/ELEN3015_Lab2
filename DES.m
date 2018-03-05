function [ L, R ] = DES( inBlock, round_no, subKey)
% Performs encryption on an input 64-bit block, returns two encrypted 32-bit blocks

% if length(inBlock) < 64
%     inBlock = padarray(inBlock',64-length(inBlock),'post')';
% end

% Round
[L, R] = splitter(inBlock);   

temp = R;
R = permuter(R,'expansion');
R = xor(R, subKey);
R = substitution(R);
R = permuter(R,'pbox');
R = xor(R,L);
L = temp;
if round_no == 16
    [R,L] = deal(L,R);
else
end

% disp(['Round ', num2str(round_no), ':'])
% disp(['L: ', num2string(L), '   R: ',num2string(R)])
end