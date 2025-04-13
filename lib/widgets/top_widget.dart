import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Left side text
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(169, 169, 167, 1),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ), // Icon on the right
                          filled: true,
                          fillColor: const Color.fromRGBO(46, 41, 61, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 60),
                    Image.asset(
                      'assets/doc_notify.png',
                      height: 26,
                      width: 26,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 35),
                    Image.asset(
                      'assets/notification.png',
                      height: 26,
                      width: 26,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 35),
                    Image.asset(
                      'assets/logout.png',
                      height: 26,
                      width: 26,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 100),
                    Image.asset(
                      'assets/profile_icon.png',
                      height: 26,
                      width: 26,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
