import 'package:contact_diary/controller/providers/providers.dart';
import 'package:contact_diary/modals/modals.dart';
import 'package:contact_diary/utlils/apptheme.dart';
import 'package:contact_diary/views/screens/add_contact_page.dart';
import 'package:contact_diary/views/screens/counter_page.dart';
import 'package:contact_diary/views/screens/editcontact.dart';
import 'package:contact_diary/views/screens/editpage.dart';
import 'package:contact_diary/views/screens/homepage.dart';
import 'package:contact_diary/views/screens/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isIntroVisited =
      prefs.getBool('IsIntroVisited') ?? false; //bool or null;

  bool isDarkTheme = prefs.getBool('isDark') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(
            themeModel: ThemeModel(isDark: isDarkTheme),
          ),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => ContactListPovider(),
        // ),
        // ChangeNotifierProvider(create: (context) => ImageProvider(),),
      ],
      builder: (context, _) {
        return MaterialApp(
          theme: AppTheme.lighttheme,
          darkTheme: AppTheme.darktheme,
          themeMode:
              (Provider.of<ThemeProvider>(context).themeModel.isDark == false)
                  ? ThemeMode.light
                  : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          // initialRoute: (isIntroVisited) ? "/" : "intro-screen",
          // initialRoute: 'intro-screen',
          routes: {
            '/': (context) => const homepage(),
            'intro-screen': (context) => const introscreen(),
            'add-contact': (context) => const add_contact(),
            'counter': (context) => const counterpage(),
            'edit-page': (context) => const editpage(),
            'edit-contact': (context) => const editcontact(),
          },
        );
      },
    ),
  );
}
