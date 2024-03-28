part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class LoadPostsEvent extends DashboardEvent {}

class LikeUpdateEvent extends DashboardEvent {
  final int updateIndex;

  LikeUpdateEvent(this.updateIndex);
}

class AddPostEvent extends DashboardEvent {
  final Post post;
  AddPostEvent(this.post);
}


class AddCommentEvent extends DashboardEvent {
  final int updateIndex;
  final String comment;
  AddCommentEvent(this.updateIndex, this.comment);
}
