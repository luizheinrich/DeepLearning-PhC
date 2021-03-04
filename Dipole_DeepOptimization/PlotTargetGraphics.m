% =========================================================================
% UNIVERSIDADE FEDERAL DO PARÁ
% INSTITUTO DE TECNOLOGIA
% ENGENHARIA ELÉTRICA
% LABORATÓRIO DE NANOFOTÔNICA E NANOELETRÔNICA
%
% LUIZ HENRIQUE P. ASSUNÇÃO
% =========================================================================



% -------------------------------------------------------------------------
% Nome do Modelo
    Modelo = 'quadripolo.mph';

% Escolha a Geração
    Geracao = 1;

% Escolha o Loop
    Loop = 1;
    
% Escolha a Porta
    Porta = 1:3;
    
% Escolha a Curva
    Curva = 1:3;
% -------------------------------------------------------------------------



% Número ímpar de pontos do range
NPontos = 51;
FreqLimInf = 9.2e+10;
FreqLimSup = 9.7e+10;


DeltaRange = FreqLimSup - FreqLimInf;
Passo = (DeltaRange/(NPontos - 1));
Range = FreqLimInf:Passo:FreqLimSup;
CentroRange = (NPontos + 1)/2;

%for k=1:inf
% Geração
for G = Geracao


% Loop
for L = Loop


% Porta
for P = Porta
    
    
    nomePasta = sprintf('desiredResponseData');
    pastaCorrente = strrep(pwd,'\','\\');
    
    
    % Sintaxe dos Parâmetros-S
    % Scp  ->  S32  ->  c = 3  e  p = 2

LOAD.Geracao{G}.Loop{L}.Porta{P} = load(sprintf('%s\\%s\\S-Parameter (ewfd) - Geração %d - Loop %d - Porta %d.txt',pastaCorrente,nomePasta,G,L,P));
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
    
    
    Titulo = sprintf('S-Parameter  |  Geração %d  |  Loop %d  |  Porta %d',G,L,P);
    title(Titulo)
    grid
    ylim([-50 0])
    drawnow;
    
    % Legenda para os eixos vertical e horizontal
    xlabel('Frequency')
    ylabel('dB')
    
    % Legenda dos Parâmetros S
    lgd = legend('-DynamicLegend','Location','southwest','LineWidth',1);
    title(lgd,'S-Parameter')
    %pause(1)
    
end
    
    
end


end


end


 
%end


% Apagar variáveis
clear variables