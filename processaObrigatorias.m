function M = processaObrigatorias
% Processa as matrizes "novas" do sistema acadêmico e armazena em uma
% tabela.

%% Definições gerais
matrizes = "data/Matrizes.csv";

%% Configuração da importação
opts = detectImportOptions(matrizes);
varNames = {'Matriz', 'Periodo', 'OPT', 'Codigo', 'Disciplina', ...
    'Modelo', 'AT', 'AP', 'TA', 'APS', 'APCC', 'AD', 'CHEXT', 'CHEAD', ...
    'CHT', 'Pre', 'Equivalente', 'CH', 'Grupo'};
varTypes = {'string', 'uint8', 'string', 'string', 'string', 'string', ...
    'uint16', 'uint16', 'uint16', 'uint16', 'uint16', 'uint16', ...
    'uint16', 'uint16', 'string', 'string', 'string', 'uint16', 'string'};
opts.SelectedVariableNames = varNames;
opts.VariableTypes = varTypes;
M = readtable(matrizes, opts);

%% Remoção das compontentes curriculares
M(M.Disciplina=="Disciplina", :) = [];
M(M.Periodo==0, :) = [];
M(M.Modelo=="ENADE INGRESSANTE", :) = [];
M(M.Modelo=="ENADE CONCLUINTE", :) = [];
M(M.Modelo=="ATIVIDADES COMPLEMENTARES", :) = [];
M(M.Modelo=="ESTÁGIO", :) = [];
M(M.Modelo=="TRABALHO DE CONCLUSÃO", :) = [];
M.Modelo = [];

%% Remoção de colunas irrelevantes
M.Pre = [];
M.Equivalente = [];
M.CH = [];
M.Grupo = [];

%% Ajuste do formato dos dados
M.Codigo = erase(M.Codigo, "Turmas");
M.Codigo = strtrim(M.Codigo);
M.CHT = erase(M.CHT, "horas");
M.CHT = strtrim(M.CHT);
M.CHT = uint16(str2double(M.CHT));

%% Remove optativas
M(~ismissing(M.OPT), :) = [];
M.OPT = [];

%% Agrupas duplicatas
M.Periodo = strtrim(string(num2str(M.Periodo)));
M = sortrows(M, {'Codigo', 'Matriz', 'Periodo'});
[N, ~] = size(M);
n = 1;
while n<N
    if strcmp(M.Codigo(n), M.Codigo(n + 1))
        M.Matriz(n) = strcat(M.Matriz(n), ", ", M.Matriz(n + 1));
        M.Periodo(n) = strcat(M.Periodo(n), ", ", M.Periodo(n + 1));
        M(n + 1, :) = [];
        n = n - 1;
        N = N - 1;
    end
    n = n + 1;
end
M.Matriz = categorical(M.Matriz);
M.Periodo = categorical(M.Periodo);

%% Ordena a matriz
M = sortrows(M, 'Matriz');

end
