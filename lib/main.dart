import 'package:SMS/models/messages.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './screens/message_detail_screen.dart';
import 'package:flutter/material.dart';
import './screens/message_list.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white30,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white30,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Messages(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: createMaterialColor(
            Color(0xFFFFFFFF),
          ),
          accentColor: Colors.blue[700],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MessageList(),
        routes: {
          MessageDetailScreen.routeName: (ctx) => MessageDetailScreen(),
        },
      ),
    );
  }
}
