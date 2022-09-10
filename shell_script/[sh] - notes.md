## [sh] - notes


### bash script and /bin/bash^M: bad interpreter: No such file or directory
* Unix uses different line endings so can't read the file you created on Windows. Hence it is seeing ^M as an illegal character.
* Rewrite the script in your Unix env using vi and test

* In notepad++ in the bottom right of the screen, it tells you the document format. By default, it will say Dos\Windows. To change it go to

settings->preferences
new document / default directory tab
select the format as unix and close
create a new document