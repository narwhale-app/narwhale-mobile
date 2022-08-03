import 'package:narwhale_mobile/app/models/CryptoContainerModel.dart';
import 'package:narwhale_mobile/app/widgets/qrCode/QRCodeScanner.dart';

import '../CServices.dart';
import 'providers/CCryptoProvider.dart';

class CControlWalletsService {
  CControlWalletsService(CCryptoProvider cryptoProvider);

  Future<bool> addNewWallet({required String walletName}) async {
    SMnemonicRootKey mnemonicRootKey = CServices.crypto.cryptoContainerAuth.getCurrentMnemonicRootKey();

    SWalletDescriptor walletDescriptor;
    try {
      walletDescriptor = CServices.crypto.cryptoProvider.getDefaultDescriptor(mnemonicRootKey, CServices.crypto.getCurrentNetwork());
    } catch(e) {
      print(e);
      return false;
    }

    //
    if (!(await CServices.crypto.privateCryptoContainer.addNewWallet(
        walletName: walletName,
        walletDescriptor: walletDescriptor
    ))) {
      return false;
    }
    return true;
  }

  Future<bool> addExistWallet({
    required String walletName,
    required String descriptor
  }) async {
    SMnemonicRootKey mnemonicRootKey = CServices.crypto.cryptoContainerAuth.getCurrentMnemonicRootKey();

    SWalletDescriptor walletDescriptor;
    try {
      walletDescriptor = CServices.crypto.cryptoProvider.getParsedDescriptor(mnemonicRootKey, descriptor, CServices.crypto.getCurrentNetwork());
    } catch(e) {
      print(e);
      return false;
    }

    //
    if (!(await CServices.crypto.privateCryptoContainer.addNewWallet(
        walletName: walletName,
        walletDescriptor: walletDescriptor
    ))) {
      return false;
    }
    return true;
  }

  SWalletModel getWalletByKey(String key) {
    return CServices.crypto.privateCryptoContainer.getWalletByKey(key);
  }

  String getPublicKey(String path) {
    SMnemonicRootKey mnemonicRootKey = CServices.crypto.cryptoContainerAuth.getCurrentMnemonicRootKey();
    WalletNetwork net = CServices.crypto.getCurrentNetwork();

    String pubKey = CServices.crypto.cryptoProvider.getPublicKey(mnemonicRootKey, path, net);
    return pubKey;
  }
}