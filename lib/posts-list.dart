import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostList extends StatelessWidget {
  final String apiUrl = "http://blackmarkermyanmar.com/public/api/posts";

  Future<List<dynamic>> fetchPosts() async {
    var result = await http.get(apiUrl);
    return json.decode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<dynamic>>(
        future: fetchPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data[0]["id"]);
            return ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage("http://blackmarkermyanmar.com/public/storage/"+snapshot.data[index]['image'])),
                          title: Text(snapshot.data[index]["title"]),
                          subtitle: Text(snapshot.data[index]["slug"]),
                          //trailing: Text(snapshot.data[index]["body"]),
                        )
                      ],
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
