import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/Page/S-HomePage/Screwaircomp.dart';

import '../../Model/Model.dart';
import '../../Model/luaguage.dart';
import 'Addnewresiprocating.dart';
import 'r-homepage.dart';
import 'Reciprocating.dart';

// class newinquirypage extends StatefulWidget {
//   final String language; // Add language parameter
//   const newinquirypage({super.key,required this.language});
//
//   @override
//   State<newinquirypage> createState() => _newinquirypageState();
// }
//
// class _newinquirypageState extends State<newinquirypage> {
//   String selectedButton = 'none';
//   bool isNewInquirySelected = true; // Initially, the first button is selected
//   String newInquiryText = "New Inquiry";
//   String reciprocatingText = "RECIPROCATING AIR COMPRESSOR";
//   String screwText = "SCREW AIR COMPRESSOR";
//
//   @override
//   void initState() {
//     super.initState();
//     _translateText(); // Translate text based on the selected language
//   }
//   void _translateText() {
//     setState(() {
//       if (widget.language == 'Gujarati') {
//         newInquiryText = "નવી ઇન્કવાયરી";
//         reciprocatingText = "રેસીપ્રોકેટિંગ એર કમપ્રેસર";
//         screwText = "સ્ક્રુ એર કમપ્રેસર";
//       } else {
//         newInquiryText = "New Inquiry";
//         reciprocatingText = "RECIPROCATING AIR COMPRESSOR";
//         screwText = "SCREW AIR COMPRESSOR";
//       }
//     });
//   }
//
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
//         MaterialPageRoute(builder: (context) => ReciprocatingPage(companies: [Company('', '', '')], language: widget.language)),
//       );
//     } else if (button == 'screw') {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => screwaitcomppage(companies: [Company('', '', '')], language: widget.language,)),
//       );
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     // Get the screen size based on the orientation
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
//                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(language: widget.language,),)); // Navigate back to the previous screen
//                 },
//               ),
//               title: Text(
//                 newInquiryText,
//                 style: GoogleFonts.inter(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 20,
//                   color: Colors.white, // Text color for the AppBar title
//                 ),
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
//                         reciprocatingText,
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
//                         screwText,
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
// class newinquirypage extends StatefulWidget {
//   final String language;// Add language parameter
//   const newinquirypage({super.key, required this.language});
//
//   @override
//   State<newinquirypage> createState() => _newinquirypageState();
// }
//
// class _newinquirypageState extends State<newinquirypage> {
//   String selectedButton = 'none';
//   String NewInquiryText = TranslationHelper.translate(language, 'newInquiry');
//   String ReciprocatingText = TranslationHelper.translate(language, 'reciprocatingText');
//   String ScrewText = TranslationHelper.translate(language, 'screwText');
//
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
//         MaterialPageRoute(
//           builder: (context) => ReciprocatingPage(companies: [Company('', '', '')], language: widget.language),
//         ),
//       );
//     } else if (button == 'screw') {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => screwaitcomppage(companies: [Company('', '', '')], language: widget.language),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Get the screen size based on the orientation
//     Size size = MediaQuery.of(context).size;
//
//     // Get height and width based on the orientation
//     double height = size.height;
//     double width = size.width;
//
//     return Scaffold(
//       backgroundColor: Color(0xFFFFFFFF),
//       body: Column(
//         children: [
//           SizedBox(
//             height: height * 0.030,
//           ),
//           Container(
//             height: 65,
//             child: AppBar(
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Home(),
//                     ),
//                   ); // Navigate back to the previous screen
//                 },
//               ),
//               title: Text(
//                 NewInquiryText,
//                 style: GoogleFonts.inter(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 20,
//                   color: Colors.white, // Text color for the AppBar title
//                 ),
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
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.black,
//                       backgroundColor: selectedButton == 'reciprocating'
//                           ? Color(0xFF003123)
//                           : Color(0xFFD9D9D9), // Dynamic text color
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
//                         ReciprocatingText,
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
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Colors.black,
//                       backgroundColor: selectedButton == 'screw'
//                           ? Color(0xFF003123)
//                           : Color(0xFFD9D9D9), // Dynamic text color
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
//                         ScrewText,
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
//         ],
//       ),
//     );
//   }
// }

class newinquirypage extends StatefulWidget {
  final String language; // Add language parameter
  const newinquirypage({super.key, required this.language});

  @override
  State<newinquirypage> createState() => _newinquirypageState();
}

class _newinquirypageState extends State<newinquirypage> {
  String selectedButton = 'none';
  String NewInquiry = "";
  String RECIPROCATINGAIRCOMPRESSOR = "";
  String SCREWAIRCOMPRESSOR = "";

  @override
  void initState() {
    super.initState();
    _translateText(); // Translate text based on the selected language
  }

  void _translateText() {
    setState(() {
      NewInquiry = TranslationHelper.translate(widget.language, 'newInquiry');
      RECIPROCATINGAIRCOMPRESSOR = TranslationHelper.translate(widget.language, 'reciprocatingText');
      SCREWAIRCOMPRESSOR = TranslationHelper.translate(widget.language, 'screwText');
    });
  }


  void _handleTap(String button) {
    setState(() {
      selectedButton = button;
    });

    // Add the inquiry type to Firestore using the FirestoreService
    FirestoreService _firestoreService = FirestoreService();

    _firestoreService.addInquiryToFirestore(button).then((_) {
      // Navigate to the respective page after successfully adding to Firestore
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
    }).catchError((error) {
      // Show a SnackBar if there is an error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error adding inquiry: $error'),
        ),
      );
    });
  }

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
  //         builder: (context) => ReciprocatingPage(companies: [Company('', '', '')], language: widget.language),
  //       ),
  //     );
  //   } else if (button == 'screw') {
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => screwaitcomppage(companies: [Company('', '', '')], language: widget.language),
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
    double width = size.width;

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.030,
          ),
          Container(
            height: 65,
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  ); // Navigate back to the previous screen
                },
              ),
              title: Text(
                NewInquiry,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white, // Text color for the AppBar title
                ),
              ),
              backgroundColor: Color(0xFF003123), // Background color for the AppBar
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _handleTap('reciprocating');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: selectedButton == 'reciprocating'
                          ? Color(0xFF003123)
                          : Color(0xFFD9D9D9), // Dynamic text color
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
                        RECIPROCATINGAIRCOMPRESSOR,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: selectedButton == 'reciprocating'
                              ? Colors.white
                              : Colors.black, // Dynamic text color
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 31,
                  width: 245,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _handleTap('screw');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: selectedButton == 'screw'
                          ? Color(0xFF003123)
                          : Color(0xFFD9D9D9), // Dynamic text color
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
                        SCREWAIRCOMPRESSOR,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: selectedButton == 'screw'
                              ? Colors.white
                              : Colors.black, // Dynamic text color
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


class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addInquiryToFirestore(String inquiryType) async {
    try {
      // Define the collection based on the inquiry type
      String collectionName = inquiryType == 'reciprocating' ? 'ReciprocatingInquiries' : 'ScrewInquiries';

      // Add a new document with the inquiry type
      await _firestore.collection(collectionName).add({
        'inquiryType': inquiryType,
        'timestamp': FieldValue.serverTimestamp(),
      });

      print('Inquiry added successfully to $collectionName');
    } catch (e) {
      print('Error adding inquiry: $e');
      throw e;  // This will trigger the catchError in your button's onTap
    }
  }
}
