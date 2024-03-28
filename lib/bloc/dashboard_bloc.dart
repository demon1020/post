import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitialState()) {

    on<LoadPostsEvent>((event, emit) {
      emit(DashboardLoadingState());
      // Simulate loading posts from a data source
      emit(DashboardLoadedState(posts));
    });

    on<AddPostEvent>((event, emit) {
      emit(DashboardLoadingState());
      posts.add(event.post);
      // Simulate loading posts from a data source
      emit(DashboardLoadedState(posts));
    });

    on<LikeUpdateEvent>((event, emit) {
      if (state is DashboardLoadedState) {
        List<Post> posts = List.from((state as DashboardLoadedState).posts);
        posts[event.updateIndex].liked = !posts[event.updateIndex].liked;
        if (posts[event.updateIndex].liked) {
          posts[event.updateIndex].addLike();
        } else {
          posts[event.updateIndex].removeLike();
        }
        emit(DashboardLoadedState(posts));
      }
    });

    on<AddCommentEvent>((event, emit) {
      if (state is DashboardLoadedState) {
        List<Post> posts = List.from((state as DashboardLoadedState).posts);
        posts[event.updateIndex].commented =
            !posts[event.updateIndex].commented;
        posts[event.updateIndex].addComment(event.comment);
        emit(DashboardLoadedState(posts));
      }
    });
  }
}



List<Post> posts = [
  Post(
    title: 'Lovely Bird',
    details: 'I saw a bird sitting on the tree in front of my house.',
    owner: 'babu',
    comments: [Comment("Nice", "babu"),Comment("wow", "Nick")],
  ),
  Post(
    title: 'Puppy on road',
    details: 'Keren found a puppy on the road.',
    owner: 'babu',
    comments: [Comment("This is lovely, nice to see this post,nice to see this post, nice to see this post nice to see this post,", "Raj"),Comment("Nice", "babu"),Comment("wow", "Nick")],
  ),
];