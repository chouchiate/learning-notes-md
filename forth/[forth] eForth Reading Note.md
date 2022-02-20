## [Forth] - eForth

* small machine dependent kernel
* Be ported to other CPU's very conveniently.
* The kernel words can be classified as following:
  * System interface: 
    ```asm
      BYE, 
      ?rx, 
      tx!, 
      !io
    ```
  * Inner interpreters: 
    ```asm
      doLIT, 
      doLIST, 
      next, 
      ?branch, 
      branch, 
      EXECUTE, 
      EXIT
    ```

  * Memory access: 
    ```asm
      ! , 
      @, 
      C!, 
      C@
    ```

  * Return stack: 
    ```asm
      RP@, 
      RP!, 
      R>, 
      R@, 
      R>
    ```

  * Data stack: 
    ```asm
      SP@, 
      SP!, 
      DROP, 
      DUP, 
      SWAP, 
      OVER
    ```
  * Logic: 
    ```asm
      0<, 
      AND, 
      OR, 
      XOR
    ```
  * Arithmetic: 
    ```asm
      UM+
    ```

## Kernal Words
* The kernal words move and process data and address among the stacks and the memory. 
* Make a computer to behave like a Forth computer. 
* A complete understanding of these kernel * Only 31 of kernal words.

## Two Stack Architecture (Virtual Forth)
* Forth segregated these two types of information **(return addresses & parameters)** on two
separate stacks and thus greatly simplies the execution and compilation of words.

* Passing parameter on
the data stack also reduces the syntactical complexity of Forth language to the minimum and allows words
to be strung together into lists with minimum overhead in compilation and interpretation.

## Forth Law of Computing
* All computable functions can be constructed by lists of these kernel words and the high level
words built from these kernel words. 
* The eForth model includes:
  * a text interpreter which allows the user to type lists of word names and execute them in sequence. 
  * a compiler which allows the user to name lists of words and compile new words, and utilities like memory dump, stack dump, and a colon word decompiler. 
> Thus the eForth system forms a fairly complete software development environment for the user to develop applications. 


## System Interface
  

## Inner Interpreter