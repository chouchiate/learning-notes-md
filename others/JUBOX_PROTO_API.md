# Protobuf API

### SystemEventUpdate

```sequence
Grpc Client->Grpc Server: SystemEventUpdate
Note right of Grpc Server: Server Process
Grpc Server-->Grpc Client: UpdateResp
```

### Grpc Example

```
{
	transaction_no: 123
	timestamp: '2020-12-10T09:48:09.440Z',
	location: {
		facility_id: 'thudercat',
		room: '101',
		bed: 'A',
		position: 'optional',
		floor: 'optiona',
		area: 'optional'
	},
	device_id: 'd36b9fc6-7a87-4f10-b4dc-bbdfba63bcf5',
	sys_event_detail: {
		name:	'MWG Mattress',
		message: 'request_uuid'
	}
}
```

### Event Detail 

|       Operation        |  EventDetail Name  | EventDetail Message |
| :--------------------: | :----------------: | :-----------------: |
|  Register New Device   | Device Description |    request_uuid     |
| Update Device Location | Device Description |   update_location   |



### SystemReportUpdate - TBD

```sequence
Grpc Server-->Grpc Client: SystemReportRequest
Note right of Grpc Client: Client Process
Grpc Client->Grpc Server: SystemReportUpdate
Note left of Grpc Server: Server Process
Grpc Server-->Grpc Client: UpdateResp
```

### Grpc Example - TBD

```

```



### Report Request - TBD

| Request Item | Query |
| :----------: | :---: |
|              |       |
|              |       |



### BedEventUpdate

```sequence
Grpc Client->Grpc Server: BedEventUpdate
Note right of Grpc Server: Server Process
Grpc Server-->Grpc Client: UpdateResp
```

### Grpc Example

```
{
	transaction_no: 123,
	device_id: 'd36b9fc6-7a87-4f10-b4dc-bbdfba63bcf5',
	timestamp: '2020-12-10T09:48:09.440Z',
	bed_event_detail:{
		senior: {
			patient_id: 'bfd78e77-c89e-488a-8db0-a859df1543a0'
		},
		location: {
			facility_id: '',
			room: '101',
			bed: 'A',
			position: '',
			floor: '',
			area: ''
		},
		event_detail: {
			name: 'sit_on_bed_side',
			message: '坐在床緣'
		}
	}
}
```



### BedReportUpdate

```sequence
Grpc Client->Grpc Server: BedReportUpdate
Note right of Grpc Server: Server Process
Grpc Server-->Grpc Client: UpdateResp
```

### Grpc Example

```
{
	transaction_no: 123,
	device_id: 'd36b9fc6-7a87-4f10-b4dc-bbdfba63bcf5',
	timestamp: '2020-12-10T09:48:09.440Z',
	bed_report_detail: {
		senior: {
			patient_id: 'bfd78e77-c89e-488a-8db0-a859df1543a0'		
		},
		location: {
			facility_id: '',
			room: '101',
			bed: 'A',
			position: '',
			floor: '',
			area: ''		
		},
		sleep_start_at: '2020-07-20T03:01:40.000Z'
		sleep_end_at: '2020-07-21T13:01:40.000Z'
		sleep_latency: 1965
		sleep_effectiveness: 54.165
		turn_over_cnt:	5
		not_in_bed_cnt:	0
		not_in_bed_time:	1234
	}
}
```

### Presence

```sequence
Grpc Client-->Grpc Server: something
Grpc Server->Grpc Client: something resp
Grpc Server->Grpc Client: PresenceRequest
Grpc Client->Grpc Server: RequestAck
Note left of Grpc Client: Client Process
Grpc Client->Grpc Server: PresenceData(stream)
Grpc Server->Grpc Client: StreamResp
Note right of Grpc Server: Server Process
Grpc Client->Grpc Server: PresenceData(stream)
Grpc Server->Grpc Client: StreamResp
Note right of Grpc Server: Server Process
Grpc Client->Grpc Server: PresenceData(stream)
Grpc Server->Grpc Client: StreamResp
Note right of Grpc Server: Server Process
Grpc Server-->Grpc Client: PresenceStop
Grpc Client-->Grpc Server: RequestResp
```





