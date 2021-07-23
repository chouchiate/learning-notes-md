# [Typescript] - Utility Types 學習筆記

### Extend Express Request Object using Typescript
* Use Declaration Merge **[[dcos]](https://www.typescriptlang.org/docs/handbook/declaration-merging.html)**

* Create custom type folder
  1. <project_root>/types/@types/express/custom.request.d.ts
  2. edit tsconfig.json at <project_root>
  ```json
  {
    "compilerOptions": {
      "module": "commonjs",
      "allowJs": true,
      "declaration": true,
      "typeRoots": [
        ...,
        "src/types/@types/*",
        "node_modules/@types",
      ],
    },
    "files": [
      "src/types/types/express/custom.request.d.ts"
    ],
  }
  ```
  3. add following in custom.express.d.ts
  ```ts
    declare global {
      namespace Express {
        interface Request {
          customContext: custom_context
        }
      }
    }
  ```
  4. Compile and Use it !!
  ```ts
  router.use((req:Request,res,next)=>{
    console.log(req.customContext);
    ...
    next();
  });
  ```
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

