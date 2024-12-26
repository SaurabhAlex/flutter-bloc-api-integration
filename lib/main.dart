import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_api_integration/data/model/post_model.dart';
import 'package:flutter_bloc_api_integration/data/repositories/post_repo.dart';
import 'package:flutter_bloc_api_integration/presentation/screens/home_screen.dart';

void main() async{
  PostRepository repository = PostRepository();
  List<PostModel> postModels = await repository.fetchPosts();
  log(postModels.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}