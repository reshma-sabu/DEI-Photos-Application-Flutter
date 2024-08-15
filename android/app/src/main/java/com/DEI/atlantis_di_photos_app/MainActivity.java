// import android.content.ContentValues;
// import android.content.Context;
// import android.graphics.Bitmap;
// import android.graphics.BitmapFactory;
// import android.os.Environment;
// import android.provider.MediaStore;
// import android.util.Base64;
// import android.util.Log;

// import androidx.annotation.NonNull;

// import java.io.ByteArrayInputStream;
// import java.io.IOException;
// import java.io.InputStream;

// import io.flutter.embedding.android.FlutterActivity;
// import io.flutter.embedding.engine.FlutterEngine;
// import io.flutter.plugin.common.MethodChannel;
// import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
// import io.flutter.plugin.common.MethodChannel.Result;

// public class MainActivity extends FlutterActivity {
//     private static final String CHANNEL = "com.example/mediastore";

//     @Override
//     public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
//         super.configureFlutterEngine(flutterEngine);
//         new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
//                 .setMethodCallHandler(new MethodCallHandler() {
//                     @Override
//                     public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
//                         if (call.method.equals("saveImageToGallery")) {
//                             String imageBytesBase64 = call.argument("imageBytes");
//                             String filename = call.argument("filename");
//                             saveImageToGallery(imageBytesBase64, filename, getApplicationContext());
//                             result.success(null);
//                         } else {
//                             result.notImplemented();
//                         }
//                     }
//                 });
//     }

//     private void saveImageToGallery(String imageBytesBase64, String filename, Context context) {
//         byte[] decodedString = Base64.decode(imageBytesBase64, Base64.DEFAULT);
//         InputStream inputStream = new ByteArrayInputStream(decodedString);

//         Bitmap bitmap = BitmapFactory.decodeStream(inputStream);
//         ContentValues values = new ContentValues();
//         values.put(MediaStore.Images.Media.DISPLAY_NAME, filename);
//         values.put(MediaStore.Images.Media.MIME_TYPE, "image/jpeg");
//         values.put(MediaStore.Images.Media.RELATIVE_PATH, Environment.DIRECTORY_PICTURES);

//         Uri uri = context.getContentResolver().insert(MediaStore.Images.Media.EXTERNAL_CONTENT_URI, values);

//         try {
//             OutputStream outputStream = context.getContentResolver().openOutputStream(uri);
//             bitmap.compress(Bitmap.CompressFormat.JPEG, 100, outputStream);
//             if (outputStream != null) {
//                 outputStream.close();
//             }
//         } catch (IOException e) {
//             Log.e("MediaStore", "Error saving image to MediaStore", e);
//         }
//     }
// }
