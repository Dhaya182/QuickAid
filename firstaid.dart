import 'package:flutter/material.dart';

void main() {
  runApp(FirstAidApp());
}

class FirstAidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Aid App',
      theme: ThemeData(
        primarySwatch: Colors.red, // Changed primary color to red
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _medicalDetailsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _medicalDetailsController,
              decoration: InputDecoration(
                hintText: 'Medical Details',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FirstAidHomePage(
                      title: 'First Aid Measures',
                      email: _emailController.text,
                      name: _nameController.text,
                      medicalDetails: _medicalDetailsController.text,
                    ),
                  ),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstAidHomePage extends StatelessWidget {
  FirstAidHomePage({
    Key? key,
    required this.title,
    required this.email,
    required this.name,
    required this.medicalDetails,
  }) : super(key: key);

  final String title;
  final String email;
  final String name;
  final String medicalDetails;

  final List<String> _firstAidMeasures = [    'Bleeding',    'Burns',    'Choking',    'Fractures',    'CPR',  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: _firstAidMeasures.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_firstAidMeasures[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FirstAidDetailsPage(
                      title: _firstAidMeasures[index],
                      measureDetails:
                          getMeasureDetails(_firstAidMeasures[index])),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Function to return measure details based on measure title
  String getMeasureDetails(String measureTitle) {
    switch (measureTitle) {
      case 'Bleeding':
        return 'Apply pressure and elevate the wound.';
      case 'Burns':
        return 'Cool the burn with running water for 20 minutes.';
      case 'Choking':
        return 'Cough it out.\nSlap it out - 5 back blows.\nSqueeze it out - 5 abdominal thrusts.\nCheck
