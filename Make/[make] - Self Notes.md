## [make] - Self Notes

### .PHONY

By default, Makefile targets are "file targets" - they are used to build files from other files. Make assumes its target is a file, and this makes writing Makefiles relatively easy:
```bash
foo: bar
  create_one_from_the_other foo bar
```

However, sometimes you want your Makefile to run commands that do not represent physical files in the file system. Good examples for this are the common targets "clean" and "all".

```bash
.PHONY: clean
clean:
  rm -rf *.o
```