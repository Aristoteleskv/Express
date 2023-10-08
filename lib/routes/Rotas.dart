// ignore_for_file: file_names

import 'package:express/views/404/404.dart';
import 'package:express/views/pages/authentication_pin_page.dart';
import 'package:express/views/pages/home/home_screen.dart';
import 'package:express/views/pages/views.dart';
import 'package:express/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final themeMode = ValueNotifier(2);

class Rotas extends StatelessWidget {
  const Rotas({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      builder: (context, value, g) {
        return MaterialApp(
          title: "Express",
          initialRoute: "/splash",
          debugShowCheckedModeBanner: false,
          routes: {
            '/splash': (_) => const SplashScreen(),
            '/home': (_) => const HomeScreen(),
            '/pagamentos': (_) => const Pagamentos(),
            '/consultas': (_) => const Consultas(),
            '/transferencias': (_) => const Transferencias(),
            '/levantamento': (_) => const Levantamento(),
            '/compras': (_) => const Compras(),
            '/pin': (_) => const AuthenticationPIN(),
            '/erro': (_) => const Erro(),
          },
        );
      },
      valueListenable: themeMode,
    );
  }
}
