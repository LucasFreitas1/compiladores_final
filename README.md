Trabalho desenvolvido para a disciplina "Construção de Compiladores" do 6º semestre de Ciência da Computação do UniCEUB com o professor Eduardo Santos.

O compilador foi desenvolvido para ser utilizado em Linux,e devido a diferenças de sistemas operacionais não irá funcionar corretamente caso tente executa-lo no Windows.

É um compilador da Linguagem DECAF, baseado no ANTLR, que é uma ferramenta de reconhecimento de linguagem, que permite criar um analisador Léxico, Sintático e Semântico.
Pré-requisitos:
Arquivos para realizar testes no código
https://drive.google.com/open?id=1psaS5A13klaKt4Y_rGM9ATnvPVZyK6W9

Arquivos Compiler.jar, antlr.jar e symtab-1.0.8.jar
https://drive.google.com/open?id=11a-7ngd8m3-17Gnnn8eHhiABTuL4skzP

JavaC instalado

ANTLR
Como instalar:
Após baixar os pré-requisitos, crie uma pasta "Compilador" e extraia os documentos que estão em "prerequisitos1.zip" dentro da pasta
Crie uma pasta com nome "skeleton" e realize um git clone do repositório.
Dentro da pasta skeleton extraia os arquivos de "prerequisitos2.zip", que são as pastas lib e dist.

Abra o terminal no diretório da pasta e execute o código 'ant' no terminal para compilar

Depois basta executar os testes utilizando esse comando como exemplo:
java -jar dist/Compiler.jar -target inter -debug ../semantics/legal-01.dcf


