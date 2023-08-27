## Vim_Note

### Movement

* h: left, j: down, k: up, l: right

### Enter, Delete, Change Text

* i: enter insert mode
* <Esc>: exit insert mode to command mode
* x: delete a character
* dd: delete a line
* r: replace a character

### Searching for Text

* command_mode

```
# search down
/text

# search up
?text
```

### Vim commands lists

* <Esc> or <ctrl> + <c> --> Enter Command Mode

* : <Return> --> Exit Mode
* ZZ <Enter> --> Write, then quit
* :wq <Enter> --> Write, then quit
* :q <Enter> --> Quit (No Change)
* :q! <Enter> --> Quit without saving
* :set number <enter> -> add line numbers

### Open 2 files at once
```bash
# <file1> <file2>
$ vim -O pthread.c Makefile
```

### select between tabs


### setup .vimrc
* unix: .vimrc
* window: _vimrc

