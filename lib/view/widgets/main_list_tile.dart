// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainListTile extends StatelessWidget {
  const MainListTile({
    super.key,
    required this.centerNumber,
    required this.countries,
    required this.exchangerate,
    required this.lastupdate,
  });
  final int centerNumber;
  final String countries;
  final double exchangerate;
  final DateTime lastupdate;

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('MM/dd').format(lastupdate);

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 47, 46, 77),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 94, 47, 84),
                radius: 26,
                child: Icon(
                  Icons.currency_exchange,
                  color: Color.fromARGB(255, 255, 9, 109),
                  size: 20,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    countries.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 184, 183, 183)),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "${exchangerate * centerNumber}",
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
