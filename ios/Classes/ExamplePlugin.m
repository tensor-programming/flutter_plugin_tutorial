#import "ExamplePlugin.h"

@implementation ExamplePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"example_plugin"
            binaryMessenger:[registrar messenger]];
  ExamplePlugin* instance = [[ExamplePlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"randomString" isEqualToString:call.method]) {
    result([@"This is our Random String"]);
   } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
