import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tnance/helper/constans.dart';
import 'package:tnance/providers/auth_provider.dart';
import 'package:tnance/providers/crypto_coin_provider.dart';
import 'package:tnance/screens/auth_screens/login_screen.dart';
import 'package:tnance/screens/auth_screens/splash_screen.dart';
import 'package:tnance/screens/main_screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CryptoProvider>(
            create: (context) => CryptoProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
            appBarTheme: const AppBarTheme(
                backgroundColor: Color.fromARGB(255, 22, 23, 29), elevation: 0),
            bottomNavigationBarTheme:
                BottomNavigationBarThemeData(backgroundColor: primaryColor),
            useMaterial3: false,
          ),
          home: const SplashScreen()),
    );
  }
}

class ScreenRouter extends StatefulWidget {
  const ScreenRouter({super.key});

  @override
  State<ScreenRouter> createState() => _ScreenRouterState();
}

class _ScreenRouterState extends State<ScreenRouter> {
  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).initAuthProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authConsumer, child) {
        return authConsumer.authenticated
            ? const HomeScreen()
            : const LoginScreen();
      },
    );
  }
}
