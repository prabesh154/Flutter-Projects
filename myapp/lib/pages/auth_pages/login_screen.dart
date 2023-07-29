import 'package:flutter/material.dart';
import 'package:myapp/consts/consts.dart';
import 'package:myapp/pages/home_screen/home_screen.dart';

// s
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username cannot be empty';
    } else if (value.length < 4) {
      return 'Username should be at least 4 characters long';
    } else if (!value.contains(RegExp(r'\d'))) {
      return 'Username should contain at least one number';
    }
    return null;
  }

  //Validate Password
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 7) {
      return 'Password should be at least 7 characters long';
    } else if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password should contain at least one uppercase letter';
    } else if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password should contain at least one lowercase letter';
    } else if (!value.contains(RegExp(r'\d'))) {
      return 'Password should contain at least one number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Instagram',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: billabong,
                      height: 4,
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: usernameController,
                    validator: validateUsername,
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: passwordController,
                    validator: validatePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Login Success"),
                          ),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                            //  HomeScreen(userName: usernameController.text),
                          ),
                        );
                      }
                    },
                    child: Container(
                      color: const Color.fromARGB(255, 54, 154, 236),
                      width: double.infinity,
                      height: 35,
                      alignment: Alignment.center,
                      child: const Text(
                        'Log in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 121, 119, 119),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('OR'),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 121, 119, 119),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.facebook,
                          color: Colors.blue,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Login With Facebook',
                          style: TextStyle(
                            color: Color.fromARGB(255, 5, 117, 209),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text('Forget Password? '),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 121, 119, 119),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            // Handle Signup button press
                          },
                          child: const Text(
                            'Signup',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
