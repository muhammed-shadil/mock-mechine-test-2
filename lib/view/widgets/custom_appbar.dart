import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize:
          const Size.fromHeight(100.0), // Adjust the height as needed
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1B1B2F), // Background color similar to your design
          // Adjust the radius for rounding corners
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: const Color.fromARGB(255, 90, 89, 89))),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 12,
                  ),
                  onPressed: () {
                    // Add your back button action here
                  },
                ),
              ),
              const Text(
                'Revenue Flow',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: const Color.fromARGB(255, 94, 89, 89))),
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 15,
                  ),
                  onPressed: () {
                    // Add your menu button action here
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
