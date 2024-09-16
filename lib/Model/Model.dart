import 'package:cloud_firestore/cloud_firestore.dart';

class Company {
  final String Cname;
  final String Uname;
  final List<String>? pdfPath; // Changed to List<String> to handle multiple paths

  // Constructor with named parameters
  Company({
    required this.Cname,
    required this.Uname,
    this.pdfPath, // Made optional
  });

  // Convert a Company object into a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'Cname': Cname,
      'Uname': Uname,
      'pdfPaths': pdfPath ?? [], // Convert to empty list if null
    };
  }

  // Create a Company object from a Firestore document
  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      Cname: map['Cname'] ?? '',
      Uname: map['Uname'] ?? '',
      pdfPath: List<String>.from(map['pdfPath'] ?? []),
    );
  }

  factory Company.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Company(
      Cname: data['Cname'] ?? '',
      Uname: data['Uname'] ?? '',
      pdfPath: List<String>.from(data['pdfPath'] ?? []),
    );
  }
}
