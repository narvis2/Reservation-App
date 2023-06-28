import 'package:flutter/material.dart';

class SearchTabScreen extends StatefulWidget {
  const SearchTabScreen({Key? key}) : super(key: key);

  @override
  State<SearchTabScreen> createState() => _SearchTabScreenState();
}

class _SearchTabScreenState extends State<SearchTabScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Search Tab Screen"),
    );
  }
}
