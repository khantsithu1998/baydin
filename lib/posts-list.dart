import 'package:admob_flutter/admob_flutter.dart';
import 'package:app/admob_service.dart';
import 'package:app/post-details.dart';
import 'package:app/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostList extends StatefulWidget {
  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  final ams = AdMobService();
  List<Post> postObjs = List();
  final String apiUrl = "http://blackmarkermyanmar.com/public/api/posts";

  Future<List<Post>> fetchPosts() async {
    var result = await http.get(apiUrl);
    if(result.statusCode == 200){
      //var postObjJson =  json.decode(result.body);
      postObjs = postFromMap(result.body);
      return postObjs;
    }else{
      throw Exception("failed to load api");
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Admob.initialize(ams.getAppMobAppId());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Post>>(
        future: fetchPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostDetailsScreen(postObjs[index]),
                              ),
                            );
                          },
                        ),
                        AdmobBanner(adUnitId: ams.getBannerAdId(),adSize: AdmobBannerSize.BANNER)
                      ],
                    ),
                  );
                },);
          } else {
            return Center(child: CircularProgressIndicator());
          }

        },
      ),
    );
  }
}
