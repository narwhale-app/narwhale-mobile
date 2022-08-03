#import "NarwhaleRustPlugin.h"
#if __has_include(<narwhale_rust/narwhale_rust-Swift.h>)
#import <narwhale_rust/narwhale_rust-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "narwhale_rust-Swift.h"
#endif

@implementation NarwhaleRustPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNarwhaleRustPlugin registerWithRegistrar:registrar];
}
@end
