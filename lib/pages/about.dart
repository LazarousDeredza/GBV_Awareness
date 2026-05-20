// import 'package:flutter/material.dart';

// class AboutPage extends StatelessWidget {
//   const AboutPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xfff6f4ff),

//       appBar: AppBar(
//         title: const Text("About Safe Voice"),
//         centerTitle: true,
//       ),

//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),

//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             // HEADER
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(25),

//               decoration: BoxDecoration(
//                 gradient: const LinearGradient(
//                   colors: [
//                     Color(0xff7b2cbf),
//                     Color(0xff9d4edd),
//                   ],
//                 ),

//                 borderRadius: BorderRadius.circular(25),
//               ),

//               child: const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [

//                   Icon(
//                     Icons.shield,
//                     color: Colors.white,
//                     size: 55,
//                   ),

//                   SizedBox(height: 15),

//                   Text(
//                     "Safe Voice",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   SizedBox(height: 10),

//                   Text(
//                     "Support Against Gender-Based Violence",
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 18,
//                     ),
//                   ),

//                   SizedBox(height: 15),

//                   Text(
//                     "A safe platform designed to help survivors access emergency support, legal guidance, shelters, counseling, and community resources across Kenya.",
//                     style: TextStyle(
//                       color: Colors.white70,
//                       fontSize: 16,
//                       height: 1.5,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             const Text(
//               "What This App Does",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),

//             const SizedBox(height: 20),

//             featureCard(
//               icon: Icons.call,
//               title: "Emergency Assistance",
//               description:
//                   "Provides quick access to emergency contacts, helplines, and protection services.",
//               color: Colors.red,
//             ),

//             featureCard(
//               icon: Icons.report,
//               title: "Report Abuse",
//               description:
//                   "Helps users safely report cases of violence, abuse, or harassment.",
//               color: Colors.orange,
//             ),

//             featureCard(
//               icon: Icons.home,
//               title: "Find Safe Shelters",
//               description:
//                   "Locate nearby shelters and safe recovery centers for protection and support.",
//               color: Colors.purple,
//             ),

//             featureCard(
//               icon: Icons.psychology,
//               title: "Mental Health Support",
//               description:
//                   "Access counseling, emotional support, and mental wellness resources.",
//               color: Colors.green,
//             ),

//             featureCard(
//               icon: Icons.gavel,
//               title: "Legal Guidance",
//               description:
//                   "Learn about rights, legal aid services, and protection options available in Kenya.",
//               color: Colors.blue,
//             ),

//             const SizedBox(height: 30),

//             // MISSION SECTION
//             Container(
//               padding: const EdgeInsets.all(20),

//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),

//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 10,
//                   ),
//                 ],
//               ),

//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [

//                   Row(
//                     children: [

//                       Icon(
//                         Icons.favorite,
//                         color: Colors.purple,
//                       ),

//                       SizedBox(width: 10),

//                       Text(
//                         "Our Mission",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),

//                   SizedBox(height: 20),

//                   Text(
//                     "Safe Voice aims to create a safer and more supportive environment for survivors of gender-based violence by connecting them to life-saving resources, emotional support, and protection services.",
//                     style: TextStyle(
//                       fontSize: 16,
//                       height: 1.7,
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             // HOW IT HELPS
//             Container(
//               padding: const EdgeInsets.all(20),

//               decoration: BoxDecoration(
//                 color: Colors.green.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(20),
//               ),

//               child: const Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [

//                   Row(
//                     children: [

//                       Icon(
//                         Icons.volunteer_activism,
//                         color: Colors.green,
//                       ),

//                       SizedBox(width: 10),

//                       Text(
//                         "How Safe Voice Helps",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),

//                   SizedBox(height: 20),

//                   helpPoint(
//                     "Encourages survivors to seek help safely.",
//                   ),

//                   helpPoint(
//                     "Provides educational information about GBV.",
//                   ),

//                   helpPoint(
//                     "Connects users to emergency services and shelters.",
//                   ),

//                   helpPoint(
//                     "Promotes emotional healing and recovery support.",
//                   ),

//                   helpPoint(
//                     "Raises awareness and community support.",
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             // FOOTER MESSAGE
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),

//               decoration: BoxDecoration(
//                 color: Colors.purple.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(20),
//               ),

//               child: const Text(
//                 "Every voice matters. Everyone deserves safety, dignity, protection, and support.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.w600,
//                   height: 1.6,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//           ],

//         ),
//       ),
//     );
//   }

//   static Widget featureCard({
//     required IconData icon,
//     required String title,
//     required String description,
//     required Color color,
//   }) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 15),

//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),

//       child: Padding(
//         padding: const EdgeInsets.all(18),

//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             CircleAvatar(
//               radius: 25,
//               backgroundColor: color.withOpacity(0.1),

//               child: Icon(
//                 icon,
//                 color: color,
//               ),
//             ),

//             const SizedBox(width: 15),

//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [

//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   const SizedBox(height: 8),

//                   Text(
//                     description,
//                     style: const TextStyle(
//                       height: 1.5,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class helpPoint extends StatelessWidget {
//   final String text;

//   const helpPoint(this.text, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),

//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [

//           const Icon(
//             Icons.check_circle,
//             color: Colors.green,
//             size: 22,
//           ),

//           const SizedBox(width: 10),

//           Expanded(
//             child: Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 15,
//                 height: 1.5,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String appVersion = "";

  @override
  void initState() {
    super.initState();
    loadVersion();
  }

  Future<void> loadVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      appVersion = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f4ff),

      appBar: AppBar(title: const Text("About Safe Voice"), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff7b2cbf), Color(0xff9d4edd)],
                ),

                borderRadius: BorderRadius.circular(25),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.shield, color: Colors.white, size: 55),

                  SizedBox(height: 15),

                  Text(
                    "Safe Voice",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Support Against Gender-Based Violence",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "A safe platform designed to help survivors access emergency support, legal guidance, shelters, counseling, and community resources across Kenya.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "What This App Does",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            featureCard(
              icon: Icons.call,
              title: "Emergency Assistance",
              description:
                  "Provides quick access to emergency contacts, helplines, and protection services.",
              color: Colors.red,
            ),

            featureCard(
              icon: Icons.report,
              title: "Report Abuse",
              description:
                  "Helps users safely report cases of violence, abuse, or harassment.",
              color: Colors.orange,
            ),

            featureCard(
              icon: Icons.home,
              title: "Find Safe Shelters",
              description:
                  "Locate nearby shelters and safe recovery centers for protection and support.",
              color: Colors.purple,
            ),

            featureCard(
              icon: Icons.psychology,
              title: "Mental Health Support",
              description:
                  "Access counseling, emotional support, and mental wellness resources.",
              color: Colors.green,
            ),

            featureCard(
              icon: Icons.gavel,
              title: "Legal Guidance",
              description:
                  "Learn about rights, legal aid services, and protection options available in Kenya.",
              color: Colors.blue,
            ),

            const SizedBox(height: 30),

            // MISSION SECTION
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.purple),

                      SizedBox(width: 10),

                      Text(
                        "Our Mission",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Safe Voice aims to create a safer and more supportive environment for survivors of gender-based violence by connecting them to life-saving resources, emotional support, and protection services.",
                    style: TextStyle(fontSize: 16, height: 1.7),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // HOW IT HELPS
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.volunteer_activism, color: Colors.green),

                      SizedBox(width: 10),

                      Text(
                        "How Safe Voice Helps",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  helpPoint("Encourages survivors to seek help safely."),

                  helpPoint("Provides educational information about GBV."),

                  helpPoint(
                    "Connects users to emergency services and shelters.",
                  ),

                  helpPoint("Promotes emotional healing and recovery support."),

                  helpPoint("Raises awareness and community support."),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // FOOTER MESSAGE
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Text(
                "Every voice matters. Everyone deserves safety, dignity, protection, and support.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  height: 1.6,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const SizedBox(height: 30),

            Center(
              child: Column(
                children: [
                  const Divider(),

                  const SizedBox(height: 10),

                  const Text(
                    "Safe Voice",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "Version $appVersion",
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "© 2026 Safe Voice Kenya",
                    style: TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  static Widget featureCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: Padding(
        padding: const EdgeInsets.all(18),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: color.withOpacity(0.1),

              child: Icon(icon, color: color),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(description, style: const TextStyle(height: 1.5)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class helpPoint extends StatelessWidget {
  final String text;

  const helpPoint(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 22),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
