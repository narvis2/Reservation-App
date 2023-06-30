package com.thepan.reservation_app

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        // Android 에서 화면 잠금시 지도가 생기는 이슈 때문에 추가
        intent.putExtra("background_mode", "transparent")
        super.onCreate(savedInstanceState)
    }
}
