import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

import '../bloc/dashboard_bloc.dart';

class CommentBottomSheet extends StatelessWidget {
  late final int index;

  CommentBottomSheet(this.index);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        List<Comment>? comments =
            (state as DashboardLoadedState).posts[index].comments;

        return Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: comments?.length ?? 0,
            itemBuilder: (context, index) {
              Comment comment = comments![index];
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Center(
                          child: Text(
                            comment.owner,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width-100,
                          child: ReadMoreText(
                            comment.data,
                            trimLines: 2,
                            trimMode: TrimMode.Length,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            lessStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
