// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app_ui/core/utils/colors.dart';
import 'package:whats_app_ui/features/otp_screen/view_model/phone_auth/phone_auth_cubit.dart';
import 'package:whats_app_ui/features/otp_screen/view_model/phone_auth/phone_auth_state.dart';

class PhoneFormField extends StatelessWidget {
  // late String phoneNumber;
  const PhoneFormField({
    Key? key,
  }) : super(key: key);

  String generateCountryFlag() {
    String countryCode = 'eg'; //بترجعلى علم مصر
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
      builder: (context, state) {
        var cubit = PhoneAuthCubit.get(context);
        return Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                ),
                child: Text(
                  '${generateCountryFlag()} +20',
                  style: const TextStyle(
                    fontSize: 18,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                ),
                child: TextFormField(
                  autofocus:
                      true, // عشان اول ما افتح البروجكت يفتح الكيبورد ويجى عليها علطول
                  style: const TextStyle(
                    fontSize: 18,
                    letterSpacing: 2.0,
                  ),
                  decoration: const InputDecoration(border: InputBorder.none),
                  cursorColor: AppColors.primaryColor,
                  keyboardType: TextInputType.phone,
                  controller: cubit.phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter your phone number!';
                    } else if (value.length < 11) {
                      return 'too short for a phone number!';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // phoneNumber = value!;
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
