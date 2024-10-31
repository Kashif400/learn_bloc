import 'package:bloc/bloc.dart';
import 'package:learn_bloc/Repository/post_repository.dart';
import 'package:learn_bloc/utils/enums.dart';

import '../../model/post_model.dart';
import 'post_event.dart';
import 'post_states.dart';

class PostBloc extends Bloc<PostEvent, PostStates> {
  List<PostModel> temPostList = [];
  PostRepository postRepository = PostRepository();
  PostBloc() : super(const PostStates()) {
    on<PostFetch>(_fetchPost);
    on<SearchItem>(_filterItem);
  }

  void _filterItem(SearchItem event, Emitter<PostStates> emit) async {
    if (event.stSearch.isEmpty) {
      emit(state.copyWith(temPostList: [], searchMessage: ''));
    } else {
      temPostList = state.postList
          .where((element) => element.email
              .toString()
              .toLowerCase()
              .contains(event.stSearch.toString().toLowerCase()))
          .toList();
      if (temPostList.isEmpty) {
        emit(state.copyWith(
            temPostList: temPostList, searchMessage: "No Data found"));
      } else {
        emit(state.copyWith(temPostList: temPostList, searchMessage: ''));
      }
    }
  }

  void _fetchPost(PostFetch event, Emitter<PostStates> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
          postList: value, postStatus: PostStatus.success, message: "Success"));
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(
          postStatus: PostStatus.failure, message: error.toString()));
    });
  }
}
