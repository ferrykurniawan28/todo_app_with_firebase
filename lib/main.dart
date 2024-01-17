import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/routes.dart';
import 'package:todo/routesname.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.lemon(
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
          bodyMedium: GoogleFonts.lemon(
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
          bodySmall: GoogleFonts.lemon(
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.lemon(
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
          bodyMedium: GoogleFonts.lemon(
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
          bodySmall: GoogleFonts.lemon(
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      initialRoute: PagesName.splash,
      getPages: Routes.pages,
    );
  }
}
