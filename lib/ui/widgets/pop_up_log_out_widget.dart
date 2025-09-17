// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:ikommerce/data/cubits/auth/logout/cubit/logout_cubit.dart';
// import 'package:ikommerce/data/cubits/profile/cubit/profile_cubit.dart';
// import 'package:ikommerce/ui/screens/auth/login_screen.dart';
// import 'package:ikommerce/ui/widgets/button_widget.dart';
// import 'package:ikommerce/utils/colors.dart';
// import 'package:ikommerce/utils/extensions.dart';
// import 'package:ikommerce/utils/storage_helper.dart';
// import 'package:ikommerce/utils/typography.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class PopUpLogOutWidget extends StatelessWidget {
//   const PopUpLogOutWidget({super.key});

//   static void showExitBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
//       ),
//       builder: (BuildContext context) {
//         return BlocListener<LogoutCubit, LogoutState>(
//           listener: (context, state) async {
//             if (state is LogoutSuccess) {
//               context.read<ProfileCubit>().resetProfile();
//               pushAndRemoveScreen(context, pageRef: const LoginScreen());
//               await StorageHelper.deleteLocalStorage("hasLogin");
//             }
//           },
//           child: LayoutBuilder(
//             builder: (BuildContext context, BoxConstraints constraints) {
//               return Padding(
//                 padding: const EdgeInsets.only(
//                     right: 40, left: 40, top: 5, bottom: 20),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                         width: 40,
//                         height: 4,
//                         margin: const EdgeInsets.only(bottom: 10),
//                         decoration: BoxDecoration(
//                           color: Colors.grey[400],
//                           borderRadius: BorderRadius.circular(10),
//                         )),
//                     Text(
//                       AppLocalizations.of(context)!.logout,
//                       style: poppinsBold20.copyWith(
//                           color: const Color(0xffA52A2A).withOpacity(0.86)),
//                     ),
//                     Divider(
//                       thickness: 2,
//                       color: black.withOpacity(0.2),
//                     ),
//                     Text(AppLocalizations.of(context)!.logout_description,
//                         style: poppinsSemiBold16),
//                     const SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         SizedBox(
//                             width: constraints.maxWidth / 3,
//                             child: CustomButton.contained(
//                               label: AppLocalizations.of(context)!.cancel,
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               color: lightGrey6,
//                               textColor: primary,
//                               splashColor: black,
//                               elevation: 10,
//                             )),
//                         BlocBuilder<LogoutCubit, LogoutState>(
//                           builder: (context, state) {
//                             if (state is LogoutLoading) {
//                               return SizedBox(
//                                   width: constraints.maxWidth / 3,
//                                   child: CustomButton.contained(
//                                       isLoading: true,
//                                       label: "Yes, Exit",
//                                       onPressed: () {}));
//                             }
//                             return SizedBox(
//                                 width: constraints.maxWidth / 3,
//                                 child: CustomButton.contained(
//                                     label: AppLocalizations.of(context)!.exit,
//                                     onPressed: () {
//                                       context.read<LogoutCubit>().logout();
//                                     }));
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const SizedBox.shrink();
//   }
// }
