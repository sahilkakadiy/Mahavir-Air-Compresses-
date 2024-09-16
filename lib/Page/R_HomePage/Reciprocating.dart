// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class reciprocatingpage extends StatefulWidget {
//   const reciprocatingpage({super.key});
//
//   @override
//   State<reciprocatingpage> createState() => _reciprocatingpageState();
// }
//
// class _reciprocatingpageState extends State<reciprocatingpage> {
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
//             height: height * 0.025,
//           ),
//           AppBar(
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back,color: Color(0xFFFFFFFF)),
//               onPressed: () {
//                 Navigator.pop(context); // Navigate back to the previous screen
//               },
//             ),
//             title: Text(
//               "New Inquiry",
//               style: GoogleFonts.inter(
//                 fontWeight: FontWeight.w700,
//                 fontSize: 20,
//                 color: Colors.white, // Text color for the AppBar title
//               ),
//             ),
//             backgroundColor: Color(0xFF003123), // Background color for the AppBar
//           ),
//           SizedBox(
//             height: height * 0.015,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               decoration: InputDecoration(
//                 focusColor: Color(0xFFD9D9D9), // Color when the field is focused
//                 contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Padding inside the TextFormField
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 fillColor: Color(0xFFD9D9D9), // Background color inside the border
//                 filled: true, // Ensures the background color is applied
//                 prefixIcon: Icon(Icons.search, size: 28, color: Color(0xFF003123)), // Search icon at the beginning
//                 suffixIcon: Icon(Icons.arrow_drop_down, size: 34, color: Color(0xFF003123)), // Drop-down icon at the end
//               ),
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
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => reciprocatingsearch(),));
//                 },
//                 child: Container(
//                   height: 50,
//                   width: 50,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
//                         spreadRadius: 2, // How much the shadow spreads
//                         blurRadius: 5, // How blurry the shadow is
//                         offset: Offset(0, 3), // Position of the shadow (x, y)
//                       ),
//                     ],
//                     color: Color(0xFFD9D9D9), // Correct way to set background color
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   child: Icon(
//                     Icons.add,
//                     size: 22,
//                     color: Color(0xFF000000), // Correct way to set icon color
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class Company {
//   final String name;
//
//   Company(this.name);
// }
//
//
// class reciprocatingsearch extends StatefulWidget {
//   const reciprocatingsearch({super.key});
//
//   @override
//   State<reciprocatingsearch> createState() => _reciprocatingsearchState();
// }
//
// class _reciprocatingsearchState extends State<reciprocatingsearch> {
//
//   final List<Company> _companies = [
//     Company("Demo Company name 1"),
//     Company("Demo Company name 2"),
//     Company("Demo Company name 3"),
//     // Add more companies as needed
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: _companies.length,
//         itemBuilder: (context, index) {
//           // Get the company data
//           final company = _companies[index];
//
//           return ListTile(
//             title: Text(company.name),
//             // Optionally, add more widgets like subtitle, leading, trailing, etc.
//           );
//         },
//       ),
//     );
//   }
// }

//________________________________________________________________
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/Getx.dart';
import '../../Model/Model.dart';
import '../../Model/luaguage.dart';
import '../../Model/pdf.dart';
import '../../dashBoard.dart';
import 'Addnewresiprocating.dart';
import 'New InQuiry.dart';

//
// class CompanyController extends GetxController {
//   // Observable list of companies
//   var companies = <Company>[].obs;
//   var filteredCompanies = <Company>[].obs;
//   var searchQuery = ''.obs;
//
//   // Language observable
//   var language = 'English'.obs;
//   RxString searchHintText = 'Search Company'.obs; // Set initial hint text
//
//   @override
//   void onInit() {
//     super.onInit();
//     // Add initial companies here
//     companies.addAll([
//       // Example: Company(Cname: 'Company1', Uname: 'User1', pdfPath: ''),
//     ]);
//     // Initially filtered companies should match the complete list
//     filteredCompanies.assignAll(companies);
//   }
//
//   void setSearchHintText(String newText) {
//     searchHintText.value = newText;
//   }
//
//   // Update the filtered company list based on search query
//   void filterCompanies(String query) {
//     searchQuery.value = query;
//     if (query.isEmpty) {
//       filteredCompanies.assignAll(companies);
//     } else {
//       filteredCompanies.assignAll(
//         companies.where((company) =>
//             company.Cname.toLowerCase().contains(query.toLowerCase())),
//       );
//     }
//   }
//
//   // Set the language for translation
//   void setLanguage(String newLanguage) {
//     language.value = newLanguage;
//   }
// }
// class CompanyController extends GetxController {
//   // Observable list of companies
//   var companies = <Company>[].obs;
//   var filteredCompanies = <Company>[].obs;
//   var searchQuery = ''.obs;
//
//   // Language observable
//   var language = 'English'.obs;
//   RxString searchHintText = ''.obs;
//   // Set initial data
//   @override
//   void onInit() {
//     super.onInit();
//     // Add initial companies here
//     companies.addAll([
//       // Example: Company(Cname: 'Company1', Uname: 'User1', pdfPath: ''),
//     ]);
//     // Initially filtered companies should match the complete list
//     filteredCompanies.assignAll(companies);
//   }
//   void setSearchHintText(String newText) {
//     searchHintText.value = newText;
//   }
//   // Update the filtered company list based on search query
//   void filterCompanies(String query) {
//     searchQuery.value = query;
//     if (query.isEmpty) {
//       filteredCompanies.assignAll(companies);
//     } else {
//       filteredCompanies.assignAll(
//         companies.where((company) =>
//             company.Cname.toLowerCase().contains(query.toLowerCase())),
//       );
//     }
//   }
//
//   // Set the language for translation
//   void setLanguage(String newLanguage) {
//     language.value = newLanguage;
//   }
// }
// class CompanyControllers extends GetxController {
//   var companyList = <Company>[].obs;
//   var searchQuery = ''.obs;
//
//   // Function to add company
//   void addCompany(Company company) {
//     companyList.add(company);
//   }
//
//   // Function to filter companies based on search
//   List<Company> get filteredCompanies {
//     if (searchQuery.isEmpty) {
//       return companyList;
//     } else {
//       return companyList
//           .where((company) =>
//           company.Cname.toLowerCase().contains(searchQuery.value.toLowerCase()))
//           .toList();
//     }
//   }
//
//   // Function to update search query
//   void updateSearchQuery(String query) {
//     searchQuery.value = query;
//   }
//
//   void _getCompany(String documentId) async {
//     DocumentSnapshot doc = await firestoreService.collection('companies').doc(documentId).get();
//     Company company = Company.fromMap(doc.data() as Map<String, dynamic>);
//
//     print('Company name: ${company.Cname}');
//     print('User name: ${company.Uname}');
//     print('PDF path: ${company.pdfPath}');
//   }
//
// }

// class ReciprocatingPage extends StatefulWidget {
//   final List<Company> companies;
//   final String language;
//
//   const ReciprocatingPage({super.key, required this.companies, required this.language});
//
//   @override
//   State<ReciprocatingPage> createState() => _ReciprocatingPageState();
// }
//
// class _ReciprocatingPageState extends State<ReciprocatingPage> {
//   final TextEditingController _searchController = TextEditingController();
//   late CompanyControllers companyController = Get.find();
//
//   @override
//   void initState() {
//     super.initState();
//     companyController = Get.put(CompanyControllers());
//     companyController.companyList.addAll(companies);
//     companyController.updateSearchQuery(''); // Initialize filtered list
//     _searchController.addListener(() {
//       companyController.updateSearchQuery(_searchController.text);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double height = size.height;
//
//     return Scaffold(
//       backgroundColor: Color(0xFFFFFFFF),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           SizedBox(height: height * 0.03),
//           Container(
//             height: 65,
//             child: AppBar(
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => newinquirypage(language: widget.language)),
//                   );
//                 },
//               ),
//               title: Obx(() {
//                 return Text(
//                   companyController,
//                   style: GoogleFonts.inter(
//                     fontWeight: FontWeight.w700,
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 );
//               }),
//               backgroundColor: Color(0xFF003123),
//               toolbarHeight: 65,
//             ),
//           ),
//           SizedBox(height: height * 0.015),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               onChanged: (value) {
//                 companyController.updateSearchQuery(value);
//               },
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: companyController.searchHintText.value,
//                 focusColor: Color(0xFFD9D9D9),
//                 contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 fillColor: Color(0xFFD9D9D9),
//                 filled: true,
//                 prefixIcon: Icon(Icons.search, size: 28, color: Color(0xFF003123)),
//                 suffixIcon: Icon(Icons.arrow_drop_down, size: 34, color: Color(0xFF003123)),
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
//                     title: Text(company.Cname),
//                     subtitle: Text(company.Uname),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => CompanyDetailPage(
//                             company: company,
//                             language: companyController.language.value,
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               );
//             }),
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
//
//           Padding(
//             padding: const EdgeInsets.only(right: 33, bottom: 20),
//             child: Column(
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'Add New Company Text', // Use appropriate variable
//                         style: GoogleFonts.inter(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 10,
//                           color: Color(0xFF000000),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'Add New Company Continued Text', // Use appropriate variable
//                         style: GoogleFonts.inter(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 10,
//                           color: Color(0xFF000000),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: height * 0.01),
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
//                             builder: (context) => AddNewReciprocatingPage(language: widget.language),
//                           ),
//                         );
//
//                         if (newCompany != null) {
//                           setState(() {
//                             companyController.companies.add(newCompany);
//                             companyController.filterCompanies(''); // Refresh filtered list
//                             _searchController.clear(); // Clear search field
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
//           )
//         ],
//       ),
//     );
//   }
// }

class ReciprocatingPage extends StatefulWidget {
  final List<Company> companies;
  final String language; // Add language parameter
  const ReciprocatingPage({super.key,required this.companies, required this.language,});

  @override
  State<ReciprocatingPage> createState() => _ReciprocatingPageState();
}
// class _ReciprocatingPageState extends State<ReciprocatingPage> {
//   late List<Company> _filteredCompanies;
//   late CompanyControllersR companyController;
//   final TextEditingController _searchController = TextEditingController();
//   final firestoreService = FirestoreServiceq();
//
//   // Initialize your translated texts
//   late String titleText;
//   late String searchHintText;
//   late String addNewCompanyText;
//   late String addNewCompanyContinuedText;
//
//   @override
//   void initState() {
//     super.initState();
//     companyController = Get.find<CompanyControllersR>();
//     _filteredCompanies = List.from(widget.companies);
//     _searchController.addListener(() {
//       companyController.updateSearchQuery(_searchController.text); // Update search query
//     });
//
//     // Initialize the translated texts
//     titleText = TranslationHelper.translate(widget.language, 'titleText');
//     searchHintText = TranslationHelper.translate(widget.language, 'searchHintText');
//     addNewCompanyText = TranslationHelper.translate(widget.language, 'addNewCompanyText');
//     addNewCompanyContinuedText = TranslationHelper.translate(widget.language, 'addNewCompanyContinuedText');
//
//     // Fetch deleted company history
//     companyController.fetchDeleteHistory();
//   }
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
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           SizedBox(height: height * 0.030),
//           _buildAppBar(),
//           SizedBox(height: height * 0.015),
//           _buildSearchField(),
//           _buildCompanyList(),
//          // _buildDeletedCompanyList(),
//           _buildAddCompanyButton(height),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAppBar() {
//     return Container(
//       height: 65,
//       child: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => newinquirypage(language: widget.language)),
//             ); // Navigate back to the previous screen
//           },
//         ),
//         title: Text(
//           titleText,
//           style: GoogleFonts.inter(
//             fontWeight: FontWeight.w700,
//             fontSize: 18,
//             color: Colors.white, // Text color for the AppBar title
//           ),
//         ),
//         backgroundColor: Color(0xFF003123), // Background color for the AppBar
//         toolbarHeight: 28,
//       ),
//     );
//   }
//
//   Widget _buildSearchField() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextFormField(
//         keyboardType: TextInputType.text,
//         onChanged: (value) {
//           companyController.updateSearchQuery(value);
//         },
//         controller: _searchController,
//         decoration: InputDecoration(
//           hintText: searchHintText,
//           contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//           ),
//           fillColor: Color(0xFFD9D9D9),
//           filled: true,
//           prefixIcon: Icon(Icons.search, size: 28, color: Color(0xFF003123)),
//           suffixIcon: Icon(Icons.arrow_drop_down, size: 34, color: Color(0xFF003123)),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCompanyList() {
//     return Expanded(
//       child: Obx(() {
//         if (companyController.filteredCompanies.isEmpty) {
//           return const Center(child: Text('No companies found'));
//         }
//         return ListView.builder(
//           itemCount: companyController.filteredCompanies.length,
//           itemBuilder: (context, index) {
//             final company = companyController.filteredCompanies[index];
//
//             // Wrapping ListTile with Dismissible
//             return Dismissible(
//               key: Key(company.Cname), // Unique key for each Dismissible
//               direction: DismissDirection.endToStart, // Allows swiping only from right to left
//               background: Container(
//                 color: Colors.red, // Red background for swipe
//                 alignment: Alignment.centerRight,
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Icon(
//                   Icons.delete,
//                   color: Colors.white,
//                   size: 32,
//                 ),
//               ),
//               confirmDismiss: (direction) async {
//                 // Show confirmation dialog before deleting
//                 return await showDialog<bool>(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: Text('Confirm Delete'),
//                     content: Text('Are you sure you want to delete this company?'),
//                     actions: [
//                       TextButton(
//                         onPressed: () => Navigator.pop(context, false),
//                         child: Text('Cancel'),
//                       ),
//                       TextButton(
//                         onPressed: () => Navigator.pop(context, true),
//                         child: Text('Delete'),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               onDismissed: (direction) async {
//                 try {
//                   await firestoreService.deleteCompany(company);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Company deleted successfully!')),
//                   );
//                   companyController.filteredCompanies.removeAt(index);
//                 } catch (error) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Error deleting company: $error')),
//                   );
//                 }
//               },
//               child: ListTile(
//                 trailing: Icon(Icons.keyboard_double_arrow_left_outlined,color: Colors.red),
//                 title: Text(company.Cname),
//                 subtitle: Text(company.Uname),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => CompanyDetailPage(company: company, language: widget.language),
//                     ),
//                   );
//                 },
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
//
//   // Widget _buildCompanyList() {
//   //   return Expanded(
//   //     child: Obx(() {
//   //       if (companyController.filteredCompanies.isEmpty) {
//   //         return const Center(child: Text('No companies found'));
//   //       }
//   //       return ListView.builder(
//   //         itemCount: companyController.filteredCompanies.length,
//   //         itemBuilder: (context, index) {
//   //           final company = companyController.filteredCompanies[index];
//   //           return ListTile(
//   //             title: Text(company.Cname),
//   //             subtitle: Text(company.Uname),
//   //             onTap: () {
//   //               Navigator.push(
//   //                 context,
//   //                 MaterialPageRoute(
//   //                   builder: (context) => CompanyDetailPage(company: company, language: widget.language),
//   //                 ),
//   //               );
//   //             },
//   //             trailing: IconButton(
//   //               icon: Icon(Icons.delete, color: Colors.red),
//   //               onPressed: () async {
//   //                 final shouldDelete = await showDialog<bool>(
//   //                   context: context,
//   //                   builder: (context) => AlertDialog(
//   //                     title: Text('Confirm Delete'),
//   //                     content: Text('Are you sure you want to delete this company?'),
//   //                     actions: [
//   //                       TextButton(
//   //                         onPressed: () => Navigator.pop(context, false),
//   //                         child: Text('Cancel'),
//   //                       ),
//   //                       TextButton(
//   //                         onPressed: () => Navigator.pop(context, true),
//   //                         child: Text('Delete'),
//   //                       ),
//   //                     ],
//   //                   ),
//   //                 );
//   //
//   //                 if (shouldDelete == true) {
//   //                   try {
//   //                     await firestoreService.deleteCompany(company);
//   //                     ScaffoldMessenger.of(context).showSnackBar(
//   //                       SnackBar(content: Text('Company deleted successfully!')),
//   //                     );
//   //                     companyController.filteredCompanies.removeAt(index);
//   //                   } catch (error) {
//   //                     ScaffoldMessenger.of(context).showSnackBar(
//   //                       SnackBar(content: Text('Error deleting company: $error')),
//   //                     );
//   //                   }
//   //                 }
//   //               },
//   //             ),
//   //           );
//   //         },
//   //       );
//   //     }),
//   //   );
//   // }
//   //
//   // Widget _buildDeletedCompanyList() {
//   //   return Expanded(
//   //     child: Obx(() {
//   //       if (companyController.deletedCompaniesList.isEmpty) {
//   //         return const Center(child: Text('No deleted companies found'));
//   //       }
//   //       return ListView.builder(
//   //         itemCount: companyController.deletedCompaniesList.length,
//   //         itemBuilder: (context, index) {
//   //           final deletedCompany = companyController.deletedCompaniesList[index];
//   //           return ListTile(
//   //             title: Text(deletedCompany['Cname']),
//   //             subtitle: Text('Deleted at: ${deletedCompany['deletedAt']}'),
//   //           );
//   //         },
//   //       );
//   //     }),
//   //   );
//   // }
//
//   Widget _buildAddCompanyButton(double height) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 33, bottom: 20),
//       child: Column(
//         children: [
//           RichText(
//             text: TextSpan(
//               children: [
//                 TextSpan(
//                   text: addNewCompanyText,
//                   style: GoogleFonts.inter(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 10,
//                     color: Color(0xFF000000), // Text color
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: height * 0.010),
//           Container(
//             height: 50,
//             width: 50,
//             decoration: BoxDecoration(
//               color: Color(0xFFD9D9D9), // Background color
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5), // Shadow color
//                   spreadRadius: 2, // How much the shadow spreads
//                   blurRadius: 5, // How blurry the shadow is
//                   offset: Offset(0, 3), // Position of the shadow
//                 ),
//               ],
//             ),
//             child: Center(
//               child: IconButton(
//                 onPressed: () async {
//                   final newCompany = await Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AddNewReciprocatingPage(language: widget.language)),
//                   );
//                   if (newCompany != null) {
//                     setState(() {
//                       widget.companies.add(newCompany);
//                       companyController.addCompany(newCompany);
//                     });
//                   }
//                 },
//                 icon: Icon(Icons.add, size: 22, color: Color(0xFF000000)),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//+++++++++================++++++++++++++
//+++++++++================++++++++++++++
//+++++++++================++++++++++++++
//
class _ReciprocatingPageState extends State<ReciprocatingPage> {
  late List<Company> _filteredCompanies;
  late CompanyControllersR companyController;
  final TextEditingController _searchController = TextEditingController();

  late String titleText;
  late String searchHintText;
  late String addNewCompanyText;
  late String addNewCompanyContinuedText;

  // @override
  // void initState() {
  //   super.initState();
  //   _filteredCompanies = List.from(widget.companies);
  //   _searchController.addListener(_filterCompanies);
  //
  //   // Initialize the translated texts
  //   titleText = TranslationHelper.translate(widget.language, 'titleText');
  //   searchHintText = TranslationHelper.translate(widget.language, 'searchHintText');
  //   addNewCompanyText = TranslationHelper.translate(widget.language, 'addNewCompanyText');
  //   addNewCompanyContinuedText = TranslationHelper.translate(widget.language, 'addNewCompanyContinuedText');
  //   companyController.setLanguage(widget.language);
  //   companyController.setSearchHintText(
  //     TranslationHelper.translate(widget.language, 'searchHintText'),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    companyController = Get.find<CompanyControllersR>();
    _filteredCompanies = List.from(widget.companies);
    _searchController.addListener(() {
      companyController.updateSearchQuery(_searchController.text); // Update search query
    });
   // _searchController.addListener(_filterCompanies);

    // Initialize the translated texts
    titleText = TranslationHelper.translate(widget.language, 'titleText');
    searchHintText = TranslationHelper.translate(widget.language, 'searchHintText');
    addNewCompanyText = TranslationHelper.translate(widget.language, 'addNewCompanyText');
    addNewCompanyContinuedText = TranslationHelper.translate(widget.language, 'addNewCompanyContinuedText');

  }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     companyController.searchQuery(widget.language);
  //     companyController.searchQuery(
  //       TranslationHelper.translate(widget.language, 'searchHintText'),
  //     );
  //   });
  // }
  // @override
  // void dispose() {
  //   _searchController.removeListener(_filterCompanies);
  //   _searchController.dispose(); // Don't forget to dispose the controller
  //   super.dispose();
  // }
  //
  // void _filterCompanies() async {
  //   final companiesCollection = FirebaseFirestore.instance.collection('companies');
  //
  //   // Query Firestore for companies matching the search term
  //   final querySnapshot = await companiesCollection
  //       .where('Cname', isGreaterThanOrEqualTo: _searchController.text.toLowerCase())
  //       .where('Cname', isLessThanOrEqualTo: _searchController.text.toLowerCase() + '\uf8ff')
  //       .get();
  //
  //   // Update the filtered companies list with Firestore data
  //   setState(() {
  //     _filteredCompanies = querySnapshot.docs
  //         .map((doc) => Company.fromFirestore(doc))
  //         .toList();
  //   });
  // }

  final firestoreService = FirestoreServiceq();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    _searchController.addListener(() {
      companyController.searchQuery(_searchController.text);
    });
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: height * 0.030),
          Container(
            height: 65,
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back,color: Color(0xFFFFFFFF)),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => newinquirypage(language: widget.language,),)); // Navigate back to the previous screen
                },
              ),
              title: Text(
                titleText,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.white, // Text color for the AppBar title
                ),
              ),
              backgroundColor: Color(0xFF003123), // Background color for the AppBar
              toolbarHeight: 28,
            ),
          ),
          SizedBox(height: height * 0.015),
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            keyboardType: TextInputType.text,
            onChanged: (value) {
              companyController.updateSearchQuery(value);
            },
            controller: _searchController,
            decoration: InputDecoration(
              hintText: searchHintText,
              focusColor: Color(0xFFD9D9D9),
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              fillColor: Color(0xFFD9D9D9),
              filled: true,
              prefixIcon: Icon(Icons.search, size: 28, color: Color(0xFF003123)),
              suffixIcon: Icon(Icons.arrow_drop_down, size: 34, color: Color(0xFF003123)),
            ),
          ),
        ),
          Expanded(
            child: Obx(() {
              // Check if there are no companies to display
              if (companyController.filteredCompanies.isEmpty) {
                return const Center(child: Text('No companies found'));
              }

              // Build a ListView to display companies
              return ListView.builder(
                itemCount: companyController.filteredCompanies.length,
                itemBuilder: (context, index) {
                  final company = companyController.filteredCompanies[index];

                  return Dismissible(
                    key: ValueKey(company.Cname), // Ensure each item has a unique key
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Color(0xFF003123),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                      ),
                    ),
                    confirmDismiss: (direction) async {
                      if (direction == DismissDirection.endToStart) {
                        // Show a confirmation dialog before deleting
                        final shouldDelete = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Confirm Delete'),
                            content: Text('Are you sure you want to delete this company?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: Text('Delete'),
                              ),
                            ],
                          ),
                        );

                        return shouldDelete == true;
                      }
                      return false;
                    },
                    onDismissed: (direction) async {
                      try {
                        await firestoreService.deleteCompany(company);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Company deleted successfully!')),
                        );
                        // Remove the company from the list
                        companyController.filteredCompanies.removeAt(index);
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error deleting company: $error')),
                        );
                      }
                    },
                    child: ListTile(
                      title: Text(company.Cname),
                      subtitle: Text(company.Uname),
                      onTap: () {
                        // Navigate to CompanyDetailPage when a company is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompanyDetailPage(
                              company: company,
                              language: widget.language,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }),
          ),
          //++++++++
          // Expanded(
          //   child: Obx(() {
          //     // Check if there are no companies to display
          //     if (companyController.filteredCompanies.isEmpty) {
          //       return const Center(child: Text('No companies found'));
          //     }
          //
          //     // Build a ListView to display companies
          //     return ListView.builder(
          //       itemCount: companyController.filteredCompanies.length,
          //       itemBuilder: (context, index) {
          //         final company = companyController.filteredCompanies[index];
          //
          //         return ListTile(
          //           title: Text(company.Cname),
          //           subtitle: Text(company.Uname),
          //           onTap: () {
          //             // Navigate to CompanyDetailPage when a company is tapped
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => CompanyDetailPage(
          //                   company: company,
          //                   language: widget.language,
          //                 ),
          //               ),
          //             );
          //           },
          //           trailing: IconButton(
          //             icon: Icon(Icons.delete, color: Colors.red),
          //             onPressed: () async {
          //               // Show a confirmation dialog before deleting
          //               final shouldDelete = await showDialog<bool>(
          //                 context: context,
          //                 builder: (context) => AlertDialog(
          //                   title: Text('Confirm Delete'),
          //                   content: Text('Are you sure you want to delete this company?'),
          //                   actions: [
          //                     TextButton(
          //                       onPressed: () => Navigator.pop(context, false),
          //                       child: Text('Cancel'),
          //                     ),
          //                     TextButton(
          //                       onPressed: () => Navigator.pop(context, true),
          //                       child: Text('Delete'),
          //                     ),
          //                   ],
          //                 ),
          //               );
          //
          //               // If the user confirms deletion, proceed with it
          //               if (shouldDelete == true) {
          //                 try {
          //                   await firestoreService.deleteCompany(company);
          //                   ScaffoldMessenger.of(context).showSnackBar(
          //                     SnackBar(content: Text('Company deleted successfully!')),
          //                   );
          //                   // Remove the company from the list
          //                   companyController.filteredCompanies.removeAt(index);
          //                 } catch (error) {
          //                   ScaffoldMessenger.of(context).showSnackBar(
          //                     SnackBar(content: Text('Error deleting company: $error')),
          //                   );
          //                 }
          //               }
          //             },
          //           ),
          //         );
          //       },
          //     );
          //   }),
          // ),
          //++++++++
          //_________
          // Expanded(
          //   child: Obx(() {
          //     if (companyController.filteredCompanies.isEmpty) {
          //       return const Center(child: Text('No companies found'));
          //     }
          //     return ListView.builder(
          //       itemCount: companyController.filteredCompanies.length,
          //       itemBuilder: (context, index) {
          //         final company = companyController.filteredCompanies[index];
          //         return ListTile(
          //           title: Text(company.Cname),
          //           subtitle: Text(company.Uname),
          //           onTap: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => CompanyDetailPage(
          //                   company: company,
          //                   language: widget.language,
          //                 ),
          //               ),
          //             );
          //           },
          //             trailing: IconButton(
          //               icon: Icon(Icons.delete, color: Colors.red),
          //               onPressed: () async {
          //                 // Show confirmation dialog
          //                 final shouldDelete = await showDialog<bool>(
          //                   context: context,
          //                   builder: (context) => AlertDialog(
          //                     title: Text('Confirm Delete'),
          //                     content: Text('Are you sure you want to delete this company?'),
          //                     actions: [
          //                       TextButton(
          //                         onPressed: () => Navigator.pop(context, false),
          //                         child: Text('Cancel'),
          //                       ),
          //                       TextButton(
          //                         onPressed: () => Navigator.pop(context, true),
          //                         child: Text('Delete'),
          //                       ),
          //                     ],
          //                   ),
          //                 );
          //
          //                 if (shouldDelete == true) {
          //                   // Start deletion process
          //                   try {
          //                     await firestoreService.deleteCompany(company);
          //                     ScaffoldMessenger.of(context).showSnackBar(
          //                       SnackBar(
          //                         content: Text('Company deleted successfully!'),
          //                         duration: Duration(seconds: 2),
          //                       ),
          //                     );
          //
          //                     // Remove the company from the list after deletion
          //                     companyController.filteredCompanies.removeAt(index);
          //                   } catch (error) {
          //                     ScaffoldMessenger.of(context).showSnackBar(
          //                       SnackBar(
          //                         content: Text('Error deleting company: $error'),
          //                         duration: Duration(seconds: 2),
          //                       ),
          //                     );
          //                   }
          //                 }
          //               },
          //             )
          //
          //         );
          //       },
          //     );
          //   }),
          // ),
          //_________
          // Expanded(
          //   child: Obx(() {
          //     // Use the length of filteredCompanies to determine the condition
          //     bool hasCompanies = companyController.filteredCompanies.isNotEmpty;
          //
          //     return hasCompanies
          //         ? ListView.builder(
          //       itemCount: companyController.filteredCompanies.length,
          //       itemBuilder: (context, index) {
          //         final company = companyController.filteredCompanies[index];
          //         return ListTile(
          //           title: Text(company.Cname),
          //           subtitle: Text(company.Uname),
          //           onTap: () {
          //             Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => CompanyDetailPage(
          //                   company: company,
          //                   language: widget.language,
          //                 ),
          //               ),
          //             );
          //           },
          //         );
          //       },
          //     )
          //         : Center(child: Text('No companies found'));
          //   }),
          // ),
          Padding(
            padding: const EdgeInsets.only(right: 33,bottom: 20),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: addNewCompanyText,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: Color(0xFF000000), // Text color
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height *0.010,
                ),
                Container(
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
                    color: Color(0xFFD9D9D9), // Background color
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () async {
                        final newCompany = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddNewReciprocatingPage(language: widget.language),
                          ),
                        );

                        if (newCompany != null) {
                          setState(() {
                            widget.companies.add(newCompany);
                            companyController.addCompany(newCompany);
                           // _filterCompanies(); // Refresh filtered list
                           // _searchController.clear(); // Clear search field
                          });
                        }
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
          )
        ],
      ),
    );
  }
}
//+++++++++================++++++++++++++
//+++++++++================++++++++++++++
//+++++++++================++++++++++++++

// class Company {
//   final String Cname;
//   final String Uname;
//   final List<String>? pdfPath; // Changed to List<String> to handle multiple paths
//
//   // Constructor with named parameters
//   Company({
//     required this.Cname,
//     required this.Uname,
//     this.pdfPath, // Made optional
//   });
//
//   // Convert a Company object into a map for Firestore
//   Map<String, dynamic> toMap() {
//     return {
//       'Cname': Cname,
//       'Uname': Uname,
//       'pdfPaths': pdfPath ?? [], // Convert to empty list if null
//     };
//   }
//
//   // Create a Company object from a Firestore document
//   factory Company.fromMap(Map<String, dynamic> map) {
//     return Company(
//       Cname: map['Cname'] ?? '',
//       Uname: map['Uname'] ?? '',
//       pdfPath: List<String>.from(map['pdfPath'] ?? []),
//     );
//   }
//
//   factory Company.fromFirestore(DocumentSnapshot doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     return Company(
//       Cname: data['Cname'] ?? '',
//       Uname: data['Uname'] ?? '',
//       pdfPath: List<String>.from(data['pdfPath'] ?? []),
//     );
//   }
// }

// class Company {
//   final String Cname;
//   final String Uname;
//   final String? pdfPath;
//
//   // Constructor with named parameters
//   Company({
//     required this.Cname,
//     required this.Uname,
//     required this.pdfPath,
//   });
//
//   // Convert a Company object into a map for Firestore
//   Map<String, dynamic> toMap() {
//     return {
//       'Cname': Cname,
//       'Uname': Uname,
//       'pdfPath': pdfPath,
//     };
//   }
//
//   // Create a Company object from a Firestore document
//   factory Company.fromMap(Map<String, dynamic> map) {
//     return Company(
//       Cname: map['Cname'] ?? '',
//       Uname: map['Uname'] ?? '',
//       pdfPath: map['pdfPath'] ?? '',
//     );
//   }
//
//   factory Company.fromFirestore(DocumentSnapshot doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     return Company(
//       Cname: data['Cname'] ?? '',
//       Uname: data['Uname'] ?? '',
//       pdfPath: data['pdfPath'] ?? '',
//     );
//   }
// }
// Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: TextFormField(
//     controller: _searchController,
//     decoration: InputDecoration(
//       hintText: searchHintText,
//       focusColor: Color(0xFFD9D9D9),
//       contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//       ),
//       fillColor: Color(0xFFD9D9D9),
//       filled: true,
//       prefixIcon: Icon(Icons.search, size: 28, color: Color(0xFF003123)),
//       suffixIcon: Icon(Icons.arrow_drop_down, size: 34, color: Color(0xFF003123)),
//     ),
//   ),
// ),
// Expanded(
//   child: ListView.builder(
//     itemCount: _filteredCompanies.length,
//     itemBuilder: (context, index) {
//       final company = _filteredCompanies[index];
//       return ListTile(
//         title: Text(company.Cname),
//         subtitle: Text(company.Uname),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => CompanyDetailPage(company: company,language: widget.language,),
//             ),
//           );
//         },
//       );
//     },
//   ),
// ),

class CompanyDetailPage extends StatelessWidget {
  final Company company;
  final String language; // The selected language
  // final FirestoreServi firestoreService = FirestoreServi();
  // final RxBool isDeleting = false.obs; // Observable to track delete state

  CompanyDetailPage({
    super.key,
    required this.company,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;

    // Translated texts
    String companyNameText = TranslationHelper.translate(language, 'companyNameHintText');
    String userNameText = TranslationHelper.translate(language, 'userNameHintText');
    String pdfButtonText = TranslationHelper.translate(language, 'pdfText');
    String backText = TranslationHelper.translate(language, 'back');

    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Color(0xFFFFFFFF),
        ),
        title: Text(
          company.Cname,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF003123),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.03),
            Text(
              companyNameText, // Translated "Company Name" label
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF000000),
              ),
            ),
            Text(
              company.Cname,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF000000),
              ),
            ),
            SizedBox(height: height * 0.02),
            Text(
              userNameText, // Translated "User Name" label
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Color(0xFF000000),
              ),
            ),
            Text(
              company.Uname,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xFF000000),
              ),
            ),
            SizedBox(height: height * 0.02),
            SizedBox(height: height * 0.02),
            if (company.pdfPath!.isNotEmpty) // Check for null and non-empty string
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFViewerPage(
                        company: company,
                        paths: company.pdfPath!,
                        initialIndex: 0,
                        // Optionally include other parameters if needed
                      ),
                    ),
                  );
                },
                child: Text(pdfButtonText), // Translated "PDF" button text
              ),

            // if (company.pdfPath.isNotEmpty)
            //   ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => PDFViewerPage(paths: [company.pdfPath.toString()]),
            //         ),
            //       );
            //     },
            //     child: Text(pdfButtonText), // Translated "PDF" button text
            //   ),
            // Center(
            //   child: company.pdfPath.isNotEmpty
            //       ? ElevatedButton(
            //     onPressed: () {
            //       try {
            //         // Pass a list of PDF paths (modify according to your needs)
            //         List<String> pdfPaths = [
            //           company.pdfPath, // Assuming pdfPath is a single path
            //          // "path_to_another_pdf", // Add more PDF paths here
            //         ];
            //
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => PDFViewerPagea(paths: pdfPaths), // Pass the list of paths
            //           ),
            //         );
            //       } catch (e) {
            //         print('Error loading PDF: $e');
            //         ScaffoldMessenger.of(context).showSnackBar(
            //           SnackBar(content: Text('Error loading PDF: $e')),
            //         );
            //       }
            //     },
            //     child: Text('View PDFs'),
            //   )
            //       : Container(), // Handle empty case
            // )

          ],
        ),
      ),
    );
  }
}

class FirestoreServiceq {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Method to delete a company and remove associated PDF
  Future<void> deleteCompany(Company company) async {
    try {
      // Delete the company document from Firestore
      await _db.collection('companies').doc(company.Cname).delete();

      // Check if the company has an associated PDF path
      if (company.pdfPath != null && company.pdfPath!.isNotEmpty) {
        String pdfPath = company.pdfPath!.toString();

        // Ensure the PDF path is a valid Firebase Storage URL
        if (pdfPath.startsWith('gs://') || pdfPath.startsWith('https://')) {
          // Create a reference to the PDF file in Firebase Storage
          Reference pdfRef = _storage.refFromURL(pdfPath);

          // Delete the file from Firebase Storage
          await pdfRef.delete();
          print('PDF file deleted successfully');
        } else {
          // Handle local file deletion if the path is local (doesn't start with gs:// or https://)
          File localFile = File(pdfPath);
          if (await localFile.exists()) {
            await localFile.delete();
            print('Local file deleted successfully');
          } else {
            print('Local file does not exist at path: $pdfPath');
          }
        }
      }

      print('Company and associated data deleted successfully');
    } catch (e) {
      print('Error deleting company: $e');
      throw e; // Re-throw for handling in the UI
    }
  }

  // Method to upload a file to Firebase Storage and return its download URL
  Future<String> uploadPdfFile(String localPath, String fileName) async {
    try {
      File file = File(localPath);
      Reference storageRef = _storage.ref().child('pdfs/$fileName');

      // Upload the file
      UploadTask uploadTask = storageRef.putFile(file);
      TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);

      // Get the download URL of the uploaded PDF
      String downloadUrl = await snapshot.ref.getDownloadURL();

      // Update Firestore with the new file name
      await _db.collection('companies').doc(fileName).update({
        'pdfPath': downloadUrl,
      });

      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload PDF: $e');
    }
  }
}

// class FirestoreServiceq {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;
//
//   // Method to delete a company and remove associated PDF
//   Future<void> deleteCompany(Company company) async {
//     try {
//       // Delete the company document from Firestore
//       await _db.collection('companies').doc(company.Cname).delete();
//
//       // Check if the company has an associated PDF path
//       if (company.pdfPath != null && company.pdfPath!.isNotEmpty) {
//         String pdfPath = company.pdfPath!.toString();
//
//         // Ensure the PDF path is a valid Firebase Storage URL
//         if (pdfPath.startsWith('gs://') || pdfPath.startsWith('https://')) {
//           // Create a reference to the PDF file in Firebase Storage
//           Reference pdfRef = _storage.refFromURL(pdfPath);
//
//           // Delete the file from Firebase Storage
//           await pdfRef.delete();
//           print('PDF file deleted successfully');
//         } else {
//           // Handle local file deletion if the path is local (doesn't start with gs:// or https://)
//           File localFile = File(pdfPath);
//           if (await localFile.exists()) {
//             await localFile.delete();
//             print('Local file deleted successfully');
//           } else {
//             print('Local file does not exist at path: $pdfPath');
//           }
//         }
//       }
//
//       print('Company and associated data deleted successfully');
//     } catch (e) {
//       print('Error deleting company: $e');
//       throw e; // Re-throw for handling in the UI
//     }
//   }
//
//   // Method to upload a file to Firebase Storage and return its download URL
//   Future<String> uploadPdfFile(String localPath, String fileName) async {
//     try {
//       File file = File(localPath);
//       Reference storageRef = _storage.ref().child('pdfs/$fileName');
//
//       // Upload the file
//       UploadTask uploadTask = storageRef.putFile(file);
//       TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
//
//       // Get the download URL of the uploaded PDF
//       String downloadUrl = await snapshot.ref.getDownloadURL();
//       return downloadUrl;
//     } catch (e) {
//       throw Exception('Failed to upload PDF: $e');
//     }
//   }
// }

class FirestoreServi {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Method to delete company by ID and remove its PDF from Firebase Storage
  Future<void> deleteCompany(Company company) async {
    try {
      // Delete the company document from Firestore
      await _db.collection('companies').doc(company.Cname).delete();

      // If the company has a PDF, check if the URL is valid and delete the file from Firebase Storage
      if (company.pdfPath != null && company.pdfPath!.isNotEmpty) {
        String pdfPath = company.pdfPath!.toString();

        // Ensure the URL starts with 'gs://' or 'https://'
        if (pdfPath.startsWith('gs://') || pdfPath.startsWith('https://')) {
          Reference pdfRef = _storage.refFromURL(pdfPath);
          await pdfRef.delete();
        } else {
          throw Exception("Invalid PDF URL: $pdfPath");
        }
      }

      print('Company and associated files deleted successfully');
    } catch (e) {
      print('Error deleting company: $e');
      throw e; // Re-throw the error to handle it in the UI
    }
  }

  // Upload a file to Firebase Storage and get the download URL
  Future<String> uploadPdfFile(String localPath, String fileName) async {
    try {
      File file = File(localPath);
      Reference storageRef = FirebaseStorage.instance.ref().child('pdfs/$fileName');

      // Upload the file to Firebase Storage
      UploadTask uploadTask = storageRef.putFile(file);
      TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);

      // Get the downloadable URL of the uploaded PDF
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload PDF: $e');
    }
  }
}

//===================
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class ReciprocatingPage extends StatefulWidget {
//   const ReciprocatingPage({super.key});
//
//   @override
//   State<ReciprocatingPage> createState() => _ReciprocatingPageState();
// }
//
// class _ReciprocatingPageState extends State<ReciprocatingPage> {
//   final List<Company> _companies = [
//     Company("Default Company", "Default User") // Initial default company
//   ];
//   final TextEditingController _controller = TextEditingController();
//
//   void _addCompany() {
//     final String companyName = _controller.text;
//     if (companyName.isNotEmpty) {
//       setState(() {
//         _companies.add(Company(companyName, companyName));
//         _controller.clear(); // Clear the text field
//       });
//     }
//   }
//
//   void _navigateToAddNewPage() async {
//     final result = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => AddNewReciprocatingPage(),
//       ),
//     );
//
//     if (result != null && result is List<Company>) {
//       setState(() {
//         _companies.addAll(result);
//       });
//     }
//   }
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
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           SizedBox(height: height * 0.030),
//           Container(
//             height: 65,
//             child: AppBar(
//               leading: IconButton(
//                 icon: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
//                 onPressed: () {
//                   Navigator.pop(context); // Navigate back to the previous screen
//                 },
//               ),
//               title: Text(
//                 "RECIPROCATING AIR COMPRESSOR",
//                 style: GoogleFonts.inter(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 18,
//                   color: Colors.white, // Text color for the AppBar title
//                 ),
//               ),
//               backgroundColor: Color(0xFF003123), // Background color for the AppBar
//               toolbarHeight: 28,
//             ),
//           ),
//           SizedBox(height: height * 0.015),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 focusColor: Color(0xFFD9D9D9),
//                 contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                 ),
//                 fillColor: Color(0xFFD9D9D9),
//                 filled: true,
//                 prefixIcon: Icon(Icons.search, size: 28, color: Color(0xFF003123)),
//                 suffixIcon: Icon(Icons.arrow_drop_down, size: 34, color: Color(0xFF003123)),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _companies.length,
//               itemBuilder: (context, index) {
//                 final company = _companies[index];
//                 return ListTile(
//                   title: Text(company.Cname),
//                   leading: Text(company.Uname),
//                   onTap: () {
//                     // Navigate to the detail page and pass the selected company
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CompanyDetailPage(company: company),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 33, bottom: 20),
//             child: Column(
//               children: [
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: "To add a",
//                         style: GoogleFonts.inter(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 10,
//                           color: Color(0xFF000000), // Text color
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: " new company",
//                         style: GoogleFonts.inter(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 10,
//                           color: Color(0xFF000000), // Text color
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: height * 0.010,
//                 ),
//                 Container(
//                   height: 50,
//                   width: 50,
//                   decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5), // Shadow color with opacity
//                         spreadRadius: 2, // How much the shadow spreads
//                         blurRadius: 5, // How blurry the shadow is
//                         offset: Offset(0, 3), // Position of the shadow (x, y)
//                       ),
//                     ],
//                     color: Color(0xFFD9D9D9), // Background color
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   child: Center(
//                     child: IconButton(
//                       onPressed: _navigateToAddNewPage, // Call the function to navigate
//                       icon: Icon(
//                         Icons.add,
//                         size: 22,
//                         color: Color(0xFF000000), // Icon color
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
//
// class Company {
//   final String Cname;
//   final String Uname;
//
//   Company(this.Cname, this.Uname);
// }
//"""""""""""""""==========================""""""""""""""""""""""
// class CompanyDetailPage extends StatelessWidget {
//   final Company company;
//
//   const CompanyDetailPage({super.key, required this.company});
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     double height = size.height;
//
//     return Scaffold(
//       backgroundColor: Color(0xFFFFFFFF),
//       appBar: AppBar(leading: BackButton(onPressed: () {
//       },color: Color(0xFFFFFFFF)),
//         title: Text(
//           company.Cname,
//           style: GoogleFonts.inter(
//             fontWeight: FontWeight.w700,
//             fontSize: 18,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Color(0xFF003123),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: height * 0.03),
//             Text(
//               'Company Name:',
//               style: GoogleFonts.inter(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 16,
//                 color: Color(0xFF000000),
//               ),
//             ),
//             Text(
//               company.Cname,
//               style: GoogleFonts.inter(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 16,
//                 color: Color(0xFF000000),
//               ),
//             ),
//             SizedBox(height: height * 0.02),
//             Text(
//               'User Name:',
//               style: GoogleFonts.inter(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 16,
//                 color: Color(0xFF000000),
//               ),
//             ),
//             Text(
//               company.Uname,
//               style: GoogleFonts.inter(
//                 fontWeight: FontWeight.w400,
//                 fontSize: 16,
//                 color: Color(0xFF000000),
//               ),
//             ),
//             SizedBox(height: height * 0.02),
//             if (company.pdfPath.isNotEmpty)
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => PDFViewerPage(path: company.pdfPath),
//                     ),
//                   );
//                 },
//                 child: Text('View PDF'),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//