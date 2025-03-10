import 'package:flutter/material.dart';
import 'package:insta_clone/auth/screens/signup.dart';
import 'package:insta_clone/auth/widgets/custom_textfield.dart';
import 'package:insta_clone/home/screens/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 15,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("English "),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  height: 50,
                  image: AssetImage("assets/images/logo_no_bg.png"),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePageView(),
                    ),
                  );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  child: Text(
                    "Continue with facebook",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Divider(
                    endIndent: 15,
                    indent: 15,
                  ),
                  Center(
                    child: Container(
                      color: Colors.white,
                      width: 50,
                      child: Text(
                        "or",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
              CustomTextfield(content: "phone number / username, email"),
              CustomTextfield(content: "password"),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePageView(),
                    ),
                  );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  child: Text(
                    "Login",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: "Sign up",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              Text("From Finest coders"),
            ],
          ),
        ),
      ),
    );
  }
}
