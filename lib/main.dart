import 'package:flutter/material.dart';
import 'package:light_dark_/view/controller.dart';
import 'package:light_dark_/view/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool('isDark') ?? false;
  runApp(MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  bool? isDark;
  MyApp({super.key, this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(isDark!),
        ),
      ],
      builder: (context, child) {
        final homeProvider = Provider.of<HomeProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: homeProvider.currentTheme,
          home: const MyHomePage(),
        );
      },
    );
  }
}
