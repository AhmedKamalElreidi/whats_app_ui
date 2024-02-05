// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:whats_app_ui/core/utils/colors.dart';
// import 'package:whats_app_ui/features/otp_screen/view_model/phone_auth/phone_auth_cubit.dart';
// import 'package:whats_app_ui/features/otp_screen/view_model/phone_auth/phone_auth_state.dart';

// class BuildPinCodeFields extends StatelessWidget {
//   String otpCode;

//   BuildPinCodeFields({
//     Key? key,
//     required this.otpCode,
//   }) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
//       builder: (context, state) {
//         // var cubit = PhoneAuthCubit.get(context);
//         return Expanded(
//           child: PinCodeTextField(
//             appContext: context,
//             autoFocus: true,
//             cursorColor: AppColors.primaryColor,
//             keyboardType: TextInputType.number,
//             length: 6,
//             obscureText: false,
//             animationType: AnimationType.scale,
//             pinTheme: PinTheme(
//               shape: PinCodeFieldShape.box,
//               borderRadius: BorderRadius.circular(5),
//               fieldHeight: 50,
//               fieldWidth: 40,
//               borderWidth: 1,
//               activeColor: AppColors.primaryColor,
//               inactiveColor: AppColors.primaryColor,
//               inactiveFillColor: Colors.white,
//               activeFillColor: AppColors.lightGreen,
//               selectedColor: AppColors.primaryColor,
//               selectedFillColor: Colors.white,
//             ),
//             animationDuration: const Duration(milliseconds: 300),
//             backgroundColor: Colors.white,
//             enableActiveFill: true,
//             onCompleted: (submitedCode) {
//               otpCode = submitedCode;
//               print("Completed");
//             },
//             onChanged: (value) {
//               print(value);
//             },
//           ),
//         );
//       },
//     );
//   }
// }
