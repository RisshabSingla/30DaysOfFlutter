import 'package:android_studio_projects/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// use _ in-front of the name inorder to specify it as private

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          // Inorder to scroll if size is too big for screen
          child: Column(
            children: [
              Image.asset(
                'assets/images/login_image.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Welcome $name",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                // const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                      onChanged:
                          (value) // returns what is entered in the form of string
                          {
                        name = value;
                        setState(() {}); // changes the state
                      },
                    ),

                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                    ),
                    const SizedBox(
                      height: 40,
                    ),

                    InkWell(
                      onTap: () async {
                        setState(() {
                          changeButton = true;
                        });

                        await Future.delayed(const Duration(seconds: 1));
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        // Container is a box and does not have any clickable property
                        width: changeButton ? 75 : 100,
                        height: 50,
                        // color: Colors.deepPurple,  ---> Either give it here or give in decoration
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          // shape: changeButton?BoxShape.circle : BoxShape.rectangle,  ---> Can also be used
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8),
                        ),
                        child: changeButton
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                      ),
                    ),

                    // ElevatedButton(
                    //     style: TextButton.styleFrom(
                    //       minimumSize: const Size(100,50)
                    //     ),
                    //     onPressed: () {
                    //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //     },
                    //     child: const Text("Login"),
                    // )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
