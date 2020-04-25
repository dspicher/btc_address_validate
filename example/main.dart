import 'package:btc_address_validate/btc_address_validate.dart';

void main() {
  Address address = validate("1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2");
  print(address.type);
  // => Type.p2pkh
  print(address.network);
  // => Network.mainnet
  print(address.segwit);
  // => false
}
