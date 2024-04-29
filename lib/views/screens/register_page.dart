import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resume_builder_app/services/auth_service.dart';

import '../../models/user_model.dart';
import '../../utils/routes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController pswController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/register.png",
                width: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                children: [
                  Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Row(
                children: [
                  Text(
                    "Please register to login",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CupertinoTextField(
                controller: emailController,
                placeholder: "Email",
                prefix: const Icon(
                  Icons.mail_outlined,
                  size: 30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: CupertinoColors.systemGrey6,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CupertinoTextField(
                prefix: const Icon(
                  Icons.lock_outline,
                  size: 30,
                ),
                controller: pswController,
                placeholder: "Password",
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: CupertinoColors.systemGrey6,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  final check = await AuthService.authService
                      .signUpWithPasswordUsername(
                          email: emailController.text,
                          password: pswController.text);

                  UserModel acc = UserModel(
                      image: '', name: '', email: emailController.text);

                  if (check!.contains('Success')) {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.homePage, arguments: acc);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(check),
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
                    "Sign Up",
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
                  const Text("Already Have An Account ? "),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.loginPage);
                      },
                      child: const Text("Sign In"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
