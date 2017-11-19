close all
clear all
clc
pkg load symbolic
syms x n
f=[1 -1];%%%%%% Funcion.
L=[0 5 10];%% Intervalo.

f=sym(f);
P=max(L)-min(L);
wo=2*pi/(P);

Ao=0;
for i=1:length(f)
    Ao=Ao+int(f(i),'x',L(i),L(i+1));
end
Ao=simplify(Ao/P);

An=0;
for i=1:length(f)
    An=An+int(f(i)*cos(n*wo*x),L(i),L(i+1));
end
An=simplify(2*An/P);

Bn=0;
for i=1:length(f)
    Bn=Bn+int(f(i)*sin(n*wo*x),L(i),L(i+1));
end
Bn=simplify(2*Bn/P);

An=char(An);
Bn=char(Bn);
An=simplify(sym(strrep(char(An),'sin(pi*n)','0')));
Bn=simplify(sym(strrep(char(Bn),'sin(pi*n)','0')));

An=simplify(sym(strrep(char(An),'cos(pi*n)','(-1)^n')));
Bn=simplify(sym(strrep(char(Bn),'cos(pi*n)','(-1)^n')));

An=simplify(sym(strrep(char(An),'sin(2*pi*n)','0')));
Bn=simplify(sym(strrep(char(Bn),'sin(2*pi*n)','0')));

An=simplify(sym(strrep(char(An),'cos(2*pi*n)','1')));
Bn=simplify(sym(strrep(char(Bn),'sin(2*pi*n)','1')));
%
disp('f(x)= ')
pretty(f)
disp(' ')
fprintf('Limites = %.4f\n', L)
disp(' ')
disp('Ao')
pretty(Ao)
disp(' ')
disp('An')
pretty(An)
disp(' ')
disp('Bn')
pretty(Bn)
disp(' ')