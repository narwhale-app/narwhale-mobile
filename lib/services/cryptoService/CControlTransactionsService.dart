import 'package:narwhale_mobile/app/models/CryptoContainerModel.dart';
import 'package:narwhale_mobile/app/models/TransactionsModels.dart';
import 'package:narwhale_mobile/app/widgets/qrCode/QRCodeScanner.dart';
import 'package:narwhale_mobile/services/cryptoContainer/private/storages/DiskStorageJSON.dart';
import 'package:narwhale_mobile/services/cryptoService/providers/CCryptoProvider.dart';

import '../CServices.dart';

class CControlTransactionsService {
  late final CCryptoProvider _cryptoProvider;

  CControlTransactionsService(CCryptoProvider cryptoProvider): _cryptoProvider = cryptoProvider;

  SCryptoTransactionModel parseTransaction(QRCodeScannerResultParseTransaction transaction) {
    SMnemonicRootKey mnemonicRootKey = CServices.crypto.cryptoContainerAuth.getCurrentMnemonicRootKey();
    List<SWalletModel> wallets = CServices.crypto.privateCryptoContainer.getWallets();
    return CServices.crypto.cryptoProvider.parseTransaction(mnemonicRootKey, transaction, wallets, CServices.crypto.getCurrentNetwork());
  }

  dynamic signTransaction(SCryptoTransactionModel transaction) {
    SMnemonicRootKey mnemonicRootKey = CServices.crypto.cryptoContainerAuth.getCurrentMnemonicRootKey();
    return CServices.crypto.cryptoProvider.signTransaction(mnemonicRootKey, transaction);
  }

  List<SCryptoTransactionModel>? transactions;

  DiskStorageJSON? storageJSON;
  void loadData() {
    storageJSON = CServices.crypto.privateCryptoContainer.getTransactionsStorage();
    var obj = storageJSON!.readData();
    obj ??= [];

    transactions = [];
    obj.forEach((el) {
      transactions!.add(SCryptoTransactionModel.fromJSON(el));
    });

    //
    print('load transactions: ' + transactions.toString());
  }

  void saveData() {
    var data = [];
    transactions!.forEach((tx) {
      data.add(tx.toJSON());
    });
    storageJSON!.saveData(data);
  }

  void saveTransaction(SCryptoTransactionModel transaction) {
    if (transactions == null) {
      loadData();
    }

    transactions!.forEach((tx) {
      if (tx.key == transaction.key) {
        throw 'Already exists';
      }
    });

    transactions!.add(transaction);

    saveData();
  }

  List<SCryptoTransactionModel> getWalletTransactions(String walletKey) {
    List<SCryptoTransactionModel> ret = [];
    transactions!.forEach((tx) {
      bool isFind = false;
      tx.inputs.forEach((point) {
        if (point.walletKey == walletKey) {
          isFind = true;
        }
      });
      tx.outputs.forEach((point) {
        if (point.walletKey == walletKey) {
          isFind = true;
        }
      });

      if (!isFind) {
        return;
      }

      ret.add(tx);
    });
    return ret;
  }
}