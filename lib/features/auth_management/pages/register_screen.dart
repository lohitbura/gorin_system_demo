import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gs_demo/common/widgets/image_picker_bottom_sheet.dart';
import 'package:gs_demo/common/widgets/loading_alert.dart';
import 'package:gs_demo/features/auth_management/provider/auth_providers.dart';
import 'package:gs_demo/resources/colors.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterScreen();
  }
}

class _RegisterScreen extends State<RegisterScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  final ValueNotifier<String> _image = ValueNotifier<String>('');
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign up with Email',
              style: TextStyle( fontSize: 18),
            ),
            SizedBox(height: 10),
    ValueListenableBuilder(
    valueListenable: _image,
    builder: (context, value, child) {
      return  InkWell(
          onTap: (){
            showModalBottomSheet(
                isDismissible: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) {
                  return ChooseImageOptionBottomSheet(
                      onImageSelect:
                          (String value) {
                        if (value.isNotEmpty) {
                          _image.value = value;
                        }
                        Navigator.pop(context);
                      });
                });
          },
          child: ClipOval(
            child: Image.file(
              File(_image.value),
              width: 90,
              height: 90,
              fit: BoxFit.fill,
              errorBuilder: (context,error,x){
                return Container(
                  width: 90,
                    height: 90,
                  decoration: BoxDecoration(
                    color: AppColor.color7883B4,
                  ),
                  child: Center(child: Icon(Icons.person,size: 30,color: AppColor.colorFFFFFF,),),
                );
              },
            ),
          ),
        );}),
            SizedBox(height: 10,),
            Card(
              elevation: 4, // Set the elevation here
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  6,
                ),
              ),
              child: TextField(
                keyboardType: TextInputType.name,
                controller: nameCtrl,
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
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
                keyboardType: TextInputType.emailAddress,
                controller: emailCtrl,
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
                showLoadingDialog(context, message: "Logging in...");
                String imageUrl = '';
                await auth.registerUser(nameCtrl.text.trim(), emailCtrl.text.trim(), passwordCtrl.text.trim(), imageUrl);
              },
              child: Text("Sign Up"),
            ),
            SizedBox(height: 20,),
            InkWell(
              child: Text('Already have an account',style: TextStyle(
                fontSize: 18,
              ),),
            ),
            SizedBox(height: 5,),
            InkWell(
              onTap: (){
                context.go('/login');
              },
              child: Text('Login',style: TextStyle(
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
