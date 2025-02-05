import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hionepedia/binding/app_binding.dart';
import 'package:hionepedia/modules/auth/login_page.dart';
import 'package:hionepedia/modules/auth/register_page.dart';
import 'package:hionepedia/modules/favorite/favorite_page.dart';
import 'package:hionepedia/modules/home/home_page.dart';
import 'package:hionepedia/modules/onboarding/onboarding_page.dart';
import 'package:hionepedia/modules/page/page.dart';
import 'package:hionepedia/modules/user/profile_page.dart';
import 'package:hionepedia/theme/styles.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://gyqeqxqdyyiqlewuiikk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imd5cWVxeHFkeXlpcWxld3VpaWtrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg3NDM0NzQsImV4cCI6MjA1NDMxOTQ3NH0.QsqIR94nNFfDA76-hgVrLXTLPpNQ7rjqH2r2poJWIUg',
  );

  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hionepedia',
      theme: ThemeData(
        primaryColor: primaryColor,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      routes: {
        "/": (context) => GetStorage().hasData("isLoggedFirst")
            ? GetStorage().hasData("fullname")
                ? MyPage()
                : LoginPage()
            : OnboardingPage(),
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/home": (context) => HomePage(),
        "/favorite": (context) => FavoritePage(),
        "/profile": (context) => ProfilePage(),
      },
    );
  }
}
