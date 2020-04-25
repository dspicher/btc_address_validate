# BTCAddressValidate

[![pub package](https://img.shields.io/pub/v/btc_address_validate.svg)](https://pub.dartlang.org/packages/btc_address_validate)
[![CircleCI](https://circleci.com/gh/dspicher/btc_address_validate.svg?style=svg)](https://circleci.com/gh/dspicher/btc_address_validate)

A small library to validate Bitcoin addresses.

## Thanks

To the excellent [base58check](https://pub.dartlang.org/packages/base58check) and [bech32](https://pub.dartlang.org/packages/bech32) packages.

Partly inspired by the npm package [bitcoin-address-validation](https://github.com/ruigomeseu/bitcoin-address-validation).

## Examples

```dart
  Address address = validate("1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2");
  print(address.type);
  // => Type.p2pkh
  print(address.network);
  // => Network.mainnet
  print(address.segwit);
  // => false
```

## Alternatives

[bitcoin_flutter](https://pub.dartlang.org/packages/bitcoin_flutter) also allows address validation. However, it lacks P2SH support.