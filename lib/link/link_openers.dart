import '../fc_exporter.dart';
import 'links.dart';

///This Opens the links
Future<void> linkLauncher(String link) async {
  if (await canLaunch(link)) {
    await launch(link);
  } else {
    throw 'Could not launch $link';
  }
}

// Open Xephas Twitter Account
void openXephasTwitter() async {
  await linkLauncher(xephasTwitter);
}

// Open dartGsoc2022
void opendartGSOC2022() async {
  await linkLauncher(dartGsoc2022);
}
