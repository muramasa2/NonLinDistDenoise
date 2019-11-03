import numpy as np
from scipy.fftpack import fft, ifft
import matplotlib.pyplot as plt
from scipy import hamming, hanning
import soundfile as sf
import wave

fs = 44100
f = 1000
t = np.arange(0,1,1/fs)

signal = np.sin(2*np.pi*f*t)

np.unique(signal).shape
plt.figure(figsize=(7,5))
plt.plot(t,signal)
plt.xlim([0,0.001])
plt.xlabel('time[s]',fontsize=18)
plt.ylabel('amplitude[V]',fontsize=18)
plt.savefig('test1.jpg')

signal.dtype

sf.write('test.wav',signal,44100,subtype='PCM_16') # 16bit 44.1kHz

path = 'test.wav'
in_data,fs = sf.read(path)
n = np.unique(in_data)
max(n)
n.shape
wavefile = wave.open(path, "r")
framerate = wavefile.getframerate()
data = wavefile.readframes(wavefile.getnframes())
wavefile.getsampwidth()
x = np.frombuffer(data, dtype="int16")
np.unique(x)

plt.figure(figsize=(9,5))
plt.plot(t,x)
plt.xlim([0,0.001])
plt.xlabel('time[s]',fontsize=18)
plt.ylabel('amplitude[V]',fontsize=18)
# plt.savefig('test2.jpg')

x.shape
x.dtype
65536/2
max(x)
x.shape
a = np.unique(x)
a.shape
# signal = x.astype(np.float64)/max(x)
a = np.unique(signal)
a.shape
# signal = x/max(x)
plt.figure(figsize=(7,5))
plt.plot(t,signal[:len(t)])
plt.xlim([0,0.001])
plt.xlabel('time[s]',fontsize=18)
plt.ylabel('amplitude[V]',fontsize=18)
plt.savefig('test3.jpg')

# x.dtype
# plt.figure()
# plt.plot(t,signal[:len(t)])
# plt.xlim([0,0.001])
# in_data = x
def signal_fft(signal, N): #FFTするsignal長と窓長Nは同じサンプル数に固定する
    # win = hanning(N) # 窓関数
    # spectrum = fft(signal*win) # フーリエ変換
    spectrum = fft(signal) # フーリエ変換
    spectrum_abs = np.abs(spectrum) # 振幅を元に信号に揃える
    # spectrum.astype(np.int16)
    half_spectrum = spectrum_abs[:int(N/2)+1]
    # half_spectrum[0] = half_spectrum[0] / 2 # 直流成分（今回は扱わないけど）は2倍不要
    half_spectrum_dBV = 20*np.log10(half_spectrum)

    return spectrum, half_spectrum_dBV, half_spectrum
max(in_data)
# in_data.dtype
# in_data = signal
N = fs
# in_data = in_data.astype(np.float16)
# in_data = in_data*np.sqrt(2)

in_data = in_data[:N]
_, in_half_spectrum_dBV, in_half_spectrum = signal_fft(in_data, len(in_data))
# f1 = np.arange(0, fs/2, (fs/2)/in_half_spectrum.shape[0]) # 横軸周波数軸[Hz]
# plt.semilogx(f1, in_half_spectrum)
max(in_half_spectrum)
in_half_spectrum_dBV[in_half_spectrum_dBV==-(np.inf)] = 0
max(in_half_spectrum_dBV)
f1 = np.arange(0, fs/2, (fs/2)/in_half_spectrum.shape[0]) # 横軸周波数軸[Hz]
plt.figure(figsize=(7,5))
plt.semilogx(f1, in_half_spectrum_dBV)

plt.xlabel('frequency[Hz]',fontsize=18)
plt.ylabel('amplitude[dB]',fontsize=18)
plt.savefig('test.jpg')
min(in_half_spectrum_dBV)
# plt.xlim([0,22000


out_data = signal
# out_data = out_data*np.sqrt(2)
out_data = out_data[:N]
_, out_half_spectrum_dBV = signal_fft(out_data, len(out_data))
f2 = np.arange(0, fs/2, (fs/2)/out_half_spectrum_dBV.shape[0]) # 横軸周波数軸[Hz]
plt.semilogx(f2, out_half_spectrum_dBV)

plt.figure(figsize=(15,10))
plt.semilogx(f1, in_half_spectrum_dBV)
plt.semilogx(f1, out_half_spectrum_dBV)
plt.xlabel('frequency[Hz]',fontsize=15)
plt.ylabel('amplitude[dBV]',fontsize=15)
plt.legend(['input(distorted)', 'output(corrected)'],loc='upper right',fontsize=15)
