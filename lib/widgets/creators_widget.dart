import 'package:flutter/material.dart';

class CreatorsCardSection extends StatefulWidget {
  const CreatorsCardSection({super.key});
  @override
  State<CreatorsCardSection> createState() => _CreatorsCardSectionState();
}

class _CreatorsCardSectionState extends State<CreatorsCardSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,

      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.fromRGBO(46, 41, 61, 1), // Dark background
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Top Creators",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(color: Colors.white60, fontSize: 12),
                      ),
                      Text(
                        "Artworks",
                        style: TextStyle(color: Colors.white60, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 40),
                Text(
                  "Rating",
                  style: TextStyle(color: Colors.white60, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Static list (you can use ListView.builder if dynamic)
          _creatorRow("assets/user_1.jpg", "@maddison_c21", "9821"),
          _creatorRow("assets/user_2.jpg", "@karl.will02", "7032"),
          _creatorRow("assets/user_1.jpg", "@maddison_c21", "9821"),
          _creatorRow("assets/user_1.jpg", "@maddison_c21", "9821"),
        ],
      ),
    );
  }

  Widget _creatorRow(String imgPath, String username, String artworks) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(imgPath),
                      radius: 14,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      username,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),

                Text(
                  artworks,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(width: 40),
          Container(
            width: 50,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black26,
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.8, // adjust per rating
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF7B61FF), Color(0xFF957DFF)],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
