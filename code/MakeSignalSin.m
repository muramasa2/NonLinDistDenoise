close all;
clear;

mode = input('mode select\n');
save_path = './original_wave/'
if mode == 1
    % サンプリング周波数
    fs = 44100;

    % 正弦波の周波数
    f = 1019; %電源由来の周波数60Hzの影響と原因を切り分けるため

    % 音源の長さ(s)
    L = 60;

    % 0からLまで1/fs(周期T)(s)刻みで配列を作成
    t = 0:1/fs:L;

    % 正弦波作成
    amp  = 1; %0.5FS　(1FS:振幅1V)
    signal = amp * sin(2*pi*f*t);

    % 波形の表示
    figure(1)
    grid on;
    subplot(1,2,1);
    plot(t, signal)
    xlim([0,0.005]);
    xlabel("time [s]");
    ylim([-1.0 1.0]);
    ylabel("level[V]");

    subplot(1,2,2);
    plot(t, signal)
    xlim([0,0.001]);
    xlabel("time [s]");
    ylim([-1.0 1.0]);
    ylabel("level[V]");
    
    save_name = strcat(save_path, 'sin1019_1FS.wav');
    
    
elseif mode == 2
    % サンプリング周波数
    fs = 44100;

    % 正弦波の周波数
    f1 = 1019; %電源由来の周波数60Hzの影響と原因を切り分けるため
    f2 = 1119;
    % 音源の長さ(s)
    L = 60;

    % 0からLまで1/fs(周期T)(s)刻みで配列を作成
    t = 0:1/fs:L;

    % 正弦波作成
    amp  = 1; %0.5FS　(1FS:振幅1V)
    signal = amp * (sin(2*pi*f1*t)+sin(2*pi*f2*t));

    % 波形の表示
    figure(1)
    grid on;
    subplot(1,2,1);
    plot(t, signal)
    xlim([0,0.02]);
    xlabel("time [s]");
    ylim([-2.0 2.0]);
    ylabel("level[V]");

    subplot(1,2,2);
    plot(t, signal)
    xlim([0,0.01]);
    xlabel("time [s]");
    ylim([-2.0 2.0]);
    ylabel("level[V]");
   
    save_name = strcat(save_path, 'sin1019+sin1119_1FS.wav');

    
elseif mode == 3
    % サンプリング周波数
    fs = 44100;

    % 正弦波の周波数
    f = 1019; %電源由来の周波数60Hzの影響と原因を切り分けるため
    
    % 音源の長さ(s)
    L = 60;

    % 0からLまで1/fs(周期T)(s)刻みで配列を作成
    t = 0:1/fs:L;

    % 正弦波作成
    amp  = 1; %0.5FS　(1FS:振幅1V)
    signal = amp * sawtooth(2*pi*f*t);

    % 波形の表示
    figure(1)
    grid on;
    subplot(1,2,1);
    plot(t, signal)
    xlim([0,0.005]);
    xlabel("time [s]");
    ylim([-1.0 1.0]);
    ylabel("level[V]");

    subplot(1,2,2);
    plot(t, signal)
    xlim([0,0.001]);
    xlabel("time [s]");
    ylim([-1.0 1.0]);
    ylabel("level[V]");
    
    save_name = strcat(save_path, 'sawtooth1019_1FS.wav');   
    
elseif mode == 4
    % サンプリング周波数
    fs = 44100;

    % 正弦波の周波数
    f = 1019; %電源由来の周波数60Hzの影響と原因を切り分けるため
    
    % 音源の長さ(s)
    L = 60;

    % 0からLまで1/fs(周期T)(s)刻みで配列を作成
    t = 0:1/fs:L;

    % 正弦波作成
    amp  = 1; %0.5FS　(1FS:振幅1V)
    signal = amp * sawtooth(2*pi*f*t,0.5);

    % 波形の表示
    figure(1)
    grid on;
    subplot(1,2,1);
    plot(t, signal)
    xlim([0,0.005]);
    xlabel("time [s]");
    ylim([-1.0 1.0]);
    ylabel("level[V]");

    subplot(1,2,2);
    plot(t, signal)
    xlim([0,0.001]);
    xlabel("time [s]");
    ylim([-1.0 1.0]);
    ylabel("level[V]");

    save_name = strcat(save_path, 'triangle1019_1FS.wav');  
    
elseif mode == 5
    % サンプリング周波数
    fs = 44100;

    % 正弦波の周波数
    f = 1019; %電源由来の周波数60Hzの影響と原因を切り分けるため
    
    % 音源の長さ(s)
    L = 60;

    % 0からLまで1/fs(周期T)(s)刻みで配列を作成
    t = 0:1/fs:L;

    % 正弦波作成
    amp  = 1; %0.5FS　(1FS:振幅1V)
    signal = amp * sawtooth(2*pi*f*t);

    % 波形の表示
    figure(1)
    grid on;
    subplot(1,2,1);
    plot(t, signal)
    xlim([0,0.005]);
    xlabel("time [s]");
    ylim([-1.0 1.0]);
    ylabel("level[V]");

    subplot(1,2,2);
    plot(t, signal)
    xlim([0,0.001]);
    xlabel("time [s]");
    ylim([-1.0 1.0]);
    ylabel("level[V]");
    
    save_name = strcat(save_path, 'sawtooth1019_1FS.wav');  
    
elseif mode == 6
    % サンプリング周波数
    fs = 44100;

    % 正弦波の周波数
    f = 1019; %電源由来の周波数60Hzの影響と原因を切り分けるため
    
    % 音源の長さ(s)
    L = 60;

    % 0からLまで1/fs(周期T)(s)刻みで配列を作成
    t = 0:1/fs:L;

    % 正弦波作成
    amp  = 1; %0.5FS　(1FS:振幅1V)
    signal = amp * square(2*pi*f*t);

    % 波形の表示
    figure(1)
    grid on;
    subplot(1,2,1);
    plot(t, signal)
    xlim([0,0.005]);
    xlabel("time [s]");
    ylim([-1.0 1.0]);
    ylabel("level[V]");

    subplot(1,2,2);
    plot(t, signal)
    xlim([0,0.001]);
    xlabel("time [s]");
    ylim([-1.0 1.0]);
    ylabel("level[V]");
    
    save_name = strcat(save_path, 'square1019_1FS.wav');  
    
end
    
% wavファイルの作成
audiowrite(save_name,signal,fs,'BitsPerSample',24);
