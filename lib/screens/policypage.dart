import'package:hatgebak/screens/loginscreen.dart';

import 'package:flutter/material.dart';

class PolicyPage extends StatefulWidget {
  static String id = 'PolicyPage';

  @override
  _PolicyPageState createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  bool _isChecked = false;

  final String policyText = '''
Terms and Conditions

Introduction
Welcome to Hatgebak-هتجيبك, a mobile application designed to solve parking issues in urban areas of Egypt. By downloading or using our app, you agree to comply with and be bound by the following terms and conditions. If you disagree with any part of these terms, please do not use our app.

Hatgebak - Parking Spot Booking Policies
This policy outlines the expectations for both Parking Owners and Drivers using the Hatgebak app. Violations of these policies may result in penalties and account suspension until the penalties are settled.
For Parking Owners:
•	Reservation Commitment: Once a parking spot is booked by a driver, you cannot cancel or modify the reservation. This ensures fairness and reliability for drivers who depend on your designated spot.
•	Availability: It's your responsibility to ensure the parking spot listed on the app is accurately represented in terms of availability and location. Misleading information can cause inconvenience for drivers.
•	Communication: Respond promptly to booking requests from drivers. When a reservation is confirmed, ensure the parking spot is accessible as described in the app.
For Drivers:
•	Reservation Terms: Once a reservation is confirmed, you cannot cancel it within 30 minutes of the reservation start time. This short window prevents last-minute cancellations that could leave owners with empty spots.
•	Timeliness: Arrive at the reserved spot within the specified start time of your reservation. Promptness ensures efficient use of parking spaces for everyone.
•	Behavior: Respect the property and any guidelines provided by the parking owner. Treat the parking space with care and follow any instructions provided by the owner.

Enforcement:
•	Violation Consequences: Violations of the above rules may result in account suspension or even permanent blocking from using the app. Repeated offenses or severe violations will be met with stricter consequences.
•	Penalties: A fine or penalty may be imposed for violations. You will need to pay this penalty before your account can be reactivated.
General Guidelines:
•	Accuracy: All information provided about parking spots, including availability, fees, and descriptions, should be accurate and up-to-date. Both owners and drivers are responsible for maintaining truthful information.
•	Fair Usage: Use the app responsibly and avoid any fraudulent or misleading activities. This includes creating fake accounts, manipulating availability, or interfering with other users' experience.
Dispute Resolution:
•	Mediation: In case of disputes between parking owners and drivers, the Hatgebak app may provide mediation services to resolve conflicts. This can help reach fair solutions without needing external intervention.


Disclaimer:
•	Liability: The Hatgebak app and its operators are not liable for any damages, losses, or disputes arising from the use of the service. Users agree to use the app at their own risk. The app acts as a facilitator for parking transactions, and cannot guarantee the behavior or actions of individual users.
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms and Conditions',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green, //
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  policyText,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                  activeColor: Colors.green, // Set checkbox checked color to green
                ),
                Expanded(
                  child: Text(
                    'I agree to the terms and conditions',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _isChecked
                  ? () {
                // Proceed to the next screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => loginscreen(),
                  ),
                );
              }
                  : null,
              child: Text('Continue'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}