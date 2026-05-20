import 'package:flutter/material.dart';

class LegalAssistancePage extends StatelessWidget {
  const LegalAssistancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f4ff),

      appBar: AppBar(title: const Text("Legal Assistance"), centerTitle: true),

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
                  colors: [Color(0xff4361ee), Color(0xff3a86ff)],
                ),

                borderRadius: BorderRadius.circular(25),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.gavel, color: Colors.white, size: 50),

                  SizedBox(height: 15),

                  Text(
                    "Legal Support",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Get information about legal protection, reporting abuse, and accessing justice services in Kenya.",
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
              "Available Legal Services",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            legalCard(
              icon: Icons.local_police,
              title: "Police Reporting",
              description:
                  "Report domestic violence, assault, harassment, or abuse at the nearest police station.",
              color: Colors.blue,
            ),

            legalCard(
              icon: Icons.balance,
              title: "Court Protection Orders",
              description:
                  "You may apply for protection orders against abusive individuals under Kenyan law.",
              color: Colors.red,
            ),

            legalCard(
              icon: Icons.description,
              title: "Legal Documentation",
              description:
                  "Get assistance with statements, evidence collection, and legal documentation.",
              color: Colors.orange,
            ),

            legalCard(
              icon: Icons.support_agent,
              title: "Legal Aid Services",
              description:
                  "Free or affordable legal assistance may be available through NGOs and legal aid centers.",
              color: Colors.green,
            ),

            const SizedBox(height: 30),

            // RIGHTS SECTION
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
                      Icon(Icons.menu_book, color: Colors.purple),

                      SizedBox(width: 10),

                      Text(
                        "Know Your Legal Rights",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  legalPoint(
                    "You have the right to report abuse without discrimination.",
                  ),

                  legalPoint(
                    "Survivors of violence are entitled to medical and legal support.",
                  ),

                  legalPoint(
                    "Children and vulnerable persons are protected under Kenyan law.",
                  ),

                  legalPoint(
                    "You may seek protection orders against abusive individuals.",
                  ),

                  legalPoint(
                    "Your case information should be handled confidentially.",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // LEGAL CONTACTS
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.call, color: Colors.blue, size: 35),

                  SizedBox(width: 15),

                  Expanded(
                    child: Text(
                      "For urgent legal help, contact the nearest police station, legal aid organization, or GBV response center in Kenya.",
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

  static Widget legalCard({
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

class legalPoint extends StatelessWidget {
  final String text;

  const legalPoint(this.text, {super.key});

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
