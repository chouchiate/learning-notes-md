### Ubuntu Restart Network

### 通過命令行方式重啟網絡

* 通過快捷鍵 Ctrl+Alt+T Ubuntu 鍵盤快捷鍵 打開命令行終端

  1. network manager 服務

     ```
     $ sudo service network-manager restart
     ```

     網路圖標消失後重新顯示

  2. systemd

     

     ```
     $ sudo systemctl restart NetworkMnager.service
     ```

     請參考 man 幫主文檔了解其他選項

     

  3. nmcli

     Linux 管理網路的另一個工具 

     ```
     // 先關閉網路
     $ sudo nmcli networking off
     // 再開啟網路
     $ sudo nmcli networking on
     ```

  4. ifup & ifdown

     使用 ifdown 關閉所有網口，再使用 ifup 重新啟用網口

     ```
     $ sudo ifdown -a && sudo ifup -a
     ```

     

  5. Nmtui

     ```
     $ nmtui
     ```

     



