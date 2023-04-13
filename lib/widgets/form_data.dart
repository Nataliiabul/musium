import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/models/auth.dart';
import 'package:musium/style/colors.dart';
import 'package:musium/widgets/long_button.dart';
import 'package:provider/provider.dart';

class FormData extends StatefulWidget {
  const FormData(
      {super.key, required this.isRegistration, required this.width});

  final bool isRegistration;
  final double width;

  @override
  State<FormData> createState() => _FormDataState();
}

class _FormDataState extends State<FormData> {
  String _userName = '';
  String _userEmail = '';
  String _userPassword = '';

  final _formKey = GlobalKey<FormState>();

  final hintStyle = TextStyle(
    fontFamily: 'Century-Gothic',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white.withOpacity(0.3),
  );

  final mainStyle = const TextStyle(
    fontFamily: 'Century-Gothic',
    fontSize: 16,
    color: AppColors.mainText,
  );

  void checkForm() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    sendData();
  }

  void sendData () {
    Provider.of<Auth>(context, listen: false).registration(_userName, _userEmail, _userPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          if (widget.isRegistration)
            TextFormField(
              style: mainStyle,
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
                  prefixIcon:
                      Icon(Icons.person, color: Colors.white.withOpacity(0.3)),
                  hintText: 'Username',
                  hintStyle: hintStyle,
                  ),
              validator: (value) {
                if (value!.isEmpty || value.length < 2) {
                  return 'Некорректные данные!';
                }
              },
              onSaved: (value) {
                _userName = value!;
              },
            ),
          if (widget.isRegistration) const SizedBox(height: 20),
          TextFormField(
            style: mainStyle,
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
                prefixIcon: SvgPicture.asset('assets/icons/mail.svg',
                    width: 15,
                    height: 15,
                    fit: BoxFit.scaleDown,
                    color: Colors.white.withOpacity(0.3)),
                hintText: 'Email',
                hintStyle: hintStyle),
            validator: (value) {
              if (value!.isEmpty || value.length < 2) {
                return 'Некорректные данные!';
              }
            },
            onSaved: (value) {
              _userEmail = value!;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            style: mainStyle,
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
                prefixIcon: SvgPicture.asset('assets/icons/lock.svg',
                    width: 15,
                    height: 15,
                    fit: BoxFit.scaleDown,
                    color: Colors.white.withOpacity(0.3)),
                hintText: 'Password',
                hintStyle: hintStyle),
            validator: (value) {
              if (value!.isEmpty || value.length < 2) {
                return 'Некорректные данные!';
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
            function: checkForm,
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}