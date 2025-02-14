import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:mobile/home_page.dart';
import 'util.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;

    // Retrieves the default theme for the platform
    //TextTheme textTheme = Theme.of(context).textTheme;

    // Use with Google Fonts package to use downloadable fonts
    TextTheme textTheme = createTextTheme(context, "Urbanist", "Urbanist");
    MaterialTheme theme = MaterialTheme(textTheme);

    // Create FlexSchemeColor from your light ColorScheme
    final lightFlexSchemeColor = FlexSchemeColor(
      primary: MaterialTheme.lightScheme().primary,
      primaryContainer: MaterialTheme.lightScheme().primaryContainer,
      secondary: MaterialTheme.lightScheme().secondary,
      secondaryContainer: MaterialTheme.lightScheme().secondaryContainer,
      tertiary: MaterialTheme.lightScheme().tertiary,
      tertiaryContainer: MaterialTheme.lightScheme().tertiaryContainer,
      appBarColor: MaterialTheme.lightScheme()
          .primary, // Optional: Customize AppBar color
      swapOnMaterial3: true,
    );

    // Create FlexSchemeColor from your dark ColorScheme
    final darkFlexSchemeColor = FlexSchemeColor(
      primary: MaterialTheme.lightMediumContrastScheme().primary,
      primaryContainer:
          MaterialTheme.lightMediumContrastScheme().primaryContainer,
      secondary: MaterialTheme.lightMediumContrastScheme().secondary,
      secondaryContainer:
          MaterialTheme.lightMediumContrastScheme().secondaryContainer,
      tertiary: MaterialTheme.lightMediumContrastScheme().tertiary,
      tertiaryContainer:
          MaterialTheme.lightMediumContrastScheme().tertiaryContainer,
      appBarColor: MaterialTheme.lightMediumContrastScheme()
          .secondary, // Optional: Customize AppBar color
      swapOnMaterial3: true,
    );

    bool isDarkMode = false;

    void toggleTheme() {
      print("Toggle theme");
      setState(() {
        isDarkMode = !isDarkMode;
      });
    }

    return MaterialApp(
      title: 'Flutter Demo',
      //theme: theme.light(),
      //theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      theme: FlexThemeData.light(colors: lightFlexSchemeColor),
      darkTheme: FlexThemeData.dark(colors: darkFlexSchemeColor),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        onThemeChanged: toggleTheme,
      ),
    );
  }
}
