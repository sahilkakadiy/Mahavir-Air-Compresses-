// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_svg/svg.dart';
// // //
// // // class SplashMahavir extends StatefulWidget {
// // //   const SplashMahavir({super.key});
// // //
// // //   @override
// // //   State<SplashMahavir> createState() => _SplashMahavirState();
// // // }
// // //
// // // class _SplashMahavirState extends State<SplashMahavir> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Stack(
// // //         children: [
// // //           Expanded(
// // //               flex: 2,
// // //               child: SvgPicture.asset('image/splash_blackground.svg')),
// // //           Center(
// // //               child: SvgPicture.asset('image/Logo_Mahavir.svg'),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:flutter_svg/flutter_svg.dart';
// //
// // class SplashMahavir extends StatefulWidget {
// //   const SplashMahavir({super.key});
// //
// //   @override
// //   State<SplashMahavir> createState() => _SplashMahavirState();
// // }
// //
// // class _SplashMahavirState extends State<SplashMahavir> with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;
// //   late Animation<double> _opacityAnimation;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     // Initialize the AnimationController
// //     _controller = AnimationController(
// //       duration: const Duration(seconds: 3), // Animation duration
// //       vsync: this,
// //     )..repeat(reverse: true); // Repeat the animation
// //
// //     // Define the opacity animation
// //     _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
// //       CurvedAnimation(
// //         parent: _controller,
// //         curve: Curves.easeInOut,
// //       ),
// //     );
// //   }
// //
// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title:Text( "SVG IMAGE")
// //       ),
// //       body:Stack(
// //         fit: StackFit.expand,
// //         children: [
// //           Image.asset(
// //             'assets/image/BG_Mahavir.png',
// //             fit: BoxFit.cover,
// //           ),
// //           Center(
// //             child: FadeTransition(
// //               opacity: _opacityAnimation,
// //               child: Image.asset(
// //                 'assets/image/Logo.png',
// //               ),
// //             ),
// //           ),
// //         ],
// //       )
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import '../R_HomePage/r-homepage.dart';
//
// class SplashMahavir extends StatefulWidget {
//   const SplashMahavir({super.key});
//
//   @override
//   State<SplashMahavir> createState() => _SplashMahavirState();
// }
//
// class _SplashMahavirState extends State<SplashMahavir> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _opacityAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Initialize the AnimationController
//     _controller = AnimationController(
//       duration: const Duration(seconds: 3), // Animation duration
//       vsync: this,
//     )..repeat(reverse: true); // Repeat the animation
//
//     // Define the opacity animation
//     _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: Curves.ease,
//       ),
//     );
//
//     // Navigate to the next page after a delay
//     Future.delayed(const Duration(seconds: 5), () {
//       // Replace 'Home()' with the actual widget you want to navigate to
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Home()), // Make sure 'Home' is imported and defined
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Get the screen size based on the orientation
//     Size size = MediaQuery.of(context).size;
//
// // Get height and width based on the orientation
//     double height = size.height;
//     double width = size.width;
//
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.asset(
//             'assets/image/BG_Mahavir.png', // Use AssetImage for local assets
//             fit: BoxFit.fill,
//           ),
//           Positioned(
//             top: height * 0.23,
//             left: width * 0.1,
//             right: width * 0.1,
//             child: Center(
//               child: FadeTransition(
//                 opacity: _opacityAnimation,
//                 child: Image.asset(
//                   'assets/image/Logo.png', // Use AssetImage for local assets
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import '../R_HomePage/r-homepage.dart'; // Ensure the HomePage is correctly imported

class SplashMahavir extends StatefulWidget {
  const SplashMahavir({super.key});

  @override
  State<SplashMahavir> createState() => _SplashMahavirState();
}

class _SplashMahavirState extends State<SplashMahavir> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Animation duration
      vsync: this,
    )..repeat(reverse: true); // Repeat the animation

    // Define the opacity animation
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Navigate to the next page after a delay
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()), // Make sure Home is the next page
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size based on the orientation
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/image/BG_Mahavir.png',
            fit: BoxFit.cover,
          ),
          // Centered animated logo
          Positioned(
            top: size.height * 0.28,
            left: size.width * 0.1,
            right: size.width * 0.1,
            child: Center(
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: Image.asset(
                  height: 200,
                  width: 240,
                  'assets/image/Logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// rules_version = '2';
//
// service firebase.storage {
//   match /b/{bucket}/o {
//     match /{allPaths=**} {
//       allow read, write: if true; // Allows anyone to read and write
//     }
//   }
// }