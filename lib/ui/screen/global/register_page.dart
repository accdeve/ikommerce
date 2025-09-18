import 'package:flutter/material.dart';
import 'package:ikommerce/ui/widgets/button_widget.dart';
import 'package:ikommerce/ui/widgets/text_field_widget.dart';
import 'package:ikommerce/utils/typography.dart';
import 'package:ikommerce/utils/utils_barrel.dart';

void main() {
  runApp(const MaterialApp(
    home: RegisterPage(),
  ));
}

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
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
                    child: Text("Register", style: poppinsHeading28Bold),
                  ),
                  const SizedBox(height: 44),
                  const CustomTextField(
                      inputType: InputType.email, hintText: 'Email'),
                  const CustomTextField(
                      inputType: InputType.text, hintText: 'Name'),
                  const CustomTextField(
                      inputType: InputType.text, hintText: 'Username'),
                  const CustomTextField(
                      inputType: InputType.password, hintText: 'Password'),
                  const CustomTextField(
                      inputType: InputType.password,
                      hintText: 'Confirm Password'),
                  const SizedBox(height: 32),
                  CustomButton.contained(
                    label: "Register",
                    onPressed: () {},
                  ),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      text: "Have an account? ",
                      style: poppinsBody12Light,
                      children: [
                        TextSpan(text: "Login", style: poppinsBody12Medium),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
