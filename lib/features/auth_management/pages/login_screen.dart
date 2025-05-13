import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gs_demo/common/widgets/input_field_wrapper.dart';
import 'package:gs_demo/common/widgets/loading_alert.dart';
import 'package:gs_demo/core/functions/form_validator.dart';
import 'package:gs_demo/features/auth_management/pages/forgot_password.dart';
import 'package:gs_demo/features/auth_management/provider/auth_providers.dart';
import 'package:provider/provider.dart';

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
  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login with Email',
                style: TextStyle( fontSize: 18),
              ),
              SizedBox(height: 10),
              InputFieldWrapper(
                child: TextFormField(
                  controller: emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty)
                      return 'Email is required';
                    if (!isValidateEmail(value)) return 'Enter a valid email';
                    return null;
                  },
                ),
              ),
              SizedBox(height: 10),
              InputFieldWrapper(
                child: TextFormField(
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
                  validator: (value) {
                    if (value == null || value.trim().isEmpty)
                      return 'Password is required';
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (context) => ForgotPasswordDialog(),
                  );
                },
                child: Text('Forgot Password ?',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) return;
                  showLoadingDialog(context);
                  try {
                    await auth.loginUser(
                        emailCtrl.text.trim(), passwordCtrl.text.trim());
                  }
                  catch (e) {
                    hideLoadingDialog(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${e.toString()}")),
                    );
                  }
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
                onTap: (){
                  context.go('/register');
                },
                child: Text('Sign Up',style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
