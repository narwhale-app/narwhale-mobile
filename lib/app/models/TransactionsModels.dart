
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:narwhale_mobile/utils.dart';

class SCryptoTransactionPoint {
  final String address;
  final double value;
  final String walletKey;

  SCryptoTransactionPoint({
    required this.address,
    required this.value,
    required this.walletKey
  });

  static SCryptoTransactionPoint fromJSON(Map<String, dynamic> data) {
    String address = data['address'];
    double value = data['value'].toDouble();
    String walletKey = data['wallet'];
    return SCryptoTransactionPoint(address: address, value: value, walletKey: walletKey);
  }

  Map<String, dynamic> toJSON() {
    return {
      'address': address,
      'value': value,
      'wallet': walletKey
    };
  }

  @override
  String toString() {
    return jsonEncode(toJSON());
  }
}

class SCryptoTransactionModel {
  final String psbt;
  final double fee;
  final List<SCryptoTransactionPoint> inputs;
  final List<SCryptoTransactionPoint> outputs;

  final int addTime;
  late String key;

  SCryptoTransactionModel({
    required this.addTime,
    required this.psbt,
    required this.fee,
    required this.inputs,
    required this.outputs
  }) {
    key = getTxKey();
  }

  static SCryptoTransactionModel fromJSON(Map<String, dynamic> data) {
    var addTime = data['addTime'];
    var psbt = data['psbt'];
    var fee = data['fee'].toDouble();
    List<dynamic> inputs = data['inputs'];
    List<dynamic> outputs = data['outputs'];

    List<SCryptoTransactionPoint> inputsPoints = inputs.map((el) {
      return SCryptoTransactionPoint.fromJSON(el);
    }).toList();

    List<SCryptoTransactionPoint> outputsPoints = outputs.map((el) {
      return SCryptoTransactionPoint.fromJSON(el);
    }).toList();

    return SCryptoTransactionModel(
      addTime: addTime,
      psbt: psbt,
      fee: fee,
      inputs: inputsPoints,
      outputs: outputsPoints
    );
  }

  String getTxKey() {
    String str = '';
    str += 'inputs:';
    inputs.forEach((el) {
      str += el.address + '>' + el.value.toString() + ';';
    });
    str += 'outputs:';
    outputs.forEach((el) {
      str += el.address + '>' + el.value.toString() + ';';
    });
    str += 'fee:' + fee.toString() + ';';

    //
    return sha256.convert(utf8.encode(str)).toString().toUpperCase();
  }

  Map<String, dynamic> toJSON() {
    List<dynamic> inputsJson = [];
    List<dynamic> outputsJson = [];

    inputs.forEach((el) {
      inputsJson.add(el.toJSON());
    });
    outputs.forEach((el) {
      outputsJson.add(el.toJSON());
    });

    return {
      'psbt': psbt,
      'key': key,
      'addTime': addTime,
      'fee': fee,
      'inputs': inputsJson,
      'outputs': outputsJson
    };
  }

  @override
  String toString() {
    return jsonEncode(toJSON());
  }
}