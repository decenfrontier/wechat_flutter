import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return const Center(
      child: Text("RegisterPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      id: "register",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("register")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
