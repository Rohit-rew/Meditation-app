import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For input formatters

class OTPInput extends StatefulWidget {
  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;
  final TextEditingController controller4;

  const OTPInput({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.controller3,
    required this.controller4,
  });

  @override
  _OTPInputState createState() => _OTPInputState();
}

class _OTPInputState extends State<OTPInput> {
  // Controllers for the 4 text fields

  // Focus nodes for the text fields to control focus
  final _focusNode1 = FocusNode();
  final _focusNode2 = FocusNode();
  final _focusNode3 = FocusNode();
  final _focusNode4 = FocusNode();

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    super.dispose();
  }

  void _nextField({required String value, required FocusNode nextFocusNode}) {
    if (value.length == 1) {
      nextFocusNode.requestFocus(); // Move focus to the next field
    }
  }

  void _previousField(
      {required String value,
      required FocusNode prevFocusNode,
      required TextEditingController currentController}) {
    if (value.isEmpty) {
      prevFocusNode.requestFocus(); // Move focus to the previous field
      currentController.clear(); // Clear the current field
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildOTPField(widget.controller1, _focusNode1, _focusNode2),
        _buildOTPField(
            widget.controller2, _focusNode2, _focusNode3, _focusNode1),
        _buildOTPField(
            widget.controller3, _focusNode3, _focusNode4, _focusNode2),
        _buildOTPField(widget.controller4, _focusNode4, null, _focusNode3),
      ],
    );
  }

  // Function to build each individual OTP field
  Widget _buildOTPField(
      TextEditingController controller,
      FocusNode currentFocusNode,
      FocusNode? nextFocusNode, // Can be null if it's the last field
      [FocusNode? prevFocusNode] // Previous field, if provided
      ) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        autofocus: true,
        showCursor: false,
        controller: controller,
        focusNode: currentFocusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 24),
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '', // Remove the bottom counter
          border: OutlineInputBorder(),
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        onChanged: (value) {
          if (value.isNotEmpty && nextFocusNode != null) {
            _nextField(value: value, nextFocusNode: nextFocusNode);
          }

          if (value.isEmpty && prevFocusNode != null) {
            _previousField(
                value: value,
                prevFocusNode: prevFocusNode,
                currentController: controller);
          }
        },
        onFieldSubmitted: (_) {
          if (nextFocusNode != null) {
            nextFocusNode.requestFocus();
          }
        },
        onTap: () {
          controller.clear(); // Clear field when focused
        },
        onEditingComplete: () {
          // Manually switch focus if needed
          if (nextFocusNode != null) {
            nextFocusNode.requestFocus();
          }
        },
      ),
    );
  }
}
