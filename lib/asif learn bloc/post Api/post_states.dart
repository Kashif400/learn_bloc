import 'package:equatable/equatable.dart';
import 'package:learn_bloc/model/post_model.dart';
import 'package:learn_bloc/utils/enums.dart';

class PostStates extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> temPostList;
  final String message;
  final String searchMessage;

  const PostStates(
      {this.postStatus = PostStatus.loading,
      this.postList = const [],
      this.temPostList = const [],
      this.message = '',
      this.searchMessage = ''});

  PostStates copyWith(
      {PostStatus? postStatus,
      List<PostModel>? postList,
      List<PostModel>? temPostList,
      String? message,
      String? searchMessage}) {
    return PostStates(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      temPostList: temPostList ?? this.temPostList,
      message: message ?? this.message,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object?> get props =>
      [postList, postStatus, message, temPostList, searchMessage];
}
