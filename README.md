# Jupiter aggregator dart

Jupiter quote and swap API for Dart

[API docs](https://quote-api.jup.ag/docs/static/index.html)

## Version: 0.0.0

### /v1/quote

#### GET

##### Summary

Return route

##### Description

Get quote for a given input mint, output mint and amount

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| inputMint | query | inputMint | Yes | string |
| outputMint | query | outputMint | Yes | string |
| amount | query | amount | Yes | number |
| slippage | query | slippage | No | number |
| feeBps | query | fee bps | No | number |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| default | Default response | object |

### /v1/swap

#### POST

##### Summary

Return setup, swap and cleanup transactions

##### Description

Get swap serialized transactions for a route

##### Parameters

| Name | Located in | Description | Required | Schema |
| ---- | ---------- | ----------- | -------- | ---- |
| body | body |  | No | object |

##### Responses

| Code | Description | Schema |
| ---- | ----------- | ------ |
| default | Default response | object |

### /v1/route-map

#### GET

##### Description

[DEPRECATED] use /indexed-route-map Returns a hash map, input mint as key and an array of valid output mint as values

##### Responses

| Code | Description |
| ---- | ----------- |
| 200 | Default Response |

### /v1/indexed-route-map

#### GET

##### Description

Returns a hash map, input mint as key and an array of valid output mint as values, token mints are indexed to reduce the
file size

##### Responses

| Code | Description |
| ---- | ----------- |
| 200 | Default Response |
