import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../Page/R_HomePage/Reciprocating.dart';
import 'Model.dart';
//
// class CompanyControllersR extends GetxController {
//   var companyList = <Company>[].obs;
//   var searchQuery = ''.obs;
//   var filteredCompanies = <Company>[].obs;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchCompanies(); // Fetch companies when controller is initialized
//   }
//
//   void fetchCompanies() {
//     firestore.collection('companies').snapshots().listen((snapshot) {
//       List<Company> companies = snapshot.docs
//           .map((doc) => Company.fromFirestore(doc))
//           .toList();
//       companyList.assignAll(companies);
//     });
//   }
//
//   // Fetch all companies from Firestore
//   // void fetchCompanies() async {
//   //   try {
//   //     QuerySnapshot snapshot = await firestore.collection('companies').get();
//   //     List<Company> companies = snapshot.docs
//   //         .map((doc) => Company.fromFirestore(doc))
//   //         .toList();
//   //     companyList.value = companies;
//   //   } catch (e) {
//   //     print('Error fetching companies: $e');
//   //   }
//   // }
//
//   // // Function to add company to Firestore
//   // void addCompany(Company company) async {
//   //   try {
//   //     await firestore.collection('companies').add({
//   //       'Cname': company.Cname,
//   //       'Uname': company.Uname,
//   //       'pdfPath': company.pdfPath,
//   //     });
//   //     companyList.add(company); // Add to local list
//   //   } catch (e) {
//   //     print('Error adding company: $e');
//   //   }
//   // }
//   //
//   // // Function to filter companies based on search
//   // List<Company> get filteredCompanies {
//   //   if (searchQuery.isEmpty) {
//   //     return companyList;
//   //   } else {
//   //     return companyList
//   //         .where((company) =>
//   //         company.Cname.toLowerCase().contains(searchQuery.value.toLowerCase()))
//   //         .toList();
//   //   }
//   // }
//
//   // Function to update search query
//   void updateSearchQuery(String query) {
//     searchQuery.value = query;
//     searchCompanies(query);
//   }
//   //
//   // // Function to get a single company by document ID
//   // void getCompany(String documentId) async {
//   //   try {
//   //     DocumentSnapshot doc = await firestore.collection('companies').doc(documentId).get();
//   //     if (doc.exists) {
//   //       Company company = Company.fromFirestore(doc);
//   //       print('Company name: ${company.Cname}');
//   //       print('User name: ${company.Uname}');
//   //       print('PDF path: ${company.pdfPath}');
//   //     } else {
//   //       print('Company not found');
//   //     }
//   //   } catch (e) {
//   //     print('Error fetching company: $e');
//   //   }
//   // }
//
//   void searchCompanies(String query) {
//     if (query.isEmpty) {
//       filteredCompanies.assignAll(companyList);
//     } else {
//       filteredCompanies.assignAll(
//         companyList.where((company) =>
//         company.Cname.toLowerCase().contains(query.toLowerCase()) ||
//             company.Uname.toLowerCase().contains(query.toLowerCase())
//         ).toList(),
//       );
//     }
//   }
//
//   void addCompany(Company company) async {
//     try {
//       await firestore.collection('companies').add({
//         'Cname': company.Cname,
//         'Uname': company.Uname,
//         'pdfPath': company.pdfPath,
//       });
//       companyList.add(company); // Add to local list
//       searchCompanies(searchQuery.value); // Update filtered list
//     } catch (e) {
//       print('Error adding company: $e');
//     }
//   }
//
//   // Function to get a single company by document ID
//   void getCompany(String documentId) async {
//     try {
//       DocumentSnapshot doc = await firestore.collection('companies').doc(documentId).get();
//       if (doc.exists) {
//         Company company = Company.fromFirestore(doc);
//         print('Company name: ${company.Cname}');
//         print('User name: ${company.Uname}');
//         print('PDF path: ${company.pdfPath}');
//       } else {
//         print('Company not found');
//       }
//     } catch (e) {
//       print('Error fetching company: $e');
//     }
//   }
// }
class CompanyControllersR extends GetxController {
  var companyList = <Company>[].obs;
  var filteredCompanies = <Company>[].obs;
  var deletedCompaniesList = <Map<String, dynamic>>[].obs;
  var searchQuery = ''.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchCompanies();
    fetchDeleteHistory(); // Fetch deleted companies history on initialization
  }

  void fetchCompanies() {
    firestore.collection('companies').snapshots().listen((snapshot) {
      List<Company> companies = snapshot.docs.map((doc) => Company.fromFirestore(doc)).toList();
      companyList.assignAll(companies);
    });
  }

  void fetchDeleteHistory() {
    firestore.collection('deleted_companies').snapshots().listen((snapshot) {
      List<Map<String, dynamic>> deletedCompanies = snapshot.docs.map((doc) => {
        'Cname': doc['Cname'],
        'deletedAt': doc['deletedAt'],
      }).toList();
      deletedCompaniesList.assignAll(deletedCompanies);
    });
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    filteredCompanies.assignAll(
      companyList.where((company) =>
      company.Cname.toLowerCase().contains(query.toLowerCase()) ||
          company.Uname.toLowerCase().contains(query.toLowerCase()),
      ),
    );
  }

  void addCompany(Company newCompany) {
    companyList.add(newCompany);
    filteredCompanies.add(newCompany);
  }
}

class CompanyControllersS extends GetxController {
  var companyList = <Company>[].obs;
  var searchQuery = ''.obs;
  var filteredCompanies = <Company>[].obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchCompanies(); // Fetch companies when controller is initialized
  }

  void fetchCompanies() {
    firestore.collection('companies').snapshots().listen((snapshot) {
      List<Company> companies = snapshot.docs
          .map((doc) => Company.fromFirestore(doc))
          .toList();
      companyList.assignAll(companies);
    });
  }

  // Fetch all companies from Firestore
  // void fetchCompanies() async {
  //   try {
  //     QuerySnapshot snapshot = await firestore.collection('companies').get();
  //     List<Company> companies = snapshot.docs
  //         .map((doc) => Company.fromFirestore(doc))
  //         .toList();
  //     companyList.value = companies;
  //   } catch (e) {
  //     print('Error fetching companies: $e');
  //   }
  // }

  // // Function to add company to Firestore
  // void addCompany(Company company) async {
  //   try {
  //     await firestore.collection('companies').add({
  //       'Cname': company.Cname,
  //       'Uname': company.Uname,
  //       'pdfPath': company.pdfPath,
  //     });
  //     companyList.add(company); // Add to local list
  //   } catch (e) {
  //     print('Error adding company: $e');
  //   }
  // }
  //
  // // Function to filter companies based on search
  // List<Company> get filteredCompanies {
  //   if (searchQuery.isEmpty) {
  //     return companyList;
  //   } else {
  //     return companyList
  //         .where((company) =>
  //         company.Cname.toLowerCase().contains(searchQuery.value.toLowerCase()))
  //         .toList();
  //   }
  // }

  // Function to update search query
  void updateSearchQuery(String query) {
    searchQuery.value = query;
    searchCompanies(query);
  }
  //
  // // Function to get a single company by document ID
  // void getCompany(String documentId) async {
  //   try {
  //     DocumentSnapshot doc = await firestore.collection('companies').doc(documentId).get();
  //     if (doc.exists) {
  //       Company company = Company.fromFirestore(doc);
  //       print('Company name: ${company.Cname}');
  //       print('User name: ${company.Uname}');
  //       print('PDF path: ${company.pdfPath}');
  //     } else {
  //       print('Company not found');
  //     }
  //   } catch (e) {
  //     print('Error fetching company: $e');
  //   }
  // }

  void searchCompanies(String query) {
    if (query.isEmpty) {
      filteredCompanies.assignAll(companyList);
    } else {
      filteredCompanies.assignAll(
        companyList.where((company) =>
        company.Cname.toLowerCase().contains(query.toLowerCase()) ||
            company.Uname.toLowerCase().contains(query.toLowerCase())
        ).toList(),
      );
    }
  }

  void addCompany(Company company) async {
    try {
      await firestore.collection('companies').add({
        'Cname': company.Cname,
        'Uname': company.Uname,
        'pdfPath': company.pdfPath,
      });
      companyList.add(company); // Add to local list
      searchCompanies(searchQuery.value); // Update filtered list
    } catch (e) {
      print('Error adding company: $e');
    }
  }

  // Function to get a single company by document ID
  void getCompany(String documentId) async {
    try {
      DocumentSnapshot doc = await firestore.collection('companies').doc(documentId).get();
      if (doc.exists) {
        Company company = Company.fromFirestore(doc);
        print('Company name: ${company.Cname}');
        print('User name: ${company.Uname}');
        print('PDF path: ${company.pdfPath}');
      } else {
        print('Company not found');
      }
    } catch (e) {
      print('Error fetching company: $e');
    }
  }
}
