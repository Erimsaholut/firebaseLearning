import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text("Naber")),
      body: Column(
        children: [
          Container(
            height: height*0.25,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/topImage.png"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
