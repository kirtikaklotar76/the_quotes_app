import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuComponent extends StatelessWidget {
  MenuComponent({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {
              Get.changeThemeMode(
                Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
              );
            },
            icon: const Icon(Icons.brightness_5_rounded),
            label: const Text("Light"),
          ),
        ],
      ),
    );
  }
}
