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
    Modelo = 'DivisorPor3Horizontal.mph';

% Escolha a Geração
    Geracao = 1;

% Escolha o Loop
    Loop = 641;
    
% Escolha a Porta
    Porta = 1:3;
    
% Escolha a Curva
    Curva = 1:3;
% -------------------------------------------------------------------------



% Criar diretório
    nomePastaPlots = 'Plots';
    
    % Verificar se o diretório existe
    if ~exist(nomePastaPlots, 'dir')
        mkdir(nomePastaPlots);
    end
    


% Número ímpar de pontos do range
NPontos = 51;
FreqLimInf = 92.0;
FreqLimSup = 97.0;

DeltaRange = FreqLimSup - FreqLimInf;
Passo = (DeltaRange/(NPontos - 1));
Range = FreqLimInf:Passo:FreqLimSup;
CentroRange = (NPontos + 1)/2;



for G = Geracao


for L = Loop


for P = Porta
    
    
    nomePasta = sprintf('geracao_%d',G);
    pastaCorrente = strrep(pwd,'\','\\');
    
    
    % Sintaxe dos Parâmetros-S
    % Scp  ->  S32  ->  c = 3  e  p = 2

LOAD.Geracao{G}.Loop{L}.Porta{P} = load(sprintf('%s\\%s\\S-Parameter (ewfd) - Geração %d - Loop %d - Porta %d.txt',pastaCorrente,nomePasta,G,L,P));
Transp = transpose(LOAD.Geracao{G}.Loop{L}.Porta{P});


for C = Curva

% S-Parameter (ewfd) - S1[1 2 3]
S_Parameter.Geracao{G}.Loop{L}.S{C,P} = Transp(2,((C - 1)*NPontos + 1):C*NPontos);

% Plotagem ----------------------------------------------------------------


    DisplayN = sprintf('S_%d_%d',C,P);
    mkr = randi([1 12],1,1);
    Mkr = {'-ob' '-vr' '-*m' '-xr' '-sg' '-dc' '-xk' '-sc' '-dm'};
    Plot = plot(Range,S_Parameter.Geracao{G}.Loop{L}.S{C,P},Mkr{C+3*(P-1)},'DisplayName',DisplayN,'LineWidth',0.5);
    %Plot.MarkerSize = 5;
    Plot.MarkerIndices = 1:5:NPontos;
    hold all
    
    Titulo = sprintf('S-Parameter  |  Geração %d  |  Loop %d  |  Porta %d',G,L,P);
    title(Titulo)
    
    ylim([-50 0])
    yticks(-50:5:0)
    xticks(92:0.5:97)
    drawnow;
    
    % Legenda para os eixos vertical e horizontal
    xlabel('Frequency [GHz]')
    ylabel('Transmission Coefficients [dB]')
    
    % Legenda dos Parâmetros S
    lgd = legend('-DynamicLegend','Location','southwest','LineWidth',1);
    title(lgd,'S-Parameter')
    
    
end

    
    
end

    grid
    hold off
    % Salvando .png
    SaveFig = sprintf('%s\\%s\\G%d_Loop%d.png',pastaCorrente,nomePastaPlots,G,L);
    print(gcf,SaveFig,'-dpng','-r300');
    pause(2)

end


end



% Apagar variáveis
%clear variables
