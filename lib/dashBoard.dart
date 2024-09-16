import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdfx/pdfx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart'; // For file name handling

import 'Model/luaguage.dart';
import 'main.dart';

// class DashBoard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Homescreen'),
//         actions: [
//           Consumer<LaLanguageChange>(
//             builder: (context, languageChange, child) {
//               return PopupMenuButton<Locale>(
//                 onSelected: (Locale locale) {
//                   languageChange.changeLanguage(locale);
//                 },
//                 itemBuilder: (context) => [
//                   PopupMenuItem(
//                     value: Locale('en', ''),
//                     child: Text('English'),
//                   ),
//                   PopupMenuItem(
//                     value: Locale('gu', ''),
//                     child: Text('Gujarati'),
//                   ),
//                 ],
//                 icon: Icon(Icons.language),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Text('Hello'),
//       ),
//     );
//   }
// }

// PDF SHOW for PERMISSION
//
// class PDFPicker extends StatefulWidget {
//   @override
//   _PDFPickerState createState() => _PDFPickerState();
// }
//
// class _PDFPickerState extends State<PDFPicker> {
//   List<String>? _selectedFiles;
//
//   // Future<void> _pickPDFs() async {
//   //   // Request storage permissions
//   //   if (await _requestPermission(Permission.storage)) {
//   //     // Allow picking multiple files with specific extension
//   //     FilePickerResult? result = await FilePicker.platform.pickFiles(
//   //       allowMultiple: true,
//   //       type: FileType.custom,
//   //       allowedExtensions: ['pdf'],
//   //     );
//   //
//   //     if (result != null) {
//   //       // Get the paths of the selected files
//   //       setState(() {
//   //         _selectedFiles = result.paths.cast<String>();
//   //       });
//   //     }
//   //   } else {
//   //     // Handle the case where the user denies the permission
//   //     print('Storage permission denied');
//   //   }
//   // }
//   Future<void> _pickPDFs() async {
//     if (!kIsWeb && await _requestPermission(Permission.storage)) {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['pdf'],
//       );
//
//       if (result != null) {
//         setState(() {
//           _selectedFiles = result.paths.whereType<String>().toList();
//         });
//       } else {
//         print('No files selected');
//       }
//     } else if (kIsWeb) {
//       // Web-specific logic here (permissions are usually handled differently)
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['pdf'],
//       );
//
//       if (result != null) {
//         setState(() {
//           _selectedFiles = result.paths.whereType<String>().toList();
//         });
//       } else {
//         print('No files selected');
//       }
//     } else {
//       print('Storage permission denied');
//     }
//   }
//
//   Future<bool> _requestPermission(Permission permission) async {
//     if (!kIsWeb) {
//       if (await permission.isGranted) {
//         return true;
//       } else {
//         var result = await permission.request();
//         return result == PermissionStatus.granted;
//       }
//     } else {
//       // On web, permissions are handled differently, or might not be needed
//       return true; // Assume granted on web
//     }
//   }
//   //
//   // Future<void> _pickPDFs() async {
//   //   // Request storage permissions
//   //   if (await _requestPermission(Permission.storage)) {
//   //     // Allow picking multiple files with specific extensions
//   //     FilePickerResult? result = await FilePicker.platform.pickFiles(
//   //       allowMultiple: true,
//   //       type: FileType.custom,
//   //       allowedExtensions: ['pdf'],
//   //     );
//   //
//   //     if (result != null) {
//   //       // Get the paths of the selected files, filtering out any null values
//   //       setState(() {
//   //         _selectedFiles = result.paths.whereType<String>().toList();
//   //       });
//   //     } else {
//   //       // Handle the case where no files were selected
//   //       print('No files selected');
//   //     }
//   //   } else {
//   //     // Handle the case where the user denies the permission
//   //     print('Storage permission denied');
//   //   }
//   // }
//   //
//   //
//   // Future<bool> _requestPermission(Permission permission) async {
//   //   // Check if the permission is already granted
//   //   if (await permission.isGranted) {
//   //     return true;
//   //   } else {
//   //     // Request permission
//   //     var result = await permission.request();
//   //     return result == PermissionStatus.granted;
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Picker'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: _pickPDFs,
//               child: Text('Pick PDF Files'),
//             ),
//             if (_selectedFiles != null)
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: _selectedFiles!.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(_selectedFiles![index]!),
//                     );
//                   },
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// //==============================================================
// class PDFPicker extends StatefulWidget {
//   @override
//   _PDFPickerState createState() => _PDFPickerState();
// }
//
// class _PDFPickerState extends State<PDFPicker> {
//   List<String>? _selectedFiles;
//   PDFDocument? _pdfDocument;
//
//   Future<void> _pickPDFs() async {
//     if (!kIsWeb && await _requestPermission(Permission.storage)) {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['pdf'],
//       );
//
//       if (result != null) {
//         setState(() {
//           _selectedFiles = result.paths.whereType<String>().toList();
//         });
//       } else {
//         print('No files selected');
//       }
//     } else if (kIsWeb) {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['pdf'],
//       );
//
//       if (result != null) {
//         setState(() {
//           _selectedFiles = result.paths.whereType<String>().toList();
//         });
//       } else {
//         print('No files selected');
//       }
//     } else {
//       print('Storage permission denied');
//     }
//   }
//
//   Future<bool> _requestPermission(Permission permission) async {
//     if (!kIsWeb) {
//       if (await permission.isGranted) {
//         return true;
//       } else {
//         var result = await permission.request();
//         return result == PermissionStatus.granted;
//       }
//     } else {
//       return true;
//     }
//   }
//
//   void _openPDF(String path) async {
//     final doc = await PDFDocument.fromFile(File(path));
//     setState(() {
//       _pdfDocument = doc;
//     });
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => PDFViewerPage(path: path),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Picker'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: _pickPDFs,
//               child: Text('Pick PDF Files'),
//             ),
//             if (_selectedFiles != null)
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: _selectedFiles!.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(_selectedFiles![index]!),
//                       onTap: () => _openPDF(_selectedFiles![index]!),
//                     );
//                   },
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class PDFDocument {
// }
//
// class PDFViewerPage extends StatelessWidget {
//   final String path;
//
//   PDFViewerPage({required this.path});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: PDFView(
//         filePath: path,
//       ),
//     );
//   }
// }
// //
// //
// // class PDFViewerPage extends StatefulWidget {
// //   final String path;
// //
// //   PDFViewerPage({required this.path});
// //
// //   @override
// //   _PDFViewerPageState createState() => _PDFViewerPageState();
// // }
// //
// // class _PDFViewerPageState extends State<PDFViewerPage> {
// //   late PdfControllerPinch _pdfPinchController;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _pdfPinchController = PdfControllerPinch(
// //       document: PdfDocument.openFile(widget.path),
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     _pdfPinchController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('PDF Viewer'),
// //       ),
// //       body: PdfViewPinch(
// //         controller: _pdfPinchController,
// //       ),
// //     );
// //   }
// // }
// // class PDFPicker extends StatefulWidget {
// //   @override
// //   _PDFPickerState createState() => _PDFPickerState();
// // }
// //
// // class _PDFPickerState extends State<PDFPicker> {
// //   List<String>? _selectedFiles;
// //
// //   Future<void> _pickPDFs() async {
// //     if (!kIsWeb && await _requestPermission(Permission.storage)) {
// //       FilePickerResult? result = await FilePicker.platform.pickFiles(
// //         allowMultiple: true,
// //         type: FileType.custom,
// //         allowedExtensions: ['pdf'],
// //       );
// //
// //       if (result != null) {
// //         setState(() {
// //           _selectedFiles = result.paths.whereType<String>().toList();
// //         });
// //       } else {
// //         print('No files selected');
// //       }
// //     } else if (kIsWeb) {
// //       FilePickerResult? result = await FilePicker.platform.pickFiles(
// //         allowMultiple: true,
// //         type: FileType.custom,
// //         allowedExtensions: ['pdf'],
// //       );
// //
// //       if (result != null) {
// //         setState(() {
// //           _selectedFiles = result.paths.whereType<String>().toList();
// //         });
// //       } else {
// //         print('No files selected');
// //       }
// //     } else {
// //       print('Storage permission denied');
// //     }
// //   }
// //
// //   Future<bool> _requestPermission(Permission permission) async {
// //     if (!kIsWeb) {
// //       if (await permission.isGranted) {
// //         return true;
// //       } else {
// //         var result = await permission.request();
// //         return result == PermissionStatus.granted;
// //       }
// //     } else {
// //       return true;
// //     }
// //   }
// //
// //   void _openPDF(String path) {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => PDFViewerPage(path: path),
// //       ),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Color(0xFFFFFFFF),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             ElevatedButton(
// //               onPressed: _pickPDFs,
// //               child: Text('Pick PDF Files'),
// //             ),
// //             if (_selectedFiles != null)
// //               Expanded(
// //                 child: ListView.builder(
// //                   itemCount: _selectedFiles!.length,
// //                   itemBuilder: (context, index) {
// //                     return ListTile(
// //                       title: Text('_selectedFiles![index]!'),
// //                       onTap: () => _openPDF(_selectedFiles![index]!),
// //                     );
// //                   },
// //                 ),
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }



//+++++++++++++++++++++++++++++++++++++++++++++++++++++++

// class PDFPickerDialogContent extends StatefulWidget {
//   final ValueChanged<String> onFileSelected;
//
//   PDFPickerDialogContent({required this.onFileSelected});
//
//   @override
//   _PDFPickerDialogContentState createState() => _PDFPickerDialogContentState();
// }
//
// class _PDFPickerDialogContentState extends State<PDFPickerDialogContent> {
//   List<String>? _selectedFiles;
//
//   Future<void> _pickPDFs() async {
//     if (!kIsWeb && await _requestPermission(Permission.storage)) {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['pdf'],
//       );
//
//       if (result != null && result.files.isNotEmpty) {
//         setState(() {
//           _selectedFiles = result.paths.whereType<String>().toList();
//         });
//       } else {
//         print('No files selected');
//       }
//     } else if (kIsWeb) {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['pdf'],
//       );
//
//       if (result != null && result.files.isNotEmpty) {
//         setState(() {
//           _selectedFiles = result.paths.whereType<String>().toList();
//         });
//       } else {
//         print('No files selected');
//       }
//     } else {
//       print('Storage permission denied');
//     }
//   }
//
//   Future<bool> _requestPermission(Permission permission) async {
//     if (!kIsWeb) {
//       if (await permission.isGranted) {
//         return true;
//       } else {
//         var result = await permission.request();
//         return result == PermissionStatus.granted;
//       }
//     } else {
//       return true;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: _pickPDFs,
//           child: Text('Pick PDF Files'),
//         ),
//         if (_selectedFiles != null)
//           Expanded(
//             child: ListView.builder(
//               itemCount: _selectedFiles!.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_selectedFiles![index]),
//                   onTap: () {
//                     widget.onFileSelected(_selectedFiles![index]);
//                   },
//                 );
//               },
//             ),
//           ),
//       ],
//     );
//   }
// }

class PDFPickerDialogContent extends StatefulWidget {
  final ValueChanged<List<String>> onFileSelected;

  PDFPickerDialogContent({required this.onFileSelected});

  @override
  _PDFPickerDialogContentState createState() => _PDFPickerDialogContentState();
}

class _PDFPickerDialogContentState extends State<PDFPickerDialogContent> {
  List<String>? _selectedFiles = [];
 // List<String> _selectedFilePaths = [];

  Future<void> _pickPDFs() async {
    if (!kIsWeb && await _requestPermission(Permission.storage)) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          _selectedFiles = result.paths.whereType<String>().toList();
        });
      } else {
        print('No files selected');
      }
    } else if (kIsWeb) {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          _selectedFiles = result.paths.whereType<String>().toList();
        });
      } else {
        print('No files selected');
      }
    } else {
      print('Storage permission denied');
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (!kIsWeb) {
      if (await permission.isGranted) {
        return true;
      } else {
        var result = await permission.request();
        return result == PermissionStatus.granted;
      }
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: _pickPDFs,
          child: Text('Pick PDF Files'),
        ),
        SizedBox(height: 10),
        if (_selectedFiles != null && _selectedFiles!.isNotEmpty)
          Expanded(
            child: ListView.builder(
              itemCount: _selectedFiles!.length,
              itemBuilder: (context, index) {
                String filePath = _selectedFiles![index];
                bool isSelected = _selectedFiles!.contains(filePath); // Check if the file is selected

                return CheckboxListTile(
                  value: isSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      if (value == true) {
                        _selectedFiles!.add(filePath); // Add to selected list
                      } else {
                        _selectedFiles!.remove(filePath); // Remove from selected list
                      }
                    });
                    widget.onFileSelected(_selectedFiles!); // Pass selected files back
                  },
                  title: Text(
                    filePath.split('/').last, // Display file name only
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle:Icon(Icons.picture_as_pdf,color: Colors.red,), // You can add more info here if needed
                  activeColor: Colors.green, // Set selected checkbox to green
                  controlAffinity: ListTileControlAffinity.leading, // Display checkbox on the left
                );
              },
            ),
          ),
        // Expanded(
          //   child: ListView.builder(
          //     itemCount: _selectedFiles!.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         subtitle: Text(),
          //         title: Text(_selectedFiles![index]),
          //         onTap: () {
          //          // widget.onFileSelected(_selectedFiles![index]);
          //           widget.onFileSelected(_selectedFiles!);
          //         },
          //       );
          //     },
          //   ),
          // ),
        if (_selectedFiles!.isEmpty)
          Center(
            child: Text('No files selected'),
          ),
      ],
    );
  }
}

//
// class PDFViewerPage extends StatefulWidget {
//   final List<String> paths;
//
//   PDFViewerPage({required this.paths});
//
//   @override
//   _PDFViewerPageState createState() => _PDFViewerPageState();
// }
//
// class _PDFViewerPageState extends State<PDFViewerPage> {
//   PdfControllerPinch? _pdfPinchController;
//   int _currentIndex = 0;
//   bool _isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _requestPermissions();
//     _printFilePaths();
//     _loadPdf(widget.paths[_currentIndex]);
//   }
//
//   Future<String> _copyFileToPermanentLocation(String path) async {
//     final file = File(path);
//
//     if (!await file.exists()) {
//       throw Exception('File not found at path: $path');
//     }
//
//     final directory = await getTemporaryDirectory();
//     final newPath = '${directory.path}/${path.split('/').last}';
//
//     final newFile = await file.copy(newPath);
//     return newFile.path;
//   }
//
//   Future<void> _requestPermissions() async {
//     if (await Permission.storage.request().isGranted) {
//       // Permission granted
//     } else {
//       print("Storage permission denied");
//     }
//   }
//
//   void _printFilePaths() {
//     for (var path in widget.paths) {
//       print('Path: $path');
//     }
//   }
//
//   Future<void> _loadPdf(String path) async {
//     try {
//       print('Attempting to load PDF from: $path');
//
//       final permanentPath = await _copyFileToPermanentLocation(path);
//       print('Copied PDF to: $permanentPath');
//
//       if (!kIsWeb && !await File(permanentPath).exists()) {
//         throw Exception('File not found: $permanentPath');
//       }
//
//       _pdfPinchController = PdfControllerPinch(
//         document: PdfDocument.openFile(permanentPath),
//       );
//
//       setState(() {
//         _isLoading = false;
//       });
//     } catch (e) {
//       print("Error loading PDF: $e");
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   SnackBar(content: Text('Error loading PDF: $e')),
//       // );
//     }
//   }
//
//   void _onNext() {
//     if (_currentIndex < widget.paths.length - 1) {
//       setState(() {
//         _isLoading = true;
//         _currentIndex++;
//         _loadPdf(widget.paths[_currentIndex]);
//       });
//     }
//   }
//
//   void _onPrevious() {
//     if (_currentIndex > 0) {
//       setState(() {
//         _isLoading = true;
//         _currentIndex--;
//         _loadPdf(widget.paths[_currentIndex]);
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _pdfPinchController?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer (${_currentIndex + 1}/${widget.paths.length})'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.navigate_before),
//             onPressed: _onPrevious,
//             tooltip: 'Previous PDF',
//           ),
//           IconButton(
//             icon: Icon(Icons.navigate_next),
//             onPressed: _onNext,
//             tooltip: 'Next PDF',
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _pdfPinchController == null
//           ? Center(child: Text('Error loading PDF'))
//           : PdfViewPinch(controller: _pdfPinchController!),
//     );
//   }
// }
//
//









// class PDFViewerPage extends StatefulWidget {
//   final List<String> paths;
//
//   PDFViewerPage({required this.paths});
//
//   @override
//   _PDFViewerPageState createState() => _PDFViewerPageState();
// }
//
// class _PDFViewerPageState extends State<PDFViewerPage> {
//   late PdfControllerPinch _pdfPinchController;
//   int _currentIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadPdf(widget.paths[_currentIndex]);
//   }
//
//   void _loadPdf(String path) {
//     _pdfPinchController = PdfControllerPinch(
//       document: PdfDocument.openFile(path),
//     );
//   }
//
//   void _onNext() {
//     if (_currentIndex < widget.paths.length - 1) {
//       setState(() {
//         _currentIndex++;
//         _loadPdf(widget.paths[_currentIndex]);
//       });
//     }
//   }
//
//   void _onPrevious() {
//     if (_currentIndex > 0) {
//       setState(() {
//         _currentIndex--;
//         _loadPdf(widget.paths[_currentIndex]);
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _pdfPinchController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer (${_currentIndex + 1}/${widget.paths.length})'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.navigate_before),
//             onPressed: _onPrevious,
//             tooltip: 'Previous PDF',
//           ),
//           IconButton(
//             icon: Icon(Icons.navigate_next),
//             onPressed: _onNext,
//             tooltip: 'Next PDF',
//           ),
//         ],
//       ),
//       body: PdfViewPinch(
//         controller: _pdfPinchController,
//       ),
//     );
//   }
// }

//
// //+++++++++++++++++++
// class PDFPickerDialogContentw extends StatefulWidget {
//   final ValueChanged<List<String>> onFileSelected;
//
//   PDFPickerDialogContentw({required this.onFileSelected});
//
//   @override
//   _PDFPickerDialogContentwState createState() => _PDFPickerDialogContentwState();
// }
//
// class _PDFPickerDialogContentwState extends State<PDFPickerDialogContentw> {
//   List<String>? _selectedFiles = [];
//
//   Future<void> _pickPDFs() async {
//     if (!kIsWeb && await _requestPermission(Permission.storage)) {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['pdf'],
//       );
//
//       if (result != null && result.files.isNotEmpty) {
//         setState(() {
//           _selectedFiles = result.paths.whereType<String>().toList();
//           // Notify parent widget with selected files
//           widget.onFileSelected(_selectedFiles!);
//         });
//       } else {
//         print('No files selected');
//       }
//     } else if (kIsWeb) {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['pdf'],
//       );
//
//       if (result != null && result.files.isNotEmpty) {
//         setState(() {
//           _selectedFiles = result.paths.whereType<String>().toList();
//           // Notify parent widget with selected files
//           widget.onFileSelected(_selectedFiles!);
//         });
//       } else {
//         print('No files selected');
//       }
//     } else {
//       print('Storage permission denied');
//     }
//   }
//
//   Future<bool> _requestPermission(Permission permission) async {
//     if (!kIsWeb) {
//       if (await permission.isGranted) {
//         return true;
//       } else {
//         var result = await permission.request();
//         return result == PermissionStatus.granted;
//       }
//     } else {
//       return true;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         ElevatedButton(
//           onPressed: _pickPDFs,
//           child: Text('Pick PDF Files'),
//         ),
//         SizedBox(height: 10),
//         if (_selectedFiles != null && _selectedFiles!.isNotEmpty)
//           Expanded(
//             child: ListView.builder(
//               itemCount: _selectedFiles!.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_selectedFiles![index]),
//                   onTap: () {
//                     // Notify parent widget with selected files
//                     widget.onFileSelected(_selectedFiles!);
//                   },
//                 );
//               },
//             ),
//           ),
//         if (_selectedFiles!.isEmpty)
//           Center(
//             child: Text('No files selected'),
//           ),
//       ],
//     );
//   }
// }

//+++++++++++++++++++

//+++++++++++++++++++






// class PDFViewerPage extends StatefulWidget {
//   final String path;
//
//   PDFViewerPage({required this.path});
//
//   @override
//   _PDFViewerPageState createState() => _PDFViewerPageState();
// }
//
// class _PDFViewerPageState extends State<PDFViewerPage> {
//   late PdfControllerPinch _pdfPinchController;
//
//   @override
//   void initState() {
//     super.initState();
//     _pdfPinchController = PdfControllerPinch(
//       document: PdfDocument.openFile(widget.path),
//     );
//   }
//
//   @override
//   void dispose() {
//     _pdfPinchController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: PdfViewPinch(
//         controller: _pdfPinchController,
//       ),
//     );
//   }
// }
//
// class PDFPickerDialogContent extends StatefulWidget {
//   final ValueChanged<String> onFileSelected;
//
//   PDFPickerDialogContent({
//     required this.onFileSelected,
//
//   });
//
//   @override
//   _PDFPickerDialogContentState createState() => _PDFPickerDialogContentState();
// }
//
// class _PDFPickerDialogContentState extends State<PDFPickerDialogContent> {
//   List<String>? _selectedFiles = [];
//   List<String> _selectedCheckboxFiles = [];
//   String? _selectedPdf;
//   final CollectionReference pdfCollection = FirebaseFirestore.instance.collection('pdfs');
//
//   Future<void> _pickPDFs() async {
//     if (!kIsWeb && await _requestPermission(Permission.storage)) {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['pdf'],
//       );
//
//       if (result != null && result.files.isNotEmpty) {
//         setState(() {
//           _selectedFiles = result.paths.whereType<String>().toList();
//         });
//       } else {
//         print('No files selected');
//       }
//     } else if (kIsWeb) {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['pdf'],
//       );
//
//       if (result != null && result.files.isNotEmpty) {
//         setState(() {
//           _selectedFiles = result.paths.whereType<String>().toList();
//         });
//       } else {
//         print('No files selected');
//       }
//     } else {
//       print('Storage permission denied');
//     }
//   }
//   List<String>? _selectedFilePath;
//
//   Future<void> _uploadPDFToFirebaseStorage(String filePath) async {
//     try {
//       final file = File(filePath);
//       final storageRef = FirebaseStorage.instance.ref().child('pdfs/${file.uri.pathSegments.last}');
//       final uploadTask = storageRef.putFile(file);
//       final snapshot = await uploadTask.whenComplete(() => null);
//       final downloadUrl = await snapshot.ref.getDownloadURL();
//
//       await pdfCollection.add({'fileUrl': downloadUrl});
//       print('PDF uploaded to Firebase Storage and added to Firestore');
//     } catch (e) {
//       print('Failed to upload PDF: $e');
//     }
//   }
//
//   Future<bool> _requestPermission(Permission permission) async {
//     if (!kIsWeb) {
//       if (await permission.isGranted) {
//         return true;
//       } else {
//         var result = await permission.request();
//         return result == PermissionStatus.granted;
//       }
//     } else {
//       return true;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ElevatedButton(
//           onPressed: _pickPDFs,
//           child: Text('Pick PDF Files'),
//         ),
//         SizedBox(height: 10),
//         if (_selectedFiles != null && _selectedFiles!.isNotEmpty)
//           Expanded(
//             child: ListView.builder(
//               itemCount: _selectedFiles!.length,
//               itemBuilder: (context, index) {
//                 var filePath = _selectedFiles![index];
//                 bool isSelected = _selectedCheckboxFiles.contains(filePath);
//
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: isSelected ? Colors.green[100] : Colors.red[100],
//                       border: Border.all(width: 1),
//                       borderRadius: BorderRadius.circular(10)
//                     ),
//                     child: ListTile(
//                       leading: Checkbox(
//                         value: isSelected,
//                         onChanged: (value) {
//                           setState(() {
//                             if (value == true) {
//                               _selectedCheckboxFiles.add(filePath);
//                             } else {
//                               _selectedCheckboxFiles.remove(filePath);
//                             }
//                             widget.onFileSelected(filePath);
//                           });
//                         },
//                       ),
//                       title: Text(filePath.split('/').last),
//                       onTap: () {
//                         setState(() {
//                           if (isSelected) {
//                             _selectedCheckboxFiles.remove(filePath);
//                           } else {
//                             _selectedCheckboxFiles.add(filePath);
//                           }
//                           widget.onFileSelected(filePath);
//                         });
//                       },
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         SizedBox(height: 10),
//       ],
//     );
//   }
// }


// Assuming PDFPickerDialogContent is modified to handle both single and multiple file selections
// class PDFPickerDialogContent extends StatefulWidget {
//   final ValueChanged<String>? onFileSelected;
//   final ValueChanged<List<String>>? onFilesSelected;
//
//   PDFPickerDialogContent({this.onFileSelected, this.onFilesSelected});
//
//   @override
//   _PDFPickerDialogContentState createState() => _PDFPickerDialogContentState();
// }
//
// class _PDFPickerDialogContentState extends State<PDFPickerDialogContent> {
//   List<String>? _selectedFiles = [];
//   final List<String> _selectedCheckboxFiles = [];
//   final CollectionReference pdfCollection = FirebaseFirestore.instance.collection('pdfs');
//
//   Future<void> _pickPDFs() async {
//     if (!kIsWeb && await _requestPermission(Permission.storage)) {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['pdf'],
//       );
//
//       if (result != null && result.files.isNotEmpty) {
//         setState(() {
//           _selectedFiles = result.paths.whereType<String>().toList();
//         });
//       } else {
//         print('No files selected');
//       }
//     } else if (kIsWeb) {
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//         type: FileType.custom,
//         allowedExtensions: ['pdf'],
//       );
//
//       if (result != null && result.files.isNotEmpty) {
//         setState(() {
//           _selectedFiles = result.paths.whereType<String>().toList();
//         });
//       } else {
//         print('No files selected');
//       }
//     } else {
//       print('Storage permission denied');
//     }
//   }
//
//   Future<void> _addPDFToFirestore(String filePath) async {
//     try {
//       await pdfCollection.add({'filePath': filePath});
//       print('PDF added to Firestore');
//     } catch (e) {
//       print('Failed to add PDF: $e');
//     }
//   }
//
//   Future<bool> _requestPermission(Permission permission) async {
//     if (!kIsWeb) {
//       if (await permission.isGranted) {
//         return true;
//       } else {
//         var result = await permission.request();
//         return result == PermissionStatus.granted;
//       }
//     } else {
//       return true;
//     }
//   }
//
//   Future<void> _uploadPDFToFirebaseStorage(String filePath) async {
//     try {
//       final file = File(filePath);
//       final storageRef = FirebaseStorage.instance.ref().child('pdfs/${file.uri.pathSegments.last}');
//       final uploadTask = storageRef.putFile(file);
//       final snapshot = await uploadTask.whenComplete(() => null);
//       final downloadUrl = await snapshot.ref.getDownloadURL();
//
//       await pdfCollection.add({'fileUrl': downloadUrl});
//       print('PDF uploaded to Firebase Storage and added to Firestore');
//     } catch (e) {
//       print('Failed to upload PDF: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: pdfCollection.snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }
//
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         }
//
//         final pdfDocs = snapshot.data?.docs ?? [];
//
//         return Column(
//           children: [
//             ElevatedButton(
//               onPressed: _pickPDFs,
//               child: Text('Pick PDF Files'),
//             ),
//             SizedBox(height: 10),
//             if (_selectedFiles != null && _selectedFiles!.isNotEmpty)
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: _selectedFiles!.length,
//                   itemBuilder: (context, index) {
//                     var filePath = _selectedFiles![index];
//                     bool isChecked = _selectedCheckboxFiles.contains(filePath);
//
//                     return Container(
//                       color: isChecked ? Colors.green[100] : Colors.red[100],
//                       child: ListTile(
//                         leading: Checkbox(
//                           value: isChecked,
//                           onChanged: (value) {
//                             setState(() {
//                               if (value == true) {
//                                 _selectedCheckboxFiles.add(filePath);
//                               } else {
//                                 _selectedCheckboxFiles.remove(filePath);
//                               }
//                               widget.onFilesSelected?.call(_selectedCheckboxFiles);
//                             });
//                           },
//                         ),
//                         title: Text(filePath.split('/').last),
//                         trailing: IconButton(
//                           icon: Icon(Icons.delete, color: Colors.redAccent),
//                           onPressed: () {
//                             setState(() {
//                               _selectedFiles!.removeAt(index);
//                               _selectedCheckboxFiles.remove(filePath);
//                             });
//                           },
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ElevatedButton(
//               onPressed: () {
//                 if (_selectedCheckboxFiles.isNotEmpty) {
//                   for (var filePath in _selectedCheckboxFiles) {
//                     _uploadPDFToFirebaseStorage(filePath);
//                   }
//                   setState(() {
//                     _selectedFiles = [];
//                     _selectedCheckboxFiles.clear();
//                   });
//                   Navigator.of(context).pop(); // Close the dialog after upload
//                 }
//               },
//               child: Text('Done'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
class PDFDetailView extends StatefulWidget {
  final List<String> pdfPaths; // Multiple paths can be passed

  PDFDetailView({required this.pdfPaths});

  @override
  _PDFDetailViewState createState() => _PDFDetailViewState();
}

class _PDFDetailViewState extends State<PDFDetailView> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool _isReady = false;
  late PDFViewController _pdfViewController;
  int _currentPdfIndex = 0; // Track which PDF is currently being shown

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Viewing PDF'),
        actions: [
          if (_totalPages > 1)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('${_currentPage + 1}/$_totalPages'),
              ),
            ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PDFView(
              filePath: widget.pdfPaths[_currentPdfIndex], // Show current PDF
              autoSpacing: false,
              enableSwipe: true,
              swipeHorizontal: true,
              onRender: (_pages) {
                setState(() {
                  _totalPages = _pages!;
                  _isReady = true;
                });
              },
              onViewCreated: (PDFViewController pdfViewController) {
                _pdfViewController = pdfViewController;
              },
              onPageChanged: (int? page, int? total) {
                setState(() {
                  _currentPage = page!;
                });
              },
            ),
          ),
          !_isReady
              ? Center(child: CircularProgressIndicator())
              : Container(),
        ],
      ),
      floatingActionButton: _buildFloatingActionButtons(),
    );
  }

  Widget? _buildFloatingActionButtons() {
    // For a single PDF, show page navigation if there are multiple pages
    if (widget.pdfPaths.length == 1) {
      return _totalPages > 1
          ? Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              if (_currentPage > 0) {
                _pdfViewController.setPage(_currentPage - 1);
              }
            },
            child: Icon(Icons.chevron_left),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              if (_currentPage < _totalPages - 1) {
                _pdfViewController.setPage(_currentPage + 1);
              }
            },
            child: Icon(Icons.chevron_right),
          ),
        ],
      )
          : null;
    }

    // For multiple PDFs, show PDF navigation (previous/next PDF)
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (_currentPdfIndex > 0) // Show 'Previous PDF' if not on the first one
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _currentPdfIndex--;
                _isReady = false; // Reset PDF loading state
              });
            },
            child: Icon(Icons.arrow_back),
          ),
        if (_currentPdfIndex < widget.pdfPaths.length - 1) // Show 'Next PDF' if not on the last one
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _currentPdfIndex++;
                _isReady = false; // Reset PDF loading state
              });
            },
            child: Icon(Icons.arrow_forward),
          ),
      ],
    );
  }
}

// mlutiple PDF


class PDFViewerPa extends StatefulWidget {
  final List<String> paths;
  final int initialIndex;

  PDFViewerPa({required this.paths, required this.initialIndex});

  @override
  _PDFViewerPaState createState() => _PDFViewerPaState();
}

class _PDFViewerPaState extends State<PDFViewerPa> {
  PdfControllerPinch? _pdfPinchController;
  int _currentIndex = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _loadPdf(widget.paths[_currentIndex]);
  }

  Future<void> _loadPdf(String url) async {
    try {
      // Load the PDF from the Firebase Storage URL
      _pdfPinchController = PdfControllerPinch(
        document: PdfDocument.openData((await NetworkAssetBundle(Uri.parse(url)).load(url)).buffer.asUint8List()),
      );

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading PDF: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _onNext() {
    if (_currentIndex < widget.paths.length - 1) {
      setState(() {
        _isLoading = true;
        _currentIndex++;
        _loadPdf(widget.paths[_currentIndex]);
      });
    }
  }

  void _onPrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _isLoading = true;
        _currentIndex--;
        _loadPdf(widget.paths[_currentIndex]);
      });
    }
  }

  @override
  void dispose() {
    _pdfPinchController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer (${_currentIndex + 1}/${widget.paths.length})'),
        actions: [
          IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: _onPrevious,
            tooltip: 'Previous PDF',
          ),
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: _onNext,
            tooltip: 'Next PDF',
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _pdfPinchController == null
          ? Center(child: Text('Error loading PDF'))
          : PdfViewPinch(controller: _pdfPinchController!),
    );
  }
}


//

























































//
// class PDFViewerPagea extends StatelessWidget {
//   final List<String> paths; // Change to List<String>
//
//   PDFViewerPagea({required this.paths});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: ListView.builder(
//         itemCount: paths.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text('Document ${index + 1}'),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PDFFileView(
//                     path: paths[index],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
// //
// // class PDFFileView extends StatelessWidget {
// //   final String path;
// //
// //   PDFFileView({required this.path});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('PDF Viewer'),
// //       ),
// //       body: PDFView(
// //         filePath: path,
// //         enableSwipe: true,
// //         swipeHorizontal: true,
// //         autoSpacing: false,
// //         pageFling: true,
// //         pageSnap: true,
// //         defaultPage: 0,
// //         fitPolicy: FitPolicy.BOTH,
// //       ),
// //     );
// //   }
// // }
// class PDFFileView extends StatelessWidget {
//   final String path;
//
//   PDFFileView({required this.path});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//       body: PDFView(
//         filePath: path,
//       ),
//     );
//   }
// }