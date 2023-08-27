## C gcc & Make

### Execute 2 modules with main.c

```
gcc mod1.c mod2.c main.c -o exec.exe
```

### Incremental Build Object

```
gcc -c mod1.c ⇒ mod1.o
gcc -c mod2.c ⇒ mod2.o
gcc -c main.c ⇒ main.o
gcc mod1.o mod2.o main.o -o superchess
```

### Makefile Example

```
SRC = mod1.c mod2.c main.c
OBJ = mod1.o mod2.o main.o
PROG = myProgram$(PROG): $(OBJ) gcc $(OBJ) -o $(PROG)
$(OBJ): $(SRC)

```

### First Time Make 

```
$ make
gcc -c -o mod1.o mod1.c
gcc -c -o mod2.o mod2.c
gcc -c -o main.o main.c
gcc mod1.o mod2.o main.o -o myProgram
```









