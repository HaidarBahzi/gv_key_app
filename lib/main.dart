import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gv_key_app/app/bindings/auth_binding.dart';
import 'package:gv_key_app/app/config/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        initialRoute: '/',
        initialBinding: AuthBinding(),
        getPages: PageRoutes,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff0f0f0f),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
        debugShowCheckedModeBanner: false,
        builder: FlutterSmartDialog.init(),
      ),
    );
  }
}
