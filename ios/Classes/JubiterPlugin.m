#import "JuBiterPlugin.h"
#import <jubiter_plugin/jubiter_plugin-Swift.h>

@implementation JuBiterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftJuBiterPlugin registerWithRegistrar:registrar];
}
@end
