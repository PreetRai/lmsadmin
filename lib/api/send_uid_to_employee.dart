import 'dart:convert';

import 'package:http/http.dart' as http;

Future sendEmail(String name, String email, String message) async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  const serviceId = 'service_152djob';
  const templateId = 'template_e4b80fc';
  const userId = '4p3NgoQBNmczXPPuu';
  final response = await http.post(url,
      headers: {
        'Content-Type': 'application/json'
      }, //This line makes sure it works for all platforms.
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'username': name,
          'to_email': email,
          'message': message
        }
      }));
  return response.statusCode;
}
