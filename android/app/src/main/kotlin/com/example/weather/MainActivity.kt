package com.example.weather

import io.flutter.embedding.android.FlutterActivity
import android.content.Intent
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "weather/share"
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
       super.configureFlutterEngine(flutterEngine)
       MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
           call, result ->
           when (call.method) {
               "shareData" -> {
                   shareData(call.arguments as String)
                   result.success(null)
               }
               else -> result.notImplemented()
           }
        }
}
private fun shareData(data: String) {
    val sendIntent: Intent = Intent().apply {
        action = Intent.ACTION_SEND
        putExtra(Intent.EXTRA_TEXT, data)
        type = "text/plain"
    }
    val shareIntent = Intent.createChooser(sendIntent, null)
    startActivity(shareIntent)
    // wifi.isWifiEnabled = !wifi.isWifiEnabled
    // showToast(if (!wifi.isWifiEnabled) "Вайфай включен" else
	// 	"Вайфай выключен");
}

}
