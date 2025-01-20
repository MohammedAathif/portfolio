import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // For making HTTP requests
import 'package:portfolio_website/utils/app_constants.dart';
import 'package:portfolio_website/utils/helper_widget.dart'; // For encoding data

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

      try {
        final response = await http.post(
          Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'service_id': AppConstants.serviceId,
            'template_id': AppConstants.templateId,
            'user_id': AppConstants.publicKey,
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
    var width = MediaQuery.of(context).size.width;
    return Container(
      key: widget.contactKey,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 15),
              child: Text(
                AppConstants.contact,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width > 750 ? 20 : 15),
              child: Text(
                AppConstants.contactInfo,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              child: SizedBox(
                width: width > 750 ? width / 2 : width / 1.1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppConstants.name,
                          style: const TextStyle(color: Colors.white),
                        ),
                        commonTextField(
                          controller: _nameController,
                          hintText: AppConstants.nameHint,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppConstants.emptyNameErrorText;
                            }
                            return null;
                          },
                        ),
                        Text(
                          AppConstants.email,
                          style: const TextStyle(color: Colors.white),
                        ),
                        commonTextField(
                          controller: _emailController,
                          hintText: AppConstants.emailHint,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppConstants.emptyEmailErrorText;
                            }
                            final emailRegex = RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                            if (!emailRegex.hasMatch(value)) {
                              return AppConstants.validEmailErrorText;
                            }
                            return null;
                          },
                        ),
                        Text(
                          AppConstants.message,
                          style: const TextStyle(color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: commonTextField(
                            controller: _messageController,
                            hintText: AppConstants.messageHint,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppConstants.emptyMessageErrorText;
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
                                  : Text(
                                      AppConstants.submit,
                                      style:
                                          const TextStyle(color: Colors.black),
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
