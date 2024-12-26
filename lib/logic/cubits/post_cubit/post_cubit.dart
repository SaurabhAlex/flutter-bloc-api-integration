import 'package:dio/dio.dart';
import 'package:flutter_bloc_api_integration/data/model/post_model.dart';
import 'package:flutter_bloc_api_integration/data/repositories/post_repo.dart';
import 'package:flutter_bloc_api_integration/logic/cubits/post_cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPost();
  }

  PostRepository postRepository = PostRepository();

  void fetchPost() async {
    try {
      List<PostModel> posts = await postRepository.fetchPosts();
      emit(PostLoadedState(posts: posts));
    } on DioException catch (ex) {
      if (ex.type == DioExceptionType.connectionError) {
        emit(PostErrorState(
            "Can't fetch Posts, please check your internet connection!"));
      } else {
        emit(PostErrorState(ex.type.toString()));
      }
    } catch (e) {
      emit(PostErrorState(e.toString()));
    }
  }
}
