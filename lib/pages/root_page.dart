import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shoe_store/pages/discover_page.dart';
import 'package:shoe_store/widgets/background.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  @override
  void initState() {

    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const DiscoverPage();
  }
}
