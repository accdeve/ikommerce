import 'package:flutter/material.dart';
import 'package:ikommerce/ui/widgets/button_widget.dart';
import 'package:ikommerce/ui/widgets/text_field_widget.dart';
import 'package:ikommerce/utils/colors.dart';
import 'package:ikommerce/utils/typography.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: const BoxDecoration(
                        color: primaryLight,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text("Login", style: poppinsHeading28Bold),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const CustomTextField(
                  inputType: InputType.email, hintText: 'Email'),
              const SizedBox(height: 8),
              const CustomTextField(
                  inputType: InputType.password, hintText: 'Password'),
              const SizedBox(height: 20),
              CustomButton.contained(
                label: "Login",
                onPressed: () {},
              ),
              const SizedBox(height: 8),
              const Text.rich(
                textAlign: TextAlign.start,
                TextSpan(
                  text: "Don’t have an account? ",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w300, // Light
                  ),
                  children: [
                    TextSpan(
                      text: "Register",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w500, // Medium
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
