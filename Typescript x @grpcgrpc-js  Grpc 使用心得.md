## Typescript + @grpc/grpc-js  Grpc 使用心得

### Grpc 簡介

![alt](https://i2.wp.com/www.dineshonjava.com/wp-content/uploads/2019/05/gRPC.png?fit=674%2C483&ssl=1)



以 __jubox.proto__ 為例 

```sequence
Grpc Nodejs->Grpc Golang: Grpc Message
Note right of Grpc Golang: Server Process
Grpc Golang-->Grpc Nodejs: Grpc Resp
```





```
syntax = "proto3";

package grpc.proto.jubox;
option go_package = "jubo.health/smilinn/server/grpc/proto/jubox";

service Jubox {
    rpc RequestDeviceId (NewDeviceRegister) returns (NewDeviceRegister) {}
    rpc SystemEventUpdate (SystemEvent) returns (UpdateResp) {}
    rpc BedEventUpdate (BedEvent) returns (UpdateResp) {}
    rpc BedReportUpdate (BedReport) returns (UpdateResp) {}
    rpc FallEventUpdate (FallEvent) returns (UpdateResp) {}
}

message NewDeviceRegister {
    uint32 transaction_no = 1;
    string timestamp = 2;
    string device_type = 3;
    string device_description = 4;
    Affiliation affiliation = 5;
    string device_id = 6;
}

message SystemEvent {
    uint32 transaction_no = 1;
    string timestamp = 2;       
    Affiliation affiliation = 3;
    string device_id = 4;      
    EventDetail sys_event_detail = 5;
}

message Affiliation {
    string facility_id = 1;
    string customer_id = 2;
}

message EventDetail {
    string name = 1;
    string message = 2;
}

message BedEvent {
    uint32 transaction_no = 1;
    string device_id = 2;
    string timestamp = 3;
    EventDetail event_detail = 4;
}

message BedReport {
    uint32 transaction_no = 1;
    string device_id = 2;
    string timestamp = 3;
    BedReportDetail bed_report_detail = 4;
}

message BedReportDetail {
    string sleep_start_time = 1;     
    string sleep_end_time = 2;        
    uint32 sleep_latency = 3;      
    float sleep_effectiveness = 4;
    uint32 turn_over_cnt = 5;       
    uint32 not_in_bed_cnt = 6;      
    uint32 not_in_bed_time = 7;        
}

message FallEvent {
    uint32 transaction_no = 1;
    string device_id = 2;
    FallEventDetail fall_event_detail = 3;
}

message FallEventDetail {
    EventDetail event_detail = 2;
}

message UpdateResp {
    uint32 transaction_no = 1;
    string resp_code = 2;
    string resp_message = 3;
}

```

### Rpc Call Type

* Unary

* Client-Side stream

* Server-Side stream

* Bidirectional stream

  

### 改用 @grpc/grpc-js 起源

* 官方 **grpc/grpc-node** 通知 **April, 2021** 將 **Deprecated** 建議改用 **@grpc/grpc-js**
* grpc/grpc-node 無 **TS** 支援  
* 含 **TS: optional** 以及 **Grpc: oneofs** 的型別特別容易出現 **undefined Error**

### 探索

<img src="/Users/derickchou/Programming/markdowns/img/Screen Shot 2021-01-19 at 11.15.57 AM.png" alt="alt" style="zoom:35%;" />

*  試用 **@grpc/grpc-js + Typescript** 中採用 **gRpc** 建議的標準命名方式  **package grpc.proto.jubox** 需要一層層手動撥洋蔥 **tsc** 才不會出現錯誤

  ```
  // package naming convention
  syntax = "proto3";
  package grpc.proto.jubox;
  option go_package = "jubo.health/smilinn/server/grpc/proto/jubox";
  ```

* 試用搭配 devDependencies: **grpc-tools** and **grpc_tools_node_protoc_ts**

  

  ### Package.json

  ```
    "dependencies": {
      "@grpc/grpc-js": "^1.2.2",
      "google-protobuf": "^3.13.0"
    },
    "devDependencies": {
      "@types/google-protobuf": "^3.7.3",
      "grpc_tools_node_protoc_ts": "^5.0.0",
      "grpc-tools": "^1.9.1"
    },
  ```

### Shell **compile-proto.sh** Script

```
OUT_DIR="."
JS_OUT_DIR="./dist/iot/protocol/grpc"
TS_OUT_DIR="./src/iot/protocol/grpc"
IN_DIR="./proto"
PROTOC="$(npm bin)/grpc_tools_node_protoc"
PROTOC_GEN_TS_PATH="$(npm bin)/protoc-gen-ts"
PROTOC_GEN_GRPC_PATH="$(npm bin)/grpc_tools_node_protoc_plugin"

$PROTOC \
    -I="./" \
    --plugin=protoc-gen-ts=$PROTOC_GEN_TS_PATH \
    --plugin=protoc-gen-grpc=${PROTOC_GEN_GRPC_PATH} \
    --js_out=import_style=commonjs:$JS_OUT_DIR \
    --grpc_out=grpc_js:$JS_OUT_DIR \
    --ts_out=grpc_js:$TS_OUT_DIR \
    "$IN_DIR"/*.proto

```

### Shell Output Files

```
./dist/iot/protocol/grpc
										├── jubox_grpc_pb.d.js
										├── jubox_pb.d.ts
./src/iot/protocol/grpc
										├── jubox_grpc_pb.d.ts
										├── jubox_pb.d.ts
```

### 使用注意

* NodeJs Version **v12.19.0 (npm v6.14.8)**
* Grpc naming convention **Snake Case**
* 用 **grpc-tools** and **grpc_tools_node_protoc_ts** transpile 後 **TS** and **JS** 自動修改為 **Camel case**
* Add Type Guard in **1 : N** / **N : 1** cases (Optional)

### Type Guard Example

```
const isEventDetailType = (obj:EventDetailType): obj is EventDetailType => {
    return (obj as EventDetailType).name !== undefined
    && (obj as EventDetailType).message !== undefined
    && typeof (obj as EventDetailType).name === "string"
    && typeof (obj as EventDetailType).message === "string"
}

const isBedEventType = (obj:BedEventType): obj is BedEventType => {
    return (obj as BedEventType).timestamp !== undefined
    && typeof (obj as BedEventType).timestamp === 'string'
    &&  (obj as BedEventType).transactionNo !== undefined
    && typeof (obj as BedEventType).transactionNo === 'number'
    &&  (obj as BedEventType).deviceId !== undefined
    && typeof (obj as BedEventType).deviceId === 'string'
    &&  (obj as BedEventType).eventDetail !== undefined
    && isEventDetailType((obj as BedEventType).eventDetail)
}
```

### Jubox - Grpc Adapter Implementation

```
'use strict'
import { BedEvent } from '../proto/jubox_pb'
import { BedEventType } from 'types/Proto'
import { eventDetailAdaptee, defaultEventDetail } from './eventDetail'

const defaultBedEvent:BedEventType = {
    transactionNo: 1,
    deviceId: '',
    timestamp: '',
    eventDetail: defaultEventDetail
}

const BedEventGrpcAdaptee = (bedEvent:BedEventType):BedEvent => {
    const { transactionNo, deviceId, eventDetail, timestamp } = bedEvent
    
    let bedEventGrpc = new BedEvent()
                        .setDeviceId((deviceId!==undefined)?
                                        deviceId:'')
                        .setTransactionNo((transactionNo!==undefined)?
                                            transactionNo:1)
                        .setTimestamp((timestamp!==undefined)?
                                        timestamp:'')
                        .setEventDetail(
                            eventDetailAdaptee((eventDetail!==undefined)?
                                                        eventDetail:defaultEventDetail)
                        )
    return bedEventGrpc
}

export default {
    BedEventGrpcAdaptee,
    defaultBedEvent
}

export {
    BedEventGrpcAdaptee,
    defaultBedEvent
}
```

### Jubox Grpc Implementation 

```
const updateBedEvent = (bedEvent:MwgEvents) => {
    return new Promise((resolve,reject)=>{
        try {
            handleBedUnaryUpdate({
                transactionNo: ++mwgGrpcTransNum,
                deviceId: bedEvent.systemId,
                timestamp: getCurrentTimeInISO(),
                eventDetail:{
                    name: bedEvent.eventName,
                    message: bedEvent.eventMessage
                }
            }).then((res:UpdateResp)=>{
                let resp = res.toObject(false) as UpdateRespType
                if(resp.respCode==='200'){
                    resolve(resp)
                } else {
                    handleFaultUpdateResp(resp)
                }
            })

        } catch(error){
            reject(error)
        }
    })
}
```

```
const handleBedUnaryUpdate = (bedUpdate:BedEventType|BedReportType):Promise<UpdateResp> => {
    return new Promise((resolve,reject)=>{
        try{
            if(isBedEventType(bedUpdate)){
                let updateEvent = bedUpdate as BedEventType

                mwgClient.bedEventUpdate(
                    BedEventGrpcAdaptee(updateEvent),
                    (err,resp:UpdateResp) =>{
                        if(err) { throw new Error(`[handleBedUnaryUpdate]->bedEvent ${JSON.stringify(err)}`)}
                        resolve(resp)
                    }
                )
            }

            else if(isBedReportType(bedUpdate)){
                let updateReport = bedUpdate as BedReportType

                mwgClient.bedReportUpdate(
                    bedReportGrpcAdaptee(updateReport),
                    (err,resp:UpdateResp) =>{
                        if(err) { throw new Error(`[handleBedUnaryUpdate]->bedReport ${JSON.stringify(err)}`)}
                        resolve(resp)
                    }
                )
            }
        } catch(error){
            reject(error)
        }
    })
}

```





​		

