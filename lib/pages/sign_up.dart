import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final topImageAddress = "assets/images/topImage.png";
  final formKey = GlobalKey<FormState>();
  late String email, password;

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
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleText(),
                      emailTextField(),
                      customSizedBox(),
                      passwordTextField(),
                      customSizedBox(),
                      signUpButton(),
                      backToLoginPageButton(),
                    ],
                  ),
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

  SizedBox customSizedBox() {
    return const SizedBox(
      height: 20,
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

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz";
        }
      },
      onSaved: (value) {
        email = value!;
      },
      style: const TextStyle(color: Colors.white),
      decoration: customInputDecoration("Email"),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty && value.length < 6) {
          return "Bilgileri Eksiksiz Doldurunuz";
        }
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      style: const TextStyle(color: Colors.white),
      decoration: customInputDecoration("Parola"),
    );
  }

  Center signUpButton() {
    return Center(
      child: TextButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
          }
        },
        child: Text(
          "Hesap Oluştur",
          style: TextStyle(color: Colors.pink.shade200),
        ),
      ),
    );
  }

  Center backToLoginPageButton() {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, "/loginPage");
        },
        child: Text(
          "Giriş Ekranına Dön",
          style: TextStyle(color: Colors.pink.shade200),
        ),
      ),
    );
  }
}
