import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/routes.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List myOptions = [
      "Contact Information",
      "Carrer Objective",
      "Personal Details",
      "Education",
      "Experiences",
      "Technical Skills",
      "Interests/Hobbies",
      "Project Works",
      "Achievements",
      "References",
      "Declaration",
    ];

    List myOptionsImages = [
      "assets/images/contact-books.png",
      "assets/images/briefcase.png",
      "assets/images/user.png",
      "assets/images/mortarboard.png",
      "assets/images/experience.png",
      "assets/images/thinking.png",
      "assets/images/open-book.png",
      "assets/images/project.png",
      "assets/images/achievement.png",
      "assets/images/handshake.png",
      "assets/images/declaration.png",
    ];

    List myOptionsRoutes = [
      Routes.contactPage,
      Routes.carrerPage,
      Routes.personalPage,
      Routes.educationPage,
      Routes.experiencePage,
      Routes.skillsPage,
      Routes.interestPage,
      Routes.projectPage,
      Routes.achievementsPage,
      Routes.referPage,
      Routes.declarePage,
    ];

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text("Options"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: myOptionsImages.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Image.asset(
                    "${myOptionsImages[index]}",
                    width: 40,
                  ),
                  title: Text("${myOptions[index]}"),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(myOptionsRoutes[index]);
                      },
                      icon: const Icon(Icons.arrow_forward_ios)),
                ),
              );
            },
          ),
        ));
  }
}
