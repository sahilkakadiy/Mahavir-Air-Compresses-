import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/Model.dart';
import '../../Model/luaguage.dart';
import '../R_HomePage/Reciprocating.dart';
import '../R_HomePage/r-homepage.dart';
import '../S-HomePage/Screwaircomp.dart';

// class demoinqurypage extends StatefulWidget {
//   final String language; // Add language parameter
//   const demoinqurypage({super.key,required this.language});
//
//   @override
//   State<demoinqurypage> createState() => _demoinqurypageState();
// }
//
// class _demoinqurypageState extends State<demoinqurypage> {
//   String selectedButton = 'none';
//   bool isNewInquirySelected = true; // Initially, the first button is selected
//
//   void _handleTap(String button) {
//     setState(() {
//       selectedButton = button;
//     });
//
//     // Navigate to the respective pages based on the button tapped
//     if (button == 'reciprocating') {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => ReciprocatingPage(companies: [Company('', '', '')], language: '',)),
//       );
//     } else if (button == 'screw') {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => screwaitcomppage(companies: [Company('', '', '')],)),
//       );
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
// // Get height and width based on the orientation
//     double height = size.height;
//     double width = size.width;
//     return Scaffold(
//       backgroundColor: Color(0xFFFFFFFF),
//       body: Column(
//         children: [
//           SizedBox(
//             height: height *0.030,
//           ),
//           Container(
//             height: 65,
//             child: AppBar(
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back,color: Color(0xFFFFFFFF)),
//                 onPressed: () {
//                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),)); // Navigate back to the previous screen
//                 },
//               ),
//               title: Text(
//                 "DONE INQUIRY",
//                 style: GoogleFonts.inter(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 20,
//                   color: Colors.white, // Text color for the AppBar title
//                 ),
//                 overflow: TextOverflow.ellipsis,
//               ),
//               backgroundColor: Color(0xFF003123), // Background color for the AppBar
//               toolbarHeight: 28,
//             ),
//           ),
//           SizedBox(
//             height: height * 0.15,
//           ),
//           Center(
//             child: Image.asset(
//               'assets/image/Logo.png', // Ensure the asset path is correct
//             ),
//           ),
//           SizedBox(
//             height: height * 0.05,
//           ),
//           Center(
//             child: Column(
//               children: [
//                 Container(
//                   height: 31,
//                   width: 314,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       _handleTap('reciprocating');
//                     },
//                     // style: ElevatedButton.styleFrom(
//                     //   backgroundColor: selectedButton == 'reciprocating'
//                     //       ? Colors.green
//                     //       : Colors.white, // Dynamic button color
//                     // ),
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: !isNewInquirySelected ? Colors.white : Colors.black,
//                       backgroundColor: selectedButton == 'reciprocating'? Color(0xFF003123) : Color(0xFFD9D9D9), // Dynamic text color
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 0, // Remove elevation for flat button look
//                     ).copyWith(
//                       overlayColor: MaterialStateProperty.all<Color>(
//                         Colors.green.withOpacity(0.5), // Color on tap
//                       ),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "RECIPROCATING AIR COMPRESSOR",
//                         style: GoogleFonts.inter(
//                           fontWeight: FontWeight.w700,
//                           fontSize: 14,
//                           color: selectedButton == 'reciprocating'
//                               ? Colors.white
//                               : Colors.black, // Dynamic text color
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Container(
//                   height: 31,
//                   width: 245,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       _handleTap('screw');
//                     },
//                     // style: ElevatedButton.styleFrom(
//                     //   backgroundColor: selectedButton == 'screw'
//                     //       ? Colors.green
//                     //       : Colors.white, // Dynamic button color
//                     // ),
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: !isNewInquirySelected ? Colors.white : Colors.black,
//                       backgroundColor: selectedButton == 'screw' ? Color(0xFF003123) : Color(0xFFD9D9D9), // Dynamic text color
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       elevation: 0, // Remove elevation for flat button look
//                     ).copyWith(
//                       overlayColor: MaterialStateProperty.all<Color>(
//                         Colors.green.withOpacity(0.5), // Color on tap
//                       ),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "SCREW AIR COMPRESSOR",
//                         style: GoogleFonts.inter(
//                           fontWeight: FontWeight.w700,
//                           fontSize: 14,
//                           color: selectedButton == 'screw'
//                               ? Colors.white
//                               : Colors.black, // Dynamic text color
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // Center(
//           //   child: Column(
//           //     children: [
//           //       Container(
//           //         height: 31,
//           //         width: 314,
//           //         decoration: BoxDecoration(
//           //           borderRadius: BorderRadius.all(Radius.circular(10)),
//           //         ),
//           //         child: ElevatedButton(
//           //           onPressed: () {
//           //             _handleTap(true);
//           //           },
//           //           style: ElevatedButton.styleFrom(
//           //             backgroundColor: isNewInquirySelected
//           //                 ? Color(0xFF003123)
//           //                 : Color(0xFFD9D9D9), // Dynamic button color
//           //           ),
//           //           child: Center(
//           //             child: Text(
//           //               "RECIPROCATING AIR COMPRESSOR",
//           //               style: GoogleFonts.inter(
//           //                 fontWeight: FontWeight.w700,
//           //                 fontSize: 15,
//           //                 color: isNewInquirySelected
//           //                     ? Colors.black
//           //                     : Colors.white,
//           //                 //color: Color(0xFFFFFFFF), // Text color for the button
//           //               ),
//           //             ),
//           //           ),
//           //         ),
//           //       ),
//           //       SizedBox(height: 10), // Add spacing between the two buttons
//           //       Container(
//           //         height: 31,
//           //         width: 245,
//           //         decoration: BoxDecoration(
//           //           borderRadius: BorderRadius.all(Radius.circular(10)),
//           //         ),
//           //         child: ElevatedButton(
//           //           onPressed: () {
//           //             _handleTap(false);
//           //           },
//           //           style: ElevatedButton.styleFrom(
//           //               backgroundColor: isNewInquirySelected
//           //                   ? Color(0xFFD9D9D9)
//           //                   :Color(0xFF003123)// Background color for the second button
//           //           ),
//           //           child: Center(
//           //             child: Text(
//           //               "SCREW AIR COMPRESSOR",
//           //               style: GoogleFonts.inter(
//           //                 fontWeight: FontWeight.w700,
//           //                 fontSize: 15,
//           //                 color:  isNewInquirySelected
//           //                     ? Colors.black
//           //                     : Colors.white,
//           //                 //color: Color(0xFF000000), // Text color for the button
//           //               ),
//           //             ),
//           //           ),
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }


//===================================================

class demoinqurypage extends StatefulWidget {
  final String language; // Add language parameter

  const demoinqurypage({super.key, required this.language});

  @override
  State<demoinqurypage> createState() => _demoinqurypageState();
}

class _demoinqurypageState extends State<demoinqurypage> {
  String selectedButton = 'none';
  bool isNewInquirySelected = true; // Initially, the first button is selected

  // Text variables for translation
  late String doneInquiryText;
  late String reciprocatingText;
  late String screwText;

  @override
  void initState() {
    super.initState();
    // Initialize the translation text using the passed language
    doneInquiryText = TranslationHelper.translate(widget.language, 'doneInquiry');
    reciprocatingText = TranslationHelper.translate(widget.language, 'reciprocatingText');
    screwText = TranslationHelper.translate(widget.language, 'screwText');
  }

  void _handleTap(String button) async {
    setState(() {
      selectedButton = button;
    });

    // Firestore reference
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Example data to be added
    Map<String, dynamic> inquiryData = {
      'type': button == 'reciprocating' ? 'Reciprocating Inquiry' : 'Screw Inquiry',
      'timestamp': FieldValue.serverTimestamp(),
    };

    // Add data to the collection 'inquiries'
    await firestore.collection('inquiries').add(inquiryData);

    // Navigate to the respective pages based on the button tapped
    if (button == 'reciprocating') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ReciprocatingPage(
            companies: [Company(Cname: '', Uname: '', pdfPath: [])],
            language: widget.language,
          ),
        ),
      );
    } else if (button == 'screw') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => screwaitcomppage(
            companies: [Company(Cname: '', Uname: '', pdfPath: [])],
            language: widget.language,
          ),
        ),
      );
    }
  }

  //
  // void _handleTap(String button) {
  //   setState(() {
  //     selectedButton = button;
  //   });
  //
  //   // Navigate to the respective pages based on the button tapped
  //   if (button == 'reciprocating') {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => ReciprocatingPage(
  //           companies: [Company('', '', '')],
  //           language: widget.language, // Pass the language parameter
  //         ),
  //       ),
  //     );
  //   } else if (button == 'screw') {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => screwaitcomppage(
  //           companies: [Company('', '', '')],
  //           language: widget.language,),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // Get the screen size based on the orientation
    Size size = MediaQuery.of(context).size;

    // Get height and width based on the orientation
    double height = size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.030,
          ),
          SizedBox(
            height: 65,
            child: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(), // Pass language
                    ),
                  ); // Navigate back to the previous screen
                },
              ),
              title: Text(
                doneInquiryText,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white, // Text color for the AppBar title
                ),
                overflow: TextOverflow.ellipsis,
              ),
              backgroundColor: const Color(0xFF003123), // Background color for the AppBar
              toolbarHeight: 28,
            ),
          ),
          SizedBox(
            height: height * 0.15,
          ),
          Center(
            child: Image.asset(
              height: 200,
              width: 240,
              'assets/image/Logo.png', // Ensure the asset path is correct
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Center(
            child: Column(
              children: [
                Container(
                  height: 31,
                  width: 314,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _handleTap('reciprocating');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: selectedButton == 'reciprocating' ? Colors.white : Colors.black,
                      backgroundColor: selectedButton == 'reciprocating'
                          ? const Color(0xFF003123)
                          : const Color(0xFFD9D9D9), // Dynamic background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0, // Remove elevation for flat button look
                    ).copyWith(
                      overlayColor: MaterialStateProperty.all<Color>(
                        Colors.green.withOpacity(0.5), // Color on tap
                      ),
                    ),
                    child: Center(
                      child: Text(
                        reciprocatingText,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: selectedButton == 'reciprocating' ? Colors.white : Colors.black, // Dynamic text color
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 31,
                  width: 245,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _handleTap('screw');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: selectedButton == 'screw' ? Colors.white : Colors.black,
                      backgroundColor: selectedButton == 'screw'
                          ? const Color(0xFF003123)
                          : const Color(0xFFD9D9D9), // Dynamic background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0, // Remove elevation for flat button look
                    ).copyWith(
                      overlayColor: MaterialStateProperty.all<Color>(
                        Colors.green.withOpacity(0.5), // Color on tap
                      ),
                    ),
                    child: Center(
                      child: Text(
                        screwText,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: selectedButton == 'screw' ? Colors.white : Colors.black, // Dynamic text color
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


