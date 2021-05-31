# [Typescript] - Utility Types 學習筆記



### Utility Types 

API Reference: https://www.typescriptlang.org/docs/handbook/utility-types.html

- Partial<Type>

> 建立一個 type 其所有 properties 同於 <Type> 且全部成為 optional.

```typescript

type SampleInfo = {
  id: string;
  publicKey: string;
  version: number;
}

function updateInfo (info:SampleInfo, fieldToUpdate: Partial<SampleInfo>):SampleInfo{
  const {id, publicKey, version} = info
  const { publicKey:newKey } = fieldToUpdate
  return ({
    id:id,
    publicKey:newKey,
    version:version
  })
}
```



- Required<Type>

> 建立一個 type 其所有 properties 同於 <Type> 且全部變成 required 
>
> 其結果與 Partial 相反

