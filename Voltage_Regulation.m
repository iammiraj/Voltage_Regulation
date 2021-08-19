%Voltage Regulation of Transformer as a function of load

clc
close all
clear

VS = 230;                           % Secondary Voltage (V)
amps = 0:6.52:65.2;                 % Current Values (A)
Req = 0.0445;                       % Equivalent R (ohms)
Xeq = 0.0645;                       % Equivalent X (ohms)

% Current values for three power factors:
I(1,:)= amps .* (0.19 - i*0.6);     % Lagging 
I(2,:)= amps .* (1.0         );     % Unity 
I(3,:)= amps .* (0.19 + i*0.6);     % Leading

%Claculation of Vp/a:
VPa = VS + Req .*I +i.*Xeq.*I;

%Claculation of Voltage Regulation:
VR = (abs(VPa)-VS)./VS.*100;

%Plot the Voltage Regulation:
plot (amps,VR(1,:),'b--');
hold on;
plot (amps,VR(2,:),'k-');
hold on;
plot (amps,VR(3,:),'r-.');
title ('Voltage Regulation vs Load');
xlabel('Load (A)');
ylabel ('Voltage Regulation (%)');
legend('0.19 PF lagging','1.00 PF','0.19 PF leading');
grid on;
hold off;
