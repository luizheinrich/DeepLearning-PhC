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
% Nome do Modelo
    Modelo = 'dipolo.mph';

% Escolha a Geração
    Geracao = 1;
    
% Escolha o Loop
    Loop = MaxLoop + 1;
    
% Escolha a Porta
    Porta = 1:3;
% -------------------------------------------------------------------------



% Importar para o MATLAB as funções do COMSOL
import com.comsol.model.*
import com.comsol.model.util.*



% Simulando Resposta da Rede
fprintf('\nSimulando Resposta da Rede\n');
fprintf('\t-> Loop %d\n\n', Loop);




for G = Geracao
    
    
    NPontos = 51;
    FreqLimInf = 9.2e+10;
    FreqLimSup = 9.7e+10;


    DeltaRange = FreqLimSup - FreqLimInf;
    Passo = (DeltaRange/(NPontos - 1));
    Range = FreqLimInf:Passo:FreqLimSup;
    CentroRange = (NPontos + 1)/2;
    
    MakeRange = sprintf('range(%e,%e/%d,%e)',FreqLimInf,DeltaRange,(NPontos - 1),FreqLimSup);
    
    
    % Criar diretório para guardar os resultados de cada geração
    nomePasta = sprintf('geracao_%d',G);
    
    % Verificar se o diretório existe
    if ~exist(nomePasta, 'dir')
        mkdir(nomePasta);
    end

    
for L = Loop


    Port = {'port1' 'port2' 'port3'};
    Plot = {'plot1' 'plot2' 'plot3'};
    Png  = {'pg2' 'pg3' 'pg4'};
    Img  = {'img1' 'img2' 'img3'};


A1 = {'YF' 'RF' 'YC' 'XC' 'RC' 'YCS' 'RCS' 'YCDS' 'XCDS' 'RCDS' 'YCDDS'...
      'XCDDS' 'RCDDS' 'YCDDI' 'XCDDI' 'RCDDI' 'YCDDI1' 'XCDDI1' 'RCDDI1'...
      'YCDDII1' 'XCDDII1' 'RCDDII1' 'YSSF' 'RSSF'};


    load DenormalizedDataSetTargetNet.mat DenormalizedDataSetTargetNet
A2 = transpose(DenormalizedDataSetTargetNet);
A2 = num2str(A2,'%.15f');
A2 = {A2(1,1:18), A2(2,1:18), A2(3,1:18), A2(4,1:18), A2(5,1:18), A2(6,1:18)...
A2(7,1:18), A2(8,1:18), A2(9,1:18), A2(10,1:18), A2(11,1:18), A2(12,1:18)...
A2(13,1:18), A2(14,1:18), A2(15,1:18), A2(16,1:18), A2(17,1:18), A2(18,1:18)...
A2(19,1:18), A2(20,1:18), A2(21,1:18), A2(22,1:18), A2(23,1:18), A2(24,1:18)};


  
A3 = {'Y_Ferrite' 'R_Ferrite' 'Y_Cilindros_Duplos_Inferiores'...
      'X_Cilindros_Duplos_Inferiores' 'R_Cilindros_Duplos_Inferiores'...
      'Y_Cilindros_Superior' 'R_Cilindros_Superior'...
      'Y_Cilindros_Duplos_Superiores' 'X_Cilindros_Duplos_Superiores'...
      'R_Cilindros_Duplos_Superiores' 'Y' 'X' 'R' 'Y' 'X' 'R'...
      'Y_Cilindros_Duplos_Sub_Inferior' 'X_Cilindros_Duplos_Sub_Inferior'...
      'R_Cilindros_Duplos_Sub_Inferior' 'Y' 'X' 'R' 'Y' 'R'};



% Carregar modelo do Comsol
model = mphload('Dipolo.mph');


% Mostrar janela de progresso da simulação
ModelUtil.showProgress(true)


% Parâmetros a serem alterados a cada loop
for setPar = 1:length(A1)
    
model.param('par2').set(A1{setPar}, A2{setPar}, A3{setPar});

end


model.study('std1').feature('freq').set('plist', MakeRange);
model.sol('sol1').feature('v1').set('clist', {sprintf('%s[Hz]',MakeRange)});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {MakeRange});



% Rodar simulação para uma porta de cada vez
for P = Porta
    
    if P == 1
        Exc1 = {'on'};
    else
        Exc1 = {'off'};
    end
    
    if P == 2
        Exc2 = {'on'};
    else
        Exc2 = {'off'};
    end
        
    if P == 3
        Exc3 = {'on'};
    else
        Exc3 = {'off'};
    end        
    
% Setar porta
model.component('mod1').physics('ewfd').feature('port1').set('PortExcitation', Exc1);
model.component('mod1').physics('ewfd').feature('port2').set('PortExcitation', Exc2);
model.component('mod1').physics('ewfd').feature('port3').set('PortExcitation', Exc3);


% Resolver modelo
model.sol('sol1').runAll;


% Construção dos nomes de arquivos
pastaCorrente = strrep(pwd,'\','\\');
nometxt = sprintf('%s\\%s\\S-Parameter (ewfd) - Geração %d - Loop %d - Porta %d.txt',pastaCorrente,nomePasta,G,L,P);
nomefig = sprintf('%s\\%s\\S-Parameter (ewfd) - Geração %d - Loop %d - Porta %d',pastaCorrente,nomePasta,G,L,P);

% Exportar arquivo .txt
model.result.export(Plot{P}).set('filename', nometxt);
model.result.export(Plot{P}).run;

% Título das imagens
tituloImg = sprintf('S-Parameter (ewfd) - Geração %d - Loop %d - Porta %d',G,L,P);
model.result(Png{P}).set('title', tituloImg);

% Exportar imagem .png
mphplot(model, Png{P}, 'server', 'on');
model.result.export(Img{P}).set('pngfilename', nomefig);
model.result.export(Img{P}).run;

end


% Data e hora
dataAtual = string(datetime('now','Format','d-MMM-y HH-mm-ss'));

% Criar .txt com os parâmetros usados no loop de simulação
nomeParametrosTxt = sprintf('%s\\%s\\S-Parameter (ewfd) - Geração %d - Loop %d - Parâmetros de Simulação.txt',pastaCorrente,nomePasta,G,L);
ParametrosID = fopen(nomeParametrosTxt,'w');
fprintf(ParametrosID,'%%     PARÂMETROS DE SIMULAÇÃO\n%%\n');
fprintf(ParametrosID,'%%        Modelo:   %s\n',Modelo);
fprintf(ParametrosID,'%%         Range:   %e ... %e\n',FreqLimInf,FreqLimSup);
fprintf(ParametrosID,'%%  Nº de Pontos:   %d\n',NPontos);
fprintf(ParametrosID,'%%       Geração:   %d\n',G);
fprintf(ParametrosID,'%%          Loop:   %d\n',L);
fprintf(ParametrosID,'%%          Data:   %s\n%%\n',dataAtual);
fprintf(ParametrosID,'%% Parâmetros     |     Valores\n%%\n');

for txt = 1:length(A1)
fprintf(ParametrosID,'  %10s           %s\n',A1{txt},A2{txt});
end

fclose(ParametrosID);


% Plotar figura de campo
%mphplot(model,'pg1');


% Plotar geometria
%mphgeom(model);


% Remove um objeto de modelo específico do COMSOL SERVER (ele será recarregado a cada loop)
%ModelUtil.remove('model')


% Remove todos os objetos de modelos do COMSOL armazenados no COMSOL SERVER
ModelUtil.clear


end



end


MaxLoop = max(Loop);

save Settings.mat MaxLoop


% Status
fprintf('\nSimulação Finalizada\n\n');



% Apagar variáveis
clear variables