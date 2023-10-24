import 'package:flutter/material.dart';
import 'package:repository_search/page/search_result/search_result_page.dart';

class SearchRepositoryPage extends StatelessWidget {
  const SearchRepositoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchResultList = List.generate(50, (index) => 'リポジトリ$index');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Githubリポジトリ検索'),
      ),
      body: Column(
        children: [
          TextFormField(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: searchResultList.map((searchResult) {
                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            SearchResultPage(title: searchResult),
                      ),
                    ),
                    child: Text(searchResult),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
