import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'summary.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wikipedia Flutter'),
        ),
        body: const Center(
          child: Text('Loading...'),
        ),
      ),
    );
  }
}

// Model: Handles data operations.
class ArticleModel {
  Future<Summary> getRandomArticleSummary() async {
    final uri = Uri.https(
      'en.wikipedia.org',
      '/api/rest_v1/page/random/summary',
    );
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw HttpException('Failed to update resources');
    }

    return Summary.fromJson(
      jsonDecode(response.body),
    );
  }
}

// View: Displays the UI.
class ArticleViewModel {}

// ViewModel: Manages state and connects the two.
class ArticleView {}
