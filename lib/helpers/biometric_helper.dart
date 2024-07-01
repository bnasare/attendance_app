import 'package:http/http.dart' as http;
import 'dart:convert';

class BiometricHelper {
  // Placeholder method for capturing biometric data
  Future<String> captureBiometricData() async {
    // Implement your biometric data capture logic here
    // For example, if using an external SDK or device
    // Return the captured data as a string
    return 'captured_biometric_data';
  }

  /// Sends the captured biometric data to an external API for verification.
  Future<bool> verifyBiometricData(String biometricData) async {
    const String apiUrl = 'http://127.0.0.1:8000/api/verify_biometrics';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'biometric_data': biometricData}),
      );

      if (response.statusCode == 200) {
        // Assuming the API returns a JSON response with a 'verified' field
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        return responseData['verified'];
      } else {
        // Handle unsuccessful response
        print('Verification failed: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Handle exceptions
      print('Error during verification: $e');
      return false;
    }
  }

  /// Captures biometric data and verifies it against an external database.
  Future<bool> authenticate() async {
    try {
      final biometricData = await captureBiometricData();
      return await verifyBiometricData(biometricData);
    } catch (e) {
      print('Authentication error: $e');
      return false;
    }
  }
}
