package com.example.flutter_with_docs

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.os.Build

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.app/widget"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "pinWidget" -> {
                    val success = pinWidget()
                    result.success(success)
                }
                "isPinSupported" -> {
                    val supported = isPinSupported()
                    result.success(supported)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun pinWidget(): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val appWidgetManager = AppWidgetManager.getInstance(this)
            val myProvider = ComponentName(this, HomeWidgetProvider::class.java)

            if (appWidgetManager.isRequestPinAppWidgetSupported) {
                appWidgetManager.requestPinAppWidget(myProvider, null, null)
                true
            } else {
                false
            }
        } else {
            false
        }
    }

    private fun isPinSupported(): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val appWidgetManager = AppWidgetManager.getInstance(this)
            appWidgetManager.isRequestPinAppWidgetSupported
        } else {
            false
        }
    }
}