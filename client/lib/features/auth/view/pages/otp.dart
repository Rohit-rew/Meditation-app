import 'package:client/core/layout.dart';
import 'package:client/widgets/button.dart';
import 'package:client/features/auth/view/widgets/otp_text_field.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  final _controller3 = TextEditingController();
  final _controller4 = TextEditingController();

  List<int> otp = [];

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text("Verify Phone"),
          const SizedBox(
            height: 10,
          ),
          const Text("Code has been sent to 9821443242"),
          const SizedBox(
            height: 20,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: OTPInput(
              controller1: _controller1,
              controller2: _controller2,
              controller3: _controller3,
              controller4: _controller4,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Didn't get the OTP"),
          const SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {},
            child: const Text("Resend code"),
          ),
          const SizedBox(
            height: 50,
          ),
          MyButton(
            onTap: () {
              otp.add(int.parse(_controller1.value.text));
              otp.add(int.parse(_controller2.value.text));
              otp.add(int.parse(_controller3.value.text));
              otp.add(int.parse(_controller4.value.text));

              print(otp);
              otp = [];

              // func goes here
            },
            label: "Submit",
          )
        ],
      ),
    );
  }
}
