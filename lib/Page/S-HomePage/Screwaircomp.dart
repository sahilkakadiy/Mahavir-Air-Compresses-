import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/Getx.dart';
import '../../Model/Model.dart';
import '../../Model/luaguage.dart';
import '../R_HomePage/New InQuiry.dart';
import '../R_HomePage/Reciprocating.dart';
import 'Addnewscrewair.dart';
//
// class screwaitcomppage extends StatefulWidget {
//   final List<Company> companies;
//   final String language; // Language parameter to manage translations
//   const screwaitcomppage({super.key, required this.companies, required this.language});
//
//   @override
//   State<screwaitcomppage> createState() => _screwaitcomppageState();
// }
//
// class _screwaitcomppageState extends State<screwaitcomppage> {
//   late List<Company> _filteredCompanies;
//   final TextEditingController _searchController = TextEditingController();
//
//   late String titleText;
//   late String searchHintText;
//   late String addNewCompanyText;
//   late String addNewCompanyContinuedText;
//
//   @override
//   void initState() {
//     super.initState();
//     _filteredCompanies = List.from(widget.companies);
//     _searchController.addListener(_filterCompanies);
//
//     // Initialize the translated texts
//     titleText = TranslationHelper.translate(widget.language, 'titleText');
//     searchHintText = TranslationHelper.translate(widget.language, 'searchHintText');
//     addNewCompanyText = TranslationHelper.translate(widget.language, 'addNewCompanyText');
//     addNewCompanyContinuedText = TranslationHelper.translate(widget.language, 'addNewCompanyContinuedText');
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _filteredCompanies = List.from(widget.companies);
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
//     Size size = MediaQuery.of(context).size;
//     double height = size.height;
//     double width = size.width;
//     return Scaffold(
//       backgroundColor: Color(0xFFFFFFFF),
//       body: Column(crossAxisAlignment: CrossAxisAlignment.end,
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
//                 _translate('title'),
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
//               controller: _searchController,
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
//                 hintText: _translate('searchHint'), // Search hint based on language
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
//                   onTap: () {
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
//                         text: _translate('addNewCompanyInstruction'),
//                         style: GoogleFonts.inter(
//                           fontWeight: FontWeight.w400,
//                           fontSize: 10,
//                           color: Color(0xFF000000),
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
//                             builder: (context) => addnewscrewai(),
//                           ),
//                         );
//
//                         if (newCompany != null) {
//                           setState(() {
//                             widget.companies.add(newCompany);
//                             _filterCompanies();
//                             _searchController.clear();
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


class screwaitcomppage extends StatefulWidget {
  final List<Company> companies;
  final String language; // Language parameter to manage translations

  const screwaitcomppage({super.key, required this.companies, required this.language});

  @override
  State<screwaitcomppage> createState() => _screwaitcomppageState();
}

class _screwaitcomppageState extends State<screwaitcomppage> {
  late List<Company> _filteredCompanies;
  late CompanyControllersS companyControllers;
  final TextEditingController _searchController = TextEditingController();

  late String titleText;
  late String searchHintText;
  late String addNewCompanyText;
  late String addNewCompanyContinuedText;

  @override
  void initState() {
    super.initState();
    _filteredCompanies = List.from(widget.companies);
   // _searchController.addListener(_filterCompanies);


    companyControllers = Get.find<CompanyControllersS>();
    _searchController.addListener(() {
      companyControllers.updateSearchQuery(_searchController.text); // Update search query
    });
    // Initialize the translated texts
    titleText = TranslationHelper.translate(widget.language, 'titleText');
    searchHintText = TranslationHelper.translate(widget.language, 'searchHintText');
    addNewCompanyText = TranslationHelper.translate(widget.language, 'addNewCompanyText');
    addNewCompanyContinuedText = TranslationHelper.translate(widget.language, 'addNewCompanyContinuedText');
  }

  // void _filterCompanies() {
  //   setState(() {
  //     _filteredCompanies = widget.companies
  //         .where((company) =>
  //         company.Cname.toLowerCase().contains(_searchController.text.toLowerCase()))
  //         .toList();
  //   });
  // }
  //
  // String _translate(String key) {
  //   return TranslationHelper.translate(widget.language, key);
  // }
  final firestoreService = FirestoreServiceq();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    _searchController.addListener(() {
      companyControllers.searchQuery(_searchController.text);
    });
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: height * 0.030),
          Container(
            height: 65,
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => newinquirypage(language: widget.language,),)); // Navigate back to the previous screen
                },
              ),
              title: Text(
                titleText,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.text,
              onChanged: (value) {
                companyControllers.updateSearchQuery(value);
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
          // Expanded(
          //   child: Obx(() {
          //     if (companyControllers.filteredCompanies.isEmpty) {
          //       return const Center(child: Text('No companies found'));
          //     }
          //     return ListView.builder(
          //       itemCount: companyControllers.filteredCompanies.length,
          //       itemBuilder: (context, index) {
          //         final company = companyControllers.filteredCompanies[index];
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
          //     );
          //   }),
          // ),
          Expanded(
            child: Obx(() {
              // Check if there are no companies to display
              if (companyControllers.filteredCompanies.isEmpty) {
                return const Center(child: Text('No companies found'));
              }

              // Build a ListView to display companies
              return ListView.builder(
                itemCount: companyControllers.filteredCompanies.length,
                itemBuilder: (context, index) {
                  final company = companyControllers.filteredCompanies[index];

                  return Dismissible(
                    key: ValueKey(company.Cname), // Ensure each item has a unique key
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: Colors.red,
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
                        companyControllers.filteredCompanies.removeAt(index);
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

          Padding(
            padding: const EdgeInsets.only(right: 33, bottom: 20),
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
                          color: Color(0xFF000000),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.010,
                ),
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
                      onPressed: () async {
                        final newCompany = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => addnewscrewairpage(language: widget.language,), // Ensure this class exists
                          ),
                        );
                        if (newCompany != null) {
                          setState(() {
                            widget.companies.add(newCompany);
                            companyControllers.addCompany(newCompany);
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
          ),
        ],
      ),
    );
  }
}


