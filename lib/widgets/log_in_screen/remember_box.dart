import 'package:flutter/material.dart';

import 'package:musium/style/colors.dart';
import 'package:musium/style/regular_text.dart';

class RememberBox extends StatefulWidget {
  RememberBox({super.key, required this.isChecked});

  bool isChecked;

  @override
  State<RememberBox> createState() => _RememberBoxState();
}

class _RememberBoxState extends State<RememberBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
                    children: [
                      const SizedBox(width: 8),
                      Container(
                        width: 23,
                        height: 23,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: AppColors.background,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.buttonColor,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                            BoxShadow(
                              color: AppColors.buttonColor,
                              blurRadius: 3,
                              offset: Offset(0, -2),
                            ),
                            BoxShadow(
                              color: AppColors.buttonColor,
                              blurRadius: 3,
                              offset: Offset(2, 0),
                            ),
                            BoxShadow(
                              color: AppColors.buttonColor,
                              blurRadius: 3,
                              offset: Offset(-2, 0),
                            ),
                          ],
                        ),
                        child: Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            activeColor: AppColors.background,
                            checkColor: AppColors.buttonColor,
                            value: widget.isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                widget.isChecked = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const RegularText(
                        text: 'Remember me',
                        fontSize: 14,
                      )
                    ],
                  );
  }
}