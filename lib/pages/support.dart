import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f4ff),

      appBar: AppBar(title: const Text("Support"), centerTitle: true),

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
                  Icon(Icons.support_agent, color: Colors.white, size: 50),

                  SizedBox(height: 15),

                  Text(
                    "Support & Guidance",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "You are not alone. Access trusted support services, emergency assistance, counseling, and community help across Kenya.",
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
              "Available Support Services",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            supportCard(
              icon: Icons.call,
              title: "24/7 Emergency Support",
              description:
                  "Reach emergency response services and GBV hotlines for immediate assistance and protection.",
              color: Colors.red,
            ),

            supportCard(
              icon: Icons.psychology,
              title: "Counseling Services",
              description:
                  "Talk confidentially with trained counselors for emotional and mental health support.",
              color: Colors.green,
            ),

            supportCard(
              icon: Icons.home,
              title: "Shelter & Safe Housing",
              description:
                  "Find temporary safe shelters and recovery centers for protection and care.",
              color: Colors.orange,
            ),

            supportCard(
              icon: Icons.gavel,
              title: "Legal Guidance",
              description:
                  "Access legal aid services, reporting assistance, and information about your rights.",
              color: Colors.blue,
            ),

            const SizedBox(height: 30),

            // HOW TO SEEK HELP
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
                      Icon(Icons.lightbulb, color: Colors.amber),

                      SizedBox(width: 10),

                      Text(
                        "Steps To Seek Help",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  SupportPoint(
                    "Reach out to trusted family members or friends.",
                  ),

                  SupportPoint(
                    "Contact emergency support services if you are in danger.",
                  ),

                  SupportPoint("Seek medical attention if you are injured."),

                  SupportPoint("Document incidents safely where possible."),

                  SupportPoint(
                    "Talk to counselors or support groups for emotional support.",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ENCOURAGEMENT SECTION
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
                      "Asking for help is a courageous step. Support services exist to protect, guide, and empower survivors.",
                      style: TextStyle(fontSize: 16, height: 1.6),
                    ),
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

  static Widget supportCard({
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

class SupportPoint extends StatelessWidget {
  final String text;

  const SupportPoint(this.text, {super.key});

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
