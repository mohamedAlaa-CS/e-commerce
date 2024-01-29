// import 'dart:developer';
// import 'dart:io';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// class DeviceInfoHelper {
//   DeviceInfoHelper._();

//   static Future<String> get deviceId async {
//     var deviceInfo = DeviceInfoPlugin();
//     try {
//       if (Platform.isIOS) {
//         var iosDeviceInfo = await deviceInfo.iosInfo;
//         return iosDeviceInfo.identifierForVendor ?? '';
//       } else if (Platform.isAndroid) {
//         var androidDeviceInfo = await deviceInfo.androidInfo;
//         return androidDeviceInfo.id;
//       }
//     } catch (e) {
//       log(e.toString());
//     }
//     return 'GGHHKK66672';
//   }

//   static Future<String> get deviceToken async {
//     String? token;
//     try {
//       final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//       token = await firebaseMessaging.getToken();
//     } catch (e) {
//       log(e.toString());
//     }
//     return token ?? 'gdhagbjewbfjcbjjcdsbjb68d7stc87wetyf7';
//   }

//   static String get deviceType {
//     if (Platform.isIOS) {
//       return 'ios';
//     } else if (Platform.isAndroid) {
//       return 'android';
//     }
//     return '';
//   }
// }
