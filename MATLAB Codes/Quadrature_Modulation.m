% Parameters
Fs = 1000;                 % Sampling frequency (Hz)
t = 0:1/Fs:1-1/Fs;         % Time vector (1 second)
fc = 100;                  % Carrier frequency (Hz)
fm1 = 5;                   % Message frequency 1 (Hz)
fm2 = 7;                   % Message frequency 2 (Hz)

% Message signals for in-phase (I) and quadrature (Q) components
mI = cos(2*pi*fm1*t);      % In-phase component
mQ = sin(2*pi*fm2*t);      % Quadrature component

% Create analytic signals of I and Q using Hilbert Transform
mI_analytic = hilbert(mI);
mQ_analytic = hilbert(mQ);

% Generate QAM signal: I*cos(2*pi*fc*t) - Q*sin(2*pi*fc*t)
qam_signal = real(mI_analytic .* exp(1j*2*pi*fc*t)) - real(mQ_analytic .* exp(1j*(2*pi*fc*t + pi/2)));

% Plot message signals and QAM signal
figure;

subplot(3,1,1);
plot(t, mI, 'b');
title('In-Phase Message Signal (I)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
plot(t, mQ, 'r');
title('Quadrature Message Signal (Q)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3,1,3);
plot(t, qam_signal, 'k');
title('QAM Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
