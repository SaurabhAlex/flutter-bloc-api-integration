import 'package:flutter_bloc_api_integration/data/model/post_model.dart';

abstract class PostState{}

class PostLoadingState extends PostState{}

class PostLoadedState extends PostState{
  final List<PostModel> posts;
  PostLoadedState({required this.posts});
}

class PostErrorState extends PostState{
  final String error;
  PostErrorState(this.error);
}