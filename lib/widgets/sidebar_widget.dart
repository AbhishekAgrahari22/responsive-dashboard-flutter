// lib/src/widgets/sidebar.dart
import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> navItems = [
    {"icon": Icons.home, "label": "Home"},
    {"icon": Icons.people, "label": "Employees"},
    {"icon": Icons.schedule, "label": "Attendance"},
    {"icon": Icons.calendar_month, "label": "Summary"},
    {
      "icon": Icons.info_outline,
      "label": "Information",
      "isImage": true,
      "imagePath": "assets/alert.png",
    },
    {"icon": Icons.settings, "label": "Settings"},
    {"icon": Icons.logout, "label": "Logout"},
  ];

  @override
  Widget build(BuildContext context) {
    final topNavItems = navItems.sublist(0, 5);
    final bottomNavItems = navItems.sublist(5);

    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Image.asset(
            'assets/logo.png',
            height: 30,
            width: 60,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Divider(),
          ),
          const SizedBox(height: 16),
          CircleAvatar(
            radius: 36,
            backgroundColor: const Color.fromRGBO(221, 176, 82, 1),
            child: const CircleAvatar(
              radius: 34,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Guddi Yadav",
            style: TextStyle(fontSize: 9, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 6),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              minimumSize: const Size(60, 27),
              elevation: 0,
              side: const BorderSide(
                width: 2,
                color: Color.fromRGBO(190, 183, 235, 1),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.zero,
            ),
            child: const Text(
              "Admin",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 8, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Divider(),
          ),

          // Top nav items
          ...List.generate(topNavItems.length, (index) {
            final item = topNavItems[index];
            return item["isImage"] == true
                ? _buildImageNavItem(item["imagePath"], item["label"], index)
                : _buildNavItem(item["icon"], item["label"], index);
          }),
          Container(
            height: 60,
            decoration: BoxDecoration(color: Color.fromRGBO(228, 233, 255, 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "WORKSPACE",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Icon(Icons.add, size: 30),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: "Adstacks",
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
                onChanged: (String? newValue) {},
                items: const [
                  DropdownMenuItem(
                    value: "Adstacks",
                    child: Center(child: Text("Adstacks")),
                  ),
                ],
                alignment: Alignment.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: "Finance",
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
                onChanged: (String? newValue) {},
                items: const [
                  DropdownMenuItem(
                    value: "Finance",
                    child: Center(child: Text("Finance")),
                  ),
                ],
                alignment: Alignment.center,
              ),
            ),
          ),
          const Spacer(),

          // Bottom nav items
          ...List.generate(bottomNavItems.length, (index) {
            final actualIndex = index + topNavItems.length;
            final item = bottomNavItems[index];
            return _buildNavItem(item["icon"], item["label"], actualIndex);
          }),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 6, bottom: 6, left: 0),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? const Color.fromRGBO(242, 242, 240, 1)
                  : Colors.transparent,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(30),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(width: 80),
            Icon(icon, color: const Color(0xFF0A0E21), size: 20),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                color: const Color(0xFF0A0E21),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageNavItem(String imagePath, String label, int index) {
    final bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 6, bottom: 6, left: 0),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? const Color.fromRGBO(242, 242, 240, 1)
                  : Colors.transparent,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(30),
          ),
        ),
        child: Center(
          child: Row(
            children: [
              const SizedBox(width: 80),
              Image.asset(imagePath, height: 17, width: 17),
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
                  color: const Color(0xFF0A0E21),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
