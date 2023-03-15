close all
clear
clc
%% Parametros
r1 = 3;  %ohm
r2 = 15; %ohm
r3 = 18; %ohm
v0 = 20; %v
c = 0.5; %f
t_estudio = [3,5,8];

%% Corremos y graficamos para diversos valores de t0
n_times = length(t_estudio);
figure()
set(gcf,'Position',[0 40 1100 630])
for it = 1:n_times
    t0 = t_estudio(it);
    data = sim('modelo.slx');
    subplot(n_times,2,2*it-1)
    plot(data.corriente_fuente)
    title(['Corriente en fuente (t0 = ',num2str(t0),')'])
    xlabel('tiempo (s)')
    grid on
    subplot(n_times,2,2*it)
    plot(data.volt_cap)
    title(['Voltaje de capacitor (t0 = ',num2str(t0),')'])
    xlabel('tiempo (s)')
    grid on
end
suptitle('Evolucion del sistema para distintos valores de t0')
hold off
saveas(gcf,'Graficas.png')
