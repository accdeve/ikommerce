import 'package:flutter/material.dart';
import 'package:ikommerce/ui/screen/global/home/home_page.dart';
import 'package:ikommerce/ui/screen/global/register_page.dart';
import 'package:ikommerce/ui/widgets/button_widget.dart';
import 'package:ikommerce/ui/widgets/text_field_widget.dart';
import 'package:ikommerce/utils/colors.dart';
import 'package:ikommerce/utils/extensions.dart';
import 'package:ikommerce/utils/typography.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🔹 Bagian atas (tinggi 1/4 layar)
                      SizedBox(
                        height: height / 5,
                      ),

                      Center(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: primaryLight,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.lock_outline,
                            size: 48,
                            color: primary,
                          ),
                        ),
                      ),

                      // 🔹 Konten Login
                      Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 8),
                            Text("Login",
                                style: poppinsHeading28Bold.copyWith(
                                    color: primary)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      const CustomTextField(
                        inputType: InputType.email,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 8),
                      const CustomTextField(
                        inputType: InputType.password,
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 20),

                      CustomButton.contained(
                        label: "Login",
                        onPressed: () {
                          pushAndRemoveScreen(context,
                              pageRef: const HomePage(isAdmin: false));
                        },
                      ),
                      const SizedBox(height: 8),

                      InkWell(
                        onTap: () {
                          pushScreen(context, const RegisterPage());
                        },
                        child: const Text.rich(
                          TextSpan(
                            text: "Don’t have an account? ",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                            children: [
                              TextSpan(
                                text: "Register",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
