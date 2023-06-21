
import 'package:flutter/material.dart';

class SettingTabScreen extends StatefulWidget {
  const SettingTabScreen({Key? key}) : super(key: key);

  @override
  State<SettingTabScreen> createState() => _SettingTabScreenState();
}

class _SettingTabScreenState extends State<SettingTabScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Setting Tab Screen"),
    );
  }
}
