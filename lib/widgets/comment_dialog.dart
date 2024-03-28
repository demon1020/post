import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';

import '../bloc/dashboard_bloc.dart';

class CommentDialog extends StatefulWidget {
  late final int index;

  CommentDialog(this.index);

  @override
  _CommentDialogState createState() => _CommentDialogState();
}

class _CommentDialogState extends State<CommentDialog> {
  String comment = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        // Add listener logic if needed
      },
      builder: (BuildContext context, state) {
        return AlertDialog(
          title: Text('Add Comment'),
          content: TextField(
            onChanged: (value) {
              comment = value;
            },
            decoration: InputDecoration(hintText: 'Enter your comment'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<DashboardBloc>(context)
                    .add(AddCommentEvent(widget.index, comment));
                print('Comment: $comment');
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

