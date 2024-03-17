import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for input validation

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>(); // for form validation
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _referralCodeController = TextEditingController();
  final _gmailController = TextEditingController();

  bool _nameValid = true;
  bool _addressValid = true;
  bool _gmailValid = true;

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _referralCodeController.dispose();
    _gmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //The AppBar of profile will be empty
      appBar: AppBar(
        title: const Text(''),
      ),

      //The body of profile
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),

        //A form will be in work as validation is require
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              //The TextFields of profile name
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'প্রতিষ্ঠানের নাম (*)',
                  errorText: _nameValid ? null : ' দয়া করে প্রতিষ্ঠানের নাম লিখুন  ',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() => _nameValid = false);
                    return ' দয়া করে প্রতিষ্ঠানের নাম লিখুন ';
                  }
                  setState(() => _nameValid = true);
                  return null;
                },
              ),

              const SizedBox(height: 20.0),

              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'প্রতিষ্ঠানের ঠিকানা (*)',
                  errorText: _addressValid ? null : 'দয়া করে প্রতিষ্ঠানের ঠিকানা লিখুন ',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() => _addressValid = false);
                    return 'দয়া করে প্রতিষ্ঠানের ঠিকানা লিখুন ';
                  }
                  setState(() => _addressValid = true);
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _referralCodeController,
                decoration: const InputDecoration(
                  labelText: 'রেফার কোড (যদি থাকে)',
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _gmailController,
                keyboardType: TextInputType.emailAddress, // for email input
                decoration: InputDecoration(
                  labelText: 'জিমেইল একাউন্ট (*)',
                  errorText: _gmailValid ? null : 'দয়া করে জিমেইল একাউন্টটি দিবেন  ',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() => _gmailValid = false);
                    return 'দয়া করে জিমেইল একাউন্টটি দিবেন  ';
                  }
                  // Basic email validation (can be improved)
                  if (!value.contains('@') || !value.contains('.')) {
                    setState(() => _gmailValid = false);
                    return 'দয়া করে জিমেইল একাউন্টটি দিবেন  ';
                  }
                  setState(() => _gmailValid = true);
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, proceed with data storage (Firebase/sqflite)
                    // You'll need to implement the logic to store data in your chosen storage solution
                    print('Name: ${_nameController.text}');
                    print('Address: ${_addressController.text}');
                    print('Referral Code: ${_referralCodeController.text}');
                    print('Gmail Account: ${_gmailController.text}');
                  }
                },
                child: const Text('Save Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
