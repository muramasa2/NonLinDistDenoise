import numpy as np
import matplotlib.pyplot as plt
import soundfile as sf
from glob import glob
from scipy.fftpack import fft, ifft
from scipy import hamming, hanning

def signal_fft(signal, N): #FFTするsignal長と窓長Nは同じサンプル数に固定する
    win = hanning(N) # 窓関数
    spectrum = fft(signal*win) # フーリエ変換
    spectrum_abs = np.abs(spectrum) # 振幅を元に信号に揃える
    half_spectrum = spectrum_abs[:int(N/2)] / (signal.shape[0] / 2)
    half_spectrum[0] = half_spectrum[0] / 2 # 直流成分（今回は扱わないけど）は2倍不要
    half_spectrum_dBV = 20*np.log10(half_spectrum)

    return spectrum, half_spectrum_dBV

def THD(spectrum, n, f):
    V = 10**(spectrum[f]/20)
    lin_V = []

    for i in range(2,n+1):
        lin_V.append(10**(spectrum[f*i]/20))

    lin_V = np.array(lin_V)**2
    thd = sum(lin_V)/V

    return thd

####################
# make signal data #
####################
# fs = 44100
# L = 60
# f = 1019
#
# t = np.arange(0,L,1/44100)
# amp = np.sqrt(2)*1 # 1Vrms = √2Vpp
# base_signal = amp * np.sin(2*np.pi*f*t)
#
# num = 10 #何次高調波まで見るか
#
# mode = 'even' # all:全ての高調波含む, even:偶数次高調波のみ, odd:奇数時高調波のみ
#
# if mode == 'all':
#     start = 2
#     step = 1
#     save_path = './figure/make_all_non_lineardist_signal.jpg'
# else:
#     step = 2
#     if mode == 'even':
#         start = 2
#         save_path = './figure/make_even_non_lineardist_signal.jpg'
#     elif mode == 'odd':
#         start = 3
#         save_path = './figure/make_odd_non_lineardist_signal.jpg'
#
# non_lin_dist = [( 4.472 * 10**(-6)/ 2**(i-1)) * np.sin(2*np.pi*(i)*f*t) for i in range(start,num+1,step)]
# non_lin_dist = [( 100000 * 10**(-6)/ 2**(i-1)) * np.sin(2*np.pi*(i)*f*t)
#     for i in range(start,num+1,step)] #このくらいから歪みを知覚できる
# dist_signal = base_signal+sum(non_lin_dist)
# in_data = dist_signal

in_data,fs = sf.read('create_dist_wave/dist_even_signal.wav')

N = fs

in_data = in_data[:N]
_, in_half_spectrum_dBV = signal_fft(in_data, len(in_data))
f1 = np.arange(0, fs/2, (fs/2)/in_half_spectrum_dBV.shape[0]) # 横軸周波数軸[Hz]
# plt.semilogx(f1, in_half_spectrum_dBV)

out_data,fs = sf.read('result_wave/nonlinear_even/net_output_4999.wav')
N = fs

out_data = out_data[:fs]
_, out_half_spectrum_dBV = signal_fft(out_data, len(out_data))
f2 = np.arange(0, fs/2, (fs/2)/out_half_spectrum_dBV.shape[0]) # 横軸周波数軸[Hz]
# plt.semilogx(f2, out_half_spectrum_dBV)

plt.figure(figsize=(15,10))
plt.semilogx(f1, in_half_spectrum_dBV)
plt.semilogx(f1, out_half_spectrum_dBV)
plt.xlabel('freqency[Hz]',fontsize=18)
plt.ylabel('amplitude[dBV]',fontsize=18)
plt.legend(['input(distorted)', 'output(corrected)'],fontsize=18)
plt.savefig('figure/dist_even_signal.png')

f = 1019
in_thd = THD(in_half_spectrum_dBV, 10, f)
out_thd = THD(out_half_spectrum_dBV, 10, f)
print(20*np.log10(in_thd), 20*np.log10(out_thd))
