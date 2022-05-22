## [openssl] - study notes

* SSL v2/v3 - secure socket layer
* TLS v1.x - transport layer security ([RFC8446](https://datatracker.ietf.org/doc/html/rfc8446))
* SSLeay - 加密函式庫
    - 直接呼叫
    - 透過 openssl 加密函式庫介面呼叫
    - 透過 engine 安全平台存取 csp (content security policy)
* 支援對稱演算法 :
    * 加密解密使用相同金鑰密碼演算
    * 加密速度快 效率高 計算量小 演算法公開
    * 金鑰過多分發困難
    - AES
        - 128 bit CFB / OFB
    - DES
    - Blowfish
    - CAST
    - IDEA
    - RC2
    - RC5
    - SM1 / SM4 (國密)
* 支援非對稱演算法
    - DH
    - RSA
    - DSA
    - ECC
* 資料摘要演算法
    - MD2
    - MD5
    - MDC2
    - SHA (SHA1)
    - DSS (DSS1)
    - RIPEMD
* 資料摘要統一介面
    - EVPDigest
* 支援區塊編碼器加密模式
    - ECB 電子密碼本模式
    - CBC 加密分組連結模式
    - CFB 加密回饋模式
    - OFB 輸出回饋模式
* ASN.1 證書和金鑰標準 [X.509](https://datatracker.ietf.org/doc/html/rfc5280)
    - CRL 物件的編解碼功能
        - DER
        - PEM
        - BASE64
    - private key PKCS 編解碼
* X.509 標準編解碼
* CA 證書管理中心
* BIO Interface (basic io abstraction) - [BIO](https://www.openssl.org/docs/manmaster/man7/bio.html)
    - source/sink BIO
    - filter BIO
    ```c
    struct bio_st {
        ...
        BIO_METHOD *method
        ...
    };
    // 介面定義 interface
    // 檔案操作函數
    static BIO_METHOD methods_filep = {
        BIO_TYPE_FILE,
        "FILE_pointer",
        file_write,
        file_read,
        file_puts,
        file_gets,
        file_ctrl,
        file_new,
        file_free,
        NULL,
    };
    // 網路操作函數
    static BIO_METHOD methods_sockp = {
        BIO_TYPE_SOCKET,
        "socket",
        sock_write,
        sock_read,
        sock_puts,
        sock_ctrl,
        sock_new,
        sock_free,
        NULL,
    };

    ```
* EVP 非對稱演算法封裝
    - EVP_Sign
    - EVP_Verify

### EVP 介面
1. 公開金鑰演算法
    - EVP_Seal*...*, EVP_Open*...*
    - p_seal.c, p_open.c
2. 數位簽章演算法
    - EVP_Sign*..*, EVP_Verify*..*
    - p_sign.c, p_verify.c
3. 對稱加密演算法
    - EVP_Encrypt*..*
    - evp_enc.c, p_enc.c, p_dec.c, e_*.c
4. 資訊摘要演算法
    - EVP_Digest*..*
    - digest.c, m_*.c
5. 資訊編碼演算法
    - EVP_Encode*..*





### Project structure

| folder | features and functions |
| ----- | ----- |
| crypto |  所有加密演算法原始程式檔案和相關標準 |
| ssl | 各版本 ssl 協定和tsl 1.0 協定程式檔案 包含 openssl 協定函數庫 |
| apps | 所有 openssl 應用程式 (CA, X509) 的原始檔案 |
| docs | 使用說明文件, 應用程式說明 加密演算法函式庫 api, ssl 協定 api |
| demos | 應用範例 |
| include | openssl 函式庫標頭擋 |
| test | 功能測試原始檔案 |


### Hashing algorithms
* MD5
* SHA
* scrypt
* bcrypt

### acronym
* TLS
    - contains certificate (X.509)
* SSL
    - encryption based internet security protocol, older version of tls
* CORS
* ECDSA - Elliptic Curve Digital Signature Algorithm
* RSA - Rivest-Shamir-Adleman
* [ASN.1](https://en.wikipedia.org/wiki/ASN.1#Applications) - Abstract Syntax Notation One
* BER - Basic Encoding Rules
* XER - XML encoding rules
* DER - Distinguished Encoding Rules
* [PKCS](https://en.wikipedia.org/wiki/PKCS)
- public key cryptography standard
* CSP
* [PRG](https://en.wikipedia.org/wiki/Pseudorandom_generator) pseudorandom generator
* HTTPS
    - public key (share between browser and website) and
    - private key (use to decrypt information encrypted by the public key)
    ![](https://res.cloudinary.com/practicaldev/image/fetch/s--STcureFX--/c_limit%2Cf_auto%2Cfl_progressive%2Cq_auto%2Cw_880/https://dev-to-uploads.s3.amazonaws.com/i/v3m6r9s1ardfcq54m5l1.png)



### external
* [github](https://github.com/openssl/openssl.git)
* [asn1](https://luca.ntop.org/Teaching/Appunti/asn1.html)
