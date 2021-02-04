## 3C3R Hanging Resolution

* 8 second timeout
* after timeout send random dummy command to clear last command

~~~gfm
```flow
st=>start: Start
op=>operation: Your Operation
cond=>condition: Yes or No?
e=>end

st->op->cond
cond(yes)->e
cond(no)->op
```
~~~



``` flow
st=>start: Start
op=>operation: Your Operation
op2=>operation: False Operation
cond=>condition: Yes or No?
e=>end

st->op->cond
cond(yes)->e
cond(no)->op2->op

```





