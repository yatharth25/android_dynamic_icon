package com.example.android_dynamic_icon;

import android.content.Context;
import android.content.Intent;
import android.content.ComponentName;
import android.content.pm.PackageManager;
import android.os.Parcelable;
import java.util.ArrayList;

public class GeneralUtils {

    public static void changeAppIconDynamically(Context context, String bundleId, boolean isNewIcon, String iconName, ArrayList<String> iconNames) {
        PackageManager pm = context.getApplicationContext().getPackageManager();
        if (isNewIcon) {
                for (String name: iconNames) {
                        if (iconName != name){
                                pm.setComponentEnabledSetting(
                                        new ComponentName(context,
                                                bundleId+".MainActivityAlias"+name), //com.example.dummy will be your package
                                        PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                                PackageManager.DONT_KILL_APP);
                        }
                }
                
                pm.setComponentEnabledSetting(
                        new ComponentName(context,
                                bundleId+".MainActivityAlias"), //com.example.dummy will be your package
                        PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                PackageManager.DONT_KILL_APP);
    
                pm.setComponentEnabledSetting(
                        new ComponentName(context,
                                bundleId+".MainActivityAlias"+iconName),
                        PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                PackageManager.DONT_KILL_APP);

        } else {
                pm.setComponentEnabledSetting(
                        new ComponentName(context,
                                bundleId+".MainActivityAlias"),
                        PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                PackageManager.DONT_KILL_APP);
                
                for (String name: iconNames) {
                        pm.setComponentEnabledSetting(
                                new ComponentName(context,
                                        bundleId+".MainActivityAlias"+name),
                                PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                        PackageManager.DONT_KILL_APP);
                }
        }
    }
}