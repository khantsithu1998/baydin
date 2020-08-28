import 'package:app/post-details.dart';
import 'package:app/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class PostList extends StatelessWidget {
  List<Post> postObjs = List();
  final String apiUrl = "http://blackmarkermyanmar.com/public/api/posts";

  Future<List<Post>> fetchPosts() async {
    var result = await http.get(apiUrl);
    if(result.statusCode == 200){
      //var postObjJson =  json.decode(result.body);
      postObjs = postFromMap(result.body);
      print(postObjs[0].title);
      return postObjs;
    }else{
      throw Exception("failed to load api");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Post>>(
        future: fetchPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            print(postObjs[0].id);
            return ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: postObjs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage("http://blackmarkermyanmar.com/public/storage/"+postObjs[index].image)),
                          title: Text(postObjs[index].title),
                          subtitle: Text(postObjs[index].slug),
                          //trailing: Text(snapshot.data[index]["body"]),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostDetailsScreen(postObjs[index]),
                              ),
                            );
                          },
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
