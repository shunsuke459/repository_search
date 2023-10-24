import 'package:flutter/material.dart';
import 'package:repository_search/page/search/search_repository_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repository Search',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SearchRepositoryPage(),
    );
  }
}
