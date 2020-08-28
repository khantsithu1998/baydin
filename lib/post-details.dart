import 'package:app/post-details-content.dart';
import 'package:app/post-details-header.dart';
import 'package:app/post.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';



class PostDetailsScreen extends StatelessWidget {

  final Post post;
  PostDetailsScreen(this.post);

  String _parseHtmlString(String htmlString) {

    var document = parse(htmlString);

    String parsedString = parse(document.body.text).documentElement.text;

    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ဗေဒင်ဟောစတမ်း"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: false,
            floating: true,
            delegate: PostDetailsPageHeader(
              title : post.title,
              image: "http://blackmarkermyanmar.com/public/storage/"+post.image,
              minExtent: 150.0,
              maxExtent: 250.0,
            ),
          ),
          PostDetailsPageContent(_parseHtmlString(post.body)),
        ],
      ),
    );
  }
}
