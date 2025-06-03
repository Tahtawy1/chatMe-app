import 'package:chat_me/data.dart';
import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
        query = '';
      },
      icon: Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (usersEmails.contains(query)) {
      return Text(query);
    } else {
      return Text('Not Found!', style: TextStyle(color: Colors.red));
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: usernames.length,
      itemBuilder: (context, i) {
        return Text(usernames[i]);
      },
    );
  }
}
