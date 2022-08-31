import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset('assets/images/login_image.png',
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 40,
          ),
          const Text("Welcome",
            style:
            TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),    // const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Enter Username",
                      labelText: "Username"
                  ),
                ),

                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password"
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    child: Text("Login"),
                    // style: TextButton.styleFrom(),
                    onPressed: () {
                      print("Hello Risshab");
                    },
                )
              ],

            ),
          )

        ],
      )
    );
  }
}
