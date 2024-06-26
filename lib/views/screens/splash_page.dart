import 'dart:async';

import 'package:flutter/material.dart';

import '../../utils/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  myTimer() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      Navigator.of(context).pushReplacementNamed(Routes.loginPage);
    });
  }

  @override
  void initState() {
    super.initState();
    myTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(16),child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png",width: 150,),
            const SizedBox(height: 30,),
            const Text("Resume App",style: TextStyle(fontSize: 25),),
            const SizedBox(height: 50,),
            const LinearProgressIndicator(),
          ],
        ),
      ),),
    );
  }
}
