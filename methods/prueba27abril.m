fname = 'Rosenbrock100';
x = (5/2)*ones(1000,1);

[xf,MG,j] = dfp('Rosenbrock100', (3/2)*ones(100,1));

m = length(MG); vm = [1:m];
semilogy([1:length(MG)], MG, 'rd', [1:length(MG)], MG, 'b', 'Linewidth', 3)
title('Convergencia de DFP', 'Fontsize',20)
xlabel('Número de iteraciones', 'Fontsize',20);
ylabel('||g||', 'Fontsize',20);
