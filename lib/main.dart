import 'package:admin_app/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:admin_app/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: Fonts.base,
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(S.of(context).helloWorld),
    );
  }
}
