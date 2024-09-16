import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/Getx.dart';
import '../../Model/Model.dart';
import '../../Model/luaguage.dart';
import '../../dashBoard.dart';
import '../R_HomePage/Addnewresiprocating.dart';
import '../R_HomePage/Reciprocating.dart';
import 'Screwaircomp.dart';

class addnewscrewairpage extends StatefulWidget {
  final String language; // Add language parameter
  const addnewscrewairpage({super.key,required this.language});

  @override
  State<addnewscrewairpage> createState() => _addnewscrewairpageState();
}

class _addnewscrewairpageState extends State<addnewscrewairpage> {

  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _pdfPathController = TextEditingController();
  final List<Company> _companies = [];
  final CompanyControllersS companyController = Get.put(CompanyControllersS());
  final _formKey1 = GlobalKey<FormState>(); // GlobalKey for FormState
  final _formKey2 = GlobalKey<FormState>(); // GlobalKey for FormState
  final FirestoreService _firestoreService = FirestoreService();

  late String addNewText;
  late String companyNameHintText;
  late String userNameHintText;
  late String pdfHintText;
  late String addText;
  late String pdfText;
  List<String>? _selectedFilePath;

  @override
  void initState() {
    super.initState();

    // Initialize translation strings using the widget.language
    addNewText = TranslationHelper.translate(widget.language, 'addNewText');
    companyNameHintText = TranslationHelper.translate(widget.language, 'companyNameHintText');
    userNameHintText = TranslationHelper.translate(widget.language, 'userNameHintText');
    pdfHintText = TranslationHelper.translate(widget.language, 'pdfHintText');
    addText = TranslationHelper.translate(widget.language, 'addText');
    pdfText = TranslationHelper.translate(widget.language, 'pdfText');
  }
  void _addCompany() async {
    // Validate the form
    if (_formKey1.currentState!.validate() &&
        _formKey2.currentState!.validate()) {
      // Get values from controllers
      final companyName = _companyNameController.text;
      final userName = _userNameController.text;
      final pdfPath = _pdfPathController.text;
      List<String> pdfPaths = _pdfPathController.text.isNotEmpty
          ? _pdfPathController.text.split(',').map((path) => path.trim()).toList()
          : [];

      // Create a new company instance
      final newCompany =
      Company(Cname: companyName, Uname: userName, pdfPath: pdfPaths);

      // Clear the form fields
      _companyNameController.clear();
      _userNameController.clear();
      _pdfPathController.clear();

      // Attempt to save the company to Firestore
      try {
        await _firestoreService.addCompanyToFirestore(
            companyName, userName, pdfPath);

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Company added successfully!'),
            duration: Duration(seconds: 2),
          ),
        );

        // Pop the current screen and return the new company object
        Navigator.pop(context, newCompany);
      } catch (error) {
        // Handle Firestore errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error adding company: $error'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } else {
      // If form validation fails, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all fields.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  // void _addCompany() {
  //   final companyName = _companyNameController.text;
  //   final userName = _userNameController.text;
  //   final pdfPath = _pdfPathController.text; // Get the PDF path
  //
  //   if (companyName.isNotEmpty && userName.isNotEmpty && pdfPath.isNotEmpty) {
  //     final newCompany = Company(Cname: companyName, Uname: userName, pdfPath: pdfPath); // Pass pdfPath here
  //     _companyNameController.clear();
  //     _userNameController.clear();
  //     _pdfPathController.clear(); // Optionally clear the PDF path
  //
  //     // Show SnackBar
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Company added successfully!'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //
  //     // Return the new company to the previous screen
  //     Navigator.pop(context, newCompany);
  //   } else {
  //     // Show SnackBar if fields are empty
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Please fill all fields.'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //   }
  // }
  //
  // void _showPDFPickerDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Pick PDF Files'),
  //         content: PDFPickerDialogContent(
  //           onFileSelected: (path) {
  //             setState(() {
  //               _pdfPathController.text = path.toString(); // Update PDF path
  //             });
  //             Navigator.of(context).pop(); // Close dialog
  //           },
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('Close'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  // void _addCompany() {
  //   final companyName = _companyNameController.text;
  //   final userName = _userNameController.text;
  //
  //   if (companyName.isNotEmpty && userName.isNotEmpty) {
  //     final newCompany = Company(companyName, userName);
  //     _companyNameController.clear();
  //     _userNameController.clear();
  //
  //     // Show SnackBar
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Company added successfully!'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //
  //     // Return the new company to the previous screen
  //     Navigator.pop(context, newCompany);
  //   } else {
  //     // Show SnackBar if fields are empty
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Please enter both company name and user name.'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Expanded(
        child: Column(
          children: [
            SizedBox(height: height * 0.030),
            Container(
              height: 65,
              child: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
                        screwaitcomppage(companies: [Company(Cname: '', Uname: '', pdfPath: [])], language: widget.language,)));
                  },
                ),
                title: Text(
                  addNewText,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Color(0xFF003123),
                toolbarHeight: 28,
              ),
            ),
            SizedBox(height: height * 0.015),
            Form(
              key: _formKey1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: _companyNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter company name';
                    } else if (value.length > 50) {
                      return 'Company name cannot exceed 50 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    // Adjusts padding inside the text field
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(
                          10)), // Rounds the corners of the text field
                    ),
                    fillColor: Color(0xFFD9D9D9),
                    // Sets the background color
                    filled: true,
                    // Enables the background color
                    hintText: companyNameHintText, // Placeholder text
                  ),
                ),
              ),
            ),
            Form(
              key: _formKey2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _userNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter user name';
                    } else if (value.length > 20) {
                      return 'User name cannot exceed 20 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    // Adjusts padding inside the text field
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(
                          10)), // Rounds the corners of the text field
                    ),
                    fillColor: Color(0xFFD9D9D9),
                    // Sets the background color
                    filled: true,
                    // Enables the background color
                    hintText: userNameHintText, // Placeholder text
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.url,
                controller: _pdfPathController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  fillColor: Color(0xFFD9D9D9),
                  filled: true,
                  hintText: pdfHintText,
                ),
                onTap: () {
                  _showPDFPickerDialog();
                },
              ),
            ),
            Expanded(child: SizedBox(height: height * 0.015)),
            Padding(
              padding: const EdgeInsets.only(right: 33, bottom: 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: addText,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: pdfText,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.010),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            if (_formKey1.currentState!.validate() &&
                                _formKey2.currentState!.validate()) {
                              print(
                                  'If the form is valid, call _addCompany() to save to Firestore');
                              _addCompany();
                            } else {
                              print(
                                  'Show error message if form validation fails');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Please correct the errors in the form'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                            // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ReciprocatingPage(companies: _companies,),));
                          },
                          icon: Icon(
                            Icons.add,
                            size: 22,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _showPDFPickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Pick PDF Files',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8, // Set dialog width
            height: 300, // Set dialog height
            child: PDFPickerDialogContent(
              onFileSelected: (paths) {
                if (paths.isNotEmpty) {
                  setState(() {
                    _pdfPathController.text = paths.join(', '); // Update PDF paths as comma-separated
                    _selectedFilePath = paths; // Set the selected file paths
                  });

                  // Handle Firestore updates
                  _updateFirestore(paths);
                }
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> _updateFirestore(List<String> paths) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String uid = user.uid;
        String companyName = _companyNameController.text;

        for (String path in paths) {
          await FirebaseFirestore.instance.collection('userPdfs').add({
            'uid': uid,
            'cname': companyName,
            'pdfFilePath': path,
            'timestamp': FieldValue.serverTimestamp(),
          });
        }

        print('PDF paths and company name added to Firestore');
      } else {
        print('User not logged in');
      }
    } catch (e) {
      print('Error saving data to Firestore: $e');
    }
  }

}


//
// ======================================
//
// class addnewscrewai extends StatefulWidget {
//   const addnewscrewai({super.key});
//
//   @override
//   State<addnewscrewai> createState() => _addnewscrewaiState();
// }
//
// class _addnewscrewaiState extends State<addnewscrewai> {
//
//   final TextEditingController _companyNameController = TextEditingController();
//   final TextEditingController _userNameController = TextEditingController();
//   final TextEditingController _pdfPathController = TextEditingController();
//   final List<Company> _companies = [];
//
//   void _addCompany() {
//     final companyName = _companyNameController.text;
//     final userName = _userNameController.text;
//     final pdfPath = _pdfPathController.text; // Get the PDF path
//
//     if (companyName.isNotEmpty && userName.isNotEmpty && pdfPath.isNotEmpty) {
//       final newCompany = Company(companyName, userName, pdfPath); // Pass pdfPath here
//       _companyNameController.clear();
//       _userNameController.clear();
//       _pdfPathController.clear(); // Optionally clear the PDF path
//
//       // Show SnackBar
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Company added successfully!'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//
//       // Return the new company to the previous screen
//       Navigator.pop(context, newCompany);
//     } else {
//       // Show SnackBar if fields are empty
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please fill all fields.'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//   }
//
//   void _showPDFPickerDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Pick PDF Files'),
//           content: PDFPickerDialogContent(
//             onFileSelected: (path) {
//               setState(() {
//                 _pdfPathController.text = path; // Update PDF path
//               });
//               Navigator.of(context).pop(); // Close dialog
//             },
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Close'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   String _translate(String key, String langCode) {
//     Map<String, Map<String, String>> translations = {
//       'en': {
//         'add_new_screw': 'Add new SCREW AIR COMPRESSOR',
//         'company_name': 'Company Name',
//         'user_name': 'User Name',
//         'quotation_pdf': 'Quotation PDF',
//         'add': 'ADD',
//         'pdf': 'PDF',
//       },
//       'gu': {
//         'add_new_screw': 'નવો સ્ક્રુ એર કમ્પ્રેસર ઉમેરો',
//         'company_name': 'કંપનીનું નામ',
//         'user_name': 'વપરાશકર્તા નામ',
//         'quotation_pdf': 'કોટેશન PDF',
//         'add': 'ઉમેરો',
//         'pdf': 'PDF',
//       },
//     };
//
//     return translations[langCode]?[key] ?? key;
//   }
//
//   void _translateText(String langCode) {
//     setState(() {
//       // Example of updating the AppBar title and other texts
//       _translatedTitle = _translate('add_new_screw', langCode);
//       _companyNameHint = _translate('company_name', langCode);
//       _userNameHint = _translate('user_name', langCode);
//       _quotationPDFHint = _translate('quotation_pdf', langCode);
//       _addText = _translate('add', langCode);
//       _pdfText = _translate('pdf', langCode);
//     });
//   }
//
//   String _translatedTitle = '';
//   String _companyNameHint = '';
//   String _userNameHint = '';
//   String _quotationPDFHint = '';
//   String _addText = '';
//   String _pdfText = '';
//
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double height = size.height;
//     double width = size.width;
//     return Scaffold(
//       backgroundColor: Color(0xFFFFFFFF),
//       body: Column(
//         children: [
//           SizedBox(height: height * 0.030),
//           Container(
//             height: 65,
//             child: AppBar(
//               actions: [
//                 IconButton(
//                   icon: Icon(Icons.language),
//                   onPressed: _showLanguageSelectionDialog,
//                 ),
//               ],
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
//                 onPressed: () {
//                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ReciprocatingPage(companies: _companies, language: '',)));
//                 },
//               ),
//               title: Text(
//                 _translatedTitle,
//                 style: GoogleFonts.inter(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 18,
//                   color: Colors.white,
//                 ),
//               ),
//               backgroundColor: Color(0xFF003123),
//               toolbarHeight: 28,
//             ),
//           ),
//           SizedBox(height: height * 0.015),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: _companyNameController,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 fillColor: Color(0xFFD9D9D9),
//                 filled: true,
//                 hintText: _companyNameHint,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: _userNameController,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 fillColor: Color(0xFFD9D9D9),
//                 filled: true,
//                 hintText: _userNameHint,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: _pdfPathController,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 fillColor: Color(0xFFD9D9D9),
//                 filled: true,
//                 hintText: _quotationPDFHint,
//               ),
//               onTap: _showPDFPickerDialog,
//               readOnly: true, // Prevent manual editing
//             ),
//           ),
//           Expanded(child: SizedBox(height: height * 0.015)),
//           Padding(
//             padding: const EdgeInsets.only(right: 33, bottom: 20),
//             child: Align(
//               alignment: Alignment.bottomRight,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: _addText,
//                           style: GoogleFonts.inter(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 10,
//                             color: Color(0xFF000000),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: _pdfText,
//                           style: GoogleFonts.inter(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 10,
//                             color: Color(0xFF000000),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: height * 0.010),
//                   Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           spreadRadius: 2,
//                           blurRadius: 5,
//                           offset: Offset(0, 3),
//                         ),
//                       ],
//                       color: Color(0xFFD9D9D9),
//                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                     ),
//                     child: Center(
//                       child: IconButton(
//                         onPressed: () {
//                           _addCompany();
//                         },
//                         icon: Icon(
//                           Icons.add,
//                           size: 22,
//                           color: Color(0xFF000000),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//
//   }
//   void _showLanguageSelectionDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Select Language'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 title: Text('English'),
//                 onTap: () {
//                   _translateText('en');
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 title: Text('Gujarati'),
//                 onTap: () {
//                   _translateText('gu');
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Close'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
// }
