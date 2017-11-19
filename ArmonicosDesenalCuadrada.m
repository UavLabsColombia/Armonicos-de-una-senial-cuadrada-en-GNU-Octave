
%Este codigo es usado para realizar la representacion de la serie de fourier para una señal cuadrada
%La señal empieza en el tiempo=0 y tiene una amplitud de 1V, y una frecuencia fundamental radial w=2*pi*f
%Sumatorioa de los terminos de la representacion de fourier o multiplos de la frecuencia fundamental 
%para una señal cuadrada perfecta, el numero del armonico deberia de tender a infinito, pero para su representacion
%se puede expresar hasta aproximadamente 10000 armonicos de la señal. 

%Video con informacion de la transformada: https://www.youtube.com/watch?v=o7O7vC0Bmms por Andrew Finelli
close all
clear all
clc
%N = input("Ingrese el numero de armonicos a generar..") % Change this variable to change the number of terms in the fourier series

disp ("--------------------------------------------------------------------------------------")
disp ("Serie de Fourier (Armonicos)...\nInformacion:\nEsta serie ha sido calculada para generar una señal de la forma cuadrada\nLa señal comienza en tiempo = 0seg y terminara en un tiempo que depende del numero de ciclos, tendra una amplitud definida en la entrada\nTambien tendremos una frecuancia angular que depende de la entrada\nel numero de la variable Armonicos, realizara la sumatoria de los terminos de fourier")
disp ("--------------------------------------------------------------------------------------")

%printf ()

Vp= input("Opcional:\nPuede utilizar notacion cientifica(3e9)\nIngrese el Voltaje Pico de la funcion a generar... \n");
N = input("Ingrese el numero de armonicos a generar... \n");
frecuencia = input("Valor de la Frecuencia (Hz)\n");
W1 = 2*pi*frecuencia; %Frecuencia fundamental para la funcion
periodo = 1/frecuencia; %Periodo de la funcion fundamental 
ciclosAVer = input("Numero de ciclos a visualizar en el plot\n");

nperiodos=periodo*ciclosAVer;%numero de periodos que se quieren ver
t = 0:periodo/2048:nperiodos; % Definicion del tiempo para la representacion desde 0 hasta nperiodos con un paso de periodo/2048 para una buena visualizacion
f = zeros(1,length(t)); % Inicializacion de la funcion
f2 = zeros(1,length(t)); % Inicializacion de la funcion
f3 = zeros(1,length(t)); % Inicializacion de la funcion


  
for n = 1:2:N % Loop para calcular la sumatoria 
    
    %bn = (4)/(pi*n);  Este es el coeficiente de la serie de fourier calculado a mano.
    bn = ((-2*(-1)^n) + cos(2*pi*n) + 1)/(pi*n); %
    f = f+ bn*Vp*sin(W1*n*t); % Agrega los N terminos a la funcion fundamental 
    f2 = f2+ bn*Vp*sin(W1*n*t); % Agrega los N terminos a la funcion fundamental
    
    
end


b1= (4)/(pi); %Coeficinente del primer armonico para graficar la funcion fundamental.
f3 = f3 + b1*Vp*sin(W1*1*t); % Agrega a la funcion  la señal fundamental.


% Ploteando las señales 
subplot(3,1,1)
plot(t,f)
axis([0 nperiodos (-Vp*0.2+-Vp) (Vp*0.2+Vp)])
title(['Representacion Serie de Fourier ' num2str(N) ' Armonico(s)'],'FontSize',16)
xlabel('Tiempo')
ylabel('V(t)')

subplot(3,1,2)
plot(t,f2)
axis([0 periodo (-Vp*0.2+-Vp) (Vp*0.2+Vp)])
title(['Primer Ciclo'],'FontSize',16)
xlabel('Tiempo')
ylabel('V(t)')


subplot(3,1,3)
plot(t,f3)
axis([0 periodo (-Vp*0.5+-Vp) (Vp*0.5+Vp)])
title(['Señal Fundamental'],'FontSize',16)
xlabel('Tiempo')
ylabel('V(t)')