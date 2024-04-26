// import 'package:flutter/material.dart';
// import 'package:techub/screens/Welcomescreen.dart';

// class siginsuccess extends StatelessWidget {
//   final String text;
//   const siginsuccess(
//     this.text, {
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text
// }

// class signinsuccess extends StatelessWidget {
//   final text;
//   const signinsuccess(
//     this.text, {
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       backgroundColor: Colors.white,
//       content: Container(
//         decoration: BoxDecoration(
//             border: Border.all(color: Colors.black, style: BorderStyle.solid),
//             borderRadius: BorderRadius.circular(16)),
//         padding: EdgeInsets.all(16),
//         height: 120,
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(child: Text(text, style: TextStyle(fontSize: 18))),
//             SizedBox(height: 15),
//             Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Flexible(
//                     child: ElevatedButton(
//                         clipBehavior: Clip.antiAlias,
//                         style: ButtonStyle(
//                             foregroundColor: MaterialStateColor.resolveWith(
//                                 (states) => Color.fromARGB(255, 0, 0, 0)),
//                             backgroundColor: MaterialStateColor.resolveWith(
//                                 (states) =>
//                                     Color.fromARGB(255, 255, 244, 195))),
//                         onPressed: () {
//                           Navigator.pushAndRemoveUntil(
//                               context,
//                               MaterialPageRoute(builder: (_) => welcome()),
//                               (route) => false);
//                         },
//                         child: Text("Done")),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
