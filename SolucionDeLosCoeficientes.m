% El siguiente codigo, realiza una solucion basada en variables simbolicas para expresar 
% La solucion de los coeficientes de la serie de fourier
% Realiza un calculo muy aproximado a los coeficientes calculados manualmente. 


close all
clear all
clc
pkg load symbolic  %cargamos el modulo para las variables simbolicas
syms x n  % variables simbolicas creadas 
f=[1 -1]; % Definicion de la Funcion 
L=[0 5 10];%% Definicion de los intervalos para la funcion. 

f=sym(f); % Crea una funciona simbolica basandose en los datos de la definicion de la funcion. 
P=max(L)-min(L); % periodo para la funcion
wo=2*pi/(P); % Frecuencia angular para la funcion

% Solucion al coeficinete A0
Ao=0;
for i=1:length(f)
    Ao=Ao+int(f(i),'x',L(i),L(i+1)); %Integracion para A0
end
% Simplificando A0
Ao=simplify(Ao/P);

% Solucion al coeficiente An
An=0;
for i=1:length(f)
    An=An+int(f(i)*cos(n*wo*x),L(i),L(i+1)); %Integracion para An
end
% Simplificando An 
An=simplify(2*An/P);

% Solucion al coeficiente Bn
Bn=0;
for i=1:length(f)
    Bn=Bn+int(f(i)*sin(n*wo*x),L(i),L(i+1)); %Integracion para Bn
end
% Simplificando Bn 
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

% Desplegando la informacion de la solucion.
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