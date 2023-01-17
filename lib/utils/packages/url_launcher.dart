import 'package:url_launcher/url_launcher.dart';

mixin LaunchMixin {
  void launchTheURL(String url1) async {
    final Uri url = Uri.parse(url1);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
