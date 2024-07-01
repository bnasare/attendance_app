import 'package:flutter/material.dart';

import '../helpers/biometric_helper.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isAuthenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text(
                'Biometric Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () async {
                isAuthenticated = await BiometricHelper().authenticate();
                setState(() {});
              },
            ),
            if (isAuthenticated)
              const Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Text(
                  'Well done! Authenticated',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            if (!isAuthenticated)
              const Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Text(
                  'Authentication failed. Please try again.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
