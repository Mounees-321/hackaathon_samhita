import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import com.chaquo.python.Python

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example.posturx/posture"

    override fun configureFlutterEngine() {
        super.configureFlutterEngine()

        // Use getFlutterEngine() to ensure you have access to the Dart executor
        MethodChannel(flutterEngine?.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "analyzePosture") {
                // Get the videoPath from the Flutter app
                val videoPath = call.argument<String>("videoPath")
                if (videoPath != null) {
                    // Initialize Python instance
                    val python = Python.getInstance()
                    // Load the posture analyzer Python file
                    val pyFile = python.getModule("posture_analyzer")
                    // Call the analyze_posture function with the video path
                    val analysisResult = pyFile.callAttr("analyze_posture", videoPath)

                    // Return the result to Flutter
                    result.success(analysisResult.toString())
                } else {
                    result.error("INVALID_ARGUMENT", "Video path is null", null)
                }
            } else {
                result.notImplemented()  // Handle unsupported methods
            }
        }
    }
}
