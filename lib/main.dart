import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutteretc/home/HomeScreen.dart';

const Color primary = Color(0xffe30084);
const Color netural3 = Color(0xff66707a);
const Color netural4 = Color(0xff525960);
const Color netural6 = Color(0xff181a1b);

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    ProviderScope(
      child: MobileManagerApp(),
    ),
  );
}

class MobileManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyScrollBehavior(), // 👈 이 줄 추가
      home: SflashLoadPage(),
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: netural6,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 16,
            color: netural3,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Pretendard',
            fontSize: 14,
            color: netural4,
            fontWeight: FontWeight.w700,
          ),
        ),
        useMaterial3: true,
      ),
    );
  }
}

class SflashLoadPage extends StatefulWidget {
  const SflashLoadPage({super.key});

  @override
  _SflashLoadPageState createState() => _SflashLoadPageState();
}

class _SflashLoadPageState extends State<SflashLoadPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 0)).then((value) => {
          FlutterNativeSplash.remove(),
        });
  }

  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
      };
}
