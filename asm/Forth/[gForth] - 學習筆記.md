## [gForth] - 學習筆記

### macOS Homebrew
```bash
$ brew install gforth

```
https://formulae.brew.sh/formula/gforth

## Web Manual
** link[manual](https://www.complang.tuwien.ac.at/forth/gforth/Docs-html/)**

## Download
** link[download](http://www.complang.tuwien.ac.at/forth/gforth/)**

## Repository
** link[url](https://savannah.gnu.org/git/?group=gforth)**

#### Word (functions)
* Display all Words
```bash
$ words

disasm disassembler base-addr show-name
...
```

#### First Example
```bash
: hi ." Hello friends" ;
```
* the word : initializes the compilation of a new word
* the word hi is the new word that will be added to the dictionary
* the string ."Hello friends" corresponds to what the created word will do 
* the word ; stop the compilation




#### Floating Point Stack:
* Words:
  * fdup
  * fswap
  * fdrop
  * fover
  * frot
* non-standard Words:
  * fnip
  * ftuck
  * fpick



### How to Start
* How to get started *

The Forth language makes it hard for newbies to get started. 
The reason is, that Forth doesn't provide sourcecode and the available Forth Virtual
machines can't be recommended anymore. But if nothing is there, what
should the newbie learn? What are the do's and dont's? The reason why
Forth is nearly invisible has to do with, that it's a virtual machine. A
VM is a game similar to a cardgame. The rules of the Forth game can be
written down in a single sheet of paper. But for playing the game right,
this description is not sufficient. What the beginner needs are additional
information about Forth. I can't recommend a single book. The inventor
is Chuck Moore and he has written some books about Forth, but they are
not the best starting point. What i recommend is to use a search engine
like google and search in the existing fulltext of all publications.

Here is my recommended Google search string, it contains of some keywords
which reduce the internet to Forth related information. At the end of
the string, the user can put his own topic of interesting for example he
can add “Forth CPU” if he is interested in Forth in Hardware, or he
can add “benchmark” if he is interested in a performance comparison
with a classical programming language.

["Rochester Forth Conference" OR "Journal of Forth Application and
Research" OR "Forth assembly" OR "Forth programming" OR "ACM SIGFORTH"
OR "Forth Dimensions" OR "euroForth" OR "figForth" OR "euroFORML" OR
“FORML Conference” OR “SVFIG” OR site:forth.org OR site:forth.com]
filetype:pdf

Forth itself can't described in a book or in software. But the
literature around Forth can be collected and searched by a fulltext
search engine. That means, the amount of blogs, pdf papers and books
about Forth is forming the corpus. And what is available in the corpus
is similar to Forth. Something in the collection is wrong or outdated,
but this is normal in every community. If we are searching for information
about robotics, we will notice the same problem. What is special in the
Forth corpus is, that the total amount of information is limited. It is
very common, that Google doesn't find a single result for a keyword. That
means, the information is simply not there, it was not written down. Let
us take a detailed look into the keyword list. They are about academic
journals like the “Journal of Forth Applications”, it contains the
famous forth.org website and also the Forth Dimension journal. I would
guess, that most of available Forth literature will be found with that
searchstring. Some Forth related information are only available as printed
books, some are out of print and no longer available. So it's important
to write new Forth tutorials from scratch to add the missing information.