import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_bloc_api_integration/data/model/post_model.dart';
import 'package:flutter_bloc_api_integration/data/repositories/api/api.dart';

class PostRepository {
  API api = API();

  Future<List<PostModel>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMaps) => PostModel.fromJson(postMaps)).toList();
    } catch (ex) {
      rethrow;
    }
  }
}
