import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/main.dart';
import 'package:flutter/material.dart';

import '../Page/R_HomePage/Reciprocating.dart';
//
// match /{document=**} {
// allow read, write: if true;
// }
class TranslationHelper {
  static const Map<String, Map<String, String>> _translations = {
    'English': {
      'newInquiry': 'New Inquiry',
      'doneInquiry': 'Done Inquiry',
      'language': 'Language',
      'addNew': 'Add New Reciprocating',
      'reciprocatingText': 'RECIPROCATING AIR COMPRESSOR',
      'screwText': 'SCREW AIR COMPRESSOR',
      'addNewText': 'Add new RECIPROCATING AIR COMPRESSOR',
      'companyNameHintText': 'Company Name',
      'userNameHintText': 'User Name',
      'pdfHintText': 'Quotation PDF',
      'addText': 'ADD',
      'pdfText': 'PDF',
      'titleText': 'RECIPROCATING AIR COMPRESSOR',
      'searchHintText': 'Search Company',
      'addNewCompanyText': 'To add a',
      'addNewCompanyContinuedText': 'new company',
      'back': 'Back',
    },
    'Gujarati': {
      'newInquiry': 'નવું પૂછપરછ',
      'doneInquiry': 'પૂર્ણ પૂછપરછ',
      'language': 'ભાષા',
      'addNew': 'નવું ઉમેરવું',
      'reciprocatingText': 'રીસિપ્રોકેટિંગ એર કોમ્પ્રેસર',
      'screwText': 'સ્ક્રુ એર કોમ્પ્રેસર',
      'addNewText': 'નવી રીસિપ્રોકેટિંગ એર કમપ્રેસર ઉમેરો',
      'companyNameHintText': 'કંપનીનું નામ',
      'userNameHintText': 'ઉપરણું નામ',
      'pdfHintText': 'કોણીશન PDF',
      'addText': 'ઉમેરો',
      'pdfText': 'PDF',
      'titleText': 'રેસીપ્રોકેટિંગ એર કમપ્રેસર',
      'searchHintText': 'કંપની શોધો',
      'addNewCompanyText': 'નવી કંપની ઉમેરવા માટે',
      'addNewCompanyContinuedText': 'નવી કંપની',
      'back': 'પાછળ',
    },
  };

  static String translate(String language, String key) {
    return _translations[language]?[key] ?? key;
  }
}

// import 'path_to_app_localizations.dart'; // Import your AppLocalizations

//
// class LanguageChange with ChangeNotifier {
//   Locale? _appLocale;
//   Locale? get appLocale => _appLocale;
//
//   LanguageChange() {
//     _loadLocale();
//   }
//
//   void _loadLocale() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     String? languageCode = preferences.getString('language_code') ?? 'en';
//     _appLocale = Locale(languageCode);
//     notifyListeners();
//   }
//
//   void changeLanguage(Locale locale) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     await preferences.setString('language_code', locale.languageCode);
//     _appLocale = locale;
//     notifyListeners();
//   }
// }

// class LaLanguageChange with ChangeNotifier{
//
//   Locale? _appLocal;
//   Locale? get appLocale => _appLocal;
//
//   void changeLanguage(Locale type) async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     _appLocal = type;
//
//     if(type == Locale('en')){
//       await sp.setString('language_code', 'en');
//     }else{
//       await sp.setString('language_code', 'gu');
//     }
//     notifyListeners();
//   }
// }

//
// class LaLanguageChange with ChangeNotifier {
//   Locale? _appLocale;
//
//   Locale? get appLocale => _appLocale;
//
//   Future<void> changeLanguage(Locale type) async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     _appLocale = type;
//
//     if (type == const Locale('en')) {
//       await sp.setString('language_code', 'en');
//     } else {
//       await sp.setString('language_code', 'gu');
//     }
//     notifyListeners();
//   }
//
//   Future<void> loadSavedLanguage() async {
//     SharedPreferences sp = await SharedPreferences.getInstance();
//     String? languageCode = sp.getString('language_code');
//
//     if (languageCode != null) {
//       _appLocale = Locale(languageCode);
//       notifyListeners();
//     }
//   }
// }


// class HomeScreens extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final localizations = AppLocalizations.of(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(localizations.appTitle),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               localizations.welcomeMessage,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             Text(
//               localizations.languageSelection,
//               style: TextStyle(fontSize: 18),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () => _changeLocale(context, Locale('en')),
//               child: Text(localizations.englishOption),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () => _changeLocale(context, Locale('es')),
//               child: Text(localizations.spanishOption),
//             ),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () => _changeLocale(context, Locale('gu')),
//               child: Text(localizations.gujaratiOption),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _changeLocale(BuildContext context, Locale newLocale) {
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(
//         builder: (BuildContext context) => Localizations.override(
//           context: context,
//           locale: newLocale,
//           child: HomeScreens(),  // Ensure the correct screen is being referenced
//         ),
//       ),
//     );
//   }
// }
//
// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});
//
//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }
//
// enum Language { english, gujarati }
//
// class _HomescreenState extends State<Homescreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("english"),
//         actions: [
//           Consumer<LaLanguageChange>(
//             builder: (context, languageChange, child) {
//               return PopupMenuButton<Language>(
//                 onSelected: (Language item) {
//                   switch (item) {
//                     case Language.english:
//                       languageChange.changeLanguage(Locale('en'));
//                       break;
//                     case Language.gujarati:
//                       languageChange.changeLanguage(Locale('gu'));
//                       break;
//                   }
//                 },
//                 itemBuilder: (context) => <PopupMenuEntry<Language>>[
//                const PopupMenuItem(
//                     value: Language.english,
//                     child: Text('English'),
//                   ),
//                   const PopupMenuItem(
//                     value: Language.gujarati,
//                     child: Text('Gujarati'),
//                   ),
//                 ],
//                 icon: const Icon(Icons.language),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Consumer<LaLanguageChange>(
//           builder: (context, languageChange, child) {
//             return Text(AppLocalizations.of(context).name);
//           },
//         ),
//       ),
//     );
//   }
// }
//



//
// class TextPageScreen extends StatelessWidget {
// final String title;
// final String content;
//
//   const TextPageScreen({Key? key, required this.title, required this.content}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Center(
//         child: Text(content),
//       ),
//     );
//   }
// }
//



//++++++++++++++++++++++++++++++++++++++++++

//
// class Homed extends StatefulWidget {
//   const Homed({Key? key}) : super(key: key);
//
//   @override
//   State<Homed> createState() => _HomedState();
// }
//
// class _HomedState extends State<Homed> {
//   String language = 'English'; // Default language
//   String newInquiryText = '';
//   String doneInquiryText = '';
//   String languageText = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _loadLanguage();
//   }
//
//   void _changeLanguage(String selectedLanguage) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString('language', selectedLanguage);
//     setState(() {
//       language = selectedLanguage;
//       _updateTextBasedOnLanguage();
//     });
//   }
//
//   void _updateTextBasedOnLanguage() {
//     newInquiryText = TranslationHelper.translate(language, 'newInquiry');
//     doneInquiryText = TranslationHelper.translate(language, 'doneInquiry');
//     languageText = TranslationHelper.translate(language, 'language');
//   }
//
//   void _loadLanguage() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       language = prefs.getString('language') ?? 'English'; // Default to English
//       _updateTextBasedOnLanguage();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 33, top: 20),
//             child: Align(
//               alignment: Alignment.centerRight,
//               child: GestureDetector(
//                 onTap: () {
//                   _showLanguageDialog();
//                 },
//                 child: Text(
//                   languageText,
//                   style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 14),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 150),
//           Center(
//             child: Image.asset('assets/image/Logo.png'),
//           ),
//           SizedBox(height: 60),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => NewquiryPage(language: language)),
//                   );
//                 },
//                 child: Text(newInquiryText),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => DonePage(language: language)),
//                   );
//                 },
//                 child: Text(doneInquiryText),
//               ),
//             ],
//           ),
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.only(right: 33, bottom: 20),
//             child: Align(
//               alignment: Alignment.centerRight,
//               child: IconButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => AddNewRePage(language: language)),
//                   );
//                 },
//                 icon: Icon(Icons.add),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
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
// }
//
//
// // NewquiryPage
// class NewquiryPage extends StatelessWidget {
//   final String language;
//
//   const NewquiryPage({Key? key, required this.language}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     String newInquiryText = TranslationHelper.translate(language, 'newInquiry');
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(newInquiryText),
//       ),
//       body: Center(
//         child: Text(newInquiryText),
//       ),
//     );
//   }
// }
//
// // DonePage
// class DonePage extends StatelessWidget {
//   final String language;
//
//   const DonePage({Key? key, required this.language}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     String doneInquiryText = TranslationHelper.translate(language, 'doneInquiry');
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(doneInquiryText),
//       ),
//       body: Center(
//         child: Text(doneInquiryText),
//       ),
//     );
//   }
// }
//
// // AddNewRePage
// class AddNewRePage extends StatelessWidget {
//   final String language;
//
//   const AddNewRePage({Key? key, required this.language}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     String aewInquiry = TranslationHelper.translate(language, 'newInquiry');
//     String doneInquiry = TranslationHelper.translate(language, 'doneInquiry');
//     String languages = TranslationHelper.translate(language, 'language');
//     String addNews = TranslationHelper.translate(language, 'addNew');
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(aewInquiry,overflow: TextOverflow.ellipsis,),
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: Text(doneInquiry),
//           ),
//           Center(
//             child: Text(languages),
//           ),
//           Center(
//             child: Text(addNews),
//           ),
//         ],
//       ),
//     );
//   }
//
// class AddNewReciprocatingController extends GetxController {
//   var companyName = ''.obs;
//   var userName = ''.obs;
//   var pdfPath = ''.obs;
//
//   void clearFields() {
//     companyName.value = '';
//     userName.value = '';
//     pdfPath.value = '';
//   }
//
//   bool areFieldsFilled() {
//     return companyName.isNotEmpty && userName.isNotEmpty && pdfPath.isNotEmpty;
//   }
//
//   void setPdfPath(String path) {
//     pdfPath.value = path;
//   }
// }

//
// class AddNewReciprocatingController extends GetxController {
//   var companyName = ''.obs;
//   var userName = ''.obs;
//   var pdfPath = ''.obs; // Add this line
//
//   bool areFieldsFilled() {
//     return companyName.isNotEmpty && userName.isNotEmpty && pdfPath.isNotEmpty; // Include pdfPath check
//   }
//
//   void clearFields() {
//     companyName.value = '';
//     userName.value = '';
//     pdfPath.value = ''; // Clear pdfPath as well
//   }
// }
//
//
// class AddNewReciprocatingController extends GetxController {
//   var companyName = ''.obs;
//   var userName = ''.obs;
//   var pdfPath = ''.obs;
//
//   bool get areFieldsFilled => companyName.value.isNotEmpty && userName.value.isNotEmpty && pdfPath.value.isNotEmpty;
//
//   void clearFields() {
//     companyName.value = '';
//     userName.value = '';
//     pdfPath.value = '';
//   }
//
//   var companies = <Company>[].obs;
//   var searchQuery = ''.obs;
//
//   // Filtered companies based on search query
//   List<Company> get filteredCompanies {
//     if (searchQuery.value.isEmpty) {
//       return companies;
//     } else {
//       return companies
//           .where((company) => company.Cname.toLowerCase().contains(searchQuery.value.toLowerCase()))
//           .toList();
//     }
//   }
//
//   void addCompany(Company company) {
//     companies.add(company);
//   }
// }
//

