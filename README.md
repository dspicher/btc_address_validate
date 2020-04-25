# BTCAddressValidate

[![pub package](https://img.shields.io/pub/v/btc_address_validate.svg)](https://pub.dartlang.org/packages/btc_address_validate)
[![CircleCI](https://circleci.com/gh/dspicher/btc_address_validate.svg?style=svg)](https://circleci.com/gh/dspicher/btc_address_validate)

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
