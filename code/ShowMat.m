close all;
clear;

%% mat�̓ǂݍ���
name = 'CEC_60MHz_1Vrms_matome'
filename = strcat('���茋��.mat\',name,'.mat')
data = load(filename);
% �z�񂩂�f�[�^�ǂݏo��

%�␳�O
freq1 = data.FFTSpectrum{4,1};
level1 = data.FFTSpectrum{4,2};
% time1 = data.Scope{4,1};
% amp1 = data.Scope{4,2};

%�␳��
freq2 = data.FFTSpectrum1{4,1};
level2 = data.FFTSpectrum1{4,2};
% time2 = data.Scope1{4,1};
% amp2 = data.Scope1{4,2};

%�␳��
freq3 = data.FFTSpectrum2{4,1};
level3 = data.FFTSpectrum2{4,2};
% time3 = data.Scope2{4,1};
% amp3 = data.Scope2{4,2};

% % ����Ȃ��ꍇ������
% level2 = 20 * log10(level);

%% �O���t�̕\��

% �S�̐}
figure(1)
% �Бΐ��O���t�̕\��
semilogx(freq1,level1,'b',freq2,level2,'g',freq3,level3,'g');
% ,freq3,level3
xlim([0,30000])
ylim([-160,-60])
xlabel("���g��[Hz]")
ylabel("�U��[dBV]")
legend('Noise floor','With noise inputed','�ʕ␳��');
grid on;

%�g��}
figure(2)
semilogx(freq1,level1,'b',freq2,level2,'g',freq3,level3,'r');
% ,freq3,level3
xlim([10,10000])
ylim([-150,-65])
xlabel("���g��[Hz]")
ylabel("�U��[dBV]")
legend('�����Đ���','GND���C���̂݃m�C�Y����','�M�����C���̂݃m�C�Y����');
grid on;

% figure(3)
% plot(time1,amp1,time2,amp2)
% xlim([0,0.002])
% xlabel("���g��[Hz]")
% ylabel("�U��[dB]")
% legend('�␳�O','�S�̕␳��','�ʕ␳��');
% grid on;

%% THD[dB]�v�Z

%dB�����j�A�\���ɕϊ�
level1lin=10.^(level1/20);
level2lin=10.^(level2/20);
level3lin=10.^(level3/20);

f=1019; %�����g���g��[Hz]

%THD�v�Z
prompt = '�����܂Ōv�Z���܂���?�i2�ȏ�̐�������́j';
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
    str='���̓G���[�ł��i2�ȏ�̐�������́j'
end