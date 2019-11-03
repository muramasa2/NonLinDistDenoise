import numpy as np
import matplotlib.pyplot as plt
from scipy.fftpack import fft, ifft
from scipy import hanning
import soundfile as sf

################
# def function #
################
def signal_fft(signal, N, win):
    # フーリエ変換
    spectrum = fft(signal*win) # 窓関数あり
    spectrum_abs = np.abs(spectrum) # 振幅を元に信号に揃える
    half_spectrum = spectrum_abs[:N//2+1]
    half_spectrum[0] = half_spectrum[0] / 2 # 直流成分（今回は扱わないけど）は2倍不要
    half_spectrum_dBV = 20*np.log10(half_spectrum)

    return spectrum, half_spectrum_dBV

####################
# make signal data #
####################
fs = 44100
L = 60
f = 1000

t = np.arange(0,L,1/44100)
amp = 1 # 1Vrms = √2Vpp
base_signal = amp * np.sin(2*np.pi*f*t)

num = 10 #何次高調波まで見るか

mode = 'all' # all:全ての高調波含む, even:偶数次高調波のみ, odd:奇数時高調波のみ

if mode == 'all':
    start = 2
    step = 1
    save_path = './figure/make_all_non_lineardist_signal.jpg'
else:
    step = 2
    if mode == 'even':
        start = 2
        save_path = './figure/make_even_non_lineardist_signal.jpg'
    elif mode == 'odd':
        start = 3
        save_path = './figure/make_odd_non_lineardist_signal.jpg'

# non_lin_dist = [( 4.472 * 10**(-6)/ 2**(i-1)) * np.sin(2*np.pi*(i)*f*t) for i in range(start,num+1,step)]
#このくらいから歪みを知覚できる
non_lin_dist = [( 1/ (2*(i-1))) * np.sin(2*np.pi*(i)*f*t) for i in range(start,num+1,step)]
# non_lin_dist[0].shape
# len(non_lin_dist)
# plt.plot(non_lin_dist[0])
# plt.xlim([0,100])
dist_signal = base_signal+sum(non_lin_dist)
dist_signal.shape


dist_signal = dist_signal/max(dist_signal)
max(dist_signal)
# sf.write('./create_dist_wave/clean_signal.wav',base_signal,44100)
sf.write('./dist_'+mode+'_signal.wav', dist_signal, 44100, subtype='PCM_16') # 16bit 44.1kHz

dist_signal, fs = sf.read('./dist_'+mode+'_signal.wav')
dist_signal.shape
##############
# FFT & IFFT #
##############
N = 44100 #フーリエ変換長[サンプル]
L_reduce = N/fs #フーリエ音源長[s] = N/fs

# 窓関数
win = hanning(N)

signal_reduce = base_signal[:N] #音源長を60s＝2545000サンプルに固定
spectrum, half_spectrum_dBV = signal_fft(signal_reduce, N, win)

# # フーリエ逆変換
# resyn_sig = ifft(spectrum) * ((signal_reduce.shape[0])/2)
# resyn_sig /= win

dist_signal_reduce = dist_signal[:N] #音源長を60s＝2545000サンプルに固定
dist_spectrum, dist_half_spectrum_dBV = signal_fft(dist_signal_reduce, N, win)

# フーリエ逆変換
# resyn_sig = ifft(spectrum) * ((dist_signal_reduce.shape[0])/2)
# resyn_sig /= win

#############
# plot data #
#############
t_reduce = np.arange(0,L_reduce,L_reduce/N) #横軸時間軸[s]
f = np.arange(0,fs//2,(fs//2)/half_spectrum_dBV.shape[0]) #横軸周波数軸[Hz]

# 図を表示
fig, ax = plt.subplots(1,2,figsize=(15,5))
fig.subplots_adjust(wspace=0.2,hspace=0.2)
ax[0].plot(t_reduce, dist_signal_reduce, 'r')
ax[0].plot(t_reduce, signal_reduce, 'b')
ax[0].legend(['distoted','not distorted'], loc='upper right')
ax[0].set_xlim(0,0.01)
ax[0].set_xlabel('time[s]',fontsize=18)
ax[0].set_ylabel('amplitude[V]',fontsize=18)

ax[1].semilogx(f, dist_half_spectrum_dBV, 'r')
ax[1].semilogx(f, half_spectrum_dBV, 'b')
ax[1].legend(['distoted','not distorted'], loc='upper right')
ax[1].set_xlim(20,22500)
ax[1].set_xlabel('freqency[Hz]',fontsize=18)
ax[1].set_ylabel('amplitude[dBV]',fontsize=18)

plt.show()
# fig.savefig(save_path)
