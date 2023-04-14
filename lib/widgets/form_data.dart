import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/models/auth.dart';
import 'package:musium/style/color_text.dart';
import 'package:musium/style/colors.dart';
import 'package:musium/widgets/long_button.dart';
import 'package:provider/provider.dart';

class FormData extends StatefulWidget {
  FormData({super.key, required this.isRegistration, required this.width});

  final bool isRegistration;
  final double width;

  @override
  State<FormData> createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  String _userName = '';
  String _userEmail = '';
  String _userPassword = '';

  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final _hintStyle = TextStyle(
    fontFamily: 'Century-Gothic',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white.withOpacity(0.3),
  );

  final _mainStyle = const TextStyle(
    fontFamily: 'Century-Gothic',
    fontSize: 16,
    color: AppColors.mainText,
  );

  Future<void> _checkForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    //
    try {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Auth>(context, listen: false)
          .registration(_userName, _userEmail, _userPassword);
    }catch (error) {
      var errorMessage = 'Could not authenticate you. Please try again later.';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      setState(() {
        _isLoading = false;
      });
      _errorDialog(errorMessage);
    }
  }

  Future<void> _errorDialog(String message) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Error',
            style: TextStyle(
              fontFamily: 'Century-Gothic',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.background,
            ),
          ),
          content: SingleChildScrollView(
            child: Text(
              message,
              style: const TextStyle(
                fontFamily: 'Century-Gothic',
                fontSize: 16,
                color: AppColors.background,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const ColorText(
                text: 'Ok',
                isBold: true,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              if (widget.isRegistration)
                TextFormField(
                  style: _mainStyle,
                  decoration: InputDecoration(
                    fillColor: AppColors.buttonFillColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.borderButtonColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.mainBlue,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.errorBorder,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.person,
                        color: Colors.white.withOpacity(0.3)),
                    hintText: 'Username',
                    hintStyle: _hintStyle,
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 2) {
                      return 'Incorrect data';
                    }
                  },
                  onSaved: (value) {
                    _userName = value!;
                  },
                ),
              if (widget.isRegistration) const SizedBox(height: 20),
              TextFormField(
                style: _mainStyle,
                decoration: InputDecoration(
                    fillColor: AppColors.buttonFillColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.borderButtonColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.mainBlue,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.errorBorder,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: SvgPicture.asset('assets/icons/mail.svg',
                        width: 15,
                        height: 15,
                        fit: BoxFit.scaleDown,
                        color: Colors.white.withOpacity(0.3)),
                    hintText: 'Email',
                    hintStyle: _hintStyle),
                validator: (value) {
                  if (value!.isEmpty || value.length < 2) {
                    return 'Incorrect data';
                  }
                },
                onSaved: (value) {
                  _userEmail = value!;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: _mainStyle,
                decoration: InputDecoration(
                    fillColor: AppColors.buttonFillColor,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.borderButtonColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.mainBlue,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.errorBorder,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: SvgPicture.asset('assets/icons/lock.svg',
                        width: 15,
                        height: 15,
                        fit: BoxFit.scaleDown,
                        color: Colors.white.withOpacity(0.3)),
                    hintText: 'Password',
                    hintStyle: _hintStyle),
                validator: (value) {
                  if (value!.isEmpty || value.length < 2) {
                    return 'Incorrect data';
                  }
                },
                onSaved: (value) {
                  _userPassword = value!;
                },
              ),
              const SizedBox(height: 30),

              // log in
              LongButton(
                text: 'Create account',
                width: widget.width,
                function: _checkForm,
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
        if (_isLoading) const Center(
          heightFactor: 3.5,
          child: SizedBox(
            width: 55,
            height: 55,
            child: CircularProgressIndicator(
              color: AppColors.lightBlue,
            ),
          ),
        ),
      ],
    );
  }
}
