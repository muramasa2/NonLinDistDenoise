close all;
clear;

%% matの読み込み
name = 'CEC_60MHz_1Vrms_matome'
filename = strcat('測定結果.mat\',name,'.mat')
data = load(filename);
% 配列からデータ読み出し

%補正前
freq1 = data.FFTSpectrum{4,1};
level1 = data.FFTSpectrum{4,2};
% time1 = data.Scope{4,1};
% amp1 = data.Scope{4,2};

%補正後
freq2 = data.FFTSpectrum1{4,1};
level2 = data.FFTSpectrum1{4,2};
% time2 = data.Scope1{4,1};
% amp2 = data.Scope1{4,2};

%補正後
freq3 = data.FFTSpectrum2{4,1};
level3 = data.FFTSpectrum2{4,2};
% time3 = data.Scope2{4,1};
% amp3 = data.Scope2{4,2};

% % いらない場合もある
% level2 = 20 * log10(level);

%% グラフの表示

% 全体図
figure(1)
% 片対数グラフの表示
semilogx(freq1,level1,'b',freq2,level2,'g',freq3,level3,'g');
% ,freq3,level3
xlim([0,30000])
ylim([-160,-60])
xlabel("周波数[Hz]")
ylabel("振幅[dBV]")
legend('Noise floor','With noise inputed','個別補正後');
grid on;

%拡大図
figure(2)
semilogx(freq1,level1,'b',freq2,level2,'g',freq3,level3,'r');
% ,freq3,level3
xlim([10,10000])
ylim([-150,-65])
xlabel("周波数[Hz]")
ylabel("振幅[dBV]")
legend('無音再生時','GNDラインのみノイズ注入','信号ラインのみノイズ注入');
grid on;

% figure(3)
% plot(time1,amp1,time2,amp2)
% xlim([0,0.002])
% xlabel("周波数[Hz]")
% ylabel("振幅[dB]")
% legend('補正前','全体補正後','個別補正後');
% grid on;

%% THD[dB]計算

%dBをリニア表示に変換
level1lin=10.^(level1/20);
level2lin=10.^(level2/20);
level3lin=10.^(level3/20);

f=1019; %正弦波周波数[Hz]

%THD計算
prompt = '何次まで計算しますか?（2以上の数次を入力）';
a = input(prompt)

sum1=0;
sum2=0;
sum3=0;

if a>=2

for i = 2:a
    sum1=sum1+level1lin(f*i+1,1)^2;
    sum2=sum2+level2lin(f*i+1,1)^2;
    sum3=sum3+level3lin(f*i+1,1)^2;
end
    thd1=20*log10(sqrt(sum1)/level1lin(f+1,1))
    thd2=20*log10(sqrt(sum2)/level1lin(f+1,1))
    thd3=20*log10(sqrt(sum3)/level1lin(f+1,1)) 

else
    str='入力エラーです（2以上の数次を入力）'
end