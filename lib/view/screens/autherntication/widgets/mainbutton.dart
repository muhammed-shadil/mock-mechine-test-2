// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mock_mechine_test2/utils/constants.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    // required this.buttontext,
    this.onpressed,
    this.child,
  }) : super(key: key);
  // final String? buttontext;
  final Function()? onpressed;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: constants.secodarycolor,
        ),
        child: child,
      ),
    );
  }
}
