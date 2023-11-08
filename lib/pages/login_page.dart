import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/service/auth_service.dart';
import 'package:firebase_test/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final topImageAddress = "assets/images/topImage.png";
  final formKey = GlobalKey<FormState>();
  final authService = AuthService();
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
                      customSizedBox(expand: 2),
                      signInButton(),
                      customSizedBox(expand: 0.5),
                      Center(
                          child: CustomTextButton(
                              onPressed: () {
                                authService.forgotPassword(email);
                              }, buttonText: "Şifremi Unuttum")),
                      customSizedBox(expand: 0.5),
                      Center(
                          child: CustomTextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, "/signUp");
                              },
                              buttonText: "Hesap Oluştur")),
                      Center(
                          child: CustomTextButton(
                              onPressed: () async {
                                final result =
                                    await authService.signInAnonymous();
                                if (result != null) {
                                  Navigator.pushNamed(context, "/homePage");
                                }else{
                                  print("Hata");
                                }
                              },
                              buttonText: "Misafir Girişi")),
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

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz";
        }
        return null;
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
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz";
        }
        return null;
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      style: const TextStyle(color: Colors.white),
      decoration: customInputDecoration("Parola"),
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

  Center forgotPasswordButton() {
    return Center(
      child: TextButton(
        onPressed: () {

        },
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
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            try {
              final userResult = await FirebaseAuth.instance
                  .signInWithEmailAndPassword(email: email, password: password);
              print(userResult.user!.email);
              Navigator.pushNamed(context, "/homePage");
            } catch (e) {
              print(e.toString());
            }
          }
        },
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
