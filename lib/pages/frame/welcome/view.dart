import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  Widget _buildView() {
    return const Center(
      child: Text("WelcomePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      id: "welcome",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("welcome")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
