import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api_integration/logic/cubits/post_cubit/post_cubit.dart';
import 'package:flutter_bloc_api_integration/logic/cubits/post_cubit/post_state.dart';
import '../../data/model/post_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    context.read<PostCubit>().fetchPost();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("API Handling", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: BlocConsumer<PostCubit, PostState>(
        listener: (context, state){
          if(state is PostErrorState){
            SnackBar snackBar = SnackBar(content: Text(state.error),
              backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state){
          if(state is PostLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is PostLoadedState){
            return buildPostListView(state.posts);
          }
          return Center(
            child: Text("An Error Occur"),
          );
        },
      )
    );
  }

  Widget buildPostListView(List<PostModel> posts){
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder:(context, index){
          PostModel post = posts[index];

          return ListTile(
            title: Text(post.title.toString()),
            subtitle: Text(post.body.toString()),
          );
        });
  }
}
