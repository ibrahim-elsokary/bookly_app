
import 'package:url_launcher/url_launcher.dart';

import 'custom_snack_bar.dart';

Future<void> urlLauncher(context, String? url) async {
  Uri uri = Uri.parse(url ?? "");
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    customSnackBar(context, 'can\'t launch URL');
  }
}

