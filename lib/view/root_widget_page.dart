import 'package:flutter/material.dart';
import 'package:payee_info/config/routes/routes_name.dart';
import 'package:payee_info/core/network/connection_service.dart';
import 'package:payee_info/core/utils/navigator_key.dart';
import 'package:payee_info/view/pages/app_intro/intro_page.dart';
import 'package:payee_info/view/pages/home/home_page.dart';
import 'package:payee_info/view_model/mobx/user_mobx.dart';
import 'package:provider/provider.dart';

class RootWidgetPage extends StatefulWidget {
  const RootWidgetPage({super.key});

  @override
  State<RootWidgetPage> createState() => _RootWidgetPageState();
}

class _RootWidgetPageState extends State<RootWidgetPage> {
  final ConnectionService _connectionService = ConnectionService();
  @override
  void dispose() {
    _connectionService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _connectionService.initialize(navigatorKey);
    return MultiProvider(
      providers: [
        Provider<UserMobx>(create: (_) => UserMobx()..fetchUser()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        initialRoute: introPage,
        routes: {
          introPage: (context) => const IntroPage(),
          homePage: (context) => const HomePage(),
        },
      ),
    );
  }
}
