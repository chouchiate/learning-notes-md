---
Slug:
title
Author:
Author_title:
tags:
---

# [Typescript] - React 學習筆記



### Initialize Typescript Sandbox

```bash
$ mkdir typescript-sandbox && cd typescript-sandbox
$ npm init -y
$ npm intstall -D typescript
```

### Create tsconfig.json

```bash
$ npx tsc --init
```

### Setting tsconfig.json

```json
```





### Force Compile that always re-compile

```bash
$ tsc -b --force
```





```



> 💡 TypeScript 可以選擇要安裝在全域（global）或專案中（local package），這裡因為是安裝在專案資料夾中，所以使用 `tsc` 指令前要加上 `npx` 的指令，若你的 TypeScript 是安裝在全域環境，可以直接執行 `tsc --init`。

這時候在專案資料夾中就會多一支名為 `tsconfig.json` 的檔案：

![Using TypeScript with React](https://i.imgur.com/7RN5R3e.png)

在這支設定檔中會告訴 TypeScript 該如何去編譯這個專案資料夾中的 TS 檔、專案的根目錄為何、編譯後的檔案要放在哪、撰寫風格的檢查等等，設定的項目非常多，有興趣的讀者可以再參考文末的資源連結[1]，檢視各個設定的含義，這裡單純作為練習和展示使用，並不需要額外調整設定。

## 執行 TS 檔的程式內容

### 使用 tsc 編譯 TS 檔案

現在讓我們先來試著使用 TypeScript 提供的 `tsc` 這個工具來編譯 TS 檔。首先在專案資料夾中新增一支 `index.ts`，要留意副檔名是 `ts` 不是 `js` 喔！

接著在裡面輸入：

​```typescript
// index.ts
const greet = 'Hello TypeScript';
console.log(greet);
​```

讀者可能會好奇這不就是 JS 的內容嗎？怎麼會說是 TS 呢？這個部分會在後面再多做說明，但這的確就是 TS。

存檔後，在終端機中輸入：

​```bash
$ npx tsc index.ts
​```

這時候你會看到在專案中多了一支 `index.js` 檔：

![Using TypeScript with React](https://i.imgur.com/FGewbx0.png)

透過 `tsc` 這個指令，將會把 TS 檔編譯成在 Node.js 可以執行的 JS 檔。現在在終端機中就可以如同執行 JS 檔一樣，去執行編譯好的 JS 檔：

​```bash
$ node index.js
​```

![Using TypeScript with React](https://i.imgur.com/5kqaSgg.png)

恭喜你成功執行了第一個 TS 檔的程式內容。

### 使用 ts-node 直接執行 TS 檔

![Using TypeScript with React](https://i.imgur.com/ksAABXU.png?1)

但這時候你可能會覺得非常麻煩，每次要執行 TypeScript 檔案錢，都必須先用 `tsc` 指令將 TS 檔編譯成 JS 檔後，再用 `node` 指令去執行編譯後的 JS 檔，不只感到麻煩，連專案中的檔案都可能變成兩倍（如果是一支 TS 檔，對應產生一支 JS 檔）。

這時候好用的套件 [ts-node](https://www.npmjs.com/package/ts-node) 來了！

在 Node.js 的環境下我們會使用 `node index.js` 來執行某支 JS 檔；有了 ts-node，就可以不用先透過 `tsc` 把 TS 檔編譯成 JS 檔後才能執行，而是可以直接使用 `ts-node index.ts` 來執行該 TS 檔。

先讓我們在專案中安裝 ts-node，接著使用 ts-node 直接執行 `index.ts`：

​```bash
$ npm install -D ts-node    # 安裝 ts-node 到專案資料夾中
$ npx ts-node index.ts      # 使用 ts-node 直接執行某支 TS 檔
​```

> 💡 不論是 typescript 或 ts-node 都可以選擇安裝在全域（global）或專案內（local package），如果是安裝在全域的話，則不需要在最前面加上 `npx`，可以直接執行 `ts-node index.ts`。

現在不需要先將 TS 檔編譯成 JS 檔，便可以直接執行這支 TS 檔，是不是簡潔了許多：

![Using TypeScript with React](https://i.imgur.com/jvzARrw.png?1)

現在你已經知道怎麼執行 TS 的檔案了，接下來讓我們看一下在 React 中常會被使用到的 TypeScript 語法。

## React 中常用到的 TypeScript 的基本語法

在還沒撰寫 TypeScript 以前，因為知道它是強型別的語言，所以誤以為需要主動去對所有變數定義型別，但這句話其實只對一半。在 TypeScript 中，開發者可以「主動」對變數定義型別，但若不去主動定義型別的話，TS 則會幫你「自動」推論這個變數的型別，也就是說，**不論有沒有主動定義變數型別，每個變數都將有其明確的型別，當程式執行中，型別有錯誤時就會提出警告**。

接著讓我們來看幾個實際的使用範例。

### TypeScript 中的型別檢驗

在 TS 中多會在冒號（`:`）後定義該變數的型別，例如：

​```typescript
/* 宣告型別為字串或數值 */
let occupation: string; // 宣告 occupation 的型別為 string
​```

以 `occupation` 這個變數來說，我們主動定義這個變數的型別是字串（string），因此未來只要這個變數帶入的值有不是字串的情況，在 TS 編譯時或 VSCode 的編輯器中都會跳出警告。

我們可以在剛剛的 `index.ts` 中輸入以下內容：

​```typescript
// index.ts
let occupation: string; // 宣告 occupation 的型別為 string
occupation = 817; // 想要把 occupation 的值帶入數值
​```

這時候 VSCode 會有紅色毛毛蟲在 `occupation` 下方，把滑鼠移過去時會顯示提示：

![Using TypeScript with React](https://i.imgur.com/EUfwjJL.png)

這裡的意思是我們要把 `817` 當作 `occupation` 這個變數的值，但 `occupation` 已經定義是字串了，因此 817 並不能作為該變數的值。若我們在終端機執行 `npx ts-node index.ts`，終端機一樣會跳出警告，並且無法執行：

![Using TypeScript with React](https://i.imgur.com/rMlLYNs.png)

但若我們是將 occupation 的值設為 `"programmer"`，像是這樣：

​```typescript
let occupation: string;
occupation = 'programmer';
​```

世界就會非常和平，可以正常運行：

![Using TypeScript with React](https://i.imgur.com/vYLgQaF.png)

這裡我們看到如何將變數的型別定義為字串，接著我們來看一下 TypeScript 中基本的型別。

### 主動宣告變數型別

#### 字串與數值

在上面的例子中，我們是先定義某個變數，之後才對其賦值，但也可以直接宣告變數型別並賦值，例如：

​```typescript
/* 宣告型別為字串或數值 */
let occupation: string = 'programmer'; // 宣告 occupation 的型別為 string，並且同時賦值
let height: number = 170; // 宣告 height 的型別為 number，並且同時賦值
​```

#### 物件

針對物件型別的定義方式很類似，從下面的例子可以看到在變數 `person` 後一樣透過 `:` 的方式，讓 TypeScript 知道 person 是一個物件，其中會有兩個屬性，分別是 `name` 和 `age`，而 `name` 屬性的型別是 `string`，`age` 屬性的型別則是 `number`：

​```typescript
/* 宣告型別為物件 */
const person: { name: string; age: number } = {
  name: 'pjchender',
  age: 32,
};
​```

物件還有一個比較特別的地方，就是有時物件中的屬性並非一定會存在，例如 person 這個物件，`name` 和 `age` 可能是必填，但職業（occupation）可以是選填，也就是可有可無，這時候可以在屬性名稱後方使用 `?` 來表示，像是這樣：

​```typescript
/* 在 occupation 後有一個 ?，表示該屬性不一定要存在於該物件中 */
const person: {
  name: string;
  age: number;
  occupation?: string;   // 在 : 前面加上 ? 表示該屬性不是必填
} = {
  name: 'pjchender',
  age: 32,
};
​```

這時候雖然後來賦值時的物件中沒有 `occupation` 這個屬性，TypeScript 也不會報錯。

#### 陣列

陣列的部分比較特別一些，一般在定義陣列的型別時，除非有額外使用後面會提到的聯集（`|`），否則都是定義陣列中所有元素的型別會是相同的。舉例來說，這裡將 `devices` 這個變數的型別定義為 `string[]`，意思就是該陣列中所有的元素都是字串：

​```typescript
/* 宣告型別為字串陣列*/
const devices: string[] = ['iphone', 'pixel', 'ipad', 'note 10'];
​```

如果你希望該陣列中所有元素都是數值，自然就是使用 `number[]`，例如：

​```typescript
/* 宣告型別為數值陣列*/
const luckyNumber: number[] = [4, 7, 11];
​```

你也可能看到有人會寫這樣 `Array<number>` ，這是使用了後面會講到的泛型（generic）的用法，但意思和上面那行是一樣的：

​```typescript
/* 宣告型別為數值陣列*/
const luckyNumber: Array<number> = [4, 7, 11];
​```

如果陣列中的元素可能包含兩種以上的型別，可以使用聯集（`|`）的寫法，這裡的聯集簡單來說就像「或」的概念：

​```typescript
/* 宣告陣列中的元素可以是字串或數值 */
const luckyItem: (string | number)[] = [4, 7, 11, 'phone', 'pad'];

// 另一種寫法
const luckyItem: Array<string | number> = [4, 7, 11, 'phone', 'pad'];
​```

#### 函式

看完了基本的字串、數值、陣列、物件之後，來看一下函式宣告的方式：

​```typescript
/* 宣告型別為函式 */
const add = (x: number, y: number): number => {
  return x + y;
};
console.log(add(3, 5)); // 8
​```

這裡可以看到，宣告了一個變數為 `add` 它的值是函式，這個函式中可以接兩個參數（`x`, `y`）這兩個參數的型別都是「數值」，在 `:` 後面則會定義個這函式會「回傳」的型別，這裡一樣定義為數值。

可以用 `ts-node` 來執行看看這段程式，但若你帶入的參數不是數值的話，VSCode 一樣會跳出紅色毛毛蟲，滑鼠移到毛毛蟲上將會顯示對應的提示：

![Using TypeScript with React](https://i.imgur.com/BlymJLs.png)

另外，在函式中很常會使用物件的解構賦值（object destructuring assignment）的方式來取出參數的內容，型別定義的寫法上會像這樣：

​```typescript
/* 宣告型別為函式，參數的地方使用物件的解構賦值 */
const add = ({ x, y }: { x: number; y: number }): number => {
  return x + y;
};

add({ x: 3, y: 5 });
​```

有些時候某個函式只是單純執行某些方法，但並不會有實際會回傳值時，我們會在 `:` 後用 `void` 這個型別，表示該函式將不會有回傳值，例如下面這個函式會直接在執行時呼叫 `console.log` 方法，而不會有實際的回傳值，這時候在 `:` 後方就會使用 `void`：

​```typescript
/* 函式不會有回傳值時使用 void */
const add = (x: number, y: number): void => {
  console.log(x + y);
};
​```

另外，假設有些方法一定會拋出錯誤（throw error）時，表示函式執行到這裡後就會被中斷而不會繼續運行，這時候會在 `:` 使用 `never` 這個型別，意思就是這個函式不會執行完成：

​```typescript
/* 該函式不會執行完成的話，使用 never */
const add = (x: number, y: number): never => {
  throw new Error('This is never');
};

add(3, 5);
​```

#### undefined, null

在 JavaScript 中的 `undefined` 或 `null` 也可以被當作型別定義：

​```typescript
/* 宣告型別為 undefined 或 null */
let foo: undefined;
let bar: null;
​```

#### literal type

除了上述這些比較有「型別味道」的型別之外，實際上型別也可以是定死某個值，例如這裡我們定義 `occupation` 這個變數的型別就是 `"Programmer"`，如此 occupation 這個變數的值就只能是 `"Programmer"`，不能是其他的值：

​```typescript
let occupation: 'Programmer';
occupation = 'Programmer';
​```

是不是很有 JS 中常數的味道？

這種型別在 TS 中稱作 literal type[3]，它可以是字串或數值，並且經常會搭配聯集（`|`）來使用：

​```typescript
let brand: 'iphone' | 'samsung' | 'sony';
​```

這時候 `brand` 這個變數的值就只能是這三個字串中的其中一種，否則都會報錯。當你使用 VSCode 時，透過其內建的 typescript intellisense，還會自動建議你可以使用的值有哪些：

![Using TypeScript with React](https://i.imgur.com/gz0rnkq.png)

最後，TypeScript 中的型別不只這些，但上面提到的這些是筆者開發 React 時比較常用到的，若想了解更多關於 TypeScript 的基本型別，可以參考 TypeScript 官網在 Basic Types 的介紹[2]。

## TypeScript 會自己推論型別，不用所有變數都主動定義型別

在段落的最開始曾經提到，在 TypeScript 中每個變數都有其對應的型別，但開發者並不需要為每一個變數去定義型別，這是因為**在開發者沒有主動定義變數型別的情況下，TypeScript 會自動去對變數進行型別推論，並以此作為該變數的型別**。簡單來說，就是你不明確定義的話，那 TS 就會幫你定義，所以每一個變數仍然有其明確的型別存在。

還記得在最一開始的範例中，我們直接寫了如同 JS 的程式碼而沒有宣告任何型別，程式一樣可以正常運作，這是因為 TS 會自動幫變數推論型別：

​```typescript
// index.ts
const greet = 'Hello TypeScript';
console.log(greet);
​```

要檢視 TypeScript 對該變數推論的型別，只需要在 VSCode 中把滑鼠移到變數上方：

![Using TypeScript with React](https://i.imgur.com/6MBmyMj.png)

這裡可以看到 TypeScript 自動推論 greet 的型別是 `"Hello TypeScript"`，也就是說當你使用 `const` 宣告一個變數時，TypeScript 就會推論它為一個 literal type，因此這個變數的值也將只能是 `"Hello TypeScript"` 這個字串。

如果我們把它改成用 `let` 來宣告，再把滑鼠移到變數上方看看會顯示的提示：

![Using TypeScript with React](https://i.imgur.com/OmuMcqh.png)

這時候你會看到 TS 很聰明的將 `greet` 這個變數型別推論為 string，而不再是 literal type，因為 `let` 的意思，就是後續還可以把這個變數的值去做修改，但因為一開始賦值的內容是字串，因此 TS 會推論這個變數的型別是字串，後續這個變數的值即使改變了，仍然只能是字串。

> 💡 在 VSCode 中，檢視 TypeScript 中變數型別的方式非常簡單，只需要把滑鼠移動到變數上方即可。除了可以透過這種方式檢視 TS 自動推論的型別之外，若有使用第三方套件，滑鼠移上去後常可以看到套件的選項（options）中接收哪些額外參數。總之，多利用 VSCode 中的提示功能，在寫 TypeScript 時會方便許多。

## 抽象化：使用型別化名（type alias）

上面我們提到了在 TypeScript 中一些基本的型別定義，一開始可能會針對每個變數去進行各自的定義，但當我們的應用程式越來越複雜時，就需要做到抽象化的動作，具體來說就是把一些可以重複使用的部分抽出來。

舉例來說，假設在專案中會定義許多的書籍，每個書籍都是一個物件，在物件中有對應的書名（name）和價格（price），一開始可能會這樣寫：

​```typescript
const book1: {
  name: string;
  price: number;
} = {
  name: 'Learn TypeScript',
  price: 300,
};
​```

當有第二本書時，因為書中的屬性和值是一樣的，所以同樣的型別需要再定義一次：

​```typescript
const book2: {
  name: string;
  price: number;
} = {
  name: 'Learn React from Hooks',
  price: 320,
};
​```

特別留意下面程式碼中套色的部分：

![Using TypeScript with React](https://i.imgur.com/UQ9EmVX.png)

你會發現這兩個變數使用的型別基本上是一樣的，這時候我們就可以把這個型別做一個抽象化的動作，有點像是把這個型別也變成一個變數。

在 TypeScript 中可以使用 **Type Alias（型別化名）**的方式來將定義好的型別命名，只需要使用 `type` 這個關鍵字即可，像是這樣：

​```typescript
type Book = {
  name: string;
  price: number;
};
​```

這樣就定義好了一個名為 `Book` 的型別，使用方式只需要把這個型別的名稱放入 `:` 後即可：

​```typescript
// 在 : 後放入的是命名過的型別
const book1: Book = {
  name: 'Learn TypeScript',
  price: 300,
};
​```

是不是簡潔很多呢！？

> 💡 關於型別化名（Type Alias）的更多說明可以參考文末的資源連結[3]。

## 使用聯集（union）和交集（intersection）

在 TypeScript 中的 Type 還可以使用聯集（`|`）或交集（`&`）來做一些變化。這裡的聯集比較像是「或」的概念，而交集比較像是「且」的概念。

### 聯集（union）

先來說明前面段落中曾經使用過的聯集（`|`）。舉例來說，假設現在商店中有兩類的商品，一類是 Book，一類是 Device：

​```typescript
type Book = {
  author: string;
  publishedAt: string;
};

type Device = {
  brand: string;
  releasedAt: string;
};
​```

但只符合其中一類的話，就能算是 Product，這時候可以使用聯集：

​```typescript
type Product = Book | Device;
​```

這裡定義了一個新的 Type Alias，它型別可以是 Book 「或」 Device。只要 Product 物件中的屬性和值符合 `Book` 或 `Device`  其中之一，TypeScript 就不會報錯：

​```typescript
// book 這個變數符合 Product Type，因為只要符合 Book Type 或 Device Type 其中之一即可符合 Product Type
const book: Product = {
  author: 'pjchender',
  publishedAt: '20200831',
};
​```

### 交集（intersection）

前面提到聯集的概念類似「或」，而交集的概念就類似「且」，交集的語法是 `&`。舉例來說，一支手機一定會包含硬體（hardware）和軟體（software），可以這樣定義：

​```typescript
type Software = {
  platform: string;
  releasedAt: string;
};

type Hardware = {
  RAM: string;
  CPU: string;
};
​```

一隻手機因為需要包含這兩個部分，所以可以用交集來建立 `MobilePhone` 這個 Type：

​```typescript
type MobilePhone = Software & Hardware;
​```

這時候，如果某個物件要符合 MobilePhone 這個型別，一定要同時符合 Software 的型別和 Hardware 的型別，也就是這兩個型別中的所有物件屬性和值所對應的型別都要正確包含在內：

​```typescript
const iphone11: MobilePhone = {
  platform: 'ios',
  releasedAt: '20190919',
  RAM: '4GB',
  CPU: 'A13',
};
​```

要符合 `MobilePhone` 這個型別的話，Software 和 Hardware 中的任何一個屬性都不能少。

> 💡 關於聯集和交集的進一步使用可以參考文末資源連結[4]。

## 抽象化：使用介面（interface）

在 TypeScript 中，除了使用 Type Alias 來達到抽象化的概念外，另一個很常用的則是介面（interface），其中 interface 的使用和定義的方式與 Type 非常類似。假設我們要定義硬體的 Interface 可以這樣寫：

​```typescript
interface Hardware {
  RAM: string;
  CPU: string;
}
​```

一樣可以對變數直接套用 interface，像是：

​```typescript
const hardware: Hardware = {
  RAM: '4GB',
  CPU: 'A13',
};
​```

在 Interface 中也有類似交集的概念，但在 Interface 中是使用 `extends` 這個關鍵字，也就是延伸的意思。如同上一個段落中交集的例子，可以先定義 Hardware 和 Software 這兩個 Interface：

​```typescript
interface Software {
  platform: string;
  releasedAt: string;
}
​```

而一個完整的 MobilePhone 需要延伸自 Hardware 和 Software 這兩個介面後，再添加 `price` 和 `brand` 的屬性，我們可以使用 `extends` 這個關鍵字這樣寫：

​```typescript
interface MobilePhone extends Software, Hardware {
  price: number;
  brand: string;
}
​```

在定義型別為 MobilePhone 的變數時會像這樣，同樣一個屬性都不能少：

​```typescript
const iphone11: MobilePhone = {
  price: 24900,
  brand: 'apple',
  platform: 'ios',
  releasedAt: '20190919',
  RAM: '4GB',
  CPU: 'A13',
};
​```

> 💡 關於 Interface 的更多說明，可以參考文末資源連結[5]。

Type Alias 和 Interface 基本上是不同的概念，雖然有時可以達到類似的效果。一般來說，若是要在 React 中定義 props 或 state 的型別時，慣例上會使用 Type Alias；當若某個元件是要開發給其他人使用到的套件，則這個元件中的 API 會建議使用 Interface，讓使用此套件的開發者更方便奠基在你提供的方法上再添加其他屬性。

關於 Types 或 Interface 的比較說明，可以進一步參考文末的資源連結[6]。

# 在 React 中使用 TypeScript

前面花了非常多篇幅在說明 TypeScript 的基本使用，現在讓我們實際進到 React 的部分。

## 建立使用 TypeScript 的 React 專案

透過 React 提供的 create-react-app 即可以快速的建立可以使用 TypeScript 的 React 專案，只需要在一般建立 React 專案的指令最後加上 `--template typescript` 即可。

例如，這裡我們可以透過 `create-react-app` 這個指令建立一個名為 typescript-react-sandbox 的專案：

​```bash
$ npx create-react-app typescript-react-sandbox --template typescript
$ cd typescript-react-sandbox
​```

很快就建立好了一個可以使用 TypeScript 的 React 專案。如果你本來就熟悉 React，你會發現除了專案資料夾中多了 `tsconfig.json` 檔案，以及原本的 `.js` 檔變成 `.tsx` 檔之外，這裡面的資料夾結構和原本的 React 專案沒有太大差別，一樣可以直接透過 `npm start` 把專案啟動起來：

![Using TypeScript with React](https://i.imgur.com/p6N65mL.png)

你甚至會發現在 `App.tsx` 中的檔案內容機乎沒有改變，沒錯！通常只要在我們實際處理資料時這些 TypeScript 的東西才會一併近來。

> 💡 在 TS 中有使用到 JSX 的檔案，副檔名會取名為 `.tsx`。

## 建立 React 元件

現在讓我們把 `App.tsx` 中的部分內容拆成 React 元件會比較有感覺，這裡為了示範，可以把連結的部分拆成一個 React 元件，也就是下圖中程式碼套色的地方：

![Using TypeScript with React](https://i.imgur.com/6BcKiMw.png)先在專案中新增一支名為 Link 的 React 元件，檔名為 `Link.tsx`，一開始就像原本使用 JS 撰寫 React 元件一樣即可：

​```tsx
// ./src/Link.tsx
import React from 'react';

const Link = () => {
  return (
    <a
      className="App-link"
      href="https://reactjs.org"
      target="_blank"
      rel="noopener noreferrer"
    >
      Learn React
    </a>
  );
};

export default Link;
​```

並且在 `App.tsx` 中去載入這個元件：

![Using TypeScript with React](https://i.imgur.com/dZDz6bl.png)

你會發現到目前為止和原本寫 JS 根本沒有任何不同，一樣可以透過 `npm start` 看看專案能否正常運作。

現在，讓我們試著把連接中的文字部分抽成 props，未來可以接收從 App 元件傳入 props，像是這樣：

![Using TypeScript with React](https://i.imgur.com/MnTQVjz.png)

你會發現紅色毛毛蟲再次出現，同時瀏覽器也出現 TS 編譯錯誤的警告：

![Using TypeScript with React](https://i.imgur.com/BOPgQRl.png?1)

遇到紅色毛毛蟲時就把滑鼠移到上方，VSCode 會自動顯示錯誤訊息：

![Using TypeScript with React](https://i.imgur.com/W0IzejC.png?1)

這裡的意思是說，`props` 在自動推論的時候，被當作是 `any` 這個型別，`any` 是 TypeScript 內建的一個型別，基本上 `any` 表示的就是「什麼都可以」，也就是不論這個變數的值是什麼我都吃，這等於破壞了 TypeScript 原本期待，因此若非開發者「主動」定義該變數的型別為 any ，而是 TypeScript 自動推論為 any 的情況下，都會跳出錯誤警告。

上面提到，會發生錯誤警告是因為開發者沒有「主動」定義該型別，要解決這種問題，其中一種方式便是主動明確告訴 TS 說這個變數的型別是 `any`，像是這樣：

​```typescript
// ❌ 請不要這麼做
const Link = (props: any) => {
  // ...
};
​```

如此世界就會恢復和平。但等等，這樣不就又違反了我們之所以要使用 TypeScript 的目的之一，以後所有變數的型別都指定為 `any` 不就好了。

之所以在 TS 中有 any 這個型別，是因為有些時候真的無法確定會得到什麼樣的結果，例如 `JSON.parse()` 這個方法的回傳值就會定義為 `any`：

![Using TypeScript with React](https://i.imgur.com/8qk2QeX.png)

但在實際的開發過程中，應該要**盡可能避免去使用 `any`**，如果很多變數的型別都定義為 `any` 的話，基本上就回去用 JS 就好了，不必繞這一大圈。

因此正確的做法應該是要去定義 props 會傳進什麼型別的資料進來，就像是在 JS 的 React 專案中，我們會去定義 PropTypes 一樣，而不是直接用 `any` 來敷衍它。

因為 props 中 content 的型別會是字串，因此可以改成這樣：

​```typescript
// ⚠️ 這樣並不是最好的做法
const Link = (props: { content: string }) => {
  const { content } = props;
  return (
    // ...
   )
}
​```

> 💡 使用 TypeScript 後，即不需要如同在 JS 中替每個元件定義 PropTypes。

這麼做在一般的 React 元件中雖然不再會報錯誤，但並不是最好的做法，讓我們繼續看一下。

## 使用 React.FC / React.FunctionComponent 來建立元件並接收 props

在上面了例子中，因為我們只需要使用傳進來的 content 這個 props 所以使用上不會有任何問題，但若現在我們需要從 props 中取出 React 元件預設的 props ，像是 `children`, `displayName`, `defaultProps` 等等屬性時，你將發現上面的做法會發生錯誤：

​```tsx
const Link = (props: { content: string }) => {
  // 當我們想要把 children 也一起來出來時，會發生錯誤提示
  const { content, children } = props;
  return (
     // ...
  );
};
​```

將滑鼠移到帶有紅色毛毛蟲的 `children` 變數上會顯示錯誤提示：

![Using TypeScript with React](https://i.imgur.com/mxoRoCS.png)

意思是 children 並不存在我們定義的 props 型別中。為了讓開發者能夠簡易的使用這些內建屬性，最好的方式是使用 React 提供給我們的型別。以建立 Functional Components 來說，React 就提供了 `React.FunctionComponent<P>` 這個型別讓開發者可以直接使用，並且可以簡寫成 `React.FC<P>`。

讓我們先把 Link 定義的型別改成 `React.FC<>` 後，再來看看 TypeScript 的提示：

​```typescript
const Link: React.FC<> = (props) => {
  const { content, children } = props;
  return (
    // ...
  )
}
​```

將滑鼠移到 `React.FC<>` 的上方，你將看到：

![Using TypeScript with React](https://i.imgur.com/a0IPWBP.png)

從這張圖中我們可以看到，在 `React.FC<>` 或 `React.FunctionComponent<>` 的後方都帶了一個 `<>`，這個用法在 TypeScript 中稱作「泛用型別（generics）」，簡單來說，它就像是可以把型別像是變數一般的傳遞。因為目前在 `<>` 中我們沒有填入任何內容，因此 TS 會顯示「Type argument list cannot be empty」，也就是我們沒有在 `<>` 中帶入型別作為參數。

讓我們很快地看個泛型例子，現在我們定義一個函式為 `greet`，但這裡面你會看到 `<T>`，這就是泛型，也就是我們不把這個函式的型別定死，而是讓使用者可以在使用這個函式的時候自行帶入型別：

​```typescript
// greet 這個函式可以接受 name 這個參數，name 參數的型別必須是 T，此函式最後回傳值的型別也是 T
// T 具體來說會是什麼型別，將根據開發者帶入 <> 中的內容決定
function greet<T>(name: T): T {
  return name;
}
​```

這裡 greet 這個函式可以接受 name 這個參數，name 參數的型別必須是 `T`，此函式最後回傳值的型別也是 `T`，至於 `T` 具體來說會是什麼型別，將根據開發者帶入 `<>` 中的內容決定。

因此在使用時，使用者可以在函式中帶入字串或數值都可以：

​```typescript
const isNumber = greet<number>(30);
const isString = greet<string>('TypeScript');
​```

但不能帶入泛型中的「型別參數」和自己帶入「函式參數」的型別不同，例如，明明在 `<>` 中帶入的型別參數是 `number`，但最後帶入函式參數的值卻是字串，如此 TypeScript 將會報錯：

![Using TypeScript with React](https://i.imgur.com/1WwTBvN.png)

在很簡單的瞭解了泛型的概念後，就會知道在 `React.FC<>` 的 `<>` 中要帶入的其實是 props 的型別，因此可以這樣寫：

​```typescript

const Link: React.FC<{ content: string }> = (props) => {
  const { content, children } = props;
  return (
    // ...
  );
};
​```

當我們使用的 React 內建提供給 Functional Component 使用的型別（`React.FC<>`）之後，就可以使用元件中內建的 `children` 這些屬性，不需要在針對它們去進行型別定義：

![Using TypeScript with React](https://i.imgur.com/YUJdGnX.png)

同樣的，若為來 props 要傳入的內容較多，你也可以透過 Types 進行抽象化的動作。例如，這裡我們透過 `type` 先定義 Link 元件會接收的 props ，接著把它帶入 `React.FC<>` 中使用：

​```typescript
type LinkProps = {
  content: string;
};

const Link: React.FC<LinkProps> = (props) => {
  const { content, children } = props;
  // ...
};
​```

到這裡就成功建立了 React 元件，並可以將 props 從 App 中傳入。由於 `content` 在 Link 元件中定義型別是必填，而非使用 `content?: string` 這種選填的方式，因此當切回 `App.tsx` 中 TypeScript 同時會自動檢查 `<Link />` 元件有沒有缺少應該要帶入的 props。

像這裡當 `<Link />` 還沒有帶入 `content` 時，在 VSCode 上會出現紅色毛毛蟲：

![Using TypeScript with React](https://i.imgur.com/zo9LUkY.png)

表示它覺得 Link 這個元件有缺少應該要帶入的 props。

只需要在 `<Link />` 元件中傳入對應要接受的 props 時，程式就可以正常運作：

​```tsx
// App.tsx
function App() {
  return (
    <div className="App">
      {/* ... */}
      <Link content="Learn More" />
    </div>
  );
}
​```

這裡我們使用 TypeScript 建立了第一個 React 元件，重點包含：

1. 使用 `React.FC<>` 或 `React.FunctionComponent<>` 作為 function component 的型別
2. 在 `React.FC<>` 的 `<>` 中帶入會 props 的型別作為型別參數

## 在 TypeScript 中使用 useState

上面我們說明了如何在 TypeScript 檔案中建立 React 元件。現在我們來看看如何在 TypeScript 的檔案中使用 `useState` 這個 React Hooks。使用的作法其實和上一個段落非常類似。

我們先在 `App.tsx` 中使用 `useState` 把剛剛在 `<Link />` 元件中帶入的 content 當成一個 state。

改變的部分如下：

![Using TypeScript with React](https://i.imgur.com/9M6FXgw.png)

你會發現沒有跳出任何的錯誤提示或警告，先在讓我們把滑鼠移到 `content` 上方：

![Using TypeScript with React](https://i.imgur.com/UzkLYOZ.png)

這裡可以看到，因為在 `useState` 中有帶入預設值 `'Learn More'` 的關係，因此 TypeScript 自動將 `content` 的型別推論為 `string`，同時在 Link 這個元件中，在上一個段落中也有定義只能傳入 `content: string` 的變數，因此這裡不會報出任何錯誤。

但若現在把 `useState()` 中對該 state 的預設值拿掉，像這樣：

​```typescript
const [content, setContent] = useState();
​```

你會發現熟悉的紅色毛毛蟲又出現了：

![Using TypeScript with React](https://i.imgur.com/NcZHE9k.png)

先來仔細看一下這個錯誤訊息。內容是說，`undefined` 並不能指派到 `string` 型別中。我們已經知道 `content` 這個 props 只能接收型別為 string 的變數，那 `undefined` 是從哪來的呢？

原來，當我們在 `useState` 的參數中沒有帶入預設值的情況下，TypeScript 會自動將 `content` 的型別推論為 `undefined`：

![Using TypeScript with React](https://i.imgur.com/nS5yLiO.png)

這時候 TypeScript 認為在 App 元件中的 content 型別為 `undefined`，但在 Link 元件中想要接收的 content 型別為 `string`，這時候就發生了衝突，因此 TS 報出錯誤訊息。

一般的情況下，我們可以在 `useState` 的預設值中帶入空字串，讓 TS 自動推論該 state 的型別為空字串即可。但若 state 中的值較複雜時（例如，物件），最好的方式就是主動告訴 TS 在 `useState` 時這個 `content` 的型別為何，而非讓它自動推論。

在 `useState` 時要定義型別的方式也是用泛型的方法，只需要使用 `useState<T>()` 。現在只需要把 state 的型別帶入 `useState` 後面的 `<>` 作為型別參數傳進去即可，像是這樣：

​```typescript
// useState 的預設值留空
const [content, setContent] = useState<string>();
​```

當我們只是這樣寫時，TypeScript 依然會報錯，因為這樣寫的話預設值是 `undefined`，而我們又定義 `content` 為 string，因此最終 content 被 TS 認為可能是 `string | undefined`：

![Using TypeScript with React](https://i.imgur.com/hpmS9nl.png)

既然 content 有可能是 undefined，自然它還是無法傳入 Link 元件中（除非在 Link 元件定義的 props 型別中，改成讓它可以接收 `undefined`）。因此在 useState 的預設值中可以加入空字串，讓 content 只能是 string 這個型別：

​```typescript
// 在 useState 的預設值中加入空字串
const [content, setContent] = useState<string>('');
​```

如此程式就能夠繼續正常運作。

這裡你可能會覺得會什麼要多此一舉，既然 TypeScript 能夠自動推論出正確的型別，為什麼還要透過泛型的方式定義型別呢？這是因為實際的 state 可能會比較複雜，例如某個 state 可以同時是字串或數值時，就可以這樣寫：

​```typescript
const [state, setState] = useState<string | number>('');
​```

又或者某個 state 是物件時，可以這樣用：

​```typescript
type Device = {
  CPU: string;
  RAM: string;
};

const [device, setDevice] = useState<Device>();
​```

## TypeScript 在 React 中的其他使用

這裡，我們已經說明如何在 React 中使用 TypeScript，包括使用 `React.FC<>` 來為 function component 的 props 定義型別，或在 `useState<>` 的 `<>` 中帶入 state 的型別。

但我們知道 React 中還有各式各樣的方法，像是 `useRef`, `useEffect`, `useReducer` 等等。對於這些方法要怎麼使用呢？

好在已經有人整理了相當完整的用法，只要你已經有上述這些基本用法的觀念，都能夠較快理解如何使用這些方法。關於 React 中其他方法的型別要如何定義，可以參考這一篇很好的整理：[React Typescript CheatSheet](https://github.com/typescript-cheatsheets/react-typescript-cheatsheet)。

在這篇文章中主要說明了如何在 React 中快速使用 TypeScript 語法，但若想要對 TypeScript 有更精熟的掌握和理解，TypeScript 的[官方文件](https://www.typescriptlang.org/)仍然是不可或缺的，另外也很推薦 iT 邦幫忙鐵人賽的文章－[讓 TypeScript 成為你全端開發的 ACE！](https://ithelp.ithome.com.tw/users/20120614/ironman/2685?sc=iThelpR)，是很好入門 TypeScript 的文章。

## 參考資料

- [1][intro to the tsconfig reference](https://www.staging-typescript.org/tsconfig) @ TypeScript
- [2][basic types](https://www.typescriptlang.org/docs/handbook/basic-types.html) @ TypeScript Handbook
- [3][literal types](https://www.staging-typescript.org/docs/handbook/literal-types.html) @ TypeScript Handbook
- [4][unions and intersection types](https://www.staging-typescript.org/docs/handbook/unions-and-intersections.html) @ TypeScript Handbook
- [5][interfaces](https://www.typescriptlang.org/docs/handbook/interfaces.html) @ TypeScript Handbook
- [6][types or interfaces?](https://github.com/typescript-cheatsheets/react-typescript-cheatsheet) @ React TypeScript CheatSheet
- [React+TypeScript CheatSheets](https://github.com/typescript-cheatsheets/react-typescript-cheatsheet) @ Github
- [讓 TypeScript 成為你全端開發的 ACE！](https://ithelp.ithome.com.tw/users/20120614/ironman/2685?sc=iThelpR)
```
