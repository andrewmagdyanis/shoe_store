import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoe_store/pages/root_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shoe_store/state_management/bag_list_cubit.dart';
import 'package:shoe_store/themes.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = window.physicalSize;
    final double devicePixelRatio = window.devicePixelRatio;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => BagListCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoe Shop',
        theme: Themes(size: size, aspectRatio: devicePixelRatio)
            .themeDataProvider('light'),
        darkTheme: Themes(size: size, aspectRatio: devicePixelRatio)
            .themeDataProvider('dark'),
        themeMode: ThemeMode.light,
        home: const RootPage(title: 'Shoe shop'),
      ),
    );
  }
}
