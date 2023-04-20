import 'package:contact_diary/views/screens/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modals/modals.dart';

class introscreen extends StatefulWidget {
  const introscreen({Key? key}) : super(key: key);

  @override
  State<introscreen> createState() => _introscreenState();
}

class _introscreenState extends State<introscreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String errormessge = "";

  final List<User> _users = [
    User("user1", "pass1"),
    User("user2", "pass2"),
    User("user3", "pass3"),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 50,
                  // ),
                  // FlutterLogo(
                  //   size: 230,
                  // ),
                  // SizedBox(
                  //   height: 100,
                  // ),
                  // CircularProgressIndicator(),
                  // SizedBox(
                  //   height: 100,
                  // ),
                  // ElevatedButton(onPressed: () async{
                  //     SharedPreferences prefs = await SharedPreferences.getInstance();
                  //
                  //    await prefs.setBool('IsIntroVisited', true);
                  //    Navigator.of(context).pushReplacementNamed('/');
                  // }, child: Text("GO>>"),),
                  const SizedBox(
                    height: 50,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Username",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline_sharp),
                      hintText: "Type your username",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Username",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),
                      hintText: "Type Your Password",
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot Password ?"),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.blue.shade300,
                                CupertinoColors.systemBlue.withOpacity(0.4),
                                Colors.purpleAccent.shade400,
                                Colors.pink.shade400,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.1, 0.3, 0.6, 0.75]),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Or Sign Up Using"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: Colors.blue,
                        size: 50,
                      ),
                      Icon(
                        Icons.snapchat_outlined,
                        color: Colors.yellow,
                        size: 50,
                      ),
                      Icon(
                        Icons.email_sharp,
                        color: Colors.red,
                        size: 50,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Or Sign Up Using"),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SIGN UP",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // ElevatedButton(
                  //   onPressed: () async {
                  //     // final prefs = await SharedPreferences.getInstance();
                  //     // final username = usernameController.text;
                  //     // final password = passwordController.text;
                  //     // String correctPassword;
                  //     //
                  //     // switch (username) {
                  //     //   case "user1":
                  //     //     correctPassword = "pass1";
                  //     //     break;
                  //     //   case "user2":
                  //     //     correctPassword = "pass2";
                  //     //     break;
                  //     //   case "user3":
                  //     //     correctPassword = "pass3";
                  //     //     break;
                  //     //   default:
                  //     //     correctPassword = "";
                  //     // }
                  //     //
                  //     // if (password == correctPassword) {
                  //     //   await prefs.setString("username", username);
                  //     //   await prefs.setString("password", password);
                  //     //
                  //     //   Navigator.pushReplacement(
                  //     //     context,
                  //     //     MaterialPageRoute(builder: (context) => homepage()),
                  //     //   );
                  //     // } else {
                  //     //   setState(() {
                  //     //     errormessge = "Invalid username or password";
                  //     //   });
                  //     // }
                  //   },
                  //   child: Text("Login"),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
