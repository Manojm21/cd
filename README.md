sudo apt-get update
sudo apt-get install flex
sudo apt-get install bison

gedit 1b.l
gedit 1b.y

lex 1b.l
yacc -d 1b.y
gcc lex.yy.c y.tab.c or cc lex.yy.c y.tab.c -ll
./a.out
