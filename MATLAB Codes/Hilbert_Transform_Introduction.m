% Parameters
Fs = 1000;               % Sampling frequency in Hz
t = 0:1/Fs:1-1/Fs;       % Time vector of 1 second duration

% Generate AM signal (message + carrier)
fc = 50;                 % Carrier frequency (Hz)
fm = 5;                  % Modulating frequency (Hz)
modulation_index = 0.6;  % Modulation index

% Message signal (modulating signal)
m = cos(2*pi*fm*t);

% Carrier signal
carrier = cos(2*pi*fc*t);

% AM signal
x = (1 + modulation_index * m) .* carrier;

% --- Compute analytic signal using Hilbert Transform ---
z = hilbert(x);

% --- Extract envelope and instantaneous phase ---
envelope = abs(z);              % Envelope of the signal
inst_phase = unwrap(angle(z));  % Unwrapped instantaneous phase

% --- Visualization: Signal, Envelope, and Instantaneous Phase ---
figure;

subplot(3,1,1);
plot(t, x, 'b');
title('Original AM Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
plot(t, envelope, 'r', 'LineWidth', 1.5);
title('Envelope of the Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(3,1,3);
plot(t, inst_phase, 'k');
title('Instantaneous Phase');
xlabel('Time (s)');
ylabel('Radians');
grid on;

% --- Single Sideband (SSB) Modulation ---

% Generate message signal for SSB modulation
m_ssb = cos(2*pi*fm*t);

% Compute analytic signal of message
m_analytic = hilbert(m_ssb);

% Generate upper sideband SSB signal by modulating analytic signal with carrier
ssb_signal = real(m_analytic .* exp(1j*2*pi*fc*t));

% Visualization of SSB signal
figure;
plot(t, ssb_signal);
title('Single Sideband (SSB) Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

