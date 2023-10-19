import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final int index;
  final String imagePath;
  final String text;

  const MyContainer({
    super.key,
    required this.index,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Handle container press
          },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(76, 175, 80, 1),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(imagePath, width: 100, height: 120)),
              ],
            ),
          ),
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 16, color: Colors.black, fontFamily: 'Poppins'),
        ),
      ],
    );
  }
}
