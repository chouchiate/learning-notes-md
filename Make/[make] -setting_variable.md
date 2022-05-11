## [make] - setting variable

* write line starting with **variable name** follow by
    - =
    - :=
    - ::=
```make
    objects = main.o foo.o bar.o utils.o
```

* set value only **if not already set**, use ?=
```make
    FOO ?= bar
```
        which is identical to
```make
    ifeq ($(origin FOO), undefined)
    FOO = bar
    endif
```



### Manuals
[manual](https://www.gnu.org/software/make/manual/html_node/Setting.html)