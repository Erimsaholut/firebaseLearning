import 'package:firebase_test/service/auth_service.dart';
import 'package:firebase_test/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';
import '../widgets/customInputDecoration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final topImageAddress = "assets/images/topImage.png";
  final formKey = GlobalKey<FormState>();
  final authService = AuthService();
   late String email,nameSurname,userName, password;

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
                      nameSurnameTextField(),
                      customSizedBox(),
                      userNameTextField(),
                      customSizedBox(),
                      passwordTextField(),
                      customSizedBox(expand: 2),
                      signInButton(),
                      customSizedBox(expand: 0.5),
                      Center(
                          child: CustomTextButton(
                              onPressed: () {
                                authService.forgotPassword(email);
                              },
                              buttonText: "Şifremi Unuttum")),
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
                                } else {
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
  TextFormField nameSurnameTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz";
        }
        return null;
      },
      onSaved: (value) {
        nameSurname = value!;
      },
      style: const TextStyle(color: Colors.white),
      decoration: customInputDecoration("Ad Soyad"),
    );
  }
  TextFormField userNameTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Bilgileri Eksiksiz Doldurunuz";
        }
        return null;
      },
      onSaved: (value) {
        userName = value!;
      },
      style: const TextStyle(color: Colors.white),
      decoration: customInputDecoration("Kullanici Adi"),
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
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
             final result = await authService.signIn(email,nameSurname,userName,password);
            if (result == "success") {
              Navigator.pushNamed(context, "/homePage");
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("hata"),
                      content: Text(result!),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Geri Dön"))
                      ],
                    );
                  });
            }
            //Navigator.pushNamed(context, "/homePage");
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
