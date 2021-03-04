% =========================================================================
% UNIVERSIDADE FEDERAL DO PAR�
% INSTITUTO DE TECNOLOGIA
% ENGENHARIA EL�TRICA
% LABORAT�RIO DE NANOFOT�NICA E NANOELETR�NICA
% 
% LUIZ HENRIQUE P. ASSUN��O
% =========================================================================

%load Settings.mat MaxLoop

% -------------------------------------------------------------------------
% Nome do Modelo
    Modelo = 'dipolo.mph';

% Escolha a Gera��o
    Geracao = 1;
    
% Escolha o Loop
    Loop = 642;%;MaxLoop + 1:640;
    
% Escolha a Porta
    Porta = 1:3;
% -------------------------------------------------------------------------



% Importar para o MATLAB as fun��es do COMSOL
import com.comsol.model.*
import com.comsol.model.util.*


for G = Geracao
    
    
    NPontos = 51;
    FreqLimInf = 9.2e+10;
    FreqLimSup = 9.7e+10;


    DeltaRange = FreqLimSup - FreqLimInf;
    Passo = (DeltaRange/(NPontos - 1));
    Range = FreqLimInf:Passo:FreqLimSup;
    CentroRange = (NPontos + 1)/2;
    
    MakeRange = sprintf('range(%e,%e/%d,%e)',FreqLimInf,DeltaRange,(NPontos - 1),FreqLimSup);
    
    
    % Criar diret�rio para guardar os resultados de cada gera��o
    nomePasta = sprintf('geracao_%d',G);
    
    % Verificar se o diret�rio existe
    if ~exist(nomePasta, 'dir')
        mkdir(nomePasta);
    end

    
for L = Loop
    
    
    Port = {'port1' 'port2' 'port3'};
    Plot = {'plot1' 'plot2' 'plot3'};
    Png  = {'pg2' 'pg3' 'pg4'};
    Img  = {'img1' 'img2' 'img3'};


% Gerar n�meros naturais rand�micos no intervalo [A B]
A = -0.2;
B = 0.2;

RandYF   = A + (B-(A)) .* rand(1,1);
RandRF   = A + (B-(A)) .* rand(1,1);
RandYC   = A + (B-(A)) .* rand(1,1);
RandXC   = A + (B-(A)) .* rand(1,1);
RandRC   = A + (B-(A)) .* rand(1,1);
RandYCS  = A + (B-(A)) .* rand(1,1);
RandRCS  = A + (B-(A)) .* rand(1,1);
RandYCDS = A + (B-(A)) .* rand(1,1);
RandXCDS = A + (B-(A)) .* rand(1,1);
RandRCDS = A + (B-(A)) .* rand(1,1);
RandYCDDS = A + (B-(A)) .* rand(1,1);
RandXCDDS = A + (B-(A)) .* rand(1,1);
RandRCDDS = A + (B-(A)) .* rand(1,1);
RandYCDDI = A + (B-(A)) .* rand(1,1);
RandXCDDI = A + (B-(A)) .* rand(1,1);
RandRCDDI = A + (B-(A)) .* rand(1,1);
RandYCDDI1 = A + (B-(A)) .* rand(1,1);
RandXCDDI1 = A + (B-(A)) .* rand(1,1);
RandRCDDI1 = A + (B-(A)) .* rand(1,1);
RandYCDDII1 = A + (B-(A)) .* rand(1,1);
RandXCDDII1 = A + (B-(A)) .* rand(1,1);
RandRCDDII1 = A + (B-(A)) .* rand(1,1);
RandYSSF = A + (B-(A)) .* rand(1,1);
RandRSSF = A + (B-(A)) .* rand(1,1);


% Gerar n�meros inteiros rand�micos no intervalo
RandIntYF   = randi([-5 5],1,1);
RandIntRF   = randi([-5 5],1,1);
RandIntYC   = randi([-5 5],1,1);
RandIntXC   = randi([-5 5],1,1);
RandIntRC   = randi([-5 5],1,1);
RandIntYCS  = randi([-5 5],1,1);
RandIntRCS  = randi([-5 5],1,1);
RandIntYCDS = randi([-5 5],1,1);
RandIntXCDS = randi([-5 5],1,1);
RandIntRCDS = randi([-5 5],1,1);
RandIntYCDDS = randi([-5 5],1,1);
RandIntXCDDS = randi([-5 5],1,1);
RandIntRCDDS = randi([-5 5],1,1);
RandIntYCDDI = randi([-5 5],1,1);
RandIntXCDDI = randi([-5 5],1,1);
RandIntRCDDI = randi([-5 5],1,1);
RandIntYCDDI1 = randi([-5 5],1,1);
RandIntXCDDI1 = randi([-5 5],1,1);
RandIntRCDDI1 = randi([-5 5],1,1);
RandIntYCDDII1 = randi([-5 5],1,1);
RandIntXCDDII1 = randi([-5 5],1,1);
RandIntRCDDII1 = randi([-5 5],1,1);
RandIntYSSF = randi([-5 5],1,1);
RandIntRSSF = randi([-5 5],1,1);


% Pesos das varia��es dos par�metros
PesoYF   = -1.770091918204028;% + RandYF*0.3;
PesoRF   = 1.220579750000000;% + RandRF*0.3;

PesoYC   = -1.079644084188952;% + RandYC*0.3;
PesoXC   = 1.179241000000000;% + RandXC*0.3;
PesoRC   = 1.252912250000000;% + RandRC*0.3;

PesoYCS  = -0.640698649330385;% + RandYCS*0.3;
PesoRCS  = 0.294824300000000;% + RandRCS*0.3;

PesoYCDS = -1.152308600000000;% + RandYCDS*0.3;
PesoXCDS = -1.594485364797471;% + RandXCDS*0.3;
PesoRCDS = 0.613191400000000;% + RandRCDS*0.3;

PesoYCDDS = 0.426566517844330;% + RandYCDDS*0.3;
PesoXCDDS = 0;% + RandXCDDS*0.3;
PesoRCDDS = 1.174172120028461;% + RandRCDDS*0.3;

PesoYCDDI = 0;% + RandYCDDI*0.3;
PesoXCDDI = 0;% + RandXCDDI*0.3;
PesoRCDDI = 0;% + RandRCDDI*0.3;

PesoYCDDI1 = 4.600424005766312;% + RandYCDDI1*0.3;
PesoXCDDI1 = 0.941745523012787;% + RandXCDDI1*0.3;
PesoRCDDI1 = 3.006073258728061;% + RandRCDDI1*0.3;

PesoYCDDII1 = 2.299406815220073;% + RandYCDDII1*0.3;
PesoXCDDII1 = 1.970010940695119;% + RandXCDDII1*0.3;
PesoRCDDII1 = 0;% + RandRCDDII1*0.3;

PesoYSSF = 0;% + RandYSSF*0.3;
PesoRSSF = 0;% + RandRSSF*0.3;



% Passar strings para o Comsol
YF   = num2str(PesoYF,'%.15f');
RF   = num2str(PesoRF,'%.15f');
YC   = num2str(PesoYC,'%.15f');
XC   = num2str(PesoXC,'%.15f');
RC   = num2str(PesoRC,'%.15f');
YCS  = num2str(PesoYCS,'%.15f');
RCS  = num2str(PesoRCS,'%.15f');
YCDS = num2str(PesoYCDS,'%.15f');
XCDS = num2str(PesoXCDS,'%.15f');
RCDS = num2str(PesoRCDS,'%.15f');
YCDDS = num2str(PesoYCDDS,'%.15f');
XCDDS = num2str(PesoXCDDS,'%.15f');
RCDDS = num2str(PesoRCDDS,'%.15f');
YCDDI = num2str(PesoYCDDI,'%.15f');
XCDDI = num2str(PesoXCDDI,'%.15f');
RCDDI = num2str(PesoRCDDI,'%.15f');
YCDDI1 = num2str(PesoYCDDI1,'%.15f');
XCDDI1 = num2str(PesoXCDDI1,'%.15f');
RCDDI1 = num2str(PesoRCDDI1,'%.15f');
YCDDII1 = num2str(PesoYCDDII1,'%.15f');
XCDDII1 = num2str(PesoXCDDII1,'%.15f');
RCDDII1 = num2str(PesoRCDDII1,'%.15f');
YSSF = num2str(PesoYSSF,'%.15f');
RSSF = num2str(PesoRSSF,'%.15f');


A1 = {'YF' 'RF' 'YC' 'XC' 'RC' 'YCS' 'RCS' 'YCDS' 'XCDS' 'RCDS' 'YCDDS'...
      'XCDDS' 'RCDDS' 'YCDDI' 'XCDDI' 'RCDDI' 'YCDDI1' 'XCDDI1' 'RCDDI1'...
      'YCDDII1' 'XCDDII1' 'RCDDII1' 'YSSF' 'RSSF'};
  
A2 = {YF RF YC XC RC YCS RCS YCDS XCDS RCDS YCDDS...
      XCDDS RCDDS YCDDI XCDDI RCDDI YCDDI1 XCDDI1 RCDDI1...
      YCDDII1 XCDDII1 RCDDII1 YSSF RSSF};

A3 = {'Y_Ferrite' 'R_Ferrite' 'Y_Cilindros_Duplos_Inferiores'...
      'X_Cilindros_Duplos_Inferiores' 'R_Cilindros_Duplos_Inferiores'...
      'Y_Cilindros_Superior' 'R_Cilindros_Superior'...
      'Y_Cilindros_Duplos_Superiores' 'X_Cilindros_Duplos_Superiores'...
      'R_Cilindros_Duplos_Superiores' 'Y' 'X' 'R' 'Y' 'X' 'R'...
      'Y_Cilindros_Duplos_Sub_Inferior' 'X_Cilindros_Duplos_Sub_Inferior'...
      'R_Cilindros_Duplos_Sub_Inferior' 'Y' 'X' 'R' 'Y' 'R'};



% Carregar modelo do Comsol
model = mphload('Dipolo.mph');


% Mostrar janela de progresso da simula��o
ModelUtil.showProgress(true)


% Par�metros a serem alterados a cada loop
for setPar = 1:length(A1)
    
model.param('par2').set(A1{setPar}, A2{setPar}, A3{setPar});

end


model.study('std1').feature('freq').set('plist', MakeRange);
model.sol('sol1').feature('v1').set('clist', {sprintf('%s[Hz]',MakeRange)});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {MakeRange});



% Rodar simula��o para uma porta de cada vez
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


% Constru��o dos nomes de arquivos
pastaCorrente = strrep(pwd,'\','\\');
nometxt = sprintf('%s\\%s\\S-Parameter (ewfd) - Gera��o %d - Loop %d - Porta %d.txt',pastaCorrente,nomePasta,G,L,P);
nomefig = sprintf('%s\\%s\\S-Parameter (ewfd) - Gera��o %d - Loop %d - Porta %d',pastaCorrente,nomePasta,G,L,P);

% Exportar arquivo .txt
model.result.export(Plot{P}).set('filename', nometxt);
model.result.export(Plot{P}).run;

% T�tulo das imagens
tituloImg = sprintf('S-Parameter (ewfd) - Gera��o %d - Loop %d - Porta %d',G,L,P);
model.result(Png{P}).set('title', tituloImg);

% Exportar imagem .png
mphplot(model, Png{P}, 'server', 'on');
model.result.export(Img{P}).set('pngfilename', nomefig);
model.result.export(Img{P}).run;

end


% Data e hora
dataAtual = string(datetime('now','Format','d-MMM-y HH-mm-ss'));

% Criar .txt com os par�metros usados no loop de simula��o
nomeParametrosTxt = sprintf('%s\\%s\\S-Parameter (ewfd) - Gera��o %d - Loop %d - Par�metros de Simula��o.txt',pastaCorrente,nomePasta,G,L);
ParametrosID = fopen(nomeParametrosTxt,'w');
fprintf(ParametrosID,'%%     PAR�METROS DE SIMULA��O\n%%\n');
fprintf(ParametrosID,'%%        Modelo:   %s\n',Modelo);
fprintf(ParametrosID,'%%         Range:   %e ... %e\n',FreqLimInf,FreqLimSup);
fprintf(ParametrosID,'%%  N� de Pontos:   %d\n',NPontos);
fprintf(ParametrosID,'%%       Gera��o:   %d\n',G);
fprintf(ParametrosID,'%%          Loop:   %d\n',L);
fprintf(ParametrosID,'%%          Data:   %s\n%%\n',dataAtual);
fprintf(ParametrosID,'%% Par�metros     |     Valores\n%%\n');

for txt = 1:length(A1)
fprintf(ParametrosID,'  %10s           %s\n',A1{txt},A2{txt});
end

fclose(ParametrosID);


% Plotar figura de campo
%mphplot(model,'pg1');


% Plotar geometria
%mphgeom(model);


% Remove um objeto de modelo espec�fico do COMSOL SERVER (ele ser� recarregado a cada loop)
%ModelUtil.remove('model')


% Remove todos os objetos de modelos do COMSOL armazenados no COMSOL SERVER
ModelUtil.clear


end



end



MaxLoop = max(Loop);

save Settings.mat MaxLoop


% Apagar vari�veis
clear variables