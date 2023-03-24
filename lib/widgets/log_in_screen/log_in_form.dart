import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:musium/style/colors.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({
    super.key,
  });

  final hintStyle = const TextStyle(
    fontFamily: 'Century-Gothic',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.mainText,
  );

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                fillColor: AppColors.buttonFillColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.borderButtonColor,
                    width: 1,
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
            // validator: (value) {
            //   if (value!.isEmpty || value.length < 2) {
            //     return 'Некорректные данные!';
            //   }
            // },
            // onSaved: (value) {
            //   userEmail = value!;
            // },
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                fillColor: AppColors.buttonFillColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.borderButtonColor,
                    width: 1,
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
            // validator: (value) {
            //   if (value!.isEmpty || value.length < 2) {
            //     return 'Некорректные данные!';
            //   }
            // },
            // onSaved: (value) {
            //   userEmail = value!;
            // },
          ),
        ],
      ),
    );
  }
}
