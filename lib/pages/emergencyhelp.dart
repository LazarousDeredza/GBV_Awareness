import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyHelpPage extends StatelessWidget {
  const EmergencyHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f4ff),

      appBar: AppBar(title: const Text("Emergency Help"), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xffd00000), Color(0xffff4d6d)],
                ),

                borderRadius: BorderRadius.circular(25),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.emergency, color: Colors.white, size: 50),

                  SizedBox(height: 15),

                  Text(
                    "Emergency Support",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "If you are in immediate danger, contact emergency services or a trusted person nearby.",
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
              "Emergency Contacts",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            emergencyTile(
              icon: Icons.local_police,
              title: "Kenya Police Emergency",
              subtitle: "Call 999 or 112",
              color: Colors.blue,
              phoneNumber: "999",
            ),

            emergencyTile(
              icon: Icons.health_and_safety,
              title: "National GBV Hotline",
              subtitle: "1195 (Toll Free)",
              color: Colors.purple,
              phoneNumber: "1195",
            ),

            emergencyTile(
              icon: Icons.local_hospital,
              title: "Ambulance Services",
              subtitle: "Call 911",
              color: Colors.green,
              phoneNumber: "911",
            ),

            const SizedBox(height: 30),

            // SAFETY TIPS
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
                      Icon(Icons.shield, color: Colors.orange),

                      SizedBox(width: 10),

                      Text(
                        "Safety Tips",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  safetyTip("Share your location with someone you trust."),

                  safetyTip("Keep emergency contacts easily accessible."),

                  safetyTip("Move to a safe public place if threatened."),

                  safetyTip(
                    "Seek medical attention immediately after violence.",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // HELP MESSAGE
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.purple.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.favorite, color: Colors.purple, size: 35),

                  SizedBox(width: 15),

                  Expanded(
                    child: Text(
                      "You are not alone. Help is available and your safety matters. Reach out to trusted support services and people around you.",
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget emergencyTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required String phoneNumber,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: ListTile(
        contentPadding: const EdgeInsets.all(15),

        leading: CircleAvatar(
          radius: 25,
          backgroundColor: color.withOpacity(0.1),

          child: Icon(icon, color: color),
        ),

        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(subtitle),
        ),

        trailing: IconButton(
          icon: const Icon(Icons.call, color: Colors.green),

          onPressed: () async {
            final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

            if (await canLaunchUrl(phoneUri)) {
              await launchUrl(phoneUri);
            }
          },
        ),
      ),
    );
  }
}

class safetyTip extends StatelessWidget {
  final String text;

  const safetyTip(this.text, {super.key});

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
