// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

/// Dart bindings to call libnarwhale_rust functions
class NarwhaleRustBindings {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  NarwhaleRustBindings(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  NarwhaleRustBindings.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  ffi.Pointer<ffi.Int8> mnemonic_from_entropy(
    ffi.Pointer<ffi.Int8> hex_entropy,
  ) {
    return _mnemonic_from_entropy(
      hex_entropy,
    );
  }

  late final _mnemonic_from_entropy_ptr =
      _lookup<ffi.NativeFunction<_c_mnemonic_from_entropy>>(
          'mnemonic_from_entropy');
  late final _dart_mnemonic_from_entropy _mnemonic_from_entropy =
      _mnemonic_from_entropy_ptr.asFunction<_dart_mnemonic_from_entropy>();

  ffi.Pointer<ffi.Int8> mnemonic_to_root_key(
    ffi.Pointer<ffi.Int8> mnemonic,
    ffi.Pointer<ffi.Int8> password,
  ) {
    return _mnemonic_to_root_key(
      mnemonic,
      password,
    );
  }

  late final _mnemonic_to_root_key_ptr =
      _lookup<ffi.NativeFunction<_c_mnemonic_to_root_key>>(
          'mnemonic_to_root_key');
  late final _dart_mnemonic_to_root_key _mnemonic_to_root_key =
      _mnemonic_to_root_key_ptr.asFunction<_dart_mnemonic_to_root_key>();

  ffi.Pointer<ffi.Int8> derive_xpub(
    ffi.Pointer<ffi.Int8> root,
    ffi.Pointer<ffi.Int8> path,
    ffi.Pointer<ffi.Int8> network,
  ) {
    return _derive_xpub(
      root,
      path,
      network,
    );
  }

  late final _derive_xpub_ptr =
      _lookup<ffi.NativeFunction<_c_derive_xpub>>('derive_xpub');
  late final _dart_derive_xpub _derive_xpub =
      _derive_xpub_ptr.asFunction<_dart_derive_xpub>();

  ffi.Pointer<ffi.Int8> get_descriptors(
    ffi.Pointer<ffi.Int8> root,
    ffi.Pointer<ffi.Int8> path,
    ffi.Pointer<ffi.Int8> scripttype,
    ffi.Pointer<ffi.Int8> network,
  ) {
    return _get_descriptors(
      root,
      path,
      scripttype,
      network,
    );
  }

  late final _get_descriptors_ptr =
      _lookup<ffi.NativeFunction<_c_get_descriptors>>('get_descriptors');
  late final _dart_get_descriptors _get_descriptors =
      _get_descriptors_ptr.asFunction<_dart_get_descriptors>();

  ffi.Pointer<ffi.Int8> derive_addresses(
    ffi.Pointer<ffi.Int8> descriptor,
    ffi.Pointer<ffi.Int8> network,
    int start,
    int end,
  ) {
    return _derive_addresses(
      descriptor,
      network,
      start,
      end,
    );
  }

  late final _derive_addresses_ptr =
      _lookup<ffi.NativeFunction<_c_derive_addresses>>('derive_addresses');
  late final _dart_derive_addresses _derive_addresses =
      _derive_addresses_ptr.asFunction<_dart_derive_addresses>();

  ffi.Pointer<ffi.Int8> parse_descriptor(
    ffi.Pointer<ffi.Int8> descriptor,
    ffi.Pointer<ffi.Int8> root,
    ffi.Pointer<ffi.Int8> network,
  ) {
    return _parse_descriptor(
      descriptor,
      root,
      network,
    );
  }

  late final _parse_descriptor_ptr =
      _lookup<ffi.NativeFunction<_c_parse_descriptor>>('parse_descriptor');
  late final _dart_parse_descriptor _parse_descriptor =
      _parse_descriptor_ptr.asFunction<_dart_parse_descriptor>();

  ffi.Pointer<ffi.Int8> parse_transaction(
    ffi.Pointer<ffi.Int8> psbt,
    ffi.Pointer<ffi.Int8> wallets,
    ffi.Pointer<ffi.Int8> network,
  ) {
    return _parse_transaction(
      psbt,
      wallets,
      network,
    );
  }

  late final _parse_transaction_ptr =
      _lookup<ffi.NativeFunction<_c_parse_transaction>>('parse_transaction');
  late final _dart_parse_transaction _parse_transaction =
      _parse_transaction_ptr.asFunction<_dart_parse_transaction>();

  ffi.Pointer<ffi.Int8> sign_transaction(
    ffi.Pointer<ffi.Int8> psbt,
    ffi.Pointer<ffi.Int8> root,
  ) {
    return _sign_transaction(
      psbt,
      root,
    );
  }

  late final _sign_transaction_ptr =
      _lookup<ffi.NativeFunction<_c_sign_transaction>>('sign_transaction');
  late final _dart_sign_transaction _sign_transaction =
      _sign_transaction_ptr.asFunction<_dart_sign_transaction>();

  ffi.Pointer<ffi.Int8> rust_greeting(
    ffi.Pointer<ffi.Int8> to,
  ) {
    return _rust_greeting(
      to,
    );
  }

  late final _rust_greeting_ptr =
      _lookup<ffi.NativeFunction<_c_rust_greeting>>('rust_greeting');
  late final _dart_rust_greeting _rust_greeting =
      _rust_greeting_ptr.asFunction<_dart_rust_greeting>();

  void rust_cstr_free(
    ffi.Pointer<ffi.Int8> s,
  ) {
    return _rust_cstr_free(
      s,
    );
  }

  late final _rust_cstr_free_ptr =
      _lookup<ffi.NativeFunction<_c_rust_cstr_free>>('rust_cstr_free');
  late final _dart_rust_cstr_free _rust_cstr_free =
      _rust_cstr_free_ptr.asFunction<_dart_rust_cstr_free>();

  ffi.Pointer<ffi.Int8> run_bitcoin_demo() {
    return _run_bitcoin_demo();
  }

  late final _run_bitcoin_demo_ptr =
      _lookup<ffi.NativeFunction<_c_run_bitcoin_demo>>('run_bitcoin_demo');
  late final _dart_run_bitcoin_demo _run_bitcoin_demo =
      _run_bitcoin_demo_ptr.asFunction<_dart_run_bitcoin_demo>();

  int ds_open_storage(
    ffi.Pointer<ffi.Int8> path,
  ) {
    return _ds_open_storage(
      path,
    );
  }

  late final _ds_open_storage_ptr =
      _lookup<ffi.NativeFunction<_c_ds_open_storage>>('ds_open_storage');
  late final _dart_ds_open_storage _ds_open_storage =
      _ds_open_storage_ptr.asFunction<_dart_ds_open_storage>();

  int ds_create_volume(
    int volumeIdx,
    ffi.Pointer<ffi.Int8> pass,
  ) {
    return _ds_create_volume(
      volumeIdx,
      pass,
    );
  }

  late final _ds_create_volume_ptr =
      _lookup<ffi.NativeFunction<_c_ds_create_volume>>('ds_create_volume');
  late final _dart_ds_create_volume _ds_create_volume =
      _ds_create_volume_ptr.asFunction<_dart_ds_create_volume>();

  int ds_find_volume_and_open(
    ffi.Pointer<ffi.Int8> pass,
  ) {
    return _ds_find_volume_and_open(
      pass,
    );
  }

  late final _ds_find_volume_and_open_ptr =
      _lookup<ffi.NativeFunction<_c_ds_find_volume_and_open>>(
          'ds_find_volume_and_open');
  late final _dart_ds_find_volume_and_open _ds_find_volume_and_open =
      _ds_find_volume_and_open_ptr.asFunction<_dart_ds_find_volume_and_open>();

  int ds_read_storage(
    int volumeIdx,
    int clusterIdx,
    ffi.Pointer<ffi.Int8> data,
    int dataSize,
  ) {
    return _ds_read_storage(
      volumeIdx,
      clusterIdx,
      data,
      dataSize,
    );
  }

  late final _ds_read_storage_ptr =
      _lookup<ffi.NativeFunction<_c_ds_read_storage>>('ds_read_storage');
  late final _dart_ds_read_storage _ds_read_storage =
      _ds_read_storage_ptr.asFunction<_dart_ds_read_storage>();

  int ds_write_storage(
    int volumeIdx,
    int clusterIdx,
    ffi.Pointer<ffi.Int8> data,
    int dataSize,
  ) {
    return _ds_write_storage(
      volumeIdx,
      clusterIdx,
      data,
      dataSize,
    );
  }

  late final _ds_write_storage_ptr =
      _lookup<ffi.NativeFunction<_c_ds_write_storage>>('ds_write_storage');
  late final _dart_ds_write_storage _ds_write_storage =
      _ds_write_storage_ptr.asFunction<_dart_ds_write_storage>();
}

typedef _c_mnemonic_from_entropy = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> hex_entropy,
);

typedef _dart_mnemonic_from_entropy = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> hex_entropy,
);

typedef _c_mnemonic_to_root_key = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> mnemonic,
  ffi.Pointer<ffi.Int8> password,
);

typedef _dart_mnemonic_to_root_key = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> mnemonic,
  ffi.Pointer<ffi.Int8> password,
);

typedef _c_derive_xpub = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> root,
  ffi.Pointer<ffi.Int8> path,
  ffi.Pointer<ffi.Int8> network,
);

typedef _dart_derive_xpub = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> root,
  ffi.Pointer<ffi.Int8> path,
  ffi.Pointer<ffi.Int8> network,
);

typedef _c_get_descriptors = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> root,
  ffi.Pointer<ffi.Int8> path,
  ffi.Pointer<ffi.Int8> scripttype,
  ffi.Pointer<ffi.Int8> network,
);

typedef _dart_get_descriptors = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> root,
  ffi.Pointer<ffi.Int8> path,
  ffi.Pointer<ffi.Int8> scripttype,
  ffi.Pointer<ffi.Int8> network,
);

typedef _c_derive_addresses = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> descriptor,
  ffi.Pointer<ffi.Int8> network,
  ffi.Uint32 start,
  ffi.Uint32 end,
);

typedef _dart_derive_addresses = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> descriptor,
  ffi.Pointer<ffi.Int8> network,
  int start,
  int end,
);

typedef _c_parse_descriptor = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> descriptor,
  ffi.Pointer<ffi.Int8> root,
  ffi.Pointer<ffi.Int8> network,
);

typedef _dart_parse_descriptor = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> descriptor,
  ffi.Pointer<ffi.Int8> root,
  ffi.Pointer<ffi.Int8> network,
);

typedef _c_parse_transaction = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> psbt,
  ffi.Pointer<ffi.Int8> wallets,
  ffi.Pointer<ffi.Int8> network,
);

typedef _dart_parse_transaction = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> psbt,
  ffi.Pointer<ffi.Int8> wallets,
  ffi.Pointer<ffi.Int8> network,
);

typedef _c_sign_transaction = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> psbt,
  ffi.Pointer<ffi.Int8> root,
);

typedef _dart_sign_transaction = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> psbt,
  ffi.Pointer<ffi.Int8> root,
);

typedef _c_rust_greeting = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> to,
);

typedef _dart_rust_greeting = ffi.Pointer<ffi.Int8> Function(
  ffi.Pointer<ffi.Int8> to,
);

typedef _c_rust_cstr_free = ffi.Void Function(
  ffi.Pointer<ffi.Int8> s,
);

typedef _dart_rust_cstr_free = void Function(
  ffi.Pointer<ffi.Int8> s,
);

typedef _c_run_bitcoin_demo = ffi.Pointer<ffi.Int8> Function();

typedef _dart_run_bitcoin_demo = ffi.Pointer<ffi.Int8> Function();

typedef _c_ds_open_storage = ffi.Int32 Function(
  ffi.Pointer<ffi.Int8> path,
);

typedef _dart_ds_open_storage = int Function(
  ffi.Pointer<ffi.Int8> path,
);

typedef _c_ds_create_volume = ffi.Int32 Function(
  ffi.Uint32 volumeIdx,
  ffi.Pointer<ffi.Int8> pass,
);

typedef _dart_ds_create_volume = int Function(
  int volumeIdx,
  ffi.Pointer<ffi.Int8> pass,
);

typedef _c_ds_find_volume_and_open = ffi.Int32 Function(
  ffi.Pointer<ffi.Int8> pass,
);

typedef _dart_ds_find_volume_and_open = int Function(
  ffi.Pointer<ffi.Int8> pass,
);

typedef _c_ds_read_storage = ffi.Int32 Function(
  ffi.Uint32 volumeIdx,
  ffi.Uint32 clusterIdx,
  ffi.Pointer<ffi.Int8> data,
  ffi.Int32 dataSize,
);

typedef _dart_ds_read_storage = int Function(
  int volumeIdx,
  int clusterIdx,
  ffi.Pointer<ffi.Int8> data,
  int dataSize,
);

typedef _c_ds_write_storage = ffi.Int32 Function(
  ffi.Uint32 volumeIdx,
  ffi.Uint32 clusterIdx,
  ffi.Pointer<ffi.Int8> data,
  ffi.Int32 dataSize,
);

typedef _dart_ds_write_storage = int Function(
  int volumeIdx,
  int clusterIdx,
  ffi.Pointer<ffi.Int8> data,
  int dataSize,
);
