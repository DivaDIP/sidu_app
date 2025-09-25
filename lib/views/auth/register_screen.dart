import 'package:flutter/material.dart';
import 'package:sidu_app/utils/const.dart';
import 'package:sidu_app/utils/validators.dart';
import 'package:sidu_app/views/auth/components/auth_button.dart';
import 'package:sidu_app/views/auth/components/auth_form_field.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           SizedBox(height: 50,),
            Image.asset(
              "assets/images/logo_sidu.png",
              height: 140,
            ),
            SizedBox(height: 10,),
          // Text(
          //   "Register",
          //   style: TextStyle(
          //     color: textColor,
          //     fontSize: 32,
          //     fontWeight: FontWeight.bold
          //   ),
          // ),
          SizedBox(height: 8),
          Text(
            "Buat akunmu dan mulai jelajahi sekarang!",
            style: TextStyle(
                fontSize: 14,
                color: textColor,
                fontWeight: FontWeight.w500
              ),
          ),
          SizedBox(height: 30),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthFormField(
                  controller: _nameController,
                  label: "Full name",
                  hintText: "Enter your full name",
                  validator: Validators.validateFullName,
                ),
                SizedBox(height: 20,),
                AuthFormField(
                  controller: _emailController,
                  label: "Email",
                  hintText: "Enter your email",
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.validateEmail,
                ),
                SizedBox(height: 20,),
                AuthFormField(
                  controller: _passwordController,
                  label: "Password",
                  hintText: "Enter your password",
                  obscureText: true,
                  suffixIcon: Icon(Icons.visibility_off, color: Color(0xFF3B5B8A)),
                  validator: Validators.validatePassword,
                ),
                SizedBox(height: 20,),
                AuthFormField(
                  controller: _confirmPasswordController,
                  label: "Confirm Password",
                  hintText: "Confirm your password",
                  obscureText: true,
                  suffixIcon: Icon(Icons.visibility_off, color: Color(0xFF3B5B8A)),
                  validator: (value) => Validators.validateConfirmPassword(
                    value,
                    _passwordController.text
                  ),
                ),
                SizedBox(height: 50,),
                AuthButton(
                  text: "Sign up",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacementNamed(context, '/catalogue');
                    }
                  },
                  backgroundColor: primaryColor,
                  textColor: Colors.white,
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: textColor
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/login'),
                      child: Text("Sign in"),
                    )
                  ],
                )
              ],
            ),
          )
        ],
        ),
      ),
    );
  }
}