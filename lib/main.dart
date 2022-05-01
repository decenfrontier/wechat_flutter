import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:desktop_window/desktop_window.dart';

import 'common/langs/translation_service.dart';
import 'common/routes/routes.dart';
import './global.dart';

Future<void> main() async {
  await Global.init();
  DesktopWindow.setWindowSize(Size(360, 660));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.INITIAL,
      getPages: AppRouter.routes,
      unknownRoute: AppRouter.unknownRoute,
      // 配置 加载中 效果
      builder: EasyLoading.init(),
      // 下面这三条配置国际化多语言
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}
