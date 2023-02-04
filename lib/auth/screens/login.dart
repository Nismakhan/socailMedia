import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/auth/controllers/auth_controller.dart';
import 'package:social_media_app/auth/widgets/login_image_design.dart';

import '../../app/router/router.dart';
import '../../utils/media_query.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 97, 96, 96),
                Color.fromARGB(255, 15, 48, 15),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Column(
              children: [
                const LoginImageDesign(),
                const SizedBox(height: 20),
                const Text(
                  "The Best Social App To",
                  style: TextStyle(
                    fontFamily: "Times new roman",
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Make New Friends",
                      style: TextStyle(
                        fontFamily: "Times new roman",
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "!",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 233, 148, 20),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Find people with the same",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "interest as you",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: screenWidth(context) * 0.8,
                    height: screenHeight(context) * 0.08,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, AppRouter.signUp);
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Container(
                  width: screenWidth(context) * 0.8,
                  height: screenHeight(context) * 0.08,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 228, 211, 62),
                        Colors.deepOrange,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: OutlinedButton(
                    onPressed: () async {
                      await showModalBottomSheet(
                        barrierColor: Colors.red.withOpacity(0.2),
                        context: context,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.38,
                          minWidth: double.infinity,
                        ),
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Text('Sign in', style: Theme.of(context).textTheme.headline4),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    controller: _emailController,
                                    validator: (value) {
                                      final expression = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                                      if (!expression.hasMatch(value!)) {
                                        return "The email is invalid.";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "joe@example.com",
                                      label: const Text("Email"),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    obscuringCharacter: "*",
                                    validator: (value) {
                                      if (value!.length < 6) {
                                        return "Password is too short!";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "* * * * * *",
                                      label: const Text("Password"),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 20.0),
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            minimumSize:
                                                Size(MediaQuery.of(context).size.width * 0.4, 50),
                                            backgroundColor: Colors.black,
                                          ),
                                          onPressed: () async {
                                            if (_formKey.currentState!.validate()) {
                                              await context
                                                  .read<AuthController>()
                                                  .loginWithEmailAndPassword(
                                                    email: _emailController.text,
                                                    password: _passwordController.text,
                                                  );

                                              if (context.read<AuthController>().appUser == null) {
                                                Navigator.of(context)
                                                    .pushReplacementNamed(AppRouter.onboarding);
                                              } else {
                                                Navigator.of(context)
                                                    .pushReplacementNamed(AppRouter.dashboard);
                                              }
                                            }
                                          },
                                          child: const Text(
                                            'Sign In',
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      // Navigator.pushNamed(
                      //   context,
                      //   AppRouter.dashboard,
                      // );
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
