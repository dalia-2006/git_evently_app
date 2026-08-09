// import 'package:flutter/material.dart';
//
// import '../l10n/app_localizations.dart';
// import '../utils/app_color.dart';
// import '../utils/size_utils.dart';
//
// class BottomSheetLanguage extends StatefulWidget {
//   final String languageName ;
//    BottomSheetLanguage({super.key,required this.languageName});
//
//   @override
//   State<BottomSheetLanguage> createState() => _BottomSheetLanguageState();
// }
//
// class _BottomSheetLanguageState extends State<BottomSheetLanguage> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap:(){
//         //todo Change Language
//       } ,
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: context.height*0.02,
//             horizontal: context.width*0.02),
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
//             border: Border.all(
//               color: AppColor.mainLightColor,
//               width: 2,
//             )            ),
//         child: Row(
//           children: [
//             Text(widget.languageName),
//             Spacer(),
//             Icon(Icons.check),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void showLanguageBottomSheet(){
//    showModalBottomSheet(context: context,
//        builder: (context) =>BottomSheetLanguage(languageName: AppLocalizations.of(context)!.language) ,
//    ) ;
//   }
// }
