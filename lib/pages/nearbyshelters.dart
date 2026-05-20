import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class NearbySheltersPage extends StatefulWidget {
  const NearbySheltersPage({super.key});

  @override
  State<NearbySheltersPage> createState() => _NearbySheltersPageState();
}

class _NearbySheltersPageState extends State<NearbySheltersPage> {
  String locationMessage = "Checking your location...";
  bool permissionDenied = false;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // CHECK IF LOCATION IS ENABLED
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      setState(() {
        locationMessage = "Location services are disabled. Please enable GPS.";
      });
      return;
    }

    // CHECK PERMISSION
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        setState(() {
          permissionDenied = true;
          locationMessage =
              "Location permission denied. Allow access to find nearby shelters.";
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        permissionDenied = true;
        locationMessage =
            "Location permission permanently denied. Enable it in settings.";
      });
      return;
    }

    // GET USER LOCATION
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    // SIMPLE LOCATION DETECTION
    String detectedArea = "Kenya";

    if (position.latitude < -1.0) {
      detectedArea = "Nairobi";
    } else if (position.latitude > -0.5) {
      detectedArea = "Mombasa";
    }

    setState(() {
      locationMessage = "Showing shelters near $detectedArea";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f4ff),

      appBar: AppBar(title: const Text("Nearby Shelters"), centerTitle: true),

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

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.home, color: Colors.white, size: 50),

                  const SizedBox(height: 15),

                  const Text(
                    "Safe Shelters",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    locationMessage,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Available Support Centers",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            shelterCard(
              title: "Gender Violence Recovery Centre",
              location: "Nairobi, Kenya",
              phone: "+254 700 000 000",
              color: Colors.purple,
            ),

            shelterCard(
              title: "Safe Haven Women Shelter",
              location: "Mombasa, Kenya",
              phone: "+254 711 111 111",
              color: Colors.red,
            ),

            shelterCard(
              title: "Community Rescue Centre",
              location: "Kisumu, Kenya",
              phone: "+254 722 222 222",
              color: Colors.green,
            ),

            const SizedBox(height: 30),

            // SAFETY MESSAGE
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

              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.shield, color: Colors.orange, size: 35),

                  SizedBox(width: 15),

                  Expanded(
                    child: Text(
                      "Shelters provide temporary accommodation, counseling, food support, legal referrals, and protection for survivors.",
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

  static Widget shelterCard({
    required String title,
    required String location,
    required String phone,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      child: ListTile(
        contentPadding: const EdgeInsets.all(15),

        leading: CircleAvatar(
          radius: 25,
          backgroundColor: color.withOpacity(0.1),

          child: Icon(Icons.home, color: color),
        ),

        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text("$location\n$phone"),
        ),

        trailing: const Icon(Icons.location_on),
      ),
    );
  }
}
