import 'package:client/core/theme/app_pallet.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;

  Function onTap;
  MyButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
        decoration: BoxDecoration(
          gradient: Pallet.gradient1,
          borderRadius: BorderRadius.circular(5.0), // Optional rounded corners
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
