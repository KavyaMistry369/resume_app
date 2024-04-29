import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_app/services/auth_service.dart';

import '../../models/user_model.dart';
import '../../utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController();
    TextEditingController pswController = TextEditingController();

    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/login.png",
                width: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30,
                        color:Colors.deepPurple,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    "Please Sign in to continue",
                    style: TextStyle(
                      fontSize: 18,
                      color:Colors.deepPurple,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CupertinoTextField(
                decoration: BoxDecoration(
                    color: CupertinoColors.systemGroupedBackground,
                    borderRadius: BorderRadius.circular(15)),
                controller: emailController,
                placeholder: "Email",
                prefix: const Icon(
                  Icons.email_outlined,
                  size: 30,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CupertinoTextField(
                controller: pswController,
                placeholder: "Password",
                prefix: const Icon(
                  Icons.lock_outline,
                  size: 30,
                ),
                decoration: BoxDecoration(
                    color: CupertinoColors.systemGroupedBackground,
                    borderRadius: BorderRadius.circular(15)),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "OR",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      UserModel account =
                      await AuthService.authService.signInWithGoogle();
                      if (account.email != "") {
                        Navigator.of(context).pushReplacementNamed(
                            Routes.homePage,
                            arguments: account);
                      }
                    },
                    child: Image.network(
                      "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                      width: 50,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  final message = await AuthService.authService
                      .signInWithPasswordUsername(
                      email: emailController.text,
                      password: pswController.text);

                  String email = emailController.text;
                  String name = email
                      .substring(0, email.indexOf('@'))
                      .replaceAll(RegExp(r'[0-9]'), ' ')
                      .trim();
                  print(name);

                  UserModel acc = UserModel(
                      image:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPjGnnelatTe1FbI6RHusiWG4wkbtmnjVC9uTBkSBX_g&s',
                      name: name,
                      email: emailController.text);

                  if (message!.contains('Success')) {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.homePage, arguments: acc);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );

                  emailController.clear();
                  pswController.clear();
                },
                child: Container(
                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(50)),
                  alignment: Alignment.center,
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't Have An Account ? "),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.registerPage);
                      },
                      child: const Text("Sign Up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
