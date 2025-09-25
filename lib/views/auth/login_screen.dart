import 'package:flutter/material.dart';
import 'package:owala_app/utils/const.dart';
import 'package:owala_app/utils/validators.dart';
import 'package:owala_app/views/auth/components/auth_button.dart';
import 'package:owala_app/views/auth/components/auth_form_field.dart';
import 'package:owala_app/views/auth/components/social_auth_button.dart';


class LoginScreen extends StatelessWidget {
  // fungsinya untuk memanggil sebuah validator dari setiap form
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Image.asset(
              "assets/images/logo_sidu.png",
              height: 140,
            ),
            SizedBox(height: 20,),
            // Text(
            //   "Here We Go!!",
            //   style: TextStyle(
            //     fontSize: 32,
            //     fontWeight: FontWeight.bold,
            //     color: textColor
            //   ),
            // ),
            SizedBox(height: 10),
            Text(
              "Login dulu, biar semua barang yang kamu mau ada, jadi ngga cuma angan angan",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: textColor,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthFormField(
                    controller: _emailController,
                    label: "Email",
                    hintText: "Enter your Email",
                    validator: Validators.validateEmail,
                  ),
                  SizedBox(height: 20),
                  AuthFormField(
                    controller: _passwordController,
                    label: "Password",
                    hintText: "Enter your Password",
                    obscureText: true,
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: textColor,
                      ),
                    validator: Validators.validatePassword,
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {}, 
                      child: Text("forgot Password?")
                      ),
                  ),
                  SizedBox(height: 20),
                  AuthButton(
                    text: "sign in", 
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, '/catalogue');
                      }
                    }, 
                    textColor: Colors.white, 
                    backgroundColor: primaryColor,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Color(0xFF3B5B8A),
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "or",
                            style: TextStyle(
                              color: textColor,
                              ),
                            ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: Color(0xFF3B5B8A),
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    SocialAuthButton(
                      assetIcon: "assets/icons/google_logo.svg", 
                      label: "Sign in with Google", 
                      backgroundColor: Colors.white, 
                      foregroundColor: Colors.black,
                      onPressed: () {},
                      ),
                      SizedBox(height: 20),
                    SocialAuthButton(
                      assetIcon: "assets/icons/apple_logo.svg", 
                      label: "Sign in with Apple", 
                      backgroundColor: Colors.black, 
                      foregroundColor: Colors.white,
                      onPressed: () {},
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: 
                            TextStyle(
                              color: textColor
                            ),
                          ),
                          TextButton(
                          onPressed: () => Navigator.pushNamed(context, '/register'),
                          child: Text("Register"),
                          )
                        ],
                      )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}