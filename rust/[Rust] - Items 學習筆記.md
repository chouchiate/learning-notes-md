## Rust Module 學習心得

Rust Module 是 零或多個 items 的集成
而 item 是 crate 中的組成

Item 可為以下其中一種:

    * module - ( mod )
    * external crate - ( extern crate )
    * use declaration - ( use )
    * function - ( fn )
    * type alias -
    * structs definitions - ( struct )
    * enumeration definitions - ( enum )
    * union definitions
    * constant items - ( const )
    * static items - ( static )
    * trait definitions - ( trait )
    * implementation - ( impl )
    * external block - ( extern )

每個 crate 都有一個最外層的 annoymous module; 其他 items 的 paths 都建構於樹狀模組內


Rust Module 用於
    * 
