import 'package:flutter/material.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);
  final void Function() onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 260,
          decoration: BoxDecoration(
              color: Colors.greenAccent,
              border: Border.all(color: Colors.green, width: 1.4),
              borderRadius: BorderRadius.circular(10)),
          child: label == "Next"
              ? Padding(
                  padding: const EdgeInsets.only(left: 102, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(fontSize: 20),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: Text(
                    "Start trading",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
        ),
      ),
    );
  }
}
