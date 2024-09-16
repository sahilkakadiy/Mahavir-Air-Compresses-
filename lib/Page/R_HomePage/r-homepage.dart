import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/Page/Demoinquiry/Demoinqury.dart';
import 'package:untitled1/Page/R_HomePage/Reciprocating.dart';


import '../../Model/luaguage.dart';
import '../../main.dart';
import '../S-HomePage/Screwaircomp.dart';
import 'Addnewresiprocating.dart';
import 'New InQuiry.dart';
//
// class Home extends StatefulWidget {
//   final String language; // Add language parameter
//   const Home({super.key,required this.language});
//
//   @override
//   State<Home> createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
//
//
//   void _changeLanguage(String selectedLanguage) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('language', selectedLanguage);
//
//     setState(() {
//       language = selectedLanguage;
//       if (language == 'English') {
//         newInquiryText = 'New Inquiry';
//         doneInquiryText = 'Done Inquiry';
//         languageText = 'Language';
//       } else if (language == 'Gujarati') {
//         newInquiryText = 'નવું પૂછપરછ';
//         doneInquiryText = 'પૂર્ણ પૂછપરછ';
//         languageText = 'ભાષા';
//       }
//     });
//   }
//
//   late AnimationController _controller;
//   late Animation<double> _opacityAnimation;
//   String language = 'English'; // Default language is English
//   String newInquiryText = 'New Inquiry';
//   String doneInquiryText = 'Done Inquiry';
//   String languageText = 'Language';
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize the AnimationController
//     _controller = AnimationController(
//       duration: const Duration(seconds: 3), // Animation duration
//       vsync: this,
//     )..repeat(reverse: true); // Repeat the animation
//
//     // Define the opacity animation
//     _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.easeInOut,
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   bool isNewInquirySelected = true; // Initially, the first button is selected
//
//   void _handleTap(bool isNewInquiry) {
//     setState(() {
//       isNewInquirySelected = isNewInquiry;
//     });
//     // Navigate to the respective pages based on the button tapped
//     if (isNewInquiry) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => newinquirypage(language:  '',)),
//       );
//     } else {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => demoinqurypage(language: widget.language,)),
//       );
//     }
//   }
//
//   void _showLanguageDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select Language', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 title: Text('English', style: GoogleFonts.inter()),
//                 onTap: () {
//                   _changeLanguage('English');
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 title: Text('Gujarati (ગુજરાતી)', style: GoogleFonts.inter()),
//                 onTap: () {
//                   _changeLanguage('Gujarati');
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   // void _changeLanguage(String selectedLanguage) {
//   //   setState(() {
//   //     language = selectedLanguage;
//   //     if (language == 'English') {
//   //       newInquiryText = 'New Inquiry';
//   //       doneInquiryText = 'Done Inquiry';
//   //       languageText = 'Language';
//   //     } else if (language == 'Gujarati') {
//   //       newInquiryText = 'નવું પૂછપરછ';
//   //       doneInquiryText = 'પૂર્ણ પૂછપરછ';
//   //       languageText = 'ભાષા';
//   //     }
//   //   });
//   // }
//
//
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
//       body: Column(crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 33, top: 20),
//             child: Align(
//               alignment: Alignment.centerRight, // Align text to the right
//               child: GestureDetector(
//                 onTap: _showLanguageDialog,
//                 child: Text(
//                   languageText,
//                   style: GoogleFonts.inter(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           // Text with Google Fonts
//           // Padding(
//           //   padding: const EdgeInsets.only(right: 33, top: 10),
//           //   child: Align(
//           //     alignment: Alignment.centerRight, // Align text to the right
//           //     child: Text(
//           //       AppLocalizations.of(context).lunguage,
//           //       style: GoogleFonts.inter(
//           //         fontWeight: FontWeight.w700,
//           //         fontSize: 15,
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           SizedBox(
//             height: 150,
//           ),
//           Center(
//             child: FadeTransition(
//               opacity: _opacityAnimation,
//               child: Image.asset(
//                 'assets/image/Logo.png', // Ensure the asset path is correct
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 60,
//           ),
//           Center(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 // New Inquiry Button
//                 Container(
//                   height: 31,
//                   width: 155,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       _handleTap(true);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: isNewInquirySelected ? Colors.black : Colors.white,
//                       backgroundColor: isNewInquirySelected ? Color(0xFFD9D9D9) : Color(0xFF003123), // Dynamic text color
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
//                         newInquiryText,
//                         style: GoogleFonts.inter(
//                           fontWeight: FontWeight.w700,
//                           fontSize: 14,
//                           color: isNewInquirySelected ? Colors.black : Colors.white, // Dynamic text color
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Done Inquiry Button
//                 Container(
//                   height: 31,
//                   width: 155,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       _handleTap(false);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: !isNewInquirySelected ? Colors.white : Colors.black, backgroundColor: !isNewInquirySelected ? Color(0xFF003123) : Color(0xFFD9D9D9), // Dynamic text color
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
//                         doneInquiryText,
//                         style: GoogleFonts.inter(
//                           fontWeight: FontWeight.w700,
//                           fontSize: 14,
//                           color: !isNewInquirySelected ? Colors.white : Colors.black, // Dynamic text color
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: SizedBox(
//               height: 60,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 33, bottom: 20),
//             child: Align(
//               alignment: Alignment.centerRight, // Align text to the right
//               child: Container(
//                 height: 50,
//                 width: 50,
//                 decoration: BoxDecoration(
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
//                       spreadRadius: 2, // How much the shadow spreads
//                       blurRadius: 5, // How blurry the shadow is
//                       offset: Offset(0, 3), // Position of the shadow (x, y)
//                     ),
//                   ],
//                   color: Color(0xFFD9D9D9), // Correct way to set background color
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 child:IconButton(
//                   onPressed: () {
//                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddNewReciprocatingPage(language: widget.language,),));
//                   },
//                   //onPressed: _addCompany, // Call the function to add a company
//                   icon: Icon(
//                     Icons.add,
//                     size: 22,
//                     color: Color(0xFF000000), // Icon color
//                   ),
//                 )
//
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  String language = 'English'; // Default language
  String newInquiryText = '';
  String doneInquiryText = '';
  String languageText = '';

  @override
  void initState() {
    super.initState();
    _loadLanguage();
    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Animation duration
      vsync: this,
    )..repeat(reverse: true); // Repeat the animation

    // Define the opacity animation
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOut,
        ),
    );
  }

  void _changeLanguage(String selectedLanguage) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', selectedLanguage);
    setState(() {
      language = selectedLanguage;
      _updateTextBasedOnLanguage();
    });
  }

  void _updateTextBasedOnLanguage() {
    newInquiryText = TranslationHelper.translate(language, 'newInquiry');
    doneInquiryText = TranslationHelper.translate(language, 'doneInquiry');
    languageText = TranslationHelper.translate(language, 'language');
  }

  void _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      language = prefs.getString('language') ?? 'English'; // Default to English
      _updateTextBasedOnLanguage();
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isNewInquirySelected = true; // Initially, the first button is selected

  void _handleTap(bool isNewInquiry) {
    setState(() {
      isNewInquirySelected = isNewInquiry;
    });
    // Navigate to the respective pages based on the button tapped
    if (isNewInquiry) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => newinquirypage(language: language)),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => demoinqurypage(language: language,)),
      );
    }
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Language', style: GoogleFonts.inter(fontWeight: FontWeight.w600)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('English', style: GoogleFonts.inter()),
                onTap: () {
                  _changeLanguage('English');
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Gujarati (ગુજરાતી)', style: GoogleFonts.inter()),
                onTap: () {
                  _changeLanguage('Gujarati');
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size based on the orientation
    Size size = MediaQuery.of(context).size;

// Get height and width based on the orientation
    double height = size.height;
    double width = size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 33, top: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  _showLanguageDialog();
                },
                child: Text(
                  languageText,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 14),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 33, top: 20),
          //   child: Align(
          //     alignment: Alignment.centerRight, // Align text to the right
          //     child: GestureDetector(
          //       onTap: _showLanguageDialog,
          //       child: Text(
          //         languageText,
          //         style: GoogleFonts.inter(
          //           fontWeight: FontWeight.w700,
          //           fontSize: 14,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Text with Google Fonts
          // Padding(
          //   padding: const EdgeInsets.only(right: 33, top: 10),
          //   child: Align(
          //     alignment: Alignment.centerRight, // Align text to the right
          //     child: Text(
          //       AppLocalizations.of(context).lunguage,
          //       style: GoogleFonts.inter(
          //         fontWeight: FontWeight.w700,
          //         fontSize: 15,
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 150,
          ),
          Center(
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Image.asset(
                height: 200,
                width: 240,
                'assets/image/Logo.png', // Ensure the asset path is correct
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // New Inquiry Button
                Container(
                  height: 31,
                  width: 155,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _handleTap(true);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: isNewInquirySelected ? Colors.black : Colors.white,
                      backgroundColor: isNewInquirySelected ? Color(0xFFD9D9D9) : Color(0xFF003123), // Dynamic text color
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
                        newInquiryText,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: isNewInquirySelected ? Colors.black : Colors.white, // Dynamic text color
                        ),
                      ),
                    ),
                  ),
                ),
                // Done Inquiry Button
                Container(
                  height: 31,
                  width: 155,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      _handleTap(false);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: !isNewInquirySelected ? Colors.white : Colors.black, backgroundColor: !isNewInquirySelected ? Color(0xFF003123) : Color(0xFFD9D9D9), // Dynamic text color
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
                        doneInquiryText,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: !isNewInquirySelected ? Colors.white : Colors.black, // Dynamic text color
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 33, bottom: 20),
            child: Align(
              alignment: Alignment.centerRight, // Align text to the right
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddNewReciprocatingPage(language: language),));
                },
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
                          spreadRadius: 2, // How much the shadow spreads
                          blurRadius: 5, // How blurry the shadow is
                          offset: Offset(0, 3), // Position of the shadow (x, y)
                        ),
                      ],
                      color: Color(0xFFD9D9D9), // Correct way to set background color
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Icon(Icons.add),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}






class NewPage extends StatelessWidget {
  final String language;

  const NewPage({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    // Update the text based on the selected language
    String welcomeText;
    if (language == 'English') {
      welcomeText = 'Welcome to the New Page!';
    } else if (language == 'Gujarati') {
      welcomeText = 'નવું પાનુંમાં આપનું સ્વાગત છે!';
    } else {
      welcomeText = 'Welcome to the New Page!';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          language == 'English' ? 'New Page' : 'નવું પાનું',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFF003123),
      ),
      body: Center(
        child: Text(
          welcomeText,
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class DoneInquiryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Done Inquiry Page"),
      ),
      body: Center(
        child: Text("This is the Done Inquiry Page"),
      ),
    );
  }
}

