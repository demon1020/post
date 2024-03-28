import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/dashboard_bloc.dart';
import '../widgets/comment_bottom_sheet.dart';
import '../widgets/comment_dialog.dart';

class SpplDashboardScreen extends StatefulWidget {
  const SpplDashboardScreen({super.key});

  @override
  State<SpplDashboardScreen> createState() => _SpplDashboardScreenState();
}

class _SpplDashboardScreenState extends State<SpplDashboardScreen> {
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
                                      // BlocProvider.of<DashboardBloc>(context)
                                      //     .add(LikeUpdateEvent(index));
                                    },
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CommentBottomSheet(index);
                                          },
                                        );
                                      },
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // BlocProvider.of<DashboardBloc>(context).add(LoadPostsEvent());
          showDialog(
            context: context,
            builder: (context) => AddPostDialog(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddPostDialog extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is AddPostState) {
          // Post was successfully added, do any necessary UI updates or navigation
          print('Post added: ${state.post}');
        }
      },
      builder: (context, state) {
        return AlertDialog(
          title: Text('Add Post'),
          content: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(hintText: 'Enter your Title'),
                maxLines: null,
              ),
              TextField(
                controller: _descController,
                minLines: 1,
                decoration: InputDecoration(
                  hintText: 'Enter Description',
                  border: InputBorder.none,
                ),
                maxLines: 4, // Allow multiple lines for the post content
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<DashboardBloc>(context).add(
                  AddPostEvent(
                    Post(
                      title: _titleController.text,
                      details: _descController.text,
                      owner: "Baburam Nabik",
                      likeCount: 0,
                      commentCount: 0,
                      comments: []
                    ),
                  ),
                );
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
