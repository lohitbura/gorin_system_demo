import 'package:flutter/material.dart';
import 'package:gs_demo/common/widgets/input_field_wrapper.dart';
import 'package:gs_demo/features/auth_management/provider/auth_providers.dart';
import 'package:gs_demo/resources/colors.dart';
import 'package:provider/provider.dart';

class ForgotPasswordDialog extends StatefulWidget {
  const ForgotPasswordDialog({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordDialogState();
  }
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  void _resetPassword() async {
    final auth = Provider.of<AuthProvider>(context, listen: false);
    setState(() => _isLoading = true);

    try {
      await auth.resetPassword(_emailController.text.trim());
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password reset link sent to your email.")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.colorDEE1ED,
      title: Text("Reset Password"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InputFieldWrapper(
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Enter your email"),

            ),
          ),
          if (_isLoading) Padding(
            padding: const EdgeInsets.only(top: 16),
            child: CircularProgressIndicator(),
          )
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text("Cancel")),
        ElevatedButton(onPressed: _resetPassword, child: Text("Send Reset Email")),
      ],
    );
  }
}