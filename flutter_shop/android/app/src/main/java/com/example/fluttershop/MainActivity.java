package com.example.fluttershop;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  private final static String CHENNEL = "plugins.flutter.io/url_launcher";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    new MethodChannel(getFlutterView(),CHENNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
      @Override
      public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        if (methodCall.method.equals("launch")){
          String phone = methodCall.argument("phone");
          Intent intent = new Intent(Intent.ACTION_DIAL);
          intent.setData(Uri.parse("tel:"+phone));
          startActivity(intent);
        }
      }
    });
  }
}
