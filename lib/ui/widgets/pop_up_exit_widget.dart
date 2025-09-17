// import 'package:flutter/material.dart';
// import 'package:ikommerce/ui/widgets/button_widget.dart';
// import 'package:ikommerce/utils/utils_barrel.dart';

// class PopUpExitWidget extends StatelessWidget {
//   final VoidCallback onCancel;
//   final VoidCallback onExit;

//   const PopUpExitWidget(
//       {super.key, required this.onCancel, required this.onExit});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         return Stack(
//           children: [
//             Container(
//               width: constraints.maxWidth,
//               height: constraints.maxHeight,
//               color: lightGrey.withOpacity(0.5),
//             ),
//             Center(
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 margin: const EdgeInsets.symmetric(horizontal: 30),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(AppLocalizations.of(context)!.exit_game,
//                         style: poppinsBold18, textAlign: TextAlign.center),
//                     SizedBox(height: constraints.maxHeight / 7),
//                     Text(AppLocalizations.of(context)!.exit_game_description,
//                         style: poppinsBold14, textAlign: TextAlign.center),
//                     SizedBox(height: constraints.maxHeight / 7),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         CustomButton.contained(
//                           label: AppLocalizations.of(context)!.cancel,
//                           onPressed: onCancel,
//                           color: green,
//                         ),
//                         CustomButton.contained(
//                           label: AppLocalizations.of(context)!.exit,
//                           onPressed: onExit,
//                           color: danger,
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
