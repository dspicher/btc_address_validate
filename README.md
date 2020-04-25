# BTCAddressValidate

A small library to validate Bitcoin addresses.

## Examples

```dart
  Address address = validate("1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2");
  print(address.type);
  // => p2pkh
  print(address.netowrk);
  // => mainnet
  print(address.segwit);
  // => false
```
