import 'package:base58check/base58check.dart';
import 'package:bech32/bech32.dart';
import 'package:equatable/equatable.dart';

enum Type {
  p2pkh,
  p2sh,
}

enum Network { mainnet, testnet }

class Address extends Equatable {
  Address(this.type, this.network, this.segwit);

  final Type type;
  final Network network;
  final bool segwit;

  @override
  List<Object> get props => [type, network, segwit];
}

const Map<int, Network> versionToNetwork = {
  0: Network.mainnet,
  5: Network.mainnet,
  111: Network.testnet,
  196: Network.testnet,
};

const Map<int, Type> versionToType = {
  0: Type.p2pkh,
  5: Type.p2sh,
  111: Type.p2pkh,
  196: Type.p2sh,
};

const minLength = 34;

Address validate(String address) {
  if (address.length < minLength) {
    throw FormatException(
        "Too short: addresses must be at least $minLength characters");
  }
  var prefix = address.substring(0, 2);
  if (prefix == 'bc' || prefix == 'tb') {
    return validateSegwit(address);
  }

  var codec = Base58CheckCodec.bitcoin();
  Base58CheckPayload decoded;
  try {
    decoded = codec.decode(address);
  } catch (e) {
    throw Base58CheckException(e);
  }
  if (decoded.payload.length != 20) {
    throw FormatException("Invalid Base58 payload length");
  }
  var version = decoded.version;
  if (!versionToType.keys.contains(version)) {
    throw FormatException("Invalid Base58 version");
  }
  return Address(versionToType[version], versionToNetwork[version], false);
}

Address validateSegwit(String address) {
  var prefix = address.substring(0, 2);
  Segwit decoded;
  try {
    decoded = segwit.decode(address);
  } catch (e) {
    throw SegwitException(e);
  }

  var type;
  // other lengths result in a [SegwitException]
  switch (decoded.program.length) {
    case 20:
      {
        type = Type.p2pkh;
      }
      break;
    case 32:
      {
        type = Type.p2sh;
      }
  }

  var network;
  switch (prefix) {
    case 'bc':
      {
        network = Network.mainnet;
      }
      break;
    case 'tb':
      {
        network = Network.testnet;
      }
  }

  return Address(type, network, true);
}

class SegwitException implements Exception {
  SegwitException(this.inner);

  final Exception inner;

  String toString() => "SegWit decoding exception: $inner";
}

class Base58CheckException implements Exception {
  Base58CheckException(this.inner);

  final Exception inner;

  String toString() => "Base58Check decoding exception: $inner";
}
