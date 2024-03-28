import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dashboard_bloc.dart';
import '../widgets/comment_bottom_sheet.dart';
import '../widgets/comment_dialog.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(LoadPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, state) {
          // Add listener logic if needed
        },
        builder: (context, state) {
          if (state is DashboardInitialState ||
              state is DashboardLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DashboardLoadedState) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                Post post = state.posts[index];
                return SizedBox(
                  height: MediaQuery.of(context).size.height/2.5,
                  child: Card(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.blue,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(post.owner),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              post.title,
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          TextFormField(
                            maxLines: 4,
                            controller:
                                TextEditingController(text: post.details),
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'Write a post',
                              border: InputBorder.none,
                            ),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      post.liked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: post.liked
                                          ? Colors.red
                                          : Colors.black,
                                    ),
                                    onPressed: () {
                                      BlocProvider.of<DashboardBloc>(context)
                                          .add(LikeUpdateEvent(index));
                                    },
                                  ),
                                  Text('${post.likeCount} Likes'),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      post.commented
                                          ? Icons.comment
                                          : Icons.comment_outlined,
                                    ),
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            CommentDialog(index),
                                      );
                                    },
                                  ),
                                  GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                          '${post.comments?.length} Comments')),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('Error loading updates'),
            );
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     BlocProvider.of<DashboardBloc>(context).add(LoadPostsEvent());
      //   },
      //   child: Icon(Icons.refresh),
      // ),
    );
  }
}
