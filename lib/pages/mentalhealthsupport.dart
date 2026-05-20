import 'package:flutter/material.dart';

class MentalHealthSupportPage extends StatelessWidget {
  const MentalHealthSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f4ff),

      appBar: AppBar(
        title: const Text("Mental Health Support"),
        centerTitle: true,
      ),

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
                  colors: [Color(0xff2a9d8f), Color(0xff52b788)],
                ),

                borderRadius: BorderRadius.circular(25),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.psychology, color: Colors.white, size: 50),

                  SizedBox(height: 15),

                  Text(
                    "Mental Wellness Support",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Healing emotionally is just as important as physical safety. Support and counseling services are available across Kenya.",
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
              "Available Mental Health Services",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            supportCard(
              icon: Icons.support_agent,
              title: "Professional Counseling",
              description:
                  "Speak with trained counselors who provide confidential emotional support and guidance.",
              color: Colors.blue,
            ),

            supportCard(
              icon: Icons.favorite,
              title: "Trauma Recovery Support",
              description:
                  "Get help managing trauma, anxiety, fear, and emotional stress after abuse or violence.",
              color: Colors.red,
            ),

            supportCard(
              icon: Icons.groups,
              title: "Group Therapy Sessions",
              description:
                  "Join support groups where survivors share experiences and encourage healing together.",
              color: Colors.purple,
            ),

            supportCard(
              icon: Icons.self_improvement,
              title: "Wellness & Self-Care",
              description:
                  "Learn healthy coping strategies, stress management, and emotional wellness practices.",
              color: Colors.green,
            ),

            const SizedBox(height: 30),

            // WARNING SIGNS
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
                      Icon(Icons.warning_amber, color: Colors.orange),

                      SizedBox(width: 10),

                      Text(
                        "Signs You May Need Support",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  mentalHealthPoint(
                    "Constant fear, anxiety, or panic attacks.",
                  ),

                  mentalHealthPoint(
                    "Difficulty sleeping or frequent nightmares.",
                  ),

                  mentalHealthPoint(
                    "Feeling isolated, hopeless, or emotionally overwhelmed.",
                  ),

                  mentalHealthPoint(
                    "Loss of interest in normal daily activities.",
                  ),

                  mentalHealthPoint(
                    "Trouble concentrating or making decisions.",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // SELF CARE SECTION
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.favorite, color: Colors.green, size: 35),

                  SizedBox(width: 15),

                  Expanded(
                    child: Text(
                      "Your emotional wellbeing matters. Seeking help is a sign of strength, not weakness.",
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

class mentalHealthPoint extends StatelessWidget {
  final String text;

  const mentalHealthPoint(this.text, {super.key});

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
