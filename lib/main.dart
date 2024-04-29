import 'package:firebase_core/firebase_core.dart';
import'package:flutter/material.dart';
import 'package:resume_builder_app/utils/routes.dart';
import 'package:resume_builder_app/views/screens/achievements.dart';
import 'package:resume_builder_app/views/screens/carrer_obj.dart';
import 'package:resume_builder_app/views/screens/contact_info.dart';
import 'package:resume_builder_app/views/screens/declaration.dart';
import 'package:resume_builder_app/views/screens/education.dart';
import 'package:resume_builder_app/views/screens/experiences.dart';
import 'package:resume_builder_app/views/screens/home_page.dart';
import 'package:resume_builder_app/views/screens/interests.dart';
import 'package:resume_builder_app/views/screens/login_page.dart';
import 'package:resume_builder_app/views/screens/options_page.dart';
import 'package:resume_builder_app/views/screens/personal_details.dart';
import 'package:resume_builder_app/views/screens/projects.dart';
import 'package:resume_builder_app/views/screens/references.dart';
import 'package:resume_builder_app/views/screens/register_page.dart';
import 'package:resume_builder_app/views/screens/skills.dart';
import 'package:resume_builder_app/views/screens/splash_page.dart';

import 'firebase_options.dart';

void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      initialRoute: Routes.splashPage,
      routes: {
        Routes.splashPage:(context) => const SplashPage(),
        Routes.loginPage:(context) => const LoginPage(),
        Routes.registerPage:(context) => const RegisterPage(),
        Routes.homePage:(context) => const HomePage(),
        Routes.optionsPage:(context) => const OptionsPage(),
        Routes.achievementsPage:(context) => const Achievements(),
        Routes.carrerPage:(context) => const CarrerObjective(),
        Routes.contactPage:(context) => const ContactInformation(),
        Routes.declarePage:(context) => const Declaration(),
        Routes.educationPage:(context) => const Education(),
        Routes.experiencePage:(context) => const Experiences(),
        Routes.interestPage:(context) => const Interests(),
        Routes.personalPage:(context) => const PersonalDetails(),
        Routes.projectPage:(context) => const Projects(),
        Routes.referPage:(context) => const References(),
        Routes.skillsPage:(context) => const Skills(),
      },
    );
  }
}
