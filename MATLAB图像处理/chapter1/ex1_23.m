A=input(¡®µ×');
B=input(¡®¶ÔÊýÖµ');
switch a
        case exp(1)
            y = log(B);
        case 2
            y = log2(B);
        case 10
            y = log10(B);
        otherwise
            y = log(B)/log(A);
end
