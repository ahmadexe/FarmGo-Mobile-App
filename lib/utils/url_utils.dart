import 'package:url_launcher/url_launcher.dart';

class UrlUtils {
  static Future<void> launchTheUrl(String url) async {
    Uri uri = Uri.parse(url);
    await launchUrl(uri);
  }
}