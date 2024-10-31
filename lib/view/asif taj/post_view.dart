import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/utils/enums.dart';

import '../../asif learn bloc/post Api/post_bloc.dart';
import '../../asif learn bloc/post Api/post_event.dart';
import '../../asif learn bloc/post Api/post_states.dart';

class PostView extends StatefulWidget {
  const PostView({super.key});

  @override
  State<PostView> createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get Api With Bloc"),
      ),
      body: BlocBuilder<PostBloc, PostStates>(builder: (context, state) {
        switch (state.postStatus) {
          case PostStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case PostStatus.failure:
            return Center(
              child: Text(state.message),
            );
          case PostStatus.success:
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "search with email",
                        border: OutlineInputBorder()),
                    onChanged: (filterKey) {
                      context.read<PostBloc>().add(SearchItem(filterKey));
                    },
                  ),
                  Expanded(
                    child: state.searchMessage.isNotEmpty
                        ? Center(
                            child: Text(state.searchMessage.toString()),
                          )
                        : ListView.builder(
                            itemCount: state.temPostList.isEmpty
                                ? state.postList.length
                                : state.temPostList.length,
                            itemBuilder: (context, index) {
                              if (state.temPostList.isNotEmpty) {
                                var item = state.temPostList[index];
                                return ListTile(
                                  title: Text(item.email.toString()),
                                  subtitle: Text(item.body.toString()),
                                );
                              } else {
                                var item = state.postList[index];
                                return ListTile(
                                  title: Text(item.email.toString()),
                                  subtitle: Text(item.body.toString()),
                                );
                              }
                            }),
                  ),
                ],
              ),
            );
        }
      }),
    );
  }
}
