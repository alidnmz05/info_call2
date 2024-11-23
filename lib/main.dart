import 'package:flutter/material.dart';
import 'package:info_call2/screens/home_screen.dart';

import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // İzinleri başlatma
  await requestPermissions();

  runApp(MyApp());
}

Future<void> requestPermissions() async {
  // Kamera iznini talep et
  PermissionStatus cameraStatus = await Permission.camera.request();

  // Konum iznini talep et
  PermissionStatus locationStatus =
      await Permission.locationWhenInUse.request();

  // İzin durumu kontrolü
  if (cameraStatus.isGranted && locationStatus.isGranted) {
    print("Tüm izinler verildi");
  } else {
    print("Bazı izinler reddedildi");
    // İzin reddedildiyse kullanıcıyı bilgilendirebilir veya hataya yönlendirebilirsiniz
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Bar Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
