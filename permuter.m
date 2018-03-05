function [ outBlock ] = permuter(inBlock, mode)
% Performs fixed permutation upon input block (64-/56-/48-bit)

block = hex2binary(inBlock);

% The permutation uses fixed D-tables and size of i/o block,
% determined by the mode argument: 
% For blocks: 'initial'(64-bit), 'final'(64-bit), 'expansion' (32->48-bit) or 'pbox'(32-bit)
% For keys: 'parity' (64->56-bit) or 'compression' (56->48-bit)

switch mode
    case 'initial'
        len = 64;
        permutationTable = [58, 50, 42, 34, 26, 18, 10, 02, 60, 52, 44, 36, 28, 20, 12, 04,...
                            62, 54, 46, 38, 30, 22, 14, 06, 64, 56, 48, 40, 32, 24, 16, 08,...
                            57, 49, 41, 33, 25, 17, 09, 01, 59, 51, 43, 35, 27, 19, 11, 03,...
                            61, 53, 45, 37, 29, 21, 13, 05, 63, 55, 47, 39, 31, 23, 15, 07];
    case 'final'
        len = 64;
        permutationTable = [40, 08, 48, 16, 56, 24, 64, 32, 39, 07, 47, 15, 55, 23, 63, 31,...
                            38, 06, 46, 14, 54, 22, 62, 30, 37, 05, 45, 13, 53, 21, 61, 29,...
                            36, 04, 44, 12, 52, 20, 60, 28, 35, 03, 43, 11, 51, 19, 59, 27,...
                            34, 02, 42, 10, 50, 18, 58, 26, 33, 01, 41, 09, 49, 17, 57, 25];

	case 'parity'
        len = 56;
        permutationTable = [57, 49, 41, 33, 25, 17, 09, 01, 58, 50, 42, 34, 26, 18,...
                            10, 02, 59, 51, 43, 35, 27, 19, 11, 03, 60, 52, 44, 36,...
                            63, 55, 47, 39, 31, 23, 15, 07, 62, 54, 46, 38, 30, 22,...
                            14, 06, 61, 53, 45, 37, 29, 21, 13, 05, 28, 20, 12, 04];
    case 'compression'
        len = 48;
        permutationTable = [14, 17, 11, 24, 01, 05, 03, 28, 15, 06, 21, 10,...
                            23, 19, 12, 04, 26, 08, 16, 07, 27, 20, 13, 02,...
                            41, 52, 31, 37, 47, 55, 30, 40, 51, 45, 33, 48,...
                            44, 49, 39, 56, 34, 53, 46, 42, 50, 36, 29, 32];
     case 'expansion'
         len = 48;
        permutationTable = [32, 01, 02, 03, 04, 05, 04, 05, 06, 07, 08, 09,...
                            08, 09, 10, 11, 12, 13, 12, 13, 14, 15, 16, 17,...
                            16, 17, 18, 19, 20, 21, 20, 21, 22, 23, 24, 25,...
                            24, 25, 26, 27, 28, 29, 28, 29, 30, 31, 32, 01];
    case 'pbox'
        len = 32;
        permutationTable = [16, 07, 20, 21, 29, 12, 28, 17,...
                            01, 15, 23, 26, 05, 18, 31, 10,...
                            02, 08, 24, 14, 32, 27, 03, 09,...
                            19, 13, 30, 06, 22, 11, 04, 25];
    otherwise
        error('Specify permutation mode: ''initial'', ''final'', ''parity'', ''compression'', ''expansion'', or ''pbox''')
end

outBlock = zeros(1,len);

for iter=1:len
    outBlock(iter) = block(permutationTable(iter));
end

outBlock = binary2hex(outBlock);

end
