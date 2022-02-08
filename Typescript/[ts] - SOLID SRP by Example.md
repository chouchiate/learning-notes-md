## [Typescript] - SOLID - Single Responsibility Principle by Example

* 單一職責原則(SRP)

> 按照慣例，先上定義：“A class should have only one reason to change.”
翻譯成中文是：「一個模組應有且只有一個理由會使其改變。」

> 「一個模組應只對唯一的一個角色負責。」

```ts
class feeCalculator {
    public function calcTax();
    public function calcCreditCardFee();
}
```
> 賣家後台與電商管理後台，把不同角色所依賴的程式碼放在一起。最簡單的想法就是為 calcCreditCardFee() 分別封裝起來，以應對不同的角色

```ts
class SalesFeeCalculator {      // for 賣家
    public function calcTax();
    public function calcCreditCardFee();
}
class AdminFeeCalculator {      // for 後台
    public function calcTax();
    public function calcCreditCardFee();
}

```

> 這樣我們 10 個角色用到很類似的計算 function，我們就要 10 個 class，然後 class 裡面的 function 都只有點一差異，這樣好像又有點怪怪的？

> 那如果是透過控制項來管理呢？ 這樣的類別雖然可以保持簡潔，我們又要面對在一個類別中會同時面向兩個角色的問題。

```ts
class FeeCalculator {
private role = null;
    
    public __construct(Role role) {
        this.role = role
    }
 
    public function calcTax();
public function calcCreditCardFee() {
        if (this.role == Sales) {
            return ....;
        }else if (this.role == Admin){
            return ....;
        }else{
            return ....;
        }
    }
}
```

> 我們會發現一直會改變的是 calcCreditCardFee() 這個方法。如果我們把 calcCreditCardFee() 抽出來獨立使用呢？

```ts
interface FeeCalculator {
    public function calc();
}
class CreditCardFeeHandler implements FeeCalculator {
    public function calc(percentage) {
        return ....;
    }
}
class TaxFeeHandler implements FeeCalculator {
    public function calc(percentage) {
        return ....;
    }
}

```
> 把 calcCreditCardFee() 變為 CreditCardFeeHandler 類別，再在裡面創建一個 calc() 方法。

> 使用了 interface 並分別實作到 CreditCardFeeHandler 與 TaxFeeHandler 上。這樣我們的計算類別都可以有效解耦，而且在要注入的情況時，又可以獲得多型的好處。