## [vscode] - drawio / mermaid

### guide

```bash
git clone --recursive https://github.com/nopeslide/drawio_mermaid_plugin.git
cd drawio_mermaid_plugin/drawio_desktop
npm install
npm run build
cd ../vscode
npm install
npm run vscode:package

```

### git graph
```mermaid
    gitGraph
       commit
       commit
       branch develop
       commit
       commit
       commit
       checkout main
       commit
       commit
```


### class diagram
```mermaid
    classDiagram
    Class01 <|-- AveryLongClass : Cool
    Class03 *-- Class04
    Class05 o-- Class06
    Class07 .. Class08
    Class09 --> C2 : Where am i?
    Class09 --* C3
    Class09 --|> Class07
    Class07 : equals()
    Class07 : Object[] elementData
    Class01 : size()
    Class01 : int chimp
    Class01 : int gorilla
    Class08 <--> C2: Cool label
```
![](https://mermaid-js.github.io/mermaid/img/class.png)

### gantt diagram
```mermaid
    gantt
    dateFormat  YYYY-MM-DD
    title Adding GANTT diagram to mermaid
    excludes weekdays 2014-01-10

    section A section
    Completed task            :done,    des1, 2014-01-06,2014-01-08
    Active task               :active,  des2, 2014-01-09, 3d
    Future task               :         des3, after des2, 5d
    Future task2               :         des4, after des3, 5d
```
![](https://mermaid-js.github.io/mermaid/img/gantt.png)

### sequence diagram
```mermaid
sequenceDiagram
    participant Alice
    participant Bob
    Alice->>John: Hello John, how are you?
    loop Healthcheck
        John->>John: Fight against hypochondria
    end
    Note right of John: Rational thoughts <br/>prevail!
    John-->>Alice: Great!
    John->>Bob: How about you?
    Bob-->>John: Jolly good!

```
![](https://mermaid-js.github.io/mermaid/img/sequence.png)

---
### flowchart
```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```
![](https://mermaid-js.github.io/mermaid/img/flow.png)

---
### external
* [github](https://mermaid-js.github.io/mermaid/#/)
* [intro](https://marketplace.visualstudio.com/items?itemName=nopeslide.vscode-drawio-plugin-mermaid)