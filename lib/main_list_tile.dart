import 'package:flutter/material.dart';

class MainListTile extends StatelessWidget {
  const MainListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10, left: 5, right: 5),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 47, 46, 77),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 94, 47, 84),
                radius: 26,
                child: Icon(
                  Icons.currency_exchange,
                  color: Color.fromARGB(255, 255, 9, 109),
                  size: 20,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "data",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "sssss",
                    style: TextStyle(color: Color.fromARGB(255, 184, 183, 183)),
                  ),
                ],
              ),
            ],
          ),
          Text(
            "data",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
