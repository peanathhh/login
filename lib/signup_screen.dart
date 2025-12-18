// ================= SIGNUP PAGE (UI MATCHES LOGIN LAYOUT, LOGIC PRESERVED) =================
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  // ================= OTP LOGIC =================
  String generateOtp() {
    return (100000 + Random().nextInt(900000)).toString();
  }

  Future<void> sendOtpEmail(String userEmail, String otp) async {
    const gmailEmail = "nathanielsarzaba@gmail.com";
    const gmailPassword = "cleluxgmqwmznxiu";

    final smtpServer = SmtpServer(
      'smtp.gmail.com',
      port: 587,
      ssl: false,
      allowInsecure: false,
      username: gmailEmail,
      password: gmailPassword,
    );

    final message = Message()
      ..from = Address(gmailEmail, "OTP Verification")
      ..recipients.add(userEmail)
      ..subject = "Your OTP Code"
      ..text = "Your 6-digit OTP is: $otp";

    try {
      await send(message, smtpServer);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Sign up to get started",
                      style: TextStyle(fontSize: 15, color: Colors.black54),
                    ),
                    const SizedBox(height: 35),

                    _input(firstName, "First Name", Icons.person),
                    const SizedBox(height: 20),
                    _input(lastName, "Last Name", Icons.person_outline),
                    const SizedBox(height: 20),
                    _input(email, "Email", Icons.email),
                    const SizedBox(height: 20),
                    _passwordInput(),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Create Account",
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () async {
                          if (!_formKey.currentState!.validate()) return;

                          try {
                            final user = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: email.text.trim(),
                              password: password.text.trim(),
                            );

                            await FirebaseFirestore.instance
                                .collection("users")
                                .doc(user.user!.uid)
                                .set({
                              "firstName": firstName.text,
                              "lastName": lastName.text,
                              "email": email.text.trim(),
                              "approved": false,
                            });

                            final otp = generateOtp();

                            await FirebaseFirestore.instance
                                .collection("otp")
                                .doc(email.text.trim())
                                .set({
                              "otp": otp,
                              "createdAt": Timestamp.now(),
                            });

                            await sendOtpEmail(email.text.trim(), otp);

                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text("Success"),
                                content: const Text(
                                  "Account created.\nOTP sent to your email.",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================= INPUT FIELD =================
  Widget _input(
      TextEditingController controller, String label, IconData icon) {
    return TextFormField(
      controller: controller,
      validator: (v) => v!.isEmpty ? "Required" : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // ================= PASSWORD FIELD =================
  Widget _passwordInput() {
    return TextFormField(
      controller: password,
      obscureText: true,
      validator: (v) => v!.isEmpty ? "Required" : null,
      decoration: InputDecoration(
        labelText: "Password",
        prefixIcon: const Icon(Icons.lock),
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
