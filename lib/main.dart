import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/Model/luaguage.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Page/S-HomePage/Screwaircomp.dart';
import 'package:untitled1/Page/SplashScreen/Splash_mahavir.dart';
import 'package:untitled1/dashBoard.dart'; // Import this
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled1/firebase_options.dart';
import 'Model/Getx.dart';
import 'Page/R_HomePage/Addnewresiprocating.dart';
import 'Page/R_HomePage/Reciprocating.dart';
import 'Page/R_HomePage/r-homepage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  Get.put(CompanyControllersR());
  Get.put(CompanyControllersS());// Register your controller
 // WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final languageChange = Provider.of<LanguageChange>(context);
  //  final CompanyController companyController = Get.find();

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // localizationsDelegates: [
        //  // AppLocalizations.delegate, // Your custom delegate
        //  // GlobalMaterialLocalizations.delegate,
        //   //GlobalWidgetsLocalizations.delegate,
        //   // GlobalCupertinoLocalizations.delegate,
        // ],
        locale: Locale('en'),
        supportedLocales: [
          Locale('en'),
          Locale('gu'),
        ],
        home: SplashMahavir(),
      );
  }
}
//
// class AppLocalizations {
//   static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
//
//   static AppLocalizations of(BuildContext context) {
//     return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
//   }
//
//   String get name {
//     return Intl.message(
//       'Language',
//       name: 'name',
//       desc: 'Label for language',
//     );
//   }
//
//   String get addNewText => 'Add New Item';
//
// //  String get name => Intl.message('english', name: 'અંગ્રેજી');
//
// }
//
// class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
//   const _AppLocalizationsDelegate();
//
//   @override
//   bool isSupported(Locale locale) => ['en', 'gu'].contains(locale.languageCode);
//
//   @override
//   Future<AppLocalizations> load(Locale locale) {
//     Intl.defaultLocale = locale.toString();
//     return SynchronousFuture<AppLocalizations>(AppLocalizations());
//   }
//
//   @override
//   bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
// }

//
// class AppLocalizations {
//   static const LocalizationsDelegate<AppLocalizations> delegate =
//       _AppLocalizationsDelegate();
//
//   // Use these methods to provide translations.
//   static AppLocalizations of(BuildContext context) {
//     return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
//   }
//
//   // Sample method for localized text
//   String get lunguage {
//     switch (Intl.getCurrentLocale()) {
//       case 'gu':
//         return 'લિંગુઅજ';
//       case 'hi':
//         return 'भाषा';
//       default:
//         return 'Language';
//     }
//   }
//
//   String get newinquiry {
//     switch (Intl.getCurrentLocale()) {
//       case 'gu':
//         return 'નવી પૂછપરછ';
//       case 'hi':
//         return 'नई पूछताछ';
//       default:
//         return 'New Inquiry';
//     }
//   }
// }
//
// class _AppLocalizationsDelegate
//     extends LocalizationsDelegate<AppLocalizations> {
//   const _AppLocalizationsDelegate();
//
//   @override
//   bool isSupported(Locale locale) =>
//       ['en', 'gu', 'hi'].contains(locale.languageCode);
//
//   @override
//   Future<AppLocalizations> load(Locale locale) {
//     Intl.defaultLocale = locale.toString(); // Set the default locale
//     return SynchronousFuture<AppLocalizations>(AppLocalizations());
//   }
//
//   @override
//   bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
// }

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'GeeksforGeeks Localization',
//       localizationsDelegates: [
//         AppLocalizations.delegate,
//         GlobalMaterialLocalizations.delegate,
//         GlobalWidgetsLocalizations.delegate,
//         GlobalCupertinoLocalizations.delegate,
//       ],
//       supportedLocales: [
//         Locale('en', ''), // English
//         Locale('es', ''), // Spanish
//         Locale('gu', ''), // Gujarati
//       ],
//       home: HomeScreens(),
//     );
//   }
// }
// class AppLocalizations {
//   static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
//
//   static AppLocalizations of(BuildContext context) {
//     return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
//   }
//
//   String get appTitle => Intl.message('GeeksforGeeks Localization', name: 'appTitle');
//   String get welcomeMessage => Intl.message('Welcome to GeeksforGeeks!', name: 'welcomeMessage');
//   String get languageSelection => Intl.message('Select a language:', name: 'languageSelection');
//   String get englishOption => Intl.message('English', name: 'englishOption');
//   String get spanishOption => Intl.message('Spanish', name: 'spanishOption');
//   String get gujaratiOption => Intl.message('ગુજરાતી', name: 'gujaratiOption');
// }
//
// class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
//   const _AppLocalizationsDelegate();
//
//   @override
//   bool isSupported(Locale locale) => ['en', 'es', 'gu'].contains(locale.languageCode);
//
//   @override
//   Future<AppLocalizations> load(Locale locale) {
//     Intl.defaultLocale = locale.toString();
//     return SynchronousFuture<AppLocalizations>(AppLocalizations());
//   }
//
//   @override
//   bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
// }


