import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();

  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login with Email',
              style: TextStyle( fontSize: 18),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4, // Set the elevation here
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  6,
                ),
              ),
              child: TextField(
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4, // Set the elevation here
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  6,
                ), // Optional: Rounded corners
              ),
              child: TextField(
                obscureText: _isObscured,
                controller: passwordCtrl,
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured =
                            !_isObscured; // Toggle the visibility state
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              child: Text('Forgot Password ?',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),),
            ),
            SizedBox(height: 20,),
            ElevatedButton(

              onPressed: () async {
              },
              child: Text("Login"),
            ),
            SizedBox(height: 20,),
            InkWell(
              child: Text('Don\'t have an account',style: TextStyle(
                  fontSize: 18,
              ),),
            ),
            SizedBox(height: 5,),
            InkWell(
              child: Text('Sign Up',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
