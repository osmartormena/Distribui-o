% Geração da distribuição de carga horária de aulas por departamento
clear
clc

%% Produz as tabelas
M = processaObrigatorias;
O = processaOptativas;
P = processaDocentes;

%% Remove optativas que são obrigatórias em outras matrizes
[N, ~] = size(O);
n = 1;
while n<=N
    if any(strcmp(O.Codigo(n), M.Codigo))
        O(n, :) = [];
        N = N - 1;
    end
    n = n + 1;
end

%% Exporta
writetable(M, "data/Distribuição.xlsx", 'WriteMode', 'replacefile', ...
    'Sheet', 'Obrigatórias')
writetable(O, "data/Distribuição.xlsx", 'WriteMode', 'overwritesheet', ...
    'Sheet', 'Optativas')
writetable(P, "data/Distribuição.xlsx", 'WriteMode', 'overwritesheet', ...
    'Sheet', 'Docentes')
