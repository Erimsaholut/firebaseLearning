import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final topImageAddress = "assets/images/topImage.png";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF21254A),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * .25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(topImageAddress),
                  ),
                ),
              ), //topImage
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText(),
                    usernameTextField(),
                    customSizedBox(),
                    passwordTextField(),
                    customSizedBox(expand: 2),
                    signInButton(),
                    forgotPasswordButton(),
                    signUpButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text titleText() {
    return const Text(
      "Merhaba,\nHoşgeldin",
      style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }

  SizedBox customSizedBox({double expand = 1}) {
    return SizedBox(
      height: 20 * expand,
    );
  }

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }

  TextField usernameTextField() {
    return TextField(
      decoration: customInputDecoration("Kullanici Adi"),
      style: TextStyle(color: Colors.white),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      obscureText: true,
      style: const TextStyle(color: Colors.white),
      decoration: customInputDecoration("Parola"),
    );
  }
  Center forgotPasswordButton() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Şifremi Unuttum",
          style: TextStyle(color: Colors.pink.shade200),
        ),
      ),
    );
  }

  Center signInButton() {
    return Center(
      child: TextButton(
        style: ButtonStyle(
            overlayColor:
                MaterialStateColor.resolveWith((states) => Colors.grey)),
        onPressed: () {},
        child: Container(
          height: 50.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xFF31274f),
          ),
          child: const Center(
            child: Text(
              "Giris Yap",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Center signUpButton() {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, "/signUp");
        },
        child: Text(
          "Hesap Oluştur",
          style: TextStyle(color: Colors.pink.shade200),
        ),
      ),
    );
  }
}
