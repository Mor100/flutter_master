package com.example.mygraduation;

import android.content.Intent;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  final static String CHANNEL = "channel:github.com/orgs/esysberlin/esys-flutter-share";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(),CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler(){
      @java.lang.Override
      public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if(methodCall.method.equals("shareText")){
          Intent intent = new Intent(Intent.ACTION_SEND);
          intent.setType("text/*");
          intent.putExtra(Intent.EXTRA_TEXT,"www.baidu.com");
          startActivity(Intent.createChooser(intent,"分享"));
        }
      }
    });
  }
}
