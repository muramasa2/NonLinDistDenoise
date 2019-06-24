import numpy as np
import matplotlib.pyplot as plt
import soundfile as sf
from glob import glob
from scipy.fftpack import fft, ifft
from scipy import hamming

#################
# load wav data #
#################
origin_wav_path = glob('./original_wave/*.wav')
dist_wav_path = glob('./result_wave/*.wav')

for i in range(len(origin_wav_path)):
    origin_wav, fs = sf.read(origin_wav_path[i])
    # dist_wav, _ = sf.read(dist_wav_path[i])

    N = 102400 #フーリエ変換長[サンプル]
    L = N/fs #音源長[s] = N/fs

    origin_wav = origin_wav[:N] #音源長を60s＝2545000サンプルに固定
    # dist_wav = dist_wav[:N]

    # 窓関数
    win = hamming(N)

    # フーリエ変換
    spectrum = fft(origin_wav * win)/ ((origin_wav.shape[0])/2) # 窓関数あり
    half_spectrum = abs(spectrum[:N//2+1])
    half_spectrum_dBV = 20*np.log10(half_spectrum)

    # フーリエ逆変換
    resyn_sig = ifft(spectrum) * ((origin_wav.shape[0])/2)
    resyn_sig /= win

    t = np.arange(0,L,L/N) #横軸時間軸[s]
    f = np.arange(0,fs//2,(fs//2)/half_spectrum.shape[0]) #横軸周波数軸[Hz]
    # 図を表示
    if i == 0:
        fig, ax = plt.subplots(len(origin_wav_path),3,figsize=(40,40))
        fig.subplots_adjust(wspace=0.2,hspace=0.2)
    ax[i,0].plot(t,origin_wav)
    ax[i,0].set_xlim(0,0.01)
    ax[i,0].set_xlabel('time[s]',fontsize=18)
    ax[i,0].set_ylabel('amplitude[V]',fontsize=18)

    ax[i,1].semilogx(f,half_spectrum_dBV)
    ax[i,1].set_xlim(20,22500)
    ax[i,1].set_xlabel('freqency[Hz]',fontsize=18)
    ax[i,1].set_ylabel('amplitude[dBV]',fontsize=18)

    ax[i,2].plot(t,resyn_sig)
    ax[i,2].set_xlim(0,0.01)
    ax[i,2].set_xlabel('time[s]',fontsize=18)
    ax[i,2].set_ylabel('amplitude[V]',fontsize=18)
plt.show()
fig.savefig('input_wave.jpg')
