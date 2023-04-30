package com.example.android_dynamic_icon;

import androidx.annotation.NonNull;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.ComponentName;
import android.content.pm.PackageManager;
import android.os.Parcelable;
import java.util.ArrayList;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** AndDynamicIconPlugin */
public class AndroidDynamicIconPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Context context;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    context = flutterPluginBinding.getApplicationContext();
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "android_dynamic_icon");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("changeIcon")) {
      String bundleId = call.argument("bundleId");
      boolean isNewIcon = call.argument("isNewIcon");
      String iconName = call.argument("iconName");
      ArrayList<String> iconNames = call.argument("iconNames");
      changeIcon(bundleId,isNewIcon,iconName,iconNames);
      result.success("Success");
    } else {
      result.notImplemented();
    }
  }

  public void changeIcon(String bundleId ,boolean isNewIcon, String iconName, ArrayList<String> iconNames) {
    GeneralUtils.changeAppIconDynamically(context, bundleId, isNewIcon, iconName, iconNames);
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    context = null;
    channel.setMethodCallHandler(null);
  }
}
