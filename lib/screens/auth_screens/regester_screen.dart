import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tnance/helper/constans.dart';
import 'package:tnance/main.dart';
import 'package:tnance/providers/auth_provider.dart';
import 'package:tnance/widgets/input_feild.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool btnEnable = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  final GlobalKey<FormState> _registerForm = GlobalKey<FormState>();

  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: seconderycolor),
      ),
      backgroundColor: base3,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _registerForm,
            onChanged: () {
              if (kDebugMode) {
                print(phoneController.text);
              }

              setState(() {
                btnEnable = _registerForm.currentState!.validate();
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 20),
                ),
                InputField(
                  controller: nameController,
                  textcolor: Colors.white,
                  hintText: "name",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter name";
                    }
                    if (value.length < 2) {
                      return "user name must be 2 chars";
                    }

                    return null;
                  },
                ),
                InputField(
                  controller: phoneController,
                  textcolor: Colors.white,
                  hintText: "phone",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter phone";
                    }
                    if (value.length < 8) {
                      return "user phone must be 8 chars";
                    }

                    return null;
                  },
                ),
                InputField(
                  obSecure: true,
                  controller: passwordController,
                  textcolor: Colors.white,
                  hintText: "password",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter password";
                    }
                    if (value.length < 8) {
                      return "password must be 8 chars";
                    }

                    return null;
                  },
                ),
                InputField(
                  controller: passwordConfirmationController,
                  textcolor: Colors.white,
                  hintText: "password confirmation",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter password confirmation";
                    }
                    if (value.length < 8) {
                      return "password must be 8 chars";
                    }

                    if (value != passwordController.text) {
                      return "passwords does not match";
                    }

                    return null;
                  },
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        btnEnable = _registerForm.currentState!.validate();
                      });
                      if (btnEnable) {
                        Provider.of<AuthProvider>(context, listen: false)
                            .register(
                          {
                            "name": nameController.text,
                            "phone": phoneController.text,
                            "password": passwordController.text,
                            "password_confirmation":
                                passwordConfirmationController.text,
                            "device_name": "iphone"
                          },
                        ).then((logedIn) {
                          if (logedIn.first) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const ScreenRouter()),
                                (route) => false);
                          } else {
                            SnackBar snackBar = SnackBar(
                              content: Text(logedIn.last),
                            );

                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        });
                      } else {
                        const snackBar = SnackBar(
                          content: Text("Fill The data"),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: btnEnable ? Colors.blue : Colors.grey),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
