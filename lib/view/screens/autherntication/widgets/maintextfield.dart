import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mock_mechine_test2/utils/constants.dart';

class MainTextfield extends StatelessWidget {
  const MainTextfield(
      {super.key,
      required this.preicon,
      required this.hinttext,
      required this.namefield,
      required this.keyboard,
      required this.validator,
      this.controller});
  final IconData preicon;
  final String hinttext;
  final String namefield;
  final TextInputType keyboard;
  final TextEditingController? controller;
  final String? Function(dynamic value) validator;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(namefield),
          ),
          TextFormField(
            textInputAction: TextInputAction.next,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'\s')),
            ],
            controller: controller,
            validator: validator,
            keyboardType: keyboard,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: const TextStyle(color: constants.white),
            decoration: InputDecoration(
              errorMaxLines: 3,
              contentPadding: const EdgeInsets.all(10),
              hintText: hinttext,
              hintStyle: styles.textfieldhintstyle,
              prefixIcon: Icon(
                preicon,
                color: constants.secodarycolor,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
              fillColor: constants.fillcolor,
              filled: true,
            ),
          )
        ],
      ),
    );
  }
}
