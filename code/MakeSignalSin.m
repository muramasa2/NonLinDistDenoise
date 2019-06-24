close all;
clear;

mode = input('mode select\n');
save_path = './original_wave/'
if mode == 1
    % �T���v�����O���g��
    fs = 44100;

    % �����g�̎��g��
    f = 1019; %�d���R���̎��g��60Hz�̉e���ƌ�����؂蕪���邽��

    % �����̒���(s)
    L = 60;

    % 0����L�܂�1/fs(����T)(s)���݂Ŕz����쐬
    t = 0:1/fs:L;

    % �����g�쐬
    amp  = 1; %0.5FS�@(1FS:�U��1V)
    signal = amp * sin(2*pi*f*t);

    % �g�`�̕\��
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
    % �T���v�����O���g��
    fs = 44100;

    % �����g�̎��g��
    f1 = 1019; %�d���R���̎��g��60Hz�̉e���ƌ�����؂蕪���邽��
    f2 = 1119;
    % �����̒���(s)
    L = 60;

    % 0����L�܂�1/fs(����T)(s)���݂Ŕz����쐬
    t = 0:1/fs:L;

    % �����g�쐬
    amp  = 1; %0.5FS�@(1FS:�U��1V)
    signal = amp * (sin(2*pi*f1*t)+sin(2*pi*f2*t));

    % �g�`�̕\��
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
    % �T���v�����O���g��
    fs = 44100;

    % �����g�̎��g��
    f = 1019; %�d���R���̎��g��60Hz�̉e���ƌ�����؂蕪���邽��
    
    % �����̒���(s)
    L = 60;

    % 0����L�܂�1/fs(����T)(s)���݂Ŕz����쐬
    t = 0:1/fs:L;

    % �����g�쐬
    amp  = 1; %0.5FS�@(1FS:�U��1V)
    signal = amp * sawtooth(2*pi*f*t);

    % �g�`�̕\��
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
    % �T���v�����O���g��
    fs = 44100;

    % �����g�̎��g��
    f = 1019; %�d���R���̎��g��60Hz�̉e���ƌ�����؂蕪���邽��
    
    % �����̒���(s)
    L = 60;

    % 0����L�܂�1/fs(����T)(s)���݂Ŕz����쐬
    t = 0:1/fs:L;

    % �����g�쐬
    amp  = 1; %0.5FS�@(1FS:�U��1V)
    signal = amp * sawtooth(2*pi*f*t,0.5);

    % �g�`�̕\��
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
    % �T���v�����O���g��
    fs = 44100;

    % �����g�̎��g��
    f = 1019; %�d���R���̎��g��60Hz�̉e���ƌ�����؂蕪���邽��
    
    % �����̒���(s)
    L = 60;

    % 0����L�܂�1/fs(����T)(s)���݂Ŕz����쐬
    t = 0:1/fs:L;

    % �����g�쐬
    amp  = 1; %0.5FS�@(1FS:�U��1V)
    signal = amp * sawtooth(2*pi*f*t);

    % �g�`�̕\��
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
    % �T���v�����O���g��
    fs = 44100;

    % �����g�̎��g��
    f = 1019; %�d���R���̎��g��60Hz�̉e���ƌ�����؂蕪���邽��
    
    % �����̒���(s)
    L = 60;

    % 0����L�܂�1/fs(����T)(s)���݂Ŕz����쐬
    t = 0:1/fs:L;

    % �����g�쐬
    amp  = 1; %0.5FS�@(1FS:�U��1V)
    signal = amp * square(2*pi*f*t);

    % �g�`�̕\��
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
    
% wav�t�@�C���̍쐬
audiowrite(save_name,signal,fs,'BitsPerSample',24);
