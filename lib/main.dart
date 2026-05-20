import 'package:flutter/material.dart';

import 'pages/emergencyhelp.dart';
import 'pages/newsandupdates.dart';
import 'pages/knowyourrights.dart';
import 'pages/supportgroups.dart';
import 'pages/support.dart';
import 'pages/about.dart';
import 'pages/nearbyshelters.dart';
import 'pages/legalassistance.dart';
import 'pages/mentalhealthsupport.dart';

void main() {
  runApp(const SafeVoiceApp());
}

class SafeVoiceApp extends StatelessWidget {
  const SafeVoiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safe Voice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const SupportPage(),
    const AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,

        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),

          NavigationDestination(
            icon: Icon(Icons.support_agent),
            label: "Support",
          ),

          NavigationDestination(icon: Icon(Icons.person), label: "About"),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f4ff),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 220,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff7b2cbf), Color(0xff9d4edd)],
                  ),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.purple,
                        size: 35,
                      ),
                    ),

                    SizedBox(height: 15),

                    Text(
                      "Safe Voice",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 5),

                    Text(
                      "Support & Protection",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),

            drawerItem(
              context,
              "Emergency Help",
              Icons.call,
              const EmergencyHelpPage(),
            ),

            drawerItem(
              context,
              "News & Updates",
              Icons.newspaper_outlined,
              const NewsUpdatesPage(),
            ),

            drawerItem(
              context,
              "Know Your Rights",
              Icons.menu_book,
              const KnowYourRightsPage(),
            ),

            drawerItem(
              context,
              "Support Groups",
              Icons.groups,
              const SupportGroupsPage(),
            ),

            const Divider(),

            drawerItem(
              context,
              "Nearby Shelters",
              Icons.home,
              const NearbySheltersPage(),
            ),

            drawerItem(
              context,
              "Legal Assistance",
              Icons.gavel,
              const LegalAssistancePage(),
            ),

            drawerItem(
              context,
              "Mental Health Support",
              Icons.psychology,
              const MentalHealthSupportPage(),
            ),

            const Divider(),

            drawerItem(
              context,
              "Support",
              Icons.support_agent,
              const SupportPage(),
            ),

            drawerItem(context, "About", Icons.person, const AboutPage()),
          ],
        ),
      ),

      appBar: AppBar(title: const Text("Safe Voice"), centerTitle: true),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff7b2cbf), Color(0xff9d4edd)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),

                  Text(
                    "You Are Not Alone 💜",
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Support Against Gender-Based Violence",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    "Get help, report abuse safely and access support resources.",
                    style: TextStyle(color: Colors.white70),
                  ),

                  SizedBox(height: 20),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: buildCard(
                      context,
                      "Emergency Help",
                      Icons.call,
                      Colors.red,
                      const EmergencyHelpPage(),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: buildCard(
                      context,
                      "News & Updates",
                      Icons.newspaper,
                      Colors.orange,
                      const NewsUpdatesPage(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: buildCard(
                      context,
                      "Know Your Rights",
                      Icons.menu_book,
                      Colors.blue,
                      const KnowYourRightsPage(),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: buildCard(
                      context,
                      "Support Groups",
                      Icons.groups,
                      Colors.green,
                      const SupportGroupsPage(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            resourceTile(
              context,
              "Nearby Shelters",
              "Find safe shelter locations",
              Icons.home,
              Colors.purple,
              const NearbySheltersPage(),
            ),

            resourceTile(
              context,
              "Legal Assistance",
              "Access legal help",
              Icons.gavel,
              Colors.blue,
              const LegalAssistancePage(),
            ),

            resourceTile(
              context,
              "Mental Health Support",
              "Talk to counselors",
              Icons.psychology,
              Colors.green,
              const MentalHealthSupportPage(),
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    Widget page,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },

      child: Container(
        height: 160,
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, color: color),
            ),

            const SizedBox(height: 12),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  static Widget resourceTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    Widget page,
  ) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },

      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.1),
        child: Icon(icon, color: color),
      ),

      title: Text(title),
      subtitle: Text(subtitle),

      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }

  static Widget drawerItem(
    BuildContext context,
    String title,
    IconData icon,
    Widget page,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.purple),

      title: Text(title),

      onTap: () {
        Navigator.pop(context);

        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
    );
  }
}
