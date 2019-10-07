#import "JubiterPlugin.h"
#import <jubiter_plugin/jubiter_plugin-Swift.h>

@implementation JubiterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftJubiterPlugin registerWithRegistrar:registrar];
}
@end
