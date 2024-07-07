import 'package:flutter/material.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget(this.searchText, {super.key});

  final String searchText;

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Search results for ${widget.searchText}'));
  }
}
