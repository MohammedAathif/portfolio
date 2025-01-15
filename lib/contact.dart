import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // For making HTTP requests
import 'dart:convert'; // For encoding data

class Contact extends StatefulWidget {
  const Contact(this.contactKey, {super.key});

  final GlobalKey contactKey;

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _isSubmitting = false;

  Future<void> _sendEmail() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSubmitting = true;
      });
      // template_kkb13sz
// service_aab12
// 1AuKJfNXP-4ujOaVm

      const String serviceId =
          'service_aab12'; // Replace with your EmailJS Service ID
      const String templateId =
          'template_1t4aprq'; // Replace with your EmailJS Template ID
      const String publicKey =
          '1AuKJfNXP-4ujOaVm'; // Replace with your EmailJS Public Key

      try {
        final response = await http.post(
          Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'service_id': serviceId,
            'template_id': templateId,
            'user_id': publicKey,
            'template_params': {
              'name': _nameController.text,
              'from_name': _emailController.text,
              'message': _messageController.text,
            },
          }),
        );

        if (response.statusCode == 200) {
          // Success
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email sent successfully!')),
          );
          _formKey.currentState!.reset();
        } else {
          // Error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to send email: ${response.body}')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      } finally {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.contactKey,
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 15),
              child: Text(
                "CONTACT",
                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "I'm always eager to explore new opportunities and welcome any outreach. Feel free to get in touch with me.",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Name",
                          style: TextStyle(color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                              hintText: 'Enter Your Name',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: 'Enter Your Email',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              final emailRegex = RegExp(
                                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                              if (!emailRegex.hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          ),
                        ),
                        const Text(
                          "Message",
                          style: TextStyle(color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 40),
                          child: TextFormField(
                            controller: _messageController,
                            maxLines: 7,
                            decoration: const InputDecoration(
                              hintText: 'Enter Your Message',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your message';
                              }
                              return null;
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            height: 50,
                            width: 180,
                            child: ElevatedButton(
                              onPressed: _isSubmitting ? null : _sendEmail,
                              // style: ElevatedButton.styleFrom(
                              //   backgroundColor: Colors.blue.shade900,
                              // ),
                              child: _isSubmitting
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      'SUBMIT',
                                      style: TextStyle(color: Colors.black),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
