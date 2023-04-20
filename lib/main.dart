import 'package:bookstore/PROVIDER/bookDetailsProvider.dart';
import 'package:bookstore/PROVIDER/bookListProvider.dart';
import 'package:bookstore/SCREENS/bookDetailsPage.dart';
import 'package:bookstore/SCREENS/bookListpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookListProvider()),
        ChangeNotifierProvider(create: (context) => BookDetailsProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: '/bookList',
        routes: {
          '/bookList': (context) => BookListPage(),
          // '/bookDetails': (context) => BookDetailsPage()
        },
      ),
    );
  }
}
