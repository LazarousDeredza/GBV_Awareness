import 'package:flutter/material.dart';

class SupportGroupsPage extends StatelessWidget {
  const SupportGroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f4ff),

      appBar: AppBar(title: const Text("Support Groups"), centerTitle: true),

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
                  colors: [Color(0xff2b9348), Color(0xff55a630)],
                ),

                borderRadius: BorderRadius.circular(25),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.groups, color: Colors.white, size: 50),

                  SizedBox(height: 15),

                  Text(
                    "Support & Healing",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Connect with safe communities, counselors, and survivor support groups across Kenya.",
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
              "Available Support Groups",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            supportCard(
              icon: Icons.favorite,
              title: "Women Survivor Circles",
              description:
                  "Safe spaces where women can share experiences, receive emotional support, and heal together.",
              color: Colors.pink,
            ),

            supportCard(
              icon: Icons.psychology,
              title: "Trauma Counseling Groups",
              description:
                  "Professional counselors provide therapy sessions and mental health support for survivors.",
              color: Colors.blue,
            ),

            supportCard(
              icon: Icons.school,
              title: "Youth Awareness Groups",
              description:
                  "Programs focused on educating young people about GBV prevention and healthy relationships.",
              color: Colors.orange,
            ),

            supportCard(
              icon: Icons.family_restroom,
              title: "Family Support Programs",
              description:
                  "Guidance and counseling for families affected by violence and abuse.",
              color: Colors.green,
            ),

            const SizedBox(height: 30),

            // HOW GROUPS HELP
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
                      Icon(Icons.volunteer_activism, color: Colors.purple),

                      SizedBox(width: 10),

                      Text(
                        "How Support Groups Help",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  SupportPoint("Reduce feelings of isolation and fear."),

                  SupportPoint("Provide emotional healing and encouragement."),

                  SupportPoint("Offer legal and medical referral guidance."),

                  SupportPoint("Build confidence and personal empowerment."),

                  SupportPoint(
                    "Create safe spaces for survivors to speak freely.",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // JOIN MESSAGE
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.green.withValues(green: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.favorite, color: Colors.green, size: 35),

                  SizedBox(width: 15),

                  Expanded(
                    child: Text(
                      "Healing becomes easier when you are supported by people who care and understand your journey.",
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.white,
                      ),
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
