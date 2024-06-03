import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(MingCute.search_line),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Searches',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Search ${index + 1}'),
                  onTap: () {},
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Trending Searches',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Trending Search ${index + 1}'),
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
