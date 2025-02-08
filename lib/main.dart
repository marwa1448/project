import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:myapp1/pages/login.dart';
import 'package:myapp1/pages/signup.dart';
import 'package:myapp1/pages/welcome.dart';
import 'package:myapp1/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: lightThemeData(context),
          darkTheme: darkThemeData(context),
          themeMode: themeProvider.themeMode,
          initialRoute: '/',
          routes: {
            '/': (context) => const Welcome(),
            '/login': (context) => Login(
                  email: '',
                  password: '',
                ),
            '/signup': (context) => const SignUp(),
          },
        );
      },
    );
  }
}
