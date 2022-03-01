## [mqtt] - General Notes

### What are stored in persistence sessions

* Existence of a session (even if there are no subscriptions).
* All the subscriptions of the client.
* All messages in a Quality of * Service (QoS) 1 or 2 flow that the client has not yet confirmed.
* All new QoS 1 or 2 messages that the client missed while offline.
* All QoS 2 messages received from the client that are not yet completely acknowledged.