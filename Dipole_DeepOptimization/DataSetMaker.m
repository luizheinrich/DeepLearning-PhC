% =========================================================================
% UNIVERSIDADE FEDERAL DO PARÁ
% INSTITUTO DE TECNOLOGIA
% ENGENHARIA ELÉTRICA
% LABORATÓRIO DE NANOFOTÔNICA E NANOELETRÔNICA
%
% LUIZ HENRIQUE P. ASSUNÇÃO
% =========================================================================

load Settings.mat MaxLoop

% -------------------------------------------------------------------------
% Escolha a Geração
    Geracao = 1;

% Escolha o Loop
    Loop = 1:MaxLoop;
    
% Escolha a Porta
    Porta = 1:3;
% -------------------------------------------------------------------------



zero = 1;
LL = length(Loop);

% Geração
for G = Geracao
    
    pastaTarget = sprintf('desiredResponseData');
    nomePasta = sprintf('geracao_%d',G);
    pastaCorrente = strrep(pwd,'\','\\');

% Loop
for L = Loop
    
    % Carregar parâmetros
nomeDirPar = sprintf('%s\\%s\\S-Parameter (ewfd) - Geração %d - Loop %d - Parâmetros de Simulação.txt',pastaCorrente,nomePasta,G,L);
LOADParameters.Geracao{G}.Loop{L} = readtable(nomeDirPar,'HeaderLines', 11);
LOADParameters.Geracao{G}.Loop{L} = transpose(LOADParameters.Geracao{G}.Loop{L}{:,2});

A2 = length(LOADParameters.Geracao{G}.Loop{L});

for P = Porta
    
    % Carregar gráficos
nomeDirGra = sprintf('%s\\%s\\S-Parameter (ewfd) - Geração %d - Loop %d - Porta %d.txt',pastaCorrente,nomePasta,G,L,P);
LOADGraphics.Geracao{G}.Loop{L}.Porta{P} = load(nomeDirGra);
LOADGraphics.Geracao{G}.Loop{L}.Porta{P} = transpose(LOADGraphics.Geracao{G}.Loop{L}.Porta{P});

nomeDirTarget = sprintf('%s\\%s\\S-Parameter (ewfd) - Geração 1 - Loop 1 - Porta %d.txt',pastaCorrente,pastaTarget,P);
LOADTarget.Geracao{1}.Loop{1}.Porta{P} = load(nomeDirTarget);
LOADTarget.Geracao{1}.Loop{1}.Porta{P} = transpose(LOADTarget.Geracao{1}.Loop{1}.Porta{P});


U = length(LOADGraphics.Geracao{G}.Loop{L}.Porta{P});


if zero == 1
DataSetIn = zeros(LL*G,A2);
DataSetOut = zeros(LL*G,U*3);
DataSetTarget = zeros(1,U*3);
end

zero = 2;


DataSetIn((G-1)*LL+L,:) = transpose(LOADParameters.Geracao{G}.Loop{L});
DataSetOut((G-1)*LL+L,(P-1)*U+1:U*P) = transpose(LOADGraphics.Geracao{G}.Loop{L}.Porta{P}(2,:));

DataSetTarget((1-1)*1+1,(P-1)*U+1:U*P) = transpose(LOADTarget.Geracao{1}.Loop{1}.Porta{P}(2,:));



end

end

end



% Normalizar DataSet
MinDataSetIn = min(DataSetIn);
MaxDataSetIn = max(DataSetIn);
MinDataSetOut = min(DataSetOut);
MaxDataSetOut = max(DataSetOut);


save MinMaxDataSetIn.mat MinDataSetIn MaxDataSetIn
save MinMaxDataSetOut.mat MinDataSetOut MaxDataSetOut





% Normalizar DataSete para [0 .. 1]
NormalizedDataSetIn = ((DataSetIn-MinDataSetIn)./(MaxDataSetIn-MinDataSetIn));
NormalizedDataSetOut = ((DataSetOut-MinDataSetOut)./(MaxDataSetOut-MinDataSetOut));
NormalizedDataSetTarget = ((DataSetTarget-MinDataSetOut)./(MaxDataSetOut-MinDataSetOut));

NormalizedDataSetIn(isnan(NormalizedDataSetIn)) = 0;

% Desnormalizar DataSet
DenormalizedDataSetIn = (NormalizedDataSetIn./1) .* (MaxDataSetIn-MinDataSetIn) + MinDataSetIn;
DenormalizedDataSetOut = (NormalizedDataSetOut./1) .* (MaxDataSetOut-MinDataSetOut) + MinDataSetOut;
%DenormalizedDataSetTargetNet = (NormalizedDataSetTarget./1) .* (MaxDataSetIn-MinDataSetIn) + MinDataSetIn;


% Exportar DataSet de Entrada e Saída Normalizados
csvwrite('NormalizedDataSetIn.csv', NormalizedDataSetIn);
csvwrite('NormalizedDataSetOut.csv', NormalizedDataSetOut);
csvwrite('NormalizedDataSetTarget.csv', NormalizedDataSetTarget);

%csvwrite('NormalizedDataSetIn.csv',NormalizedDataSetIn);
%csvwrite('NormalizedDataSetOut.csv',NormalizedDataSetOut);


minloop = min(Loop);
maxloop = max(Loop);

% Mostrar Intervalo de Varredura
fprintf('\nIntervalo de Varredura:\n');
fprintf('\t-> %d a %d\n\n', minloop, maxloop);



% Apagar variáveis
clear variables


