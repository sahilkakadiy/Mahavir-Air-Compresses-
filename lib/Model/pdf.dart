import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdfx/pdfx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

import 'Model.dart';
// // class PDFViewerPage extends StatefulWidget {
// //   final List<String> paths;
// //
// //   PDFViewerPage({required this.paths});
// //
// //   @override
// //   _PDFViewerPageState createState() => _PDFViewerPageState();
// // }
// //
// // class _PDFViewerPageState extends State<PDFViewerPage> {
// //   PdfControllerPinch? _pdfPinchController;
// //   int _currentIndex = 0;
// //   bool _isLoading = true;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _requestPermissions();
// //     _printFilePaths();
// //     _loadPdf(widget.paths[_currentIndex]);
// //   }
// //
// //   Future<String> _copyFileToPermanentLocation(String path) async {
// //     final file = File(path);
// //
// //     if (!await file.exists()) {
// //       throw Exception('File not found at path: $path');
// //     }
// //
// //     final directory = await getApplicationDocumentsDirectory();
// //     final fileName = path.split('/').last;
// //     final newPath = '${directory.path}/$fileName';
// //
// //     final newFile = await file.copy(newPath);
// //     return newFile.path;
// //   }
// //
// //   Future<void> _requestPermissions() async {
// //     if (await Permission.storage.request().isGranted) {
// //       print("Storage permission granted");
// //     } else {
// //       print("Storage permission denied");
// //     }
// //   }
// //
// //   void _printFilePaths() {
// //     for (var path in widget.paths) {
// //       print('Path: $path');
// //     }
// //   }
// //
// //   Future<void> _loadPdf(String path) async {
// //     try {
// //       print('Attempting to load PDF from: $path');
// //
// //       final permanentPath = await _copyFileToPermanentLocation(path);
// //       print('Copied PDF to: $permanentPath');
// //
// //       if (!await File(permanentPath).exists()) {
// //         throw Exception('File not found: $permanentPath');
// //       }
// //
// //       _pdfPinchController = PdfControllerPinch(
// //         document: PdfDocument.openFile(permanentPath),
// //       );
// //
// //       setState(() {
// //         _isLoading = false;
// //       });
// //     } catch (e) {
// //       print("Error loading PDF: $e");
// //       setState(() {
// //         _isLoading = false;
// //       });
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Error loading PDF: $e')),
// //       );
// //     }
// //   }
// //
// //   void _onNext() {
// //     if (_currentIndex < widget.paths.length - 1) {
// //       setState(() {
// //         _isLoading = true;
// //         _currentIndex++;
// //         _loadPdf(widget.paths[_currentIndex]);
// //       });
// //     }
// //   }
// //
// //   void _onPrevious() {
// //     if (_currentIndex > 0) {
// //       setState(() {
// //         _isLoading = true;
// //         _currentIndex--;
// //         _loadPdf(widget.paths[_currentIndex]);
// //       });
// //     }
// //   }
// //
// //   @override
// //   void dispose() {
// //     _pdfPinchController?.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('PDF Viewer (${_currentIndex + 1}/${widget.paths.length})'),
// //         actions: [
// //           IconButton(
// //             icon: Icon(Icons.navigate_before),
// //             onPressed: _onPrevious,
// //             tooltip: 'Previous PDF',
// //           ),
// //           IconButton(
// //             icon: Icon(Icons.navigate_next),
// //             onPressed: _onNext,
// //             tooltip: 'Next PDF',
// //           ),
// //         ],
// //       ),
// //       body: _isLoading
// //           ? Center(child: CircularProgressIndicator())
// //           : _pdfPinchController == null
// //           ? Center(child: Text('Error loading PDF'))
// //           : PdfViewPinch(controller: _pdfPinchController!),
// //     );
// //   }
// // }
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
//
// // class PDFViewerPagea extends StatelessWidget {
// //   final List<String> paths; // List of PDF paths
// //
// //   PDFViewerPagea({required this.paths});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('PDF Viewer'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: paths.length,
// //         itemBuilder: (context, index) {
// //           return ListTile(
// //             title: Text('Document ${index + 1}'),
// //             onTap: () {
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) => PDFFileView(
// //                     path: paths[index], // Passing the selected PDF path
// //                   ),
// //                 ),
// //               );
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// //
// // class PDFFileView extends StatelessWidget {
// //   final String path; // Single PDF file path
// //
// //   PDFFileView({required this.path});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('PDF Viewer'),
// //       ),
// //       body: PDF().cachedFromUrl(
// //         path, // Using the provided PDF path
// //         placeholder: (progress) => Center(child: Text('$progress %')),
// //         errorWidget: (error) => Center(child: Text('Failed to load PDF')),
// //       ),
// //     );
// //   }
// // }
//
// //==================================================================
//
// //
// // class PDFViewerPagea extends StatelessWidget {
// //   final List<String> paths; // List of PDF paths
// //
// //   PDFViewerPagea({required this.paths});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('PDF Viewer'),
// //       ),
// //       body: ListView.builder(
// //         itemCount: paths.length, // Number of PDF files
// //         itemBuilder: (context, index) {
// //           return ListTile(
// //             title: Text('Document ${index + 1}'), // Label for each document
// //             onTap: () {
// //               // Navigate to PDFFileView with the selected PDF path
// //               Navigator.push(
// //                 context,
// //                 MaterialPageRoute(
// //                   builder: (context) => PDFFileView(
// //                     path: paths[index], // Pass individual PDF path
// //                   ),
// //                 ),
// //               );
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// // class PDFFileView extends StatelessWidget {
// //   final String path; // Single PDF file path
// //
// //   PDFFileView({required this.path});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('PDF Viewer'),
// //       ),
// //       body: PDF().cachedFromUrl(
// //         path, // Load PDF from the given URL or file path
// //         placeholder: (progress) => Center(child: Text('$progress %')), // Show progress while loading
// //         errorWidget: (error) => Center(child: Text('Error loading PDF: $error')), // Handle errors
// //       ),
// //     );
// //   }
// // }
//
// class PDFViewerPages extends StatefulWidget {
//   final List<String> paths;
//
//   PDFViewerPages({required this.paths});
//
//   @override
//   _PDFViewerPagesState createState() => _PDFViewerPagesState();
// }
//
// class _PDFViewerPagesState extends State<PDFViewerPages> {
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
//     final directory = await getApplicationDocumentsDirectory();
//     final fileName = path.split('/').last;
//     final newPath = '${directory.path}/$fileName';
//
//     final newFile = await file.copy(newPath);
//     return newFile.path;
//   }
//   Future<void> exampleFunction() async {
//     try {
//       // Get the directory
//       final directory = await getApplicationDocumentsDirectory();
//
//       // Print the directory path
//       print('Directory path: ${directory.path}');
//
//       // Example: Creating a file in this directory
//       final filePath = '${directory.path}/example.txt';
//       final file = File(filePath);
//
//       // Write to the file
//       await file.writeAsString('Hello, world!');
//
//       print('File created at: $filePath');
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   Future<void> _requestPermissions() async {
//     if (await Permission.storage.request().isGranted) {
//       print("Storage permission granted");
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
//       if (!await File(permanentPath).exists()) {
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
//       setState(() {
//         _isLoading = false;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error loading PDF: $e')),
//       );
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
//   Future<void> _downloadPdf() async {
//     try {
//       final path = widget.paths[_currentIndex];
//       final permanentPath = await _copyFileToPermanentLocation(path);
//       // Here you can implement the download functionality.
//       // For example, you could use a package like 'path_provider' to save the file
//       // and 'url_launcher' to open it or share it.
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('PDF saved to $permanentPath')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error saving PDF: $e')),
//       );
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
//           IconButton(
//             icon: Icon(Icons.download),
//             onPressed: _downloadPdf,
//             tooltip: 'Download PDF',
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
//
//   getApplicationDocumentsDirectory() {}
// }
//
//
//
//
// class FileHandlingExample extends StatefulWidget {
//   @override
//   _FileHandlingExampleState createState() => _FileHandlingExampleState();
// }
//
// class _FileHandlingExampleState extends State<FileHandlingExample> {
//   String _filePath = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _getFilePath();
//   }
//
//   Future<void> _getFilePath() async {
//     try {
//       // Get the application documents directory
//       final directory = await getApplicationDocumentsDirectory();
//       final filePath = '${directory.path}/example.txt';
//       setState(() {
//         _filePath = filePath;
//       });
//
//       // Create and write to the file
//       final file = File(filePath);
//       await file.writeAsString('Hello, world!');
//       print('File created at: $filePath');
//     } catch (e) {
//       print('Error getting file path: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('File Handling Example'),
//       ),
//       body: Center(
//         child: Text('File path: $_filePath'),
//       ),
//     );
//   }
// }
//
// Future<void> _loadPdf(String path) async {
//   try {
//     print('Attempting to load PDF from: $path');
//
//     // Get a reference to the file in Firebase Storage
//     final storageRef = FirebaseStorage.instance.ref().child(path);
//
//     // Create a temporary directory
//     final tempDir = await getTemporaryDirectory();
//     final tempPath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.pdf';
//
//     // Download the file from Firebase Storage
//     await storageRef.writeToFile(File(tempPath));
//     print('Copied PDF to: $tempPath');
//
//     // Check if the file exists
//     if (!kIsWeb && !await File(tempPath).exists()) {
//       throw Exception('File not found: $tempPath');
//     }
//
//     // Load the PDF
//     _pdfPinchController = PdfControllerPinch(
//       document: PdfDocument.openFile(tempPath),
//     );
//
//     setState(() {
//       _isLoading = false;
//     });
//   } catch (e) {
//     print("Error loading PDF: $e");
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error loading PDF: $e')),
//     );
//   }
// }




class PDFViewerPage extends StatefulWidget {
  final List<String> paths;
  final int initialIndex;
  final Company company;

  PDFViewerPage({required this.paths, required this.initialIndex,required this.company});

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  PdfControllerPinch? _pdfPinchController;
  int _currentIndex = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _printFilePaths();
    _loadPdf(widget.paths[_currentIndex]);
  }

  Future<String> _copyFileToPermanentLocation(String path) async {
    final file = File(path);

    if (!await file.exists()) {
      throw Exception('File not found at path: $path');
    }

    final directory = await getTemporaryDirectory();
    final newPath = '${directory.path}/${path.split('/').last}';

    final newFile = await file.copy(newPath);
    return newFile.path;
  }

  Future<void> _requestPermissions() async {
    if (await Permission.storage.request().isGranted) {
      // Permission granted
    } else {
      print("Storage permission denied");
    }
  }

  void _printFilePaths() {
    for (var path in widget.paths) {
      print('Path: $path');
    }
  }

  Future<void> _loadPdf(String path) async {
    try {
      print('Attempting to load PDF from: $path');

      final permanentPath = await _copyFileToPermanentLocation(path);
      print('Copied PDF to: $permanentPath');

      if (!kIsWeb && !await File(permanentPath).exists()) {
        throw Exception('File not found: $permanentPath');
      }

      _pdfPinchController = PdfControllerPinch(
        document: PdfDocument.openFile(permanentPath),
      );

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print("Error loading PDF: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading PDF: $e')),
      );
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
        title: Text('${widget.company.Cname} (${_currentIndex + 1}/${widget.paths.length})',
          style: GoogleFonts.roboto( // Applying Google Fonts
            textStyle: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Color(0xFF003123),
            ),
          ),
        ),
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

