import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:insta_clone/app.dart';

void main() {
  FlavorConfig(
      name: "DEVELOP",
      color: Colors.red,
      location: BannerLocation.bottomStart,
      variables: {
        "counter": 0,
        "showDebugBanner": true,
      });
  runApp(const MyApp());
}
