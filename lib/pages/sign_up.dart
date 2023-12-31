import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final topImageAddress = "assets/images/topImage.png";
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
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
                      customSizedBox(),
                      signUpButton(),
                      customSizedBox(),
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

  Center signUpButton() {
    return Center(
      child: TextButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            try {
              var userResult =
                  await firebaseAuth.createUserWithEmailAndPassword(
                      email: email, password: password);
              print(userResult.user!.uid);
              formKey.currentState!.reset();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      "Hesap oluşturuldu , giris sayfasina yönlendiriliyorsunuz. "),
                ),
              );
              Navigator.pushNamed(context, "/loginPage");
            } catch (e) {
              print(e.toString());
            }
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
