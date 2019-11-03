path = 'test.wav';

[signal, fs] = audioread(path);
class(signal)
L = length(signal);

figure(1)
plot(signal)
xlim([0, 100])

fft_signal = fft(signal);
abs_fft = abs(fft_signal);
half_fft = abs_fft(1:L/2+1);
dB_fft = 20*log10(half_fft);
dB_fft(dB_fft==-Inf) = 0;
% 
% f = linspace(1, L/2+1, L/2+1);
% 
% figure(2)
% semilogx(f, half_fft)
% 
% figure(3)
% semilogx(f, dB_fft)
% xlim([1,30000])
% xlabel('frequency[Hz]')
% ylabel('amplitude[dB]')