import 'package:client/core/layout.dart';
import 'package:client/features/auth/view/widgets/Phone_input_field.dart';
import 'package:client/widgets/button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(child: Image.asset("assets/logicon.gif")),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                textAlign: TextAlign.left,
                "Enter Your Phone Number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const Text(
                "We will send you 4 digit verification code to register or login",
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
              ),
              const SizedBox(
                height: 15,
              ),
              PhoneInputField(
                controller: phoneController,
              ),
              const SizedBox(
                height: 15,
              ),
              MyButton(
                label: "Generate OTP",
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
