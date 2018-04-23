function [ L, R ] = DES( inBlock, round_no, subKey)
% Performs encryption on an input 64-bit block, returns two encrypted 32-bit blocks

% if length(inBlock) < 64
%     inBlock = padarray(inBlock',64-length(inBlock),'post')';
% end

% Round
[L, R] = splitter(inBlock);                     % evenly split the block into two 32-bit halves

temp = R;                                       % store the L half value
R = permuter(R,'expansion');                    % perform the expansion permutation
R = xor(R, subKey);                             % XOR with the round subkey
R = substitution(R);                            % perform non-linear s-box substitution
R = permuter(R,'pbox');                         % perform the p-box permutation
R = xor(R,L);                                   % XOR with the original L half
L = temp;                                       % assign L to the output from the Feistel cipher
if round_no == 16                               % swap the L and R halves on the final round
    [R,L] = deal(L,R);
end

%% output
% disp(['Round ', num2str(round_no), ':'])
% disp(['L: ', num2string(L), '   R: ',num2string(R)])
end