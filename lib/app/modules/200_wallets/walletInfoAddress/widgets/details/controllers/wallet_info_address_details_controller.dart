import 'package:get/get.dart';
import '../widgets/WalletInfoAddressDetailsList.dart';

class WalletInfoAddressDetailsController extends GetxController {
  final List<WalletInfoAddressDetailsNode> list = [
    WalletInfoAddressDetailsNode('Net', '?'),
    WalletInfoAddressDetailsNode('From wallet', '?'),
    WalletInfoAddressDetailsNode('Address index', '0'),
    WalletInfoAddressDetailsNode('Derivation', "?"),
    WalletInfoAddressDetailsNode('Is change address', "No"),
    WalletInfoAddressDetailsNode('Used', "Yes"),
    WalletInfoAddressDetailsNode('UTXO count', "1"),
    WalletInfoAddressDetailsNode('Amount', "0.123 BTC"),
    WalletInfoAddressDetailsNode('Amount, fiat', "4`183 USD")
  ];

  final String transactionAddress = 'abcd1234abcd1234abcd1234abcd1234abcd1234abcd1230';

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
