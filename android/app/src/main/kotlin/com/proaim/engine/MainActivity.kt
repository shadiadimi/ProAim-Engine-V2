package com.proaim.engine

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Intent
import android.net.Uri
import android.provider.Settings
import android.os.Build

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.proaim.engine/overlay"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "showOverlay" -> {
                    if (checkOverlayPermission()) {
                        startOverlayService()
                        result.success(null)
                    } else {
                        requestOverlayPermission()
                        result.error("PERMISSION_DENIED", "Overlay permission not granted", null)
                    }
                }
                "hideOverlay" -> {
                    stopOverlayService()
                    result.success(null)
                }
                "enableStealthMode" -> {
                    // Logic to make overlay invisible to screenshots
                    result.success(null)
                }
                "enableHumanPulse" -> {
                    val enabled = call.argument<Boolean>("enabled") ?: false
                    // Logic to toggle human pulse
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun checkOverlayPermission(): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            Settings.canDrawOverlays(this)
        } else {
            true
        }
    }

    private fun requestOverlayPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            val intent = Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION, Uri.parse("package:$packageName"))
            startActivityForResult(intent, 1234)
        }
    }

    private fun startOverlayService() {
        val intent = Intent(this, OverlayService::class.java)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(intent)
        } else {
            startService(intent)
        }
    }

    private fun stopOverlayService() {
        val intent = Intent(this, OverlayService::class.java)
        stopService(intent)
    }
}
