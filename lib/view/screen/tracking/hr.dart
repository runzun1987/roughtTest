// import 'package:flutter/material.dart';

// import 'test/IconStepper.dart';
// // import 'package:im_stepper/stepper.dart';

// class HorizontalExample extends StatefulWidget {
//   @override
//   _HorizontalExampleState createState() => _HorizontalExampleState();
// }

// class _HorizontalExampleState extends State<HorizontalExample> {
//   // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
//   int activeStep = 5; // Initial step set to 5.

//   int upperBound = 6;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 0.0,
//         title: Text(
//           "Order Status",
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//       ),
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
           
//             // header(),
//             // Expanded(
//             //   child: FittedBox(
//             //     child: Center(
//             //       child: Text('$activeStep'),
//             //     ),
//             //   ),
//             // ),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //   children: [
//             //     previousButton(),
//             //     nextButton(),
//             //   ],
//             // ),
//           ],
//         ),
//       ),
//     );
//   }

//   final _processes = [
//     'Order Signed',
//     'Order Processed',
//     'Shipped ',
//     'Out for delivery ',
//     'Delivered ',
//   ];

//   final _content = [
//     '20/18',
//     '20/18',
//     '20/18',
//     '20/18',
//     '20/18',
//   ];

//   /// Returns the next button.
//   Widget nextButton() {
//     return ElevatedButton(
//       onPressed: () {
//         // Increment activeStep, when the next button is tapped. However, check for upper bound.
//         if (activeStep < upperBound) {
//           setState(() {
//             activeStep++;
//           });
//         }
//       },
//       child: Text('Next'),
//     );
//   }

//   /// Returns the previous button.
//   Widget previousButton() {
//     return ElevatedButton(
//       onPressed: () {
//         // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
//         if (activeStep > 0) {
//           setState(() {
//             activeStep--;
//           });
//         }
//       },
//       child: Text('Prev'),
//     );
//   }

//   /// Returns the header wrapping the header text.
//   Widget header() {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.orange,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       child: Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               headerText(),
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Returns the header text based on the activeStep.
//   String headerText() {
//     switch (activeStep) {
//       case 1:
//         return 'Preface';

//       case 2:
//         return 'Table of Contents';

//       case 3:
//         return 'About the Author';

//       case 4:
//         return 'Publisher Information';

//       case 5:
//         return 'Reviews';

//       case 6:
//         return 'Chapters #1';

//       default:
//         return 'Introduction';
//     }
//   }
// }
