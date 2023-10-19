import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String leftText;
  final String rightButtonText;
  final VoidCallback onRightButtonPressed;
  final String imagePath;

  const CustomContainer({
    super.key,
    required this.leftText,
    required this.rightButtonText,
    required this.onRightButtonPressed,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    //var width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 18,
      width: double.infinity,
      decoration: BoxDecoration(
        // ignore: prefer_const_constructors
        color: Color.fromRGBO(76, 175, 80, 1),
        // rgba(76, 175, 80, 1)
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  leftText,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: onRightButtonPressed,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          5), // Set the border radius here
                    ),
                  ),
                  child: Text(
                    rightButtonText,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'Poppins'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  imagePath,
                  height: 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
