function [count, classification] = analyseSubKeys( key_schedule )
% analyseSubKeys counts and classifies the strength of a subkey schedule

[n, m] = size(unique(key_schedule,'rows'));
count = n;

switch n
    case 1
        classification = 'weak';
    case 2
        classification = 'semi weak';
    case 4
        classification = 'possibly weak';
    otherwise
        classification = 'flat/linear';
end
end

