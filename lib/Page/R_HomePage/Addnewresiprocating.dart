import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/dashBoard.dart';
import 'package:path/path.dart' as path;
import '../../Model/Getx.dart';
import '../../Model/Model.dart';
import '../../Model/luaguage.dart';
import '../../main.dart';
import 'Reciprocating.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNewReciprocatingPage extends StatefulWidget {
  final String language;

  const AddNewReciprocatingPage({super.key, required this.language});

  @override
  State<AddNewReciprocatingPage> createState() =>
      _AddNewReciprocatingPageState();
}

class _AddNewReciprocatingPageState extends State<AddNewReciprocatingPage> {
  late String addNewText;
  late String companyNameHintText;
  late String userNameHintText;
  late String pdfHintText;
  late String addText;
  late String pdfText;

  @override
  void initState() {
    super.initState();

    // Initialize translation strings using the widget.language
    addNewText = TranslationHelper.translate(widget.language, 'addNewText');
    companyNameHintText =
        TranslationHelper.translate(widget.language, 'companyNameHintText');
    userNameHintText =
        TranslationHelper.translate(widget.language, 'userNameHintText');
    pdfHintText = TranslationHelper.translate(widget.language, 'pdfHintText');
    addText = TranslationHelper.translate(widget.language, 'addText');
    pdfText = TranslationHelper.translate(widget.language, 'pdfText');
  }

  final CompanyControllersR companyController = Get.put(CompanyControllersR());
  final _formKey1 = GlobalKey<FormState>(); // GlobalKey for FormState
  final _formKey2 = GlobalKey<FormState>(); // GlobalKey for FormState
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _pdfPathController = TextEditingController();

  // String? _selectedFilePath;
  List<String> _selectedFiles = [];
  String? _selectedPdf;

// Define _selectedFilePath as List<String>? in your class
  List<String>? _selectedFilePath;

  // void _addCompany() {
  //   final companyName = _companyNameController.text;
  //   final userName = _userNameController.text;
  //   final pdfPath = _pdfPathController.text;
  //
  //   if (companyName.isNotEmpty && userName.isNotEmpty && pdfPath.isNotEmpty) {
  //     final newCompany = Company(companyName, userName, pdfPath);
  //
  //     // Clear fields
  //     _companyNameController.clear();
  //     _userNameController.clear();
  //     _pdfPathController.clear();
  //
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Company added successfully!'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //
  //     Navigator.pop(context, newCompany);
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Please fill all fields.'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //   }
  // }
  final FirestoreService _firestoreService = FirestoreService();

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

  // void _addCompany() async {
  //   // Validate the form
  //   if (_formKey.currentState!.validate()) {
  //     final companyName = _companyNameController.text;
  //     final userName = _userNameController.text;
  //     final pdfPath = _pdfPathController.text;
  //
  //     final newCompany = Company(companyName, userName, pdfPath);
  //
  //     // Clear fields after adding company
  //     _companyNameController.clear();
  //     _userNameController.clear();
  //     _pdfPathController.clear();
  //
  //     // Save the new company to Firestore
  //     try {
  //       await _firestoreService.addCompanyToFirestore(companyName, userName, pdfPath);
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Company added successfully!'),
  //           duration: Duration(seconds: 2),
  //         ),
  //       );
  //       Navigator.pop(context, newCompany);
  //     } catch (error) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Error adding company: $error'),
  //           duration: Duration(seconds: 2),
  //         ),
  //       );
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Please fill all fields.'),
  //         duration: Duration(seconds: 2),
  //       ),
  //     );
  //   }
  // }
  // void _addCompany() async {
  //   final companyName = _companyNameController.text;
  //   final userName = _userNameController.text;
  //   final pdfPath = _pdfPathController.text;
  //
  //   if (companyName.isNotEmpty && userName.isNotEmpty && pdfPath.isNotEmpty) {
  //     final newCompany = Company(companyName, userName, pdfPath);
  //
  //     // Clear fields
  //     _companyNameController.clear();
  //     _userNameController.clear();
  //     _pdfPathController.clear();
  //
  //     // Save the new company to Firestore
  //     try {
  //       await _firestoreService.addCompanyToFirestore(companyName, userName, pdfPath);
  //
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Company added successfully!'),
  //           duration: Duration(seconds: 2),
  //         ),
  //       );
  //
  //       Navigator.pop(context, newCompany);
  //     } catch (error) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           content: Text('Error adding company: $error'),
  //           duration: Duration(seconds: 2),
  //         ),
  //       );
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Please fill all fields.'),
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
      body: Column(
        children: [
          SizedBox(height: height * 0.030),
          Container(
            height: 65,
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReciprocatingPage(
                        companies: [Company(Cname: '', Uname: '', pdfPath: [])],
                        language: widget.language,
                      ),
                    ),
                  );
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
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Obx(() => TextFormField(
          //     onChanged: (value) => controller.companyName.value = value,
          //     decoration: InputDecoration(
          //       contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(10)),
          //       ),
          //       fillColor: Color(0xFFD9D9D9),
          //       filled: true,
          //       hintText: companyNameHintText,
          //     ),
          //   )),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Obx(() => TextFormField(
          //     onChanged: (value) => controller.userName.value = value,
          //     decoration: InputDecoration(
          //       contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(10)),
          //       ),
          //       fillColor: Color(0xFFD9D9D9),
          //       filled: true,
          //       hintText: userNameHintText,
          //     ),
          //   )),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Obx(() => GestureDetector(
          //     onTap: _showPDFPickerDialog,
          //     child: Container(
          //       padding: EdgeInsets.symmetric(horizontal: 10.0),
          //       decoration: BoxDecoration(
          //         color: Color(0xFFD9D9D9),
          //         borderRadius: BorderRadius.all(Radius.circular(10)),
          //       ),
          //       child: Row(
          //         children: [
          //           Expanded(
          //             child: Text(
          //               _pdfPathController.pdfPath.value.isEmpty
          //                   ? pdfHintText
          //                   : _pdfPathController.pdfPath.value,
          //               style: TextStyle(
          //                 color: _pdfPathController.pdfPath.value.isEmpty
          //                     ? Colors.grey
          //                     : Colors.black,
          //               ),
          //             ),
          //           ),
          //           Icon(Icons.attach_file),
          //         ],
          //       ),
          //     ),
          //   )),
          // ),
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
                  hintText: companyNameHintText.trim(), // Placeholder text
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
                  hintText: userNameHintText.trim(), // Placeholder text
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
                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  ReciprocatingPage(
                              //   companies: [Company(Cname: '', Uname: '', pdfPath: [])],
                              //   language: widget.language,
                              // ), ));
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
                          }, // Trigger form validation before submission
                          icon: Icon(
                            Icons.add,
                            size: 22,
                            color: Color(0xFF000000),
                          ),
                          // child: Center(
                          //   child: IconButton(
                          //     onPressed: () {
                          //       // Call method to add company
                          //       final newCompany = Company(
                          //         _companyNameController.text,
                          //         _userNameController.text,
                          //         _pdfPathController.text,
                          //       );
                          //
                          //       // Add the new company to the list using the controller
                          //       companyController.addCompany(newCompany);
                          //
                          //       // Clear the input fields
                          //       _companyNameController.clear();
                          //       _userNameController.clear();
                          //       _pdfPathController.clear();
                          //
                          //       // Show a snackbar confirmation
                          //       ScaffoldMessenger.of(context).showSnackBar(
                          //         SnackBar(
                          //           content: Text("Company added!"),
                          //         ),
                          //       );
                          //     },
                          //     icon: Icon(
                          //       Icons.add,
                          //       size: 22,
                          //       color: Color(0xFF000000),
                          //     ),
                          //   ),
                          // ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    // return Scaffold(
    //   backgroundColor: Color(0xFFFFFFFF),
    //   body: Column(
    //     children: [
    //       SizedBox(height: height * 0.030),
    //       Container(
    //         height: 65,
    //         child: AppBar(
    //           leading: IconButton(
    //             icon: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
    //             onPressed: () {
    //               Navigator.pushReplacement(
    //                 context,
    //                 MaterialPageRoute(
    //                   builder: (context) => ReciprocatingPage(
    //                     companies: [],
    //                     language: widget.language,
    //                   ),
    //                 ),
    //               );
    //             },
    //           ),
    //           title: Text(
    //             addNewText,
    //             style: GoogleFonts.inter(
    //               fontWeight: FontWeight.w700,
    //               fontSize: 18,
    //               color: Colors.white,
    //             ),
    //           ),
    //           backgroundColor: Color(0xFF003123),
    //           toolbarHeight: 28,
    //         ),
    //       ),
    //       SizedBox(height: height * 0.015),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Obx(() => TextFormField(
    //           onChanged: (value) => controller.companyName.value = value,
    //           decoration: InputDecoration(
    //             contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.all(Radius.circular(10)),
    //             ),
    //             fillColor: Color(0xFFD9D9D9),
    //             filled: true,
    //             hintText: companyNameHintText,
    //           ),
    //         )),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Obx(() => TextFormField(
    //           onChanged: (value) => controller.userName.value = value,
    //           decoration: InputDecoration(
    //             contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.all(Radius.circular(10)),
    //             ),
    //             fillColor: Color(0xFFD9D9D9),
    //             filled: true,
    //             hintText: userNameHintText,
    //           ),
    //         )),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Obx(() {
    //           return GestureDetector(
    //             onTap: _showPDFPickerDialog,
    //             child: Container(
    //               padding: EdgeInsets.symmetric(horizontal: 10.0),
    //               decoration: BoxDecoration(
    //                 color: Color(0xFFD9D9D9),
    //                 borderRadius: BorderRadius.all(Radius.circular(10)),
    //               ),
    //               child: Row(
    //                 children: [
    //                   Expanded(
    //                     child: Text(
    //                       controller.pdfPath.value.isEmpty
    //                           ? pdfHintText
    //                           : controller.pdfPath.value,
    //                       style: TextStyle(
    //                         color: controller.pdfPath.value.isEmpty
    //                             ? Colors.grey
    //                             : Colors.black,
    //                       ),
    //                     ),
    //                   ),
    //                   Icon(Icons.attach_file),
    //                 ],
    //               ),
    //             ),
    //           );
    //         }),
    //       ),
    //
    //
    //       Expanded(child: SizedBox(height: height * 0.015)),
    //       Padding(
    //         padding: const EdgeInsets.only(right: 33, bottom: 20),
    //         child: Align(
    //           alignment: Alignment.bottomRight,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               RichText(
    //                 text: TextSpan(
    //                   children: [
    //                     TextSpan(
    //                       text: addText,
    //                       style: GoogleFonts.inter(
    //                         fontWeight: FontWeight.w400,
    //                         fontSize: 10,
    //                         color: Color(0xFF000000),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               RichText(
    //                 text: TextSpan(
    //                   children: [
    //                     TextSpan(
    //                       text: pdfText,
    //                       style: GoogleFonts.inter(
    //                         fontWeight: FontWeight.w400,
    //                         fontSize: 10,
    //                         color: Color(0xFF000000),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               SizedBox(height: height * 0.010),
    //               Container(
    //                 height: 50,
    //                 width: 50,
    //                 decoration: BoxDecoration(
    //                   boxShadow: [
    //                     BoxShadow(
    //                       color: Colors.grey.withOpacity(0.5),
    //                       spreadRadius: 2,
    //                       blurRadius: 5,
    //                       offset: Offset(0, 3),
    //                     ),
    //                   ],
    //                   color: Color(0xFFD9D9D9),
    //                   borderRadius: BorderRadius.all(Radius.circular(10)),
    //                 ),
    //                 child: Center(
    //                   child: IconButton(
    //                     onPressed: _addCompany,
    //                     icon: Icon(
    //                       Icons.add,
    //                       size: 22,
    //                       color: Color(0xFF000000),
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
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
                  // _updateFirestore(paths); // Commented out if using `_uploadFiles`
                }
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Upload'),
              onPressed: () {
                if (_selectedFilePath != null && _selectedFilePath!.isNotEmpty) {
                  _uploadFiles(_selectedFilePath!); // Upload the selected files
                }
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// Define this function to upload files to Firebase Storage
  Future<void> _uploadFiles(List<String> filePaths) async {
    final storageRef = FirebaseStorage.instance.ref();
    List<String> downloadUrls = [];

    for (String filePath in filePaths) {
      final file = File(filePath);
      final fileName = path.basename(filePath);
      final fileRef = storageRef.child('pdfs/$fileName');

      try {
        // Upload the file
        await fileRef.putFile(file);

        // Get the download URL
        final downloadUrl = await fileRef.getDownloadURL();
        downloadUrls.add(downloadUrl);
        print('File uploaded successfully. Download URL: $downloadUrl');
      } catch (e) {
        print('Error uploading file: $e');
        // Optionally, show a Snackbar or Dialog with the error message
      }
    }

    // Update Firestore with the download URLs
    if (downloadUrls.isNotEmpty) {
      await _updateFirestore(downloadUrls);
    }
  }

// Function to update Firestore with the file download URLs
  Future<void> _updateFirestore(List<String> downloadUrls) async {
    try {
      // Example: Add a document with the download URLs to a collection
      await _firestore.collection('pdfs').add({
        'urls': downloadUrls,
        'timestamp': FieldValue.serverTimestamp(),
      });
      print('Firestore updated successfully with URLs');
    } catch (e) {
      print('Error updating Firestore: $e');
      // Optionally, show a Snackbar or Dialog with the error message
    }
  }
//   void _showPDFPickerDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             'Pick PDF Files',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87,
//             ),
//           ),
//           content: SizedBox(
//             width: MediaQuery.of(context).size.width * 0.8, // Set dialog width
//             height: 300, // Set dialog height
//             child: PDFPickerDialogContent(
//               onFileSelected: (paths) {
//                 if (paths.isNotEmpty) {
//                   setState(() {
//                     _pdfPathController.text = paths.join(', '); // Update PDF paths as comma-separated
//                     _selectedFilePath = paths; // Set the selected file paths
//                   });
//
//                   // Handle Firestore updates
//                  // _updateFirestore(paths);
//                 }
//               },
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Upload'),
//               onPressed: () {
//                 if (_selectedFilePath != null && _selectedFilePath!.isNotEmpty) {
//                   _uploadFiles(_selectedFilePath!); // Upload the selected files
//                 }
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//             ),
//
//           ],
//         );
//       },
//     );
//   }
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   // Define this function to upload files to Firebase Storage
//   Future<void> _uploadFiles(List<String> filePaths) async {
//     final storageRef = FirebaseStorage.instance.ref();
//     List<String> downloadUrls = [];
//
//     for (String filePath in filePaths) {
//       final file = File(filePath);
//       final fileName = path.basename(filePath);
//       final fileRef = storageRef.child('pdfs/$fileName');
//
//       try {
//         // Upload the file
//         await fileRef.putFile(file);
//
//         // Get the download URL
//         final downloadUrl = await fileRef.getDownloadURL();
//         downloadUrls.add(downloadUrl);
//         print('File uploaded successfully. Download URL: $downloadUrl');
//       } catch (e) {
//         print('Error uploading file: $e');
//       }
//     }
//
//     // Update Firestore with the download URLs
//     if (downloadUrls.isNotEmpty) {
//       await _updateFirestore(downloadUrls);
//     }
//   }
//
// // Function to update Firestore with the file download URLs
//   Future<void> _updateFirestore(List<String> downloadUrls) async {
//     try {
//       // Example: Add a document with the download URLs to a collection
//       await _firestore.collection('pdfs').add({
//         'urls': downloadUrls,
//         'timestamp': FieldValue.serverTimestamp(),
//       });
//       print('Firestore updated successfully with URLs');
//     } catch (e) {
//       print('Error updating Firestore: $e');
//     }
//   }

// Future<void> _updateFirestore(List<String> paths) async {
  //   try {
  //     User? user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       String uid = user.uid;
  //       String companyName = _companyNameController.text;
  //
  //       for (String path in paths) {
  //         await FirebaseFirestore.instance.collection('userPdfs').add({
  //           'uid': uid,
  //           'cname': companyName,
  //           'pdfFilePath': path,
  //           'timestamp': FieldValue.serverTimestamp(),
  //         });
  //       }
  //
  //       print('PDF paths and company name added to Firestore');
  //     } else {
  //       print('User not logged in');
  //     }
  //   } catch (e) {
  //     print('Error saving data to Firestore: $e');
  //   }
  // }

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
  // void _showPDFPickerDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Pick PDF Files'),
  //         content: PDFPickerDialogContent(
  //           onFileSelected: (path) {
  //             // Handle single file selection
  //             setState(() {
  //               _selectedFilePath = [path];
  //               _pdfPathController.text = path; // Set the selected path to TextFormField
  //             });
  //           },
  //           onFilesSelected: (files) {
  //             // Handle multiple file selection
  //             setState(() {
  //               _selectedFilePath = files;
  //             });
  //           },
  //           onUpload: () async {
  //             if (_selectedFilePath != null && _selectedFilePath!.isNotEmpty) {
  //               // Upload each selected file
  //               for (String path in _selectedFilePath!) {
  //                 await _uploadPDFToFirebaseStorage(path);
  //               }
  //
  //               // Clear the selected file path
  //               setState(() {
  //                 _selectedFilePath = [];
  //               });
  //
  //               // Close the dialog after the upload
  //               Navigator.of(context).pop();
  //             }
  //           },
  //         ),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('Close'),
  //             onPressed: () {
  //               Navigator.of(context).pop(); // Close the dialog without uploading
  //             },
  //           ),
  //           TextButton(
  //             child: Text('Upload'),
  //             onPressed: () async {
  //               Navigator.of(context).pop(); // Close the dialog before uploading
  //
  //               // Trigger the upload callback
  //               if (_selectedFilePath != null && _selectedFilePath!.isNotEmpty) {
  //                 for (String path in _selectedFilePath!) {
  //                   await _uploadPDFToFirebaseStorage(path);
  //                 }
  //
  //                 // Clear the selected file path
  //                 setState(() {
  //                   _selectedFilePath = [];
  //                 });
  //               }
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  //
  // void _showPDFPickerDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(
  //           'Pick PDF Files',
  //           style: TextStyle(
  //             fontSize: 20,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.black87,
  //           ),
  //         ),
  //         content: Container(
  //           width: MediaQuery.of(context).size.width * 0.8, // Set dialog width
  //           height: 250, // Increased height for better visibility
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               PDFPickerDialogContent(
  //                 onFileSelected: (path) async {
  //                   if (path != null && path.isNotEmpty) {
  //                     setState(() {
  //                       _selectedFilePath = [
  //                         path
  //                       ]; // Fixed type conversion and assignment
  //                       _pdfPathController.text = path;
  //                     });
  //
  //                     try {
  //                       User? user = FirebaseAuth.instance.currentUser;
  //                       if (user != null) {
  //                         String uid = user.uid;
  //                         String companyName = _companyNameController.text;
  //
  //                         await FirebaseFirestore.instance
  //                             .collection('userPdfs')
  //                             .add({
  //                           'uid': uid,
  //                           'cname': companyName,
  //                           'pdfFilePath': path,
  //                           'timestamp': FieldValue.serverTimestamp(),
  //                         });
  //
  //                         print('PDF path and company name added to Firestore');
  //                       } else {
  //                         print('User not logged in');
  //                       }
  //                     } catch (e) {
  //                       print('Error saving data to Firestore: $e');
  //                     }
  //                   }
  //                   Navigator.of(context).pop();
  //                 },
  //               ),
  //               SizedBox(height: 10),
  //               _selectedFilePath != null && _selectedFilePath!.isNotEmpty
  //                   ? Container(
  //                       height: 60,
  //                       // Adjusted height
  //                       width: double.infinity,
  //                       padding: EdgeInsets.all(10),
  //                       decoration: BoxDecoration(
  //                         border: Border.all(color: Colors.grey.shade300),
  //                         borderRadius: BorderRadius.circular(8),
  //                       ),
  //                       child: Row(
  //                         children: [
  //                           Icon(Icons.picture_as_pdf,
  //                               color: Colors.redAccent, size: 30),
  //                           SizedBox(width: 10),
  //                           Expanded(
  //                             child: Text(
  //                               _selectedFilePath!.first,
  //                               // Display the first path from the list
  //                               style: TextStyle(
  //                                 fontSize: 14,
  //                                 fontWeight: FontWeight.w500,
  //                                 color: Colors.black87,
  //                               ),
  //                               overflow:
  //                                   TextOverflow.ellipsis, // Handle overflow
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     )
  //                   : Container(
  //                       height: 60, // Adjusted height
  //                       width: double.infinity,
  //                       alignment: Alignment.center,
  //                       child: Text(
  //                         'No file selected',
  //                         style: TextStyle(
  //                           fontSize: 14,
  //                           fontWeight: FontWeight.w500,
  //                           color: Colors.black87,
  //                         ),
  //                       ),
  //                     ),
  //             ],
  //           ),
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
  // void _showPDFPickerDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(
  //           'Pick PDF Files',
  //           style: TextStyle(
  //             fontSize: 20,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.black87,
  //           ),
  //         ),
  //         content: SizedBox(
  //           width: MediaQuery.of(context).size.width * 0.8, // Set dialog width
  //           height: 250, // Set dialog height
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min, // Column will size to fit its children
  //             children: [
  //               PDFPickerDialogContent(onFileSelected: (path) async {
  //                   setState(() {
  //                     _pdfPathController.text = path; // Update PDF path
  //                     _selectedFilePath = [path]; // Set the selected file path
  //                   });
  //
  //                   Navigator.of(context).pop(); // Close the dialog
  //
  //                   try {
  //                     User? user = FirebaseAuth.instance.currentUser;
  //                     if (user != null) {
  //                       String uid = user.uid;
  //                       String companyName = _companyNameController.text;
  //
  //                       await FirebaseFirestore.instance
  //                           .collection('userPdfs')
  //                           .add({
  //                         'uid': uid,
  //                         'cname': companyName,
  //                         'pdfFilePath': path,
  //                         'timestamp': FieldValue.serverTimestamp(),
  //                       });
  //
  //                       print('PDF path and company name added to Firestore');
  //                     } else {
  //                       print('User not logged in');
  //                     }
  //                   } catch (e) {
  //                     print('Error saving data to Firestore: $e');
  //                   }
  //               }),
  //               SizedBox(height: 10),
  //               _selectedFilePath != null && _selectedFilePath!.isNotEmpty
  //                   ? Container(
  //                 height: 60, // Adjusted height
  //                 width: double.infinity,
  //                 padding: EdgeInsets.all(10),
  //                 decoration: BoxDecoration(
  //                   border: Border.all(color: Colors.grey.shade300),
  //                   borderRadius: BorderRadius.circular(8),
  //                 ),
  //                 child: Row(
  //                   children: [
  //                     Icon(Icons.picture_as_pdf, color: Colors.redAccent, size: 30),
  //                     SizedBox(width: 10),
  //                     Expanded(
  //                       child: Text(
  //                         _selectedFilePath!.first, // Display the first path from the list
  //                         style: TextStyle(
  //                           fontSize: 14,
  //                           fontWeight: FontWeight.w500,
  //                           color: Colors.black87,
  //                         ),
  //                         overflow: TextOverflow.ellipsis, // Handle overflow
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               )
  //                   : Container(
  //                 height: 60, // Adjusted height
  //                 width: double.infinity,
  //                 alignment: Alignment.center,
  //                 child: Text(
  //                   'No file selected',
  //                   style: TextStyle(
  //                     fontSize: 14,
  //                     fontWeight: FontWeight.w500,
  //                     color: Colors.black87,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
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

// void _showPDFPickerDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(
//             'Pick PDF Files',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87,
//             ),
//           ),
//           content: Container(
//             width: MediaQuery.of(context).size.width * 0.8, // Set dialog width
//             height: 200, // Set dialog height to ensure proper size
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 PDFPickerDialogContent(
//                   onFileSelected: (path) async {
//                     if (path != null && path.isNotEmpty) {
//                       setState(() {
//                         _selectedFilePath = path.toString() as List<String>?;
//                         _pdfPathController.text = path;
//                       });
//
//                       try {
//                         User? user = FirebaseAuth.instance.currentUser;
//                         if (user != null) {
//                           String uid = user.uid;
//                           String companyName = _companyNameController.text;
//
//                           await FirebaseFirestore.instance.collection('userPdfs').add({
//                             'uid': uid,
//                             'cname': companyName,
//                             'pdfFilePath': path,
//                             'timestamp': FieldValue.serverTimestamp(),
//                           });
//
//                           print('PDF path and company name added to Firestore');
//                         } else {
//                           print('User not logged in');
//                         }
//                       } catch (e) {
//                         print('Error saving data to Firestore: $e');
//                       }
//                     }
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 SizedBox(height: 10),
//                 _selectedFilePath != null && _selectedFilePath!.isNotEmpty
//                     ? Container(
//                   height: 200,
//                   width: 300,
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey.shade300),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(Icons.picture_as_pdf, color: Colors.redAccent, size: 30),
//                       SizedBox(width: 10),
//                       Expanded(
//                         child: Text(
//                           _selectedFilePath!.addAll.toString(),
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.black87,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//                     : Container(
//                   height: 100,width: 100,
//                 ),
//               ],
//             ),
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
// void _showPDFPickerDialog() {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Pick PDF Files'),
//         content: PDFPickerDialogContent(
//           onFileSelected: (path) {
//             setState(() {
//               _selectedFilePath = path;
//               _pdfPathController.text = path; // Set the selected path to TextFormField
//             });
//             Navigator.of(context).pop(); // Close the dialog after file selection
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

// void _showPDFPickerDialog() {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Pick PDF Files'),
//         content: PDFPickerDialogContent(
//           onFileSelected: (path) async {
//             if (path != null && path.isNotEmpty) {
//               setState(() {
//                 _selectedFilePath = path; // Update the selected file path
//                 _pdfPathController.text = path; // Display the selected path in the TextFormField
//               });
//               try {
//                 // Get the current user
//                 User? user = FirebaseAuth.instance.currentUser;
//
//                 if (user != null) {
//                   String uid = user.uid; // Current user UID
//                   String companyName = _companyNameController.text; // Assume cname is entered via a TextFormField
//
//                   // Add PDF path to Firebase Firestore in a new collection
//                   await FirebaseFirestore.instance.collection('userPdfs').add({
//                     'uid': uid,                 // User ID
//                     'cname': companyName,        // Company name
//                     'pdfFilePath': path,         // PDF file path
//                     'timestamp': FieldValue.serverTimestamp(), // Optional: Timestamp for when the file was added
//                   });
//
//                   print('PDF path and company name added to Firestore');
//                 } else {
//                   print('User not logged in');
//                 }
//               } catch (e) {
//                 print('Error saving data to Firestore: $e');
//               }
//             }
//             Navigator.of(context).pop(); // Close the dialog after file selection
//           },
//         ),
//
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

// void _showPDFPickerDialog() {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Pick PDF Files'),
//         content: PDFPickerDialogContent(
//           onFileSelected: (path) {
//             setState(() {
//               _selectedFilePath = path;
//               _pdfPathController.text = path;
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
}

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addCompanyToFirestore(
      String companyName, String userName, String pdfPath) async {
    await _db.collection('companies').add({
      'companyName': companyName,
      'userName': userName,
      'pdfPath': pdfPath,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}

//------------------------------------------

//
// class AddNewReciprocatingPage extends StatefulWidget {
//   final String language;
//   const AddNewReciprocatingPage({super.key, required this.language});
//
//   @override
//   State<AddNewReciprocatingPage> createState() => _AddNewReciprocatingPageState();
// }
//
// class _AddNewReciprocatingPageState extends State<AddNewReciprocatingPage> {
//
//   final AddNewReciprocatingController controller = Get.put(AddNewReciprocatingController());
//
//   final TextEditingController _companyNameController = TextEditingController();
//   final TextEditingController _userNameController = TextEditingController();
//   final TextEditingController _pdfPathController = TextEditingController();
//   String? _selectedFilePath;
//
//   late String addNewText;
//   late String companyNameHintText;
//   late String userNameHintText;
//   late String pdfHintText;
//   late String addText;
//   late String pdfText;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize translation strings using the widget.language
//     addNewText = TranslationHelper.translate(widget.language, 'addNewText');
//     companyNameHintText = TranslationHelper.translate(widget.language, 'companyNameHintText');
//     userNameHintText = TranslationHelper.translate(widget.language, 'userNameHintText');
//     pdfHintText = TranslationHelper.translate(widget.language, 'pdfHintText');
//     addText = TranslationHelper.translate(widget.language, 'addText');
//     pdfText = TranslationHelper.translate(widget.language, 'pdfText');
//   }
//
//   // void _addCompany() {
//   //   final companyName = _companyNameController.text;
//   //   final userName = _userNameController.text;
//   //   final pdfPath = _pdfPathController.text;
//   //
//   //   if (companyName.isNotEmpty && userName.isNotEmpty && pdfPath.isNotEmpty) {
//   //     final newCompany = Company(companyName, userName, pdfPath);
//   //     _companyNameController.clear();
//   //     _userNameController.clear();
//   //     _pdfPathController.clear();
//   //
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text('Company added successfully!'),
//   //         duration: Duration(seconds: 2),
//   //       ),
//   //     );
//   //
//   //     Navigator.pop(context, newCompany);
//   //   } else {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text('Please fill all fields.'),
//   //         duration: Duration(seconds: 2),
//   //       ),
//   //     );
//   //   }
//   // }
//
//   void _addCompany() {
//     if (controller.areFieldsFilled()) {
//       final newCompany = Company(controller.companyName.value, controller.userName.value, controller.pdfPath.value);
//
//       controller.clearFields();
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Company added successfully!'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//
//       Navigator.pop(context, newCompany);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please fill all fields.'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double height = size.height;
//     double width = size.width;
//
//     return Scaffold(
//       backgroundColor: Color(0xFFFFFFFF),
//       body: Column(
//         children: [
//           SizedBox(height: height * 0.030),
//           Container(
//             height: 65,
//             child: AppBar(
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ReciprocatingPage(
//                         companies: [],
//                         language: widget.language,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               title: Text(
//                 addNewText,
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
//             child: Obx(() => TextFormField(
//               onChanged: (value) => controller.companyName.value = value,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 fillColor: Color(0xFFD9D9D9),
//                 filled: true,
//                 hintText: companyNameHintText,
//               ),
//             )),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Obx(() => TextFormField(
//               onChanged: (value) => controller.userName.value = value,
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 fillColor: Color(0xFFD9D9D9),
//                 filled: true,
//                 hintText: userNameHintText,
//               ),
//             )),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Obx(() => TextFormField(
//               controller: TextEditingController(text: controller.pdfPath.value),
//               decoration: InputDecoration(
//                 contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 fillColor: Color(0xFFD9D9D9),
//                 filled: true,
//                 hintText: pdfHintText,
//               ),
//               onTap: _showPDFPickerDialog,
//               readOnly: true,
//             )),
//           ),
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: TextFormField(
//           //     controller: _companyNameController,
//           //     decoration: InputDecoration(
//           //       contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//           //       border: OutlineInputBorder(
//           //         borderRadius: BorderRadius.all(Radius.circular(10)),
//           //       ),
//           //       fillColor: Color(0xFFD9D9D9),
//           //       filled: true,
//           //       hintText: companyNameHintText,
//           //     ),
//           //   ),
//           // ),
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: TextFormField(
//           //     controller: _userNameController,
//           //     decoration: InputDecoration(
//           //       contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//           //       border: OutlineInputBorder(
//           //         borderRadius: BorderRadius.all(Radius.circular(10)),
//           //       ),
//           //       fillColor: Color(0xFFD9D9D9),
//           //       filled: true,
//           //       hintText: userNameHintText,
//           //     ),
//           //   ),
//           // ),
//           // Padding(
//           //   padding: const EdgeInsets.all(8.0),
//           //   child: TextFormField(
//           //     controller: _pdfPathController,
//           //     decoration: InputDecoration(
//           //       contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//           //       border: OutlineInputBorder(
//           //         borderRadius: BorderRadius.all(Radius.circular(10)),
//           //       ),
//           //       fillColor: Color(0xFFD9D9D9),
//           //       filled: true,
//           //       hintText: pdfHintText,
//           //     ),
//           //     onTap: _showPDFPickerDialog,
//           //     readOnly: true,
//           //   ),
//           // ),
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
//                           text: addText,
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
//                           text: pdfText,
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
//                         onPressed: _addCompany,
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
//                 _selectedFilePath = path;
//                 _pdfPathController.text = path;
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
// }

//+++++++++++++++++++++++++++++++++++++++
// class AddNewReciprocatingPage extends StatefulWidget {
//   const AddNewReciprocatingPage({super.key});
//
//   @override
//   State<AddNewReciprocatingPage> createState() => _AddNewReciprocatingPageState();
// }
//
// class _AddNewReciprocatingPageState extends State<AddNewReciprocatingPage> {
//
//   final TextEditingController _companyNameController = TextEditingController();
//   final TextEditingController _userNameController = TextEditingController();
//   final List<Company> _companies = [];
//   TextEditingController _pdfPathController = TextEditingController();
//   String? _selectedFilePath;
//
//   // void _addCompany() {
//   //   final companyName = _companyNameController.text;
//   //   final userName = _userNameController.text;
//   //
//   //   if (companyName.isNotEmpty && userName.isNotEmpty) {
//   //     final newCompany = Company(companyName, userName);
//   //     _companyNameController.clear();
//   //     _userNameController.clear();
//   //
//   //     // Show SnackBar
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text('Company added successfully!'),
//   //         duration: Duration(seconds: 2),
//   //       ),
//   //     );
//   //
//   //     // Return the new company to the previous screen
//   //     Navigator.pop(context, newCompany);
//   //   } else {
//   //     // Show SnackBar if fields are empty
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(
//   //         content: Text('Please enter both company name and user name.'),
//   //         duration: Duration(seconds: 2),
//   //       ),
//   //     );
//   //   }
//   // }
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
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double height = size.height;
//     double width = size.width;
//
//     return Scaffold(
//       backgroundColor: Color(0xFFFFFFFF),
//       body: Column(
//         children: [
//           SizedBox(height: height * 0.030),
//           Container(
//             height: 65,
//             child: AppBar(
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
//                 onPressed: () {
//                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ReciprocatingPage(companies: _companies, language: '',)));
//                 },
//               ),
//               title: Text(
//                 "Add new RECIPROCATING AIR COMPRESSOR",
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
//                 hintText: "Company Name",
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
//                 hintText: "User Name",
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
//                 hintText: "Quotation PDF",
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
//                           text: "ADD",
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
//                           text: " PDF",
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
//                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ReciprocatingPage(companies: _companies,),));
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
//   }
//   void _showPDFPickerDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Pick PDF Files'),
//           content: PDFPickerDialogContent(
//             onFileSelected: (path) {
//               setState(() {
//                 _selectedFilePath = path;
//                 _pdfPathController.text = path;
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
//   // void _showPDFPickerDialog() {
//   //   showDialog(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         title: Text('Pick PDF Files'),
//   //         content: PDFPicker(),
//   //         actions: <Widget>[
//   //           TextButton(
//   //             child: Text('Close'),
//   //             onPressed: () {
//   //               Navigator.of(context).pop();
//   //             },
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }
//   // void _showPDFPickerDialog() {
//   //   showDialog(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         title: Text('Pick PDF Files'),
//   //         content: PDFPickerDialogContent(
//   //           onFileSelected: (path) {
//   //             setState(() {
//   //               _selectedFilePath = path;
//   //               _pdfPathController.text = path;
//   //             });
//   //             Navigator.of(context).pop(); // Close dialog
//   //           },
//   //         ),
//   //         actions: <Widget>[
//   //           TextButton(
//   //             child: Text('Close'),
//   //             onPressed: () {
//   //               Navigator.of(context).pop();
//   //             },
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }
// }
//

//===========================
//===========================
//===========================
// class AddTextPage extends StatefulWidget {
//   @override
//   _AddTextPageState createState() => _AddTextPageState();
// }
//
// class _AddTextPageState extends State<AddTextPage> {
//   final TextEditingController _textController = TextEditingController();
//
//   void _navigateToDisplayText() {
//     final text = _textController.text;
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => DisplayTextPage(text: text),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Text'),
//         backgroundColor: Color(0xFF003123),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _textController,
//               decoration: InputDecoration(
//                 labelText: 'Enter some text',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _navigateToDisplayText,
//               child: Text('Save and Show'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DisplayTextPage extends StatelessWidget {
//   final String text;
//
//   const DisplayTextPage({Key? key, required this.text}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Display Text'),
//         backgroundColor: Color(0xFF003123),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(fontSize: 24),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class AddTextPage extends StatefulWidget {
//   @override
//   _AddTextPageState createState() => _AddTextPageState();
// }
//
// class _AddTextPageState extends State<AddTextPage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Companies'),
//         backgroundColor: Color(0xFF003123),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _companyNameController,
//               decoration: InputDecoration(
//                 labelText: 'Company Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: _userNameController,
//               decoration: InputDecoration(
//                 labelText: 'User Name',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _addCompany,
//               child: Text('Add Company'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _navigateToDisplayText,
//               child: Text('Show All Companies'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class DisplayTextPage extends StatefulWidget {
//   final List<Company> companies;
//
//   const DisplayTextPage({Key? key, required this.companies}) : super(key: key);
//
//   @override
//   _DisplayTextPageState createState() => _DisplayTextPageState();
// }
//
// class _DisplayTextPageState extends State<DisplayTextPage> {
//   late List<Company> _filteredCompanies;
//   final TextEditingController _searchController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _filteredCompanies = widget.companies;
//     _searchController.addListener(_filterCompanies);
//   }
//
//   void _filterCompanies() {
//     setState(() {
//       _filteredCompanies = widget.companies
//           .where((company) =>
//           company.Cname.toLowerCase().contains(_searchController.text.toLowerCase()))
//           .toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Display Companies'),
//         backgroundColor: Color(0xFF003123),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search by Company Name',
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 fillColor: Color(0xFFD9D9D9),
//                 filled: true,
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _filteredCompanies.length,
//               itemBuilder: (context, index) {
//                 final company = _filteredCompanies[index];
//                 return ListTile(
//                   title: Text(company.Cname),
//                   subtitle: Text(company.Uname),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 33, bottom: 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     text: "Add more companies",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 10,
//                       color: Color(0xFF000000),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Container(
//                   height: 50,
//                   width: 50,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                     color: Color(0xFFD9D9D9),
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   child: Center(
//                     child: IconButton(
//                       onPressed: () async {
//                         final newCompany = await Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => AddTextPage(),
//                           ),
//                         );
//
//                         if (newCompany != null) {
//                           setState(() {
//                             _filteredCompanies.add(newCompany);
//                             _filteredCompanies = _filteredCompanies;
//                           });
//                         }
//                       },
//                       icon: Icon(
//                         Icons.add,
//                         size: 22,
//                         color: Color(0xFF000000),
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

// class Companys {
//   final String name;
//   final String userName;
//   final String pdfPath;
//
//   Companys(this.name, this.userName, this.pdfPath);
// }
//
// class AddNewPage extends StatelessWidget {
//   final TextEditingController _companyNameController = TextEditingController();
//   final TextEditingController _userNameController = TextEditingController();
//   final TextEditingController _pdfPathController = TextEditingController();
//   final CompanyControllers companyController = Get.put(CompanyControllers());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add New Company"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _companyNameController,
//               decoration: InputDecoration(hintText: "Company Name"),
//             ),
//             TextFormField(
//               controller: _userNameController,
//               decoration: InputDecoration(hintText: "User Name"),
//             ),
//             TextFormField(
//               controller: _pdfPathController,
//               decoration: InputDecoration(hintText: "PDF Path"),
//               onTap: () {
//                 // Call your PDF picker here
//               },
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Add company to the controller
//                 final companys = Companys(
//                   _companyNameController.text,
//                   _userNameController.text,
//                   _pdfPathController.text,
//                 );
//                 companyController.addCompany(companys);
//                 // Clear fields
//                 _companyNameController.clear();
//                 _userNameController.clear();
//                 _pdfPathController.clear();
//                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Text("Company added!"),
//                 ));
//               },
//               child: Text("Save"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                // Get.to(() => CompanyList());
//                 print('tap____________');
//                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CompanyList(),));
//               },
//               child: Text("View Companies"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CompanyList extends StatelessWidget {
//   final CompanyControllers companyController = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Company List"),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: (value) {
//                 companyController.updateSearchQuery(value);
//               },
//               decoration: InputDecoration(
//                 hintText: "Search Companies",
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Obx(() {
//               return ListView.builder(
//                 itemCount: companyController.filteredCompanies.length,
//                 itemBuilder: (context, index) {
//                   final company = companyController.filteredCompanies[index];
//                   return ListTile(
//                     title: Text(company.name),
//                     subtitle: Text('User: ${company.userName}, PDF: ${company.pdfPath}'),
//                   );
//                 },
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }

//++++++++++++++++++++++++++++++++
