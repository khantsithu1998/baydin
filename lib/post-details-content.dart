import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'admob_service.dart';

final ams = AdMobService();
class PostDetailsPageContent extends StatelessWidget {
  final String contentData;
  PostDetailsPageContent(this.contentData);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: TextAndButton(
        content: contentData,
      ),
    );

  }
}


class TextAndButton extends StatelessWidget {
  const TextAndButton({Key key, this.content})
      : super(key: key);
  final String content;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AdmobBanner(adUnitId: ams.getBannerAdId(),adSize: AdmobBannerSize.BANNER),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyText1,
          ),

        ],
      ),
    );
  }
}