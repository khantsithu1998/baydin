import 'dart:io';

class AdMobService {
  String getAppMobAppId(){
    if(Platform.isIOS){

    }else if(Platform.isAndroid){
      return "ca-app-pub-3454823798847230~6892816108";
    }
    return null;
  }

  String getBannerAdId(){

    if(Platform.isIOS){

    }else if(Platform.isAndroid){
      return "ca-app-pub-3454823798847230/9327407757"; // Real Banner Ads ID
      //return "ca-app-pub-3940256099942544/6300978111"; // Test Ads Banner ID
    }
    return null;
  }
}