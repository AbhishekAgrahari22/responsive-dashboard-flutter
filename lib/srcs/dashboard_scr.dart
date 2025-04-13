import 'package:flutter/material.dart';
import 'package:office_dashboard/responsive/resposive.dart';
import 'package:office_dashboard/widgets/anniversary_widget.dart';
import 'package:office_dashboard/widgets/birthday_widget.dart';
import 'package:office_dashboard/widgets/calender_widget.dart';
import 'package:office_dashboard/widgets/creators_widget.dart';
import 'package:office_dashboard/widgets/intro_widget.dart';
import 'package:office_dashboard/widgets/performance_widget.dart';
import 'package:office_dashboard/widgets/project_widget.dart';
import 'package:office_dashboard/widgets/sidebar_widget.dart';
import 'package:office_dashboard/widgets/top_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 242, 240, 1),
      body: ResponsiveLayout(
        mobile: _buildResponsiveContent(),
        tablet: _buildResponsiveContent(),
        desktop: Row(
          children: [
            const Expanded(flex: 2, child: Sidebar()),
            Expanded(flex: 7, child: _buildResponsiveContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 1000;

        if (isWideScreen) {
          return Column(
            children: [
              const TopBar(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 2,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: const [
                            IntroCardSection(),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(flex: 3, child: ProjectCardSection()),
                                SizedBox(width: 16),
                                Expanded(flex: 2, child: CreatorsCardSection()),
                              ],
                            ),
                            SizedBox(height: 16),
                            StatChart(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: const Color.fromRGBO(46, 41, 61, 1),
                          child: Column(
                            children: const [
                              SizedBox(height: 16),
                              Text(
                                "GENERAL 10:00 AM TO 7:00 PM",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              CalendarWidget(),
                              SizedBox(height: 16),
                              BirthdayCard(),
                              SizedBox(height: 16),
                              AnniversaryCard(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                TopBar(),
                SizedBox(height: 16),
                IntroCardSection(),
                SizedBox(height: 16),
                ProjectCardSection(),
                SizedBox(height: 16),
                CreatorsCardSection(),
                SizedBox(height: 16),
                StatChart(),
                SizedBox(height: 16),
                Text(
                  "GENERAL 10:00 AM TO 7:00 PM",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12),
                CalendarWidget(),
                SizedBox(height: 16),
                BirthdayCard(),
                SizedBox(height: 16),
                AnniversaryCard(),
              ],
            ),
          );
        }
      },
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:office_dashboard/widgets/anniversary_widget.dart';
// import 'package:office_dashboard/widgets/birthday_widget.dart';
// import 'package:office_dashboard/widgets/calender_widget.dart';
// import 'package:office_dashboard/widgets/creators_widget.dart';
// import 'package:office_dashboard/widgets/intro_widget.dart';
// import 'package:office_dashboard/widgets/performance_widget.dart';
// import 'package:office_dashboard/widgets/project_widget.dart';
// import 'package:office_dashboard/widgets/sidebar_widget.dart';
// import 'package:office_dashboard/widgets/top_widget.dart';

// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(242, 242, 240, 1),
//       body: Row(
//         children: [
//           const Expanded(flex: 2, child: Sidebar()),
//           Expanded(
//             flex: 7,
//             child: Column(
//               children: [
//                 const TopBar(),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 2,
//                     ),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Left column - project info
//                         Expanded(
//                           flex: 5,
//                           child: Column(
//                             children: const [
//                               IntroCardSection(),
//                               SizedBox(height: 16),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 3,
//                                     child: ProjectCardSection(),
//                                   ),
//                                   SizedBox(width: 16),
//                                   Expanded(
//                                     flex: 2,
//                                     child: CreatorsCardSection(),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 16),
//                               StatChart(),
//                             ],
//                           ),
//                         ),
//                         // Right column - calendar and birthdays
//                         const SizedBox(width: 16),
//                         Expanded(
//                           flex: 2,
//                           child: Container(
//                             color: Color.fromRGBO(46, 41, 61, 1),
//                             child: Column(
//                               children: [
//                                 SizedBox(height: 16),
//                                 Text(
//                                   "GENERAL 10:00 AM TO 7:00 PM",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 CalendarWidget(),
//                                 SizedBox(height: 16),
//                                 BirthdayCard(),
//                                 SizedBox(height: 16),
//                                 AnniversaryCard(),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
