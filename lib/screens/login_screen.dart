import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/student_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Email Input
  TextEditingController emailController = TextEditingController();

  // Password Input
  TextEditingController passwordController = TextEditingController();

  // Remember Me
  bool rememberMe = false;

  // Password Show/Hide
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [
                const SizedBox(height: 50),

                const Icon(Icons.school, size: 100, color: Colors.deepPurple),

                const SizedBox(height: 20),

                const Text(
                  "Welcome Back!",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Text("Sign in to continue"),

                const SizedBox(height: 30),

                TextField(
                  controller: emailController,

                  decoration: const InputDecoration(
                    labelText: "Email",

                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 15),

                TextField(
                  controller: passwordController,

                  obscureText: obscureText,

                  decoration: InputDecoration(
                    labelText: "Password",

                    border: const OutlineInputBorder(),

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },

                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,

                      onChanged: (value) {
                        setState(() {
                          rememberMe = value ?? false;
                        });
                      },
                    ),

                    const Text("Remember Me"),
                  ],
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,

                  height: 55,

                  child: ElevatedButton(
                    onPressed: () async {
                      /// Email Empty Check
                      if (emailController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please Enter Email")),
                        );
                        return;
                      }

                      /// Email Format Check
                      if (!emailController.text.contains("@gmail.com")) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please Enter Valid Email"),
                          ),
                        );

                        return;
                      }

                      /// Password Empty Check
                      if (passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please Enter Password"),
                          ),
                        );

                        return;
                      }
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool("isLoggedIn", rememberMe);
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => interFace()),
                      );
                    },

                    child: const Text("LOGIN"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
