import 'features/features.dart';
import 'features/pkg.dart';
final firstLaunchProvider = StateProvider<bool>((ref) => true);
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
   SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async{
    // Check if this is the first launch
  final prefs = await SharedPreferences.getInstance();
  final isFirstLaunch = prefs.getBool('is_first_launch') ?? true;
    runApp(ProviderScope(
       overrides: [
        firstLaunchProvider.overrideWith((ref) => isFirstLaunch),
      ],
      child: const WeatherPlusApp()));
  });
}

class WeatherPlusApp extends ConsumerWidget {
  const WeatherPlusApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final isFirstLaunch = ref.watch(firstLaunchProvider);
    return MaterialApp(
      title: 'Weather Plus',
      home: isFirstLaunch 
          ? const OnboardingScreen() 
          : const HomeScreen(),
    );
  }
}

void setFirstLaunchComplete() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('is_first_launch', false);
}
