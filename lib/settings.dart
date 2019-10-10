import 'package:flutter/material.dart';
import 'package:amity_hack/tick_animation.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorLoader3(
        radius: 15.0,
        dotRadius: 6.0,
      ),
    );
  }
}