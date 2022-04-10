import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'zh_Hans.dart';
import 'en_US.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('en', 'US');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'zh_Hans': zh_Hans,
      };
}
