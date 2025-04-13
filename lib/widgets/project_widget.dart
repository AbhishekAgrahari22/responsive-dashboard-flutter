import 'package:flutter/material.dart';

class ProjectCardSection extends StatefulWidget {
  const ProjectCardSection({super.key});
  @override
  State<ProjectCardSection> createState() => _ProjectCardSectionState();
}

class _ProjectCardSectionState extends State<ProjectCardSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      decoration: BoxDecoration(
        color: Color.fromRGBO(46, 41, 61, 1),
        border: Border.all(color: Color.fromRGBO(180, 144, 147, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              "All Projects",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
          _buildCardDesign(
            imgpath: 'assets/blockChain_1.jpg',
            color: Colors.redAccent,
            projColor: Color.fromRGBO(46, 41, 61, 1),
          ),
          const SizedBox(height: 8),
          _buildCardDesign(
            imgpath: 'assets/blockChain_2.jpg',
            color: Color.fromRGBO(27, 36, 74, 1),
            projColor: Colors.white,
          ),
          const SizedBox(height: 8),
          _buildCardDesign(
            imgpath: 'assets/blockChain_3.jpg',
            color: Color.fromRGBO(27, 37, 74, 1),
            projColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildCardDesign({
    required String imgpath,
    required Color color,
    required Color projColor,
  }) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imgpath,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Technology behind the Blockchain',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'Project #1',
                        style: TextStyle(
                          fontSize: 12,
                          color: projColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          "•",
                          style: TextStyle(
                            color: Color.fromRGBO(46, 41, 61, 1),
                          ),
                        ),
                      ),
                      Text(
                        'See project details',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.edit, color: Colors.white, size: 18),
          ],
        ),
      ),
    );
  }
}
