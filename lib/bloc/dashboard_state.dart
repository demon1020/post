part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class DashboardInitialState extends DashboardState {}

class DashboardLoadingState extends DashboardState {}

class AddPostState extends DashboardState {
  final Post post;
  AddPostState(this.post);
}

class DashboardLoadedState extends DashboardState {
  final List<Post> posts;

  DashboardLoadedState(this.posts);
}

// Model class for updates
class Post {
  final String title;
  final String details;
  final String owner;
  late int likeCount;
  late int commentCount;

  List<Comment>? comments;
  bool liked;
  bool commented;

  Post(
      {required this.title,
      required this.details,
      required this.owner,
      this.comments,
      this.likeCount = 3,
      this.commentCount = 0,
      this.commented = false,
      this.liked = false});

  void addLike() {
    likeCount++;
  }

  void removeLike() {
    likeCount--;
  }

  void addComment(String comment) {
    if (comments == null) {
      comments = [];
    }
    comments!.add(Comment(comment, "user"));
    commentCount++;
  }

  void removeComment(String comment) {
    if (comments != null && comments!.contains(comment)) {
      comments!.remove(comment);
      commentCount--;
    }
  }
}

class Comment {
  final String data;
  final String owner;

  Comment(this.data, this.owner);
}
