\documentclass[a4paper]{article}
\usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
\usepackage{palatino}
\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref}
\usepackage{graphicx}
\usepackage{cp1920t}
\usepackage{subcaption}
\usepackage{adjustbox}
\usepackage{color}
\usepackage{xy}
%================= local x=====================================================%
\def\getGif#1{\includegraphics[width=0.3\textwidth]{cp1920t_media/#1.png}}
\let\uk=\emph
\def\aspas#1{``#1"}
%================= lhs2tex=====================================================%
%include polycode.fmt 
%format (div (x)(y)) = x "\div " y
%format succ = "\succ "
%format ==> = "\Longrightarrow "
%format map = "\map "
%format length = "\length "
%format fst = "\p1"
%format p1  = "\p1"
%format snd = "\p2"
%format p2  = "\p2"
%format Left = "i_1"
%format Right = "i_2"
%format i1 = "i_1"
%format i2 = "i_2"
%format >< = "\times"
%format >|<  = "\bowtie "
%format |-> = "\mapsto"
%format . = "\comp "
%format (kcomp (f)(g)) = f "\kcomp " g
%format -|- = "+"
%format conc = "\mathsf{conc}"
%format summation = "{\sum}"
%format (either (a) (b)) = "\alt{" a "}{" b "}"
%format (frac (a) (b)) = "\frac{" a "}{" b "}"
%format (uncurry f) = "\uncurry{" f "}"
%format (const f) = "\underline{" f "}"
%format TLTree = "\mathsf{TLTree}"
%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
%format (split (x) (y)) = "\conj{" x "}{" y "}"
%format (for (f) (i)) = "\for{" f "}\ {" i "}"
%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
\def\ana#1{\mathopen{[\!(}#1\mathclose{)\!]}}
%format (cataA (f) (g)) = "\cata{" f "~" g "}_A"
%format (anaA (f) (g)) = "\ana{" f "~" g "}_A"
%format (cataB (f) (g)) = "\cata{" f "~" g "}_B"
%format (anaB (f) (g)) = "\ana{" f "~" g "}_B"
%format Either a b = a "+" b 
%format fmap = "\mathsf{fmap}"
%format NA   = "\textsc{na}"
%format NB   = "\textsc{nb}"
%format inT = "\mathsf{in}"
%format outT = "\mathsf{out}"
%format Null = "1"
%format (Prod (a) (b)) = a >< b
%format fF = "\fun F "
%format e1 = "e_1 "
%format e2 = "e_2 "
%format Dist = "\fun{Dist}"
%format IO = "\fun{IO}"
%format BTree = "\fun{BTree} "
%format LTree = "\mathsf{LTree}"
%format inNat = "\mathsf{in}"
%format (cataNat (g)) = "\cata{" g "}"
%format Nat0 = "\N_0"
%format muB = "\mu "
%format (frac (n)(m)) = "\frac{" n "}{" m "}"
%format (fac (n)) = "{" n "!}"
%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
%format matrix = "matrix"
%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
%format `ominus` = "\mathbin{\ominus}"
%format % = "\mathbin{/}"
%format <-> = "{\,\leftrightarrow\,}"
%format <|> = "{\,\updownarrow\,}"
%format `minusNat`= "\mathbin{-}"
%format ==> = "\Rightarrow"
%format .==>. = "\Rightarrow"
%format .<==>. = "\Leftrightarrow"
%format .==. = "\equiv"
%format .<=. = "\leq"
%format .&&&. = "\wedge"
%format cdots = "\cdots "
%format pi = "\pi "

%---------------------------------------------------------------------------

\title{
       	    C??lculo de Programas
\\
       	Trabalho Pr??tico
\\
       	MiEI+LCC --- 2019/20
}

\author{
       	\dium
\\
       	Universidade do Minho
}


\date\mydate

\makeindex
\newcommand{\rn}[1]{\textcolor{red}{#1}}
\begin{document}

\maketitle

\begin{center}\large
\begin{tabular}{ll}
\textbf{Grupo} nr. & 3
\\\hline
a89589 & Ana Filipa Rodrigues Pereira	
\\
a89500 & Carolina Gil Afonso Santejo
\\
a89615 & Sofia Guilherme Rodrigues dos Santos
\end{tabular}
\end{center}

\section{Pre??mbulo}

A disciplina de \CP\ tem como objectivo principal ensinar
a progra\-ma????o de computadores como uma disciplina cient??fica. Para isso
parte-se de um repert??rio de \emph{combinadores} que formam uma ??lgebra da
programa????o (conjunto de leis universais e seus corol??rios) e usam-se esses
combinadores para construir programas \emph{composicionalmente}, isto ??,
agregando programas j?? existentes.
  
Na sequ??ncia pedag??gica dos planos de estudo dos dois cursos que t??m
esta disciplina, restringe-se a aplica????o deste m??todo ?? programa????o
funcional em \Haskell. Assim, o presente trabalho pr??tico coloca os
alunos perante problemas concretos que dever??o ser implementados em
\Haskell.  H?? ainda um outro objectivo: o de ensinar a documentar
programas, valid??-los, e a produzir textos t??cnico-cient??ficos de
qualidade.

\section{Documenta????o} Para cumprir de forma integrada os objectivos
enunciados acima vamos recorrer a uma t??cnica de programa\-????o dita
``\litp{liter??ria}'' \cite{Kn92}, cujo princ??pio base ?? o seguinte:
\begin{quote}\em Um programa e a sua documenta????o devem coincidir.
\end{quote} Por outras palavras, o c??digo fonte e a documenta????o de um
programa dever??o estar no mesmo ficheiro.

O ficheiro \texttt{cp1920t.pdf} que est?? a ler ?? j?? um exemplo de \litp{programa????o
liter??ria}: foi gerado a partir do texto fonte \texttt{cp1920t.lhs}\footnote{O
suffixo `lhs' quer dizer \emph{\lhaskell{literate Haskell}}.} que encontrar??
no \MaterialPedagogico\ desta disciplina descompactando o ficheiro \texttt{cp1920t.zip}
e executando
\begin{Verbatim}[fontsize=\small]
    $ lhs2TeX cp1920t.lhs > cp1920t.tex
    $ pdflatex cp1920t
\end{Verbatim}
em que \href{https://hackage.haskell.org/package/lhs2tex}{\texttt\LhsToTeX} ??
um pre-processador que faz ``pretty printing''
de c??digo Haskell em \Latex\ e que deve desde j?? instalar executando
\begin{Verbatim}[fontsize=\small]
    $ cabal install lhs2tex
\end{Verbatim}
Por outro lado, o mesmo ficheiro \texttt{cp1920t.lhs} ?? execut??vel e cont??m
o ``kit'' b??sico, escrito em \Haskell, para realizar o trabalho. Basta executar
\begin{Verbatim}[fontsize=\small]
    $ ghci cp1920t.lhs
\end{Verbatim}

%if False
\begin{code}
{-# OPTIONS_GHC -XNPlusKPatterns #-}
{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable, FlexibleInstances #-}
--module Cp1920t where 
import Cp
import List  hiding (fac)
import Nat
import BTree
import LTree
import Probability
import ListUtils
import Show
import Data.List hiding (find)
import Test.QuickCheck hiding ((><),choose,collect)
import qualified Test.QuickCheck as QuickCheck
import System.Random  hiding (split)
import System.Process
import GHC.IO.Exception
import Graphics.Gloss
import Control.Monad
import Control.Applicative hiding ((<|>))
import Exp
\end{code}
%endif

\noindent Abra o ficheiro \texttt{cp1920t.lhs} no seu editor de texto preferido
e verifique que assim ??: todo o texto que se encontra dentro do ambiente
\begin{quote}\small\tt
\verb!\begin{code}!
\\ ... \\
\verb!\end{code}!
\end{quote}
vai ser seleccionado pelo \GHCi\ para ser executado.

\section{Como realizar o trabalho}
Este trabalho te??rico-pr??tico deve ser realizado por grupos de tr??s alunos.
Os detalhes da avalia????o (datas para submiss??o do relat??rio e sua defesa
oral) s??o os que forem publicados na \cp{p??gina da disciplina} na \emph{internet}.

Recomenda-se uma abordagem participativa dos membros do grupo
de trabalho por forma a poderem responder ??s quest??es que ser??o colocadas
na \emph{defesa oral} do relat??rio.

Em que consiste, ent??o, o \emph{relat??rio} a que se refere o par??grafo anterior?
?? a edi????o do texto que est?? a ser lido, preenchendo o anexo \ref{sec:resolucao}
com as respostas. O relat??rio dever?? conter ainda a identifica????o dos membros
do grupo de trabalho, no local respectivo da folha de rosto.

Para gerar o PDF integral do relat??rio deve-se ainda correr os comando seguintes,
que actualizam a bibliografia (com \Bibtex) e o ??ndice remissivo (com \Makeindex),
\begin{Verbatim}[fontsize=\small]
    $ bibtex cp1920t.aux
    $ makeindex cp1920t.idx
\end{Verbatim}
e recompilar o texto como acima se indicou. Dever-se-?? ainda instalar o utilit??rio
\QuickCheck,
que ajuda a validar programas em \Haskell\ e a biblioteca \gloss{Gloss} para
gera????o de gr??ficos 2D:
\begin{Verbatim}[fontsize=\small]
    $ cabal install QuickCheck gloss
\end{Verbatim}
Para testar uma propriedade \QuickCheck~|prop|, basta invoc??-la com o comando:
\begin{verbatim}
    > quickCheck prop
    +++ OK, passed 100 tests.
\end{verbatim}
Pode mesmo controlar o n??mero de casos de teste e sua complexidade utilizando
o comando:
\begin{verbatim}
    > quickCheckWith stdArgs { maxSuccess = 200, maxSize = 10 } prop
    +++ OK, passed 200 tests.
\end{verbatim}
Qualquer programador tem, na vida real, de ler e analisar (muito!) c??digo
escrito por outros. No anexo \ref{sec:codigo} disponibiliza-se algum
c??digo \Haskell\ relativo aos problemas que se seguem. Esse anexo dever??
ser consultado e analisado ?? medida que isso for necess??rio.

\Problema

Pretende-se implementar um sistema de manuten????o e utiliza????o de um dicion??rio.
Este ter?? uma estrutura muito peculiar em mem??ria. Ser?? constru??da
uma ??rvore em que cada nodo ter?? apenas uma letra da palavra e cada
folha da respectiva ??rvore ter?? a respectiva tradu????o (um ou mais sin??nimos).
Dever?? ser poss??vel:
\begin{itemize}
\item
|dic_rd| --- procurar tradu????es para uma determinada palavra
\item	
|dic_in| --- inserir palavras novas (palavra e tradu????o)
\item
|dic_imp| --- importar dicion??rios do formato ``lista de pares palavra-tradu????o"
\item
|dic_exp| --- exportar dicion??rios para o formato ``lista de pares palavra-tradu????o".
\end{itemize}
A implementa????o deve ser baseada no m??dulo \textbf{Exp.hs} que est?? inclu??do no material deste trabalho pr??tico,
que deve ser estudado com aten????o antes de abordar este problema.

    \begin{figure}          
    \includegraphics[scale=0.15]{images/dic.png}
    \caption{Representa????o em mem??ria do dicion??rio dado para testes.}
    \label{fig:dic}          
    \end{figure}

No anexo \ref{sec:codigo} ?? dado um dicion??rio para testes, que corresponde ?? figura \ref{fig:dic}.
A implementa????o proposta dever?? garantir as seguintes propriedades:
\begin{propriedade}
Se um dicion??rio estiver normalizado (ver ap??ndice \ref{sec:codigo}) ent??o
n??o perdemos informa????o quando o representamos em mem??ria:
\begin{code}
prop_dic_rep x = let d = dic_norm x in (dic_exp . dic_imp) d == d
\end{code}
\end{propriedade}
\begin{propriedade}
Se um significado |s| de uma palavra |p| j?? existe num dicion??rio ent??o adicion??-lo
em mem??ria n??o altera nada:
\begin{code}
prop_dic_red p s d
   | dic_red p s d = dic_imp d == dic_in p s (dic_imp d)
   | otherwise = True
\end{code}
\end{propriedade}
\begin{propriedade}
A opera????o |dic_rd| implementa a procura na correspondente exporta????o do dicion??rio:
\begin{code}
prop_dic_rd (p,t) = dic_rd  p t == lookup p (dic_exp t)
\end{code}
\end{propriedade}

\Problema

??rvores bin??rias (elementos do tipo \BTree) s??o
    frequentemente usadas no armazenamento e procura de dados, porque
    suportam um vasto conjunto de ferramentas para procuras
    eficientes. Um exemplo de destaque ?? o caso das
    \href{https://en.wikipedia.org/wiki/Binary_search_tree}{??rvores
    bin??rias de procura}, \emph{i.e.} ??rvores que seguem o
    princ??pio de \emph{ordena????o}: para todos os n??s,
    o filho ?? esquerda tem um
    valor menor ou igual que o valor no pr??prio n??; e de forma
     an??loga, o filho ?? direita
    tem um valor maior ou igual que o valor no pr??prio n??.
    A Figura~\ref{fig:ex} apresenta dois exemplos de ??rvores bin??rias de procura.\footnote{
    As imagens foram geradas com recurso ?? fun????o |dotBt| (dispon??vel
    neste documento). Recomenda-se o
    uso desta fun????o para efeitos de teste e ilustra????o.}

    \begin{figure}          
    \includegraphics[scale=0.26]{images/example1.png}
    \includegraphics[scale=0.26]{images/example2.png}
    \caption{Duas ??rvores bin??rias de procura; a da esquerda vai ser designada
    por $t_1$ e a da direita por $t_2$.}
    \label{fig:ex}          
    \end{figure}
  Note que tais ??rvores permitem reduzir \emph{significativamente}
  o espa??o de procura, dado que ao procurar um valor podemos sempre
  \emph{reduzir a procura a um ramo} ao longo de cada n?? visitado. Por
  exemplo, ao procurar o valor $7$ na primeira ??rvore ($t_1$), sabemos que nos
  podemos restringir ao ramo da direita do n?? com o valor $5$ e assim
  sucessivamente. Como complemento a esta explica????o, consulte
  tamb??m os \href{http://www4.di.uminho.pt/~jno/media/}{v??deos das aulas te??ricas} (cap??tulo `pesquisa bin??ria').

  Para verificar se uma ??rvore bin??ria est?? ordenada,
  ?? ??til ter em conta  a seguinte
  propriedade: considere uma ??rvore bin??ria cuja ra??z tem o valor
  $a$, um filho $s_1$ ?? esquerda e um filho $s_2$ ?? direita.
  Assuma que os dois filhos est??o ordenados; que o elemento
  \emph{mais ?? direita} de $t_1$ ?? menor ou igual a $a$; e que o
  elemento \emph{mais ?? esquerda} de $t_2$ ?? maior ou igual a $a$.
  Ent??o a ??rvore bin??ria est?? ordenada. Dada esta informa????o,
  implemente as seguintes fun????es como catamorfismos de ??rvores bin??rias.
\begin{code}
maisEsq :: BTree a -> Maybe a
maisDir :: BTree a -> Maybe a
\end{code}
  Seguem alguns exemplos dos resultados que se esperam ao aplicar
  estas fun????es ?? ??rvore da esquerda ($t1$) e ?? ??rvore da direita ($t2$)
  da Figura~\ref{fig:ex}.
  \begin{Verbatim}[fontsize=\small]
   *Splay> maisDir t1
    Just 16
   *Splay> maisEsq t1
    Just 1
   *Splay> maisDir t2
    Just 8
   *Splay> maisEsq t2
    Just 0
  \end{Verbatim}
  \begin{propriedade}
  As fun????es |maisEsq| e |maisDir| s??o determinadas unicamente
  pela propriedade
\begin{code}
prop_inv :: BTree String -> Bool
prop_inv = maisEsq .==. maisDir . invBTree
\end{code}
  \end{propriedade}
  \begin{propriedade}
    O elemento mais ?? esquerda de uma ??rvore est?? presente no ramo da
    esquerda, a n??o ser que esse ramo esteja vazio:
\begin{code}
propEsq Empty = property Discard
propEsq x@(Node(a,(t,s))) = (maisEsq t) /= Nothing ==> (maisEsq x) == maisEsq t
\end{code}
\end{propriedade}
  A pr??xima tarefa deste problema consiste na implementa????o de uma fun????o
  que insere um novo elemento numa ??rvore
  bin??ria \emph{preservando} o princ??pio de ordena????o,
\begin{code}
insOrd :: (Ord a) => a -> BTree a -> BTree a
\end{code}
  e de uma fun????o que verifica se uma dada ??rvore bin??ria est?? ordenada,
\begin{code}
isOrd :: (Ord a) => BTree a -> Bool
\end{code}
Para ambas as fun????es deve utilizar o que aprendeu sobre \emph{catamorfismos e
recursividade m??tua}.

\noindent
\textbf{Sugest??o:} Se tiver problemas em implementar
com base em catamorfismos  estas duas ??ltimas
fun????es, tente implementar (com base em catamorfismos) as fun????es auxiliares
\begin{code}
insOrd' :: (Ord a) => a -> BTree a -> (BTree a, BTree a)
isOrd' :: (Ord a) => BTree a -> (Bool, BTree a)
\end{code}
tais que
$insOrd' \> x = \langle insOrd \> x, id \rangle$ para todo o elemento $x$
do tipo $a$
e
$isOrd' = \langle isOrd, id \rangle$.
  \begin{propriedade}
   Inserir uma sucess??o de elementos numa ??rvore vazia gera uma ??rvore
   ordenada.
\begin{code}
prop_ord :: [Int] -> Bool
prop_ord = isOrd . (foldr insOrd Empty)
\end{code}
\end{propriedade}

\smallskip
  \noindent
    As ??rvores bin??rias providenciam uma boa maneira de reduzir o espa??o
    de procura. Mas podemos fazer ainda melhor: podemos aproximar da
    ra??z os elementos da ??rvore que s??o mais acedidos, reduzindo assim
    o espa??o de procura na \emph{dimens??o vertical}\footnote{Note que
    nas ??rvores de bin??ria de procura a redu????o ?? feita na dimens??o
    horizontal.}. Esta opera????o ?? geralmente
    referida como
    \href{https://en.wikipedia.org/wiki/Splay_tree}{\emph{splaying}} e
    ?? implementada com base naquilo a que chamamos
    \href{https://en.wikipedia.org/wiki/Tree_rotation}{\emph{rota????es ?? esquerda
    e ?? direita de uma  ??rvore}}.

    Intuitivamente, a rota????o ?? direita de uma ??rvore move todos os
    n??s "\emph{uma casa para a sua direita}". Formalmente,
    esta opera????o define-se da seguinte maneira:
    \begin{enumerate}
       \item Considere uma ??rvore bin??ria e designe a sua
       ra??z pela letra $r$. Se $r$ n??o tem filhos ?? esquerda ent??o simplesmente
       retornamos a ??rvore dada ?? entrada. Caso contr??rio,
       \item designe o filho ?? esquerda pela letra $l$. A ??rvore
       que vamos retornar tem $l$ na ra??z, que mant??m o filho ?? esquerda
       e adopta $r$ como o filho ?? direita. O orf??o (\emph{i.e.} o anterior
       filho ?? direita de $l$) passa a ser o filho ?? esquerda de $r$.
    \end{enumerate}
    A rota????o ?? esquerda ?? definida de forma an??loga. As
       Figuras~\ref{exrot:fig} e \ref{exrot2:fig} apresentam dois
       exemplos de rota????es ?? direita. Note que em ambos os casos o
       valor $2$ subiu um n??vel na ??rvore correspodente. De facto,
       podemos sempre aplicar uma \emph{sequ??ncia} de rota????es numa
       ??rvore de forma a mover um dado n?? para a ra??z (dando origem
       portanto ?? referida opera????o de splaying).

    \begin{figure}
    \includegraphics[scale=0.27]{images/example1.png}
    \includegraphics[scale=0.27]{images/example3.png}
    \caption{Exemplo de uma rota????o ?? direita. A ??rvore da esquerda
    ?? a ??rvore original; a ??rvore da direita representa a rota????o ?? direita
    correspondente.}
    \label{exrot:fig}
    \end{figure}

    \begin{figure}
    \includegraphics[scale=0.25]{images/example2.png}
    \includegraphics[scale=0.25]{images/example4.png}
    \caption{Exemplo de uma rota????o ?? direita. A ??rvore da esquerda
    ?? a ??rvore original; a ??rvore da direita representa a rota????o ?? direita
    correspondente.}
    \label{exrot2:fig}
    \end{figure}

    Come??e ent??o por implementar as fun????es   
\begin{code}
rrot :: BTree a -> BTree a
lrot :: BTree a -> BTree a
\end{code}
    de rota????o ?? direita e ?? esquerda.
    \begin{propriedade}
       As rota????es ?? esquerda e ?? direita preservam a ordena????o
       das ??rvores.
\begin{code}
prop_ord_pres_esq = forAll orderedBTree (isOrd . lrot)
prop_ord_pres_dir = forAll orderedBTree (isOrd . rrot)
\end{code}
    \end{propriedade}
De seguida implemente a opera????o de splaying
\begin{code}
splay :: [Bool] -> (BTree a -> BTree a)
\end{code}
como um catamorfismo de listas. O argumento |[Bool]|
representa um caminho ao longo de uma ??rvore, em que o valor |True|
representa "seguir pelo ramo da esquerda" e o valor |False|
representa "seguir pelo ramo da direita". O caminho ao longo de uma ??rvore serve
para \emph{identificar} unicamente um n?? dessa ??rvore.
\begin{propriedade}
A opera????o de splay preserva a ordena????o de uma ??rvore.
\begin{code}
prop_ord_pres_splay :: [Bool] -> Property
prop_ord_pres_splay path = forAll orderedBTree (isOrd . (splay path))
\end{code}
\end{propriedade}

\Problema

\emph{??rvores de decis??o bin??rias} s??o estruturas de dados usadas na
 ??rea de
 \href{https://www.xoriant.com/blog/product-engineering/decision-trees-machine-learning-algorithm.html}{machine
 learning} para codificar processos de decis??o. Geralmente, tais
 ??rvores s??o geradas por computadores com base num vasto conjunto de
 dados e reflectem o que o computador "aprendeu" ao processar esses
 mesmos dados. Segue-se um exemplo muito simples de uma ??rvore de decis??o
 bin??ria:

\[
  \xymatrix{ & \text{chuva na ida?} \ar[dl]_{\text{sim}} \ar[dr]^{\text{n??o}} & &\\
  \text{precisa} & & \text{chuva no regresso?} \ar[dl]^{\text{sim}}
  \ar[dr]^{\text{n??o}} & \\
  & \text{precisa} & & \text{n??o precisa}
  }
\]

Esta ??rvore representa o processo de decis??o relativo a ser preciso ou
    n??o levar um guarda-chuva para uma viagem, dependendo das
    condi????es climat??ricas. Essencialmente, o processo de decis??o ??
    efectuado ao "percorrer" a ??rvore, escolhendo o ramo da esquerda ou
    da direita de acordo com a resposta ?? pergunta correspondente. Por
    exemplo, come??ando da raiz da ??rvore, responder |["n??o", "n??o"]|
    leva-nos ?? decis??o |"n??o precisa"| e responder |["n??o", "sim"]|
    leva-nos ?? decis??o |"precisa"|.

??rvores de decis??o bin??rias podem ser codificadas em \Haskell\ usando
o seguinte tipo de dados:
\begin{code}
data Bdt a = Dec a | Query (String, (Bdt a, Bdt a)) deriving Show
\end{code}

Note que o tipo de dados |Bdt| ?? parametrizado por um tipo de dados
 |a|.  Isto ?? necess??rio, porque as decis??es podem ser de diferentes
 tipos: por exemplo, respostas do tipo "sim ou n??o" (como apresentado
 acima), a escolha de n??meros, ou
 \href{http://jkurokawa.com/2018/02/09/machine-learning-part-ii-decision-trees}{classifica????es}.

De forma a conseguirmos processar ??rvores de decis??o bin??rias em \Haskell,
deve, antes de tudo, resolver as seguintes al??neas:
\begin{enumerate}
  \item Definir as fun????es |inBdt|, |outBdt|, |baseBdt|, |cataBdt|, e |anaBdt|.
  \item Apresentar no relat??rio o diagrama de |anaBdt|.
\end{enumerate}


Para tomar uma decis??o com base numa ??rvore de decis??o bin??ria |t|, o
computador precisa apenas da estrutura de |t| (\emph{i.e.} pode esquecer
a informa????o nos n??s da ??rvore) e de uma lista de respostas "sim ou n??o" (para
que possa percorrer a ??rvore da forma desejada). Implemente ent??o as seguintes
fun????es na forma de \emph{catamorfismos}:
\begin{enumerate}
\item |extLTree : Bdt a -> LTree a| (esquece a informa????o presente
nos n??s de uma dada ??rvore de decis??o bin??ria).
\begin{propriedade}
  A fun????o |extLTree| preserva as folhas da ??rvore de origem.
\begin{code}
prop_pres_tips :: Bdt Int -> Bool
prop_pres_tips = tipsBdt .==. tipsLTree . extLTree
\end{code}
\end{propriedade}
\item |navLTree : LTree a -> ([Bool] -> LTree a)| (navega um elemento de
|LTree|
de acordo com uma sequ??ncia de respostas "sim ou n??o". Esta fun????o deve
ser implementada como um catamorfismo de |LTree|. Neste contexto,
elementos de |[Bool]| representam sequ??ncias de respostas: o valor |True| corresponde a "sim" e portanto a "segue pelo ramo da esquerda"; o valor
|False| corresponde a "n??o" e portanto a "segue pelo ramo da direita".

Seguem
alguns exemplos dos resultados que se esperam ao aplicar |navLTree| a
|(extLTree bdtGC)|, em que |bdtGC| ?? a  ??rvore de decis??o bin??ria acima descrita,
e a uma
sequ??ncia de respostas.
   \begin{Verbatim}[fontsize=\small]
    *ML> navLTree (extLTree bdtGC) []
    Fork (Leaf "Precisa",Fork (Leaf "Precisa",Leaf "N precisa"))
    *ML> navLTree (extLTree bdtGC) [False]
    Fork (Leaf "Precisa",Leaf "N precisa")
    *ML> navLTree (extLTree bdtGC) [False,True]
    Leaf "Precisa"
    *ML> navLTree (extLTree bdtGC) [False,True,True]
    Leaf "Precisa"
    *ML> navLTree (extLTree bdtGC) [False,True,True,True]
    Leaf "Precisa"
   \end{Verbatim}
\end{enumerate}
\begin{propriedade}
  Percorrer uma ??rvore ao longo de um caminho ?? equivalente a percorrer
a ??rvore inversa ao longo do caminho inverso.
\begin{code}
prop_inv_nav :: Bdt Int -> [Bool] -> Bool
prop_inv_nav t l = let t' = extLTree t in
  invLTree (navLTree t' l) == navLTree (invLTree t') (fmap not l)
\end{code}
\end{propriedade}
\begin{propriedade}
  Quanto mais longo for o caminho menos alternativas de fim ir??o existir.
\begin{code}
prop_af :: Bdt Int -> ([Bool],[Bool]) -> Property
prop_af t (l1,l2) = let t' = extLTree t
                        f = length . tipsLTree . (navLTree t')
                    in isPrefixOf l1 l2 ==> (f l1 >= f l2)
\end{code}
\end{propriedade}

\Problema

%format B = "\mathit B"
%format C = "\mathit C"
M??nades s??o functores com propriedades adicionais que nos permitem obter
efeitos especiais em progra\-ma????o. Por exemplo, a biblioteca \Probability\
oferece um m??nade para abordar problemas de probabilidades. Nesta biblioteca,
o conceito de distribui????o estat??stica ?? captado pelo tipo
\begin{eqnarray}
	|newtype Dist a = D {unD :: [(a, ProbRep)]}|
	\label{eq:Dist}
\end{eqnarray}
em que |ProbRep| ?? um real de |0| a |1|, equivalente a uma escala de $0$ a
$100 \%$.

Cada par |(a,p)| numa distribui????o |d::Dist a| indica que a probabilidade
de |a| ?? |p|, devendo ser garantida a propriedade de  que todas as probabilidades
de |d| somam $100\%$.
Por exemplo, a seguinte distribui????o de classifica????es por escal??es de $A$ a $E$,
\[
\begin{array}{ll}
A & \rule{2mm}{3pt}\ 2\%\\
B & \rule{12mm}{3pt}\ 12\%\\
C & \rule{29mm}{3pt}\ 29\%\\
D & \rule{35mm}{3pt}\ 35\%\\
E & \rule{22mm}{3pt}\ 22\%\\
\end{array}
\]
ser?? representada pela distribui????o
\begin{code}
d1 :: Dist Char
d1 = D [('A',0.02),('B',0.12),('C',0.29),('D',0.35),('E',0.22)]
\end{code}
que o \GHCi\ mostrar?? assim:
\begin{Verbatim}[fontsize=\small]
'D'  35.0%
'C'  29.0%
'E'  22.0%
'B'  12.0%
'A'   2.0%
\end{Verbatim}
?? poss??vel definir geradores de distribui????es, por exemplo distribui????es \emph{uniformes},
\begin{code}
d2 = uniform (words "Uma frase de cinco palavras")
\end{code}
isto ??
\begin{Verbatim}[fontsize=\small]
     "Uma"  20.0%
   "cinco"  20.0%
      "de"  20.0%
   "frase"  20.0%
"palavras"  20.0%
\end{Verbatim}
distribui????o \emph{normais}, eg.\
\begin{code}
d3 = normal [10..20]
\end{code}
etc.\footnote{Para mais detalhes ver o c??digo fonte de \Probability, que ?? uma adapta????o da
biblioteca \PFP\ (``Probabilistic Functional Programming''). Para quem quiser souber mais
recomenda-se a leitura do artigo \cite{EK06}.}
|Dist| forma um \textbf{m??nade} cuja unidade ?? |return a = D [(a,1)]| e cuja composi????o de Kleisli
?? (simplificando a nota????o)
\begin{spec}
  ((kcomp f g)) a = [(y,q*p) | (x,p) <- g a, (y,q) <- f x]
\end{spec}
em que |g: A -> Dist B| e |f: B -> Dist C| s??o fun????es \textbf{mon??dicas} que representam
\emph{computa????es probabil??sticas}.
Este m??nade ?? adequado ?? resolu????o de problemas de
 \emph{probabilidades e estat??stica} usando programa????o funcional, de
 forma elegante e como caso particular da programa????o
 mon??dica. Vamos estudar a aplica????o
 deste m??nade ao exerc??cio anterior, tendo em conta o facto de que nem
 sempre podemos responder com 100\% de certeza a perguntas presentes
 em ??rvores de decis??o.


Considere a seguinte situa????o: a Anita vai
 trabalhar no dia seguinte
e quer saber se precisa de levar guarda-chuva.  Na verdade,
 ela tem autocarro de porta de casa at?? ao trabalho, e portanto
 as condi????es meteorol??gicas n??o s??o muito significativas; a n??o ser
 que seja segunda-feira...??s segundas ?? dia de feira e o autocarro vai
 sempre lotado! Nesses dias, ela prefere fazer a p?? o caminho de casa
 ao trabalho, o que a obriga a levar guarda-chuva (nos dias de
 chuva). Abaixo est?? apresentada a ??rvore de decis??o respectiva a este problema.

 \[
     \xymatrix{
     && \text{2a-feira?} \ar[dl]_{\text{sim}} \ar[dr]^{\text{n??o}} & \\
     & \text{chuva na ida?} \ar[dl]_{\text{sim}} \ar[dr]^{\text{n??o}}
      && \text{n??o precisa} \\
     \text{precisa} && \text{chuva no regresso?}
    \ar[dl]_{\text{sim}} \ar[dr]^{\text{n??o}} & \\
     &\text{precisa} && \text{n??o precisa}
     }
  \]

Assuma que a Anita n??o sabe em que dia est??, e que a previs??o da
   chuva para a ida ?? de 80\% enquanto que a previs??o de chuva para o
   regresso ?? de 60\%. \emph{A Anita deve
  levar guarda-chuva?}
  Para responder a esta quest??o, iremos tirar partido do que se aprendeu
  no exerc??cio anterior. De facto, a maior diferen??a ?? que agora as
  respostas ("sim" ou "n??o") s??o dadas na forma de uma distribui????o sobre o tipo de dados
  |Bool|. Implemente como um catamorfismo de |LTree| a fun????o
\begin{code}
bnavLTree :: LTree a -> ((BTree Bool) -> LTree a)
\end{code}
que percorre uma ??rvore dado um caminho, \emph{n??o} do tipo |[Bool]|, mas
do tipo |BTree Bool|. O tipo |BTree Bool| ?? necess??rio
na presen??a de incerteza, porque neste contexto n??o sabemos sempre
       qual a pr??xima pergunta a responder. Teremos portanto
que ter resposta para todas as perguntas na ??rvore de decis??o.

Seguem alguns exemplos dos resultados que se esperam
       ao aplicar |bnavLTree| a |(extLTree anita)|, em que |anita| ?? a
       ??rvore de decis??o acima descrita, e a uma ??rvore
      bin??ria de respostas.
     \begin{Verbatim}[fontsize=\small]
      *ML> bnavLTree (extLTree anita) (Node(True, (Empty,Empty)))
      Fork (Leaf "Precisa",Fork (Leaf "Precisa",Leaf "N precisa"))
      *ML> bnavLTree (extLTree anita) (Node(True, (Node(True,(Empty,Empty)),Empty)))
      Leaf "Precisa"
      *ML> bnavLTree (extLTree anita) (Node(False, (Empty,Empty)))
      Leaf "N precisa"
     \end{Verbatim}
Por fim, implemente como um catamorfismo de |LTree| a fun????o
\begin{code}
pbnavLTree :: LTree a -> ((BTree (Dist Bool)) -> Dist(LTree a))
\end{code}
que dever?? consiste na "monadifica????o" da fun????o |bnavLTree| via a m??nade das
probabilidades. Use esta ??ltima implementa????o para responder se a Anita deve
levar guarda-chuva ou n??o dada a situa????o acima descrita.
\Problema

Os \truchet{mosaicos de Truchet} s??o padr??es que se obt??m gerando aleatoriamente
combina????es bidimensionais de ladrilhos b??sicos. Os que se mostram na figura
\ref{fig:tiles} s??o conhecidos por ladrilhos de Truchet-Smith.
A figura \ref{fig:truchet} mostra um exemplo de mosaico produzido por uma
combina????o aleat??ria de 10x10 ladrilhos |a| e |b| (cf.\ figura
\ref{fig:tiles}).

Neste problema pretende-se programar a gera????o aleat??ria de mosaicos de
Truchet-Smith usando o m??nade \random{Random} e a biblioteca \gloss{Gloss}
para produ????o do resultado. Para uniformiza????o das respostas, dever??o ser
seguidas as seguintes condi????es:
\begin{itemize}
\item	Cada ladrilho dever?? ter as dimens??es 80x80
\item	O programa dever?? gerar mosaicos de quaisquer dimens??es, mas dever?? ser apresentado como figura no relat??rio o mosaico de 10x10 ladrilhos.
\item	Valorizar-se-??o respostas elegantes e com menos linhas de c??digo \Haskell.
\end{itemize} 
No anexo \ref{sec:codigo} ?? dada uma implementa????o da opera????o de permuta aleat??ria de uma lista que pode ser ??til para resolver este exerc??cio.

    \begin{figure}\centering
    \includegraphics[scale=0.20]{images/tiles.png}
    \caption{Os dois ladrilhos de Truchet-Smith.}
    \label{fig:tiles}
    \end{figure}

    \begin{figure}\centering
    \includegraphics[scale=0.20]{images/truchet.png}
    \caption{Um mosaico de Truchet-Smith.}
    \label{fig:truchet}
    \end{figure}

%----------------- Programa, bibliotecas e c??digo auxiliar --------------------%

\newpage

\part*{Anexos}

\appendix

\section{Como exprimir c??lculos e diagramas em LaTeX/lhs2tex}
Estudar o texto fonte deste trabalho para obter o efeito:\footnote{Exemplos tirados de \cite{Ol18}.} 
\begin{eqnarray*}
\start
	|id = split f g|
%
\just\equiv{ universal property }
%
        |lcbr(
		p1 . id = f
	)(
		p2 . id = g
	)|
%
\just\equiv{ identity }
%
        |lcbr(
		p1 = f
	)(
		p2 = g
	)|
\qed
\end{eqnarray*}

Os diagramas podem ser produzidos recorrendo ?? \emph{package} \LaTeX\ 
\href{https://ctan.org/pkg/xymatrix}{xymatrix}, por exemplo: 
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Nat0|
           \ar[d]_-{|cataNat g|}
&
    |1 + Nat0|
           \ar[d]^{|id + (cataNat g)|}
           \ar[l]_-{|inNat|}
\\
     |B|
&
     |1 + B|
           \ar[l]^-{|g|}
}
\end{eqnarray*}


\section{C??digo fornecido}\label{sec:codigo}

\subsection*{Problema 1}
Fun????o de representa????o de um dicion??rio:
\begin{code}
dic_imp :: [(String,[String])] -> Dict
dic_imp = Term "" . map (bmap  id singl) . untar . discollect
\end{code}
onde
\begin{code}
type Dict = Exp String String
\end{code}
Dicion??rio para testes:
\begin{code}
d :: [(String, [String])]
d =  [ ("ABA",["BRIM"]),
       ("ABALO",["SHOCK"]),
       ("AMIGO",["FRIEND"]),
       ("AMOR",["LOVE"]),
       ("MEDO",["FEAR"]),
       ("MUDO",["DUMB","MUTE"]),
       ("PE",["FOOT"]),
       ("PEDRA",["STONE"]),
       ("POBRE",["POOR"]),
       ("PODRE",["ROTTEN"])]
\end{code}
Normaliza????o de um dicion??rio (remo????o de entradas vazias):
\begin{code}
dic_norm = collect . filter p . discollect where
   p(a,b)= a > "" && b > ""
\end{code}
Teste de redund??ncia de um significado |s| para uma palavra |p|:
\begin{code}
dic_red p s d = (p,s) `elem` discollect d
\end{code}

\subsection*{Problema 2}

??rvores usadas no texto:
\begin{code}
emp x = Node(x,(Empty,Empty))

t7 = emp 7
t16 = emp 16
t7_10_16 = Node(10,(t7,t16))
t1_2_nil = Node(2,(emp 1, Empty)) 
t' = Node(5,(t1_2_nil, t7_10_16))

t0_2_1 = Node(2, (emp 0, emp 3))
t5_6_8 = Node(6, (emp 5, emp 8))
t2 = Node(4, (t0_2_1, t5_6_8))

dotBt :: (Show a) => BTree a -> IO ExitCode
dotBt = dotpict . bmap Just Just . cBTree2Exp . (fmap show)
\end{code}

\subsection*{Problema 3}
Fun????es usadas para efeitos de teste:
\begin{code}
tipsBdt :: Bdt a -> [a]
tipsBdt = cataBdt (either singl ((uncurry (++)) . p2))
tipsLTree = tips
\end{code}

\subsection*{Problema 5}
Fun????o de permuta????o aleat??ria de uma lista:
\begin{code}
permuta [] = return []
permuta x = do { (h,t) <- getR x; t' <- permuta t; return (h:t') } where
      getR x = do { i <- getStdRandom (randomR (0,length x-1)); return (x!!i,retira i x) }
      retira i x = take i x ++ drop (i+1) x
\end{code}

\subsection*{QuickCheck}
C??digo para gera????o de testes:
\begin{code}
instance Arbitrary a => Arbitrary (BTree a) where
    arbitrary = sized genbt  where
              genbt 0 = return (inBTree $ i1 ())
              genbt n = oneof [(liftM2 $ curry (inBTree . i2))
                QuickCheck.arbitrary (liftM2 (,) (genbt (n-1)) (genbt (n-1))),
                (liftM2 $ curry (inBTree . i2))
                QuickCheck.arbitrary (liftM2 (,) (genbt (n-1)) (genbt 0)),
                (liftM2 $ curry (inBTree . i2))
                QuickCheck.arbitrary (liftM2 (,) (genbt 0) (genbt (n-1)))]               

instance (Arbitrary v, Arbitrary o) => Arbitrary (Exp v o) where
    arbitrary = (genExp 10)  where
              genExp 0 = liftM (inExp . i1) QuickCheck.arbitrary
              genExp n = oneof [liftM (inExp . i2 . (\a -> (a,[]))) QuickCheck.arbitrary,
                         liftM (inExp . i1) QuickCheck.arbitrary,
                         liftM (inExp . i2 . (\(a,(b,c)) -> (a,[b,c])))
                         $ (liftM2 (,) QuickCheck.arbitrary (liftM2 (,)
                                                             (genExp (n-1)) (genExp (n-1)))),
                         liftM (inExp . i2 . (\(a,(b,c,d)) -> (a,[b,c,d])))
                         $ (liftM2 (,) QuickCheck.arbitrary (liftM3 (,,)
                                                             (genExp (n-1)) (genExp (n-1)) (genExp (n-1))))        
                      ]

orderedBTree :: Gen (BTree Int)
orderedBTree = liftM (foldr insOrd Empty) (QuickCheck.arbitrary :: Gen [Int])

instance (Arbitrary a) => Arbitrary (Bdt a) where
    arbitrary = sized genbt  where
              genbt 0 = liftM Dec QuickCheck.arbitrary
              genbt n = oneof [(liftM2 $ curry Query)
                QuickCheck.arbitrary (liftM2 (,) (genbt (n-1)) (genbt (n-1))),
                (liftM2 $ curry (Query))
                QuickCheck.arbitrary (liftM2 (,) (genbt (n-1)) (genbt 0)),
                (liftM2 $ curry (Query))
                QuickCheck.arbitrary (liftM2 (,) (genbt 0) (genbt (n-1)))]      


\end{code}

\subsection*{Outras fun????es auxiliares}
%----------------- Outras defini????es auxiliares -------------------------------------------%
L??gicas:
\begin{code}
infixr 0 .==>.
(.==>.) :: (Testable prop) => (a -> Bool) -> (a -> prop) -> a -> Property
p .==>. f = \a -> p a ==> f a

infixr 0 .<==>.
(.<==>.) :: (a -> Bool) -> (a -> Bool) -> a -> Property
p .<==>. f = \a -> (p a ==> property (f a)) .&&. (f a ==> property (p a))

infixr 4 .==.
(.==.) :: Eq b => (a -> b) -> (a -> b) -> (a -> Bool)
f .==. g = \a -> f a == g a

infixr 4 .<=.
(.<=.) :: Ord b => (a -> b) -> (a -> b) -> (a -> Bool)
f .<=. g = \a -> f a <= g a

infixr 4 .&&&.
(.&&&.) :: (a -> Bool) -> (a -> Bool) -> (a -> Bool)
f .&&&. g = \a -> ((f a) && (g a))
\end{code}
Compila????o e execu????o dentro do interpretador:\footnote{Pode ser ??til em testes
envolvendo \gloss{Gloss}. Nesse caso, o teste em causa deve fazer parte de uma fun????o
|main|.}
\begin{code}

run = do { system "ghc cp1920t" ; system "./cp1920t" }
\end{code}

%----------------- Solu????es dos alunos -----------------------------------------%

\section{Solu????es dos alunos}\label{sec:resolucao}
Os alunos devem colocar neste anexo as suas solu????es aos exerc??cios
propostos, de acordo com o "layout" que se fornece. N??o podem ser
alterados os nomes ou tipos das fun????es dadas, mas pode ser adicionado texto e/ou 
outras fun????es auxiliares que sejam necess??rias.

\subsection*{Problema 1}
\begin{code}
discollect :: (Ord b, Ord a) => [(b, [a])] -> [(b, a)]
discollect = cataList(either nil (uncurry (++).(k><id)))
        where k(a,[]) = []
              k(a,h:l) = singl (a,h) ++ k(a,l)

dic_exp :: Dict -> [(String,[String])]
dic_exp = collect . tar

tar = cataExp g where
  g = either g1 g2
  g1 v = singl ("",v)
  g2 (o,[]) = []
  g2 (o,h:t) = aux(o,h) ++ g2(o,t)
  aux(o,[]) = []
  aux(o,(a,b):t) = singl((o++a),b) ++ aux(o,t)


dic_rd p t = look p (dic_exp t)

dic_in p s d = dic_imp(collect(insert(p,s) (discollect(dic_exp d))))

\end{code}

\subsection*{Problema 2}

\begin{code}
maisDir = cataBTree g
  where g = either g1 g2
        g1() = Nothing
        g2(a,(e,Nothing)) = Just a
        g2(a,(e,d)) = d



maisEsq = cataBTree g
  where g = either g1 g2
        g1() = Nothing
        g2(a,(Nothing,d)) = Just a
        g2(a,(e,d)) = e

insOrd' x = cataBTree g 
  where g = split h k
        h (Left ()) = Node(x,(Empty,Empty))
        h (Right (a,((ne,Empty),(nd,Empty)))) | x<a = Node(a,(Node(x,(Empty,Empty)),Empty))
                                              | x>a = Node(a,(Empty,Node(x,(Empty,Empty))))
                                              | otherwise = Node(a,(Empty,Empty))
        h (Right (a,((ne,e),(nd,d)))) | x>a = Node(a,(e,nd))
                                      | x<a = Node(a,(ne,d))
                                      | otherwise = Node(a,(e,d))
        k (Left ()) = Empty
        k (Right (a,((ne,e),(nd,d)))) = Node(a,(e,d))                              

insOrd a x = p1(insOrd' a x)

isOrd' = cataBTree g
  where g = split h k
        h (Left ()) = True
        h (Right (a,((be,e),(bd,d)))) = be && bd && auxE a e && auxD a d
        k (Left ()) = Empty
        k (Right (a,((be,e),(bd,d)))) = Node (a,(e,d))
        auxE a Empty = True
        auxE a (Node (b, t)) = a>b
        auxD a Empty = True
        auxD a (Node (b, t)) = a<b
  
isOrd = p1.isOrd'


rrot Empty = Empty
rrot (Node(a,(Empty,d))) = Node(a,(Empty,d))
rrot (Node(a,(Node (e,(ee,ed)),d))) = Node(e,(ee,Node (a,(ed,d))))

lrot Empty = Empty
lrot (Node(a,(e,Empty))) = Node(a,(e,Empty))
lrot (Node(a,(e,Node (d,(de,dd))))) = Node(d,(Node (a,(e,de)),dd))

splay l t =  cataList g l t
  where g = either g1 g2
        g1 () t = t
        g2 (h,t1) Empty = Empty
        g2 (h,t1) (Node(a,(e,d))) = if (h==False) then t1 d else t1 e
  
\end{code}

\subsection*{Problema 3}

\begin{code}
extLTree :: Bdt a -> LTree a
extLTree = cataBdt g where
  g = either Leaf g2
  g2 (s,(e,d)) = Fork(e,d)

inBdt = either Dec Query

outBdt (Dec a)             = Left a
outBdt (Query (a,(t1,t2))) = Right(a,(t1,t2))

baseBdt f g = id -|- (f >< (g >< g))
recBdt g = baseBdt id g

cataBdt g = g . (recBdt (cataBdt g)) . outBdt

anaBdt g = inBdt . (recBdt (anaBdt g) ) . g 


navLTree :: LTree a -> ([Bool] -> LTree a)
navLTree = cataLTree g 
  where g = either g1 g2
        g1 a _ = Leaf a
        g2 (e,d) [] = Fork(e [], d [])
        g2 (e,d) (h:t) = if (h==False) then (d t) else (e t)

          
\end{code}

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Bdt a|
&
    |1 + ((Bdt a) >< (Bdt a))|
           \ar[l]_-{|inBdt|}
\\
     |B|
           \ar[r]^-{|g|}
           \ar[u]_-{|anaBdt g|}
&
     |1 + B|
           \ar[u]_-{|id + ((anaBdt g) >< (anaBdt g))|}
}
\end{eqnarray*}

\subsection*{Problema 4}

\begin{code}
bnavLTree = cataLTree g
  where g = either g1 g2
        g1 a _ = Leaf a
        g2 (e,d) Empty = Fork(e Empty, d Empty)
        g2 (e,d) (Node(a,(e1,d1))) = if (a==False) then (d d1) else (e e1)


pbnavLTree = cataLTree g
  where g = either g1 g2
        g1 a p = D [(Leaf a,1)]
        g2 (e,d) Empty = Probability.cond (D []) (e Empty) (d Empty)
        g2 (e,d) (Node(dist,(e1,d1))) = Probability.cond (dist) (e e1) (d d1)
         

\end{code}

De acordo com a nossa resolu????o do exercicio, obtivemos o seguinte resultado:\par\par


pbnavLTree (extLTree anita) 
(Node(D[(True,0.14),(False,0.86)],(Node(D[(True,0.8),(False,0.2)],(Empty,
Node(D[(True,0.6),(False,0.4)],(Empty,Empty)))),Empty))) \par\par

Leaf "n??o precisa"  87.1\%

Leaf "precisa"  12.9\%

Logo a Anita n??o deve levar guarda-chuva           

\subsection*{Problema 5}

\begin{code}

truchet1 = Pictures [ put (0,80) (Arc (-90) 0 40), put (80,0) (Arc 90 180 40) ]

truchet2 = Pictures [ put (0,0) (Arc 0 90 40), put (80,80) (Arc 180 (-90) 40) ]

--- janela para visualizar:

janela = InWindow
             "Truchet"        -- window title
             (800, 800)       -- window size
             (100,100)        -- window position

----- defs auxiliares -------------

put  = uncurry Translate 

-------------------------------------------------
\end{code}

%----------------- Fim do anexo com solu????es dos alunos ------------------------%

%----------------- ??ndice remissivo (exige makeindex) -------------------------%

\printindex

%----------------- Bibliografia (exige bibtex) --------------------------------%

\bibliographystyle{plain}
\bibliography{cp1920t}

%----------------- Fim do documento -------------------------------------------%
\end{document}
