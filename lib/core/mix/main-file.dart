// // lib/main.dart
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'screens/onboarding_screen.dart';
// import 'screens/home_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// // Provider to track if this is the first launch
// final firstLaunchProvider = StateProvider<bool>((ref) => true);

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
  
//   // Set preferred orientations
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
  
//   // Set system UI overlay style
//   SystemChrome.setSystemUIOverlayStyle(
//     const SystemUiOverlayStyle(
//       statusBarColor: Colors.transparent,
//       statusBarIconBrightness: Brightness.light,
//     ),
//   );
  
//   // Check if this is the first launch
//   final prefs = await SharedPreferences.getInstance();
//   final isFirstLaunch = prefs.getBool('is_first_launch') ?? true;
  
//   runApp(
//     ProviderScope(
//       overrides: [
//         firstLaunchProvider.overrideWith((ref) => isFirstLaunch),
//       ],
//       child: const WeatherApp(),
//     ),
//   );
// }

// class WeatherApp extends ConsumerWidget {
//   const WeatherApp({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isFirstLaunch = ref.watch(firstLaunchProvider);
    
//     return MaterialApp(
//       title: 'Weather App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         textTheme: GoogleFonts.poppinsTextTheme(),
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSwatch().copyWith(
//           primary: Colors.blue.shade700,
//           secondary: Colors.orange,
//         ),
//       ),
//       home: isFirstLaunch 
//           ? const OnboardingScreen() 
//           : const HomeScreen(),
//       onGenerateRoute: (settings) {
//         // Handle deep links or route generation here
//         return null;
//       },
//     );
//   }
// }

// // Save first launch preference after onboarding