import 'package:flutter/material.dart';

class KnowYourRightsPage extends StatelessWidget {
  const KnowYourRightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f4ff),

      appBar: AppBar(title: const Text("Know Your Rights"), centerTitle: true),

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
                  colors: [Color(0xff4361ee), Color(0xff4895ef)],
                ),

                borderRadius: BorderRadius.circular(25),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.gavel, color: Colors.white, size: 50),

                  SizedBox(height: 15),

                  Text(
                    "Your Rights Matter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Every person in Kenya has the right to safety, dignity, protection, and justice.",
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
              "Important Rights",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            rightsCard(
              icon: Icons.shield,
              title: "Right to Protection",
              description:
                  "You have the right to be protected from violence, abuse, and harmful treatment.",
              color: Colors.red,
            ),

            rightsCard(
              icon: Icons.balance,
              title: "Right to Justice",
              description:
                  "You can report violence and seek justice through police and courts in Kenya.",
              color: Colors.blue,
            ),

            rightsCard(
              icon: Icons.favorite,
              title: "Right to Medical Care",
              description:
                  "Survivors of violence have the right to medical treatment and emergency care.",
              color: Colors.green,
            ),

            rightsCard(
              icon: Icons.lock,
              title: "Right to Privacy",
              description:
                  "Your report and personal information should be treated confidentially.",
              color: Colors.purple,
            ),

            const SizedBox(height: 30),

            // KENYA LAW SECTION
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
                      Icon(Icons.menu_book, color: Colors.orange),

                      SizedBox(width: 10),

                      Text(
                        "Kenyan Laws & Protection",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  lawPoint(
                    "The Constitution of Kenya protects human dignity and equality.",
                  ),

                  lawPoint(
                    "The Sexual Offences Act protects survivors of sexual violence.",
                  ),

                  lawPoint(
                    "The Protection Against Domestic Violence Act protects victims of domestic abuse.",
                  ),

                  lawPoint(
                    "Children are protected under the Children Act and related laws.",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // HELP MESSAGE
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info, color: Colors.blue, size: 35),

                  SizedBox(width: 15),

                  Expanded(
                    child: Text(
                      "If your rights are violated, seek support from trusted authorities, legal aid organizations, or GBV support centers.",
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

  static Widget rightsCard({
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

class lawPoint extends StatelessWidget {
  final String text;

  const lawPoint(this.text, {super.key});

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
