% =========================================================================
% UNIVERSIDADE FEDERAL DO PAR�
% INSTITUTO DE TECNOLOGIA
% ENGENHARIA EL�TRICA
% LABORAT�RIO DE NANOFOT�NICA E NANOELETR�NICA
%
% LUIZ HENRIQUE P. ASSUN��O
% =========================================================================



% -------------------------------------------------------------------------
% Nome do Modelo
    Modelo = 'quadripolo.mph';

% Escolha a Gera��o
    Geracao = 1;

% Escolha o Loop
    Loop = 1;
    
% Escolha a Porta
    Porta = 1:3;
    
% Escolha a Curva
    Curva = 1:3;
% -------------------------------------------------------------------------



% N�mero �mpar de pontos do range
NPontos = 51;
FreqLimInf = 9.2e+10;
FreqLimSup = 9.7e+10;


DeltaRange = FreqLimSup - FreqLimInf;
Passo = (DeltaRange/(NPontos - 1));
Range = FreqLimInf:Passo:FreqLimSup;
CentroRange = (NPontos + 1)/2;

%for k=1:inf
% Gera��o
for G = Geracao


% Loop
for L = Loop


% Porta
for P = Porta
    
    
    nomePasta = sprintf('desiredResponseData');
    pastaCorrente = strrep(pwd,'\','\\');
    
    
    % Sintaxe dos Par�metros-S
    % Scp  ->  S32  ->  c = 3  e  p = 2

LOAD.Geracao{G}.Loop{L}.Porta{P} = load(sprintf('%s\\%s\\S-Parameter (ewfd) - Gera��o %d - Loop %d - Porta %d.txt',pastaCorrente,nomePasta,G,L,P));
Transp = transpose(LOAD.Geracao{G}.Loop{L}.Porta{P});

for C = Curva

% S-Parameter (ewfd) - S1[1 2 3]
S_Parameter.Geracao{G}.Loop{L}.S{C,P} = Transp(2,((C - 1)*NPontos + 1):C*NPontos);

% Plotagem ----------------------------------------------------------------
    

    DisplayN = sprintf('S%d%d',C,P);
    mkr = randi([1 12],1,1);
    Mkr = {'-o' '-+' '-*' '-x' '-s' '-d' '-^' '-v' '->' '-<' '-p' '-h'};
    Plot = plot(Range,S_Parameter.Geracao{G}.Loop{L}.S{C,P},Mkr{mkr},'DisplayName',DisplayN,'LineWidth',0.1);
    %Plot.MarkerSize = 5;
    Plot.MarkerIndices = 1:8:NPontos;
    hold all
    
    
    
    % S2
    %plot(Range,S_Parameter.Geracao{g}.Loop{n}.S{q,p},'black','LineWidth',1);
    %hold on
    
    % S3
    %plot(Range,S_Parameter.Geracao{g}.Loop{n}.S{q,p},'blue','LineWidth',1);
    
    
    Titulo = sprintf('S-Parameter  |  Gera��o %d  |  Loop %d  |  Porta %d',G,L,P);
    title(Titulo)
    grid
    ylim([-50 0])
    drawnow;
    
    % Legenda para os eixos vertical e horizontal
    xlabel('Frequency')
    ylabel('dB')
    
    % Legenda dos Par�metros S
    lgd = legend('-DynamicLegend','Location','southwest','LineWidth',1);
    title(lgd,'S-Parameter')
    %pause(1)
    
end
    
    
end


end


end


 
%end


% Apagar vari�veis
clear variables