import 'package:flutter/gestures.dart';

import '../fc_exporter.dart';
import '../link/links.dart';
import '../user/body/user_image.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          const Center(
            child: UserImage(
              userImageUrl:
                  "https://images.unsplash.com/photo-1617900906639-cab7adceb499?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDR8fGRldmVsb3BlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=400&q=60",
            ),
          ),

          // Description
          const SectionTitle(
            sectionText: "Description",
            textColor: fcWhite,
            backgroundColor: fcColor,
          ),

          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'This application is a Handiwork of ',
                style: GoogleFonts.spartan(
                  color: fcColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                children: <TextSpan>[
                  linkTextSpan(
                    text: 'Brian Cephas',
                    link: xephasTwitter,
                  ),
                  const TextSpan(
                    text:
                        ', and he developed it during his participation in the ',
                  ),
                  linkTextSpan(
                    text: 'Google Summer of Code 2022 (GSoC 2022) ',
                    link: "https://summerofcode.withgoogle.com/",
                  ),
                  const TextSpan(text: 'for the '),
                  linkTextSpan(
                    text: 'Dart Organisation ',
                    link:
                        "https://summerofcode.withgoogle.com/programs/2022/organizations/dart",
                  ),
                  const TextSpan(text: 'as per the '),
                  linkTextSpan(
                      text: "Idea List Here",
                      link:
                          "https://github.com/dart-lang/sdk/wiki/Dart-GSoC-2022-Project-Ideas"),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
          ),

          // Description
          const VerticalSpacing(of: 5),

          const SectionTitle(
            sectionText: "What it does",
            textColor: fcWhite,
            backgroundColor: fcColor,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'The application mainly accesses the ',
                style: GoogleFonts.spartan(
                  color: fcColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                children: <TextSpan>[
                  linkTextSpan(
                    text: 'Flutter Community Github Repository',
                    link: "https://github.com/fluttercommunity",
                  ),
                  const TextSpan(
                    text: ' via the GITHUB API. \n\n',
                  ),
                  const TextSpan(
                    text:
                        "The application authenticates the user using Github OAuth and then displays the repositories that are in the ",
                  ),
                  linkTextSpan(
                    text: "Flutter Community Repo",
                    link: "https://github.com/fluttercommunity",
                  ),
                  const TextSpan(
                    text:
                        ", shows details about them, like forks, issues, stars, watchers among others. It also shows the latest activity in the repositories.",
                  ),
                ],
              ),
            ),
          ),

          // open source
          const VerticalSpacing(of: 5),

          const SectionTitle(
            sectionText: "Open Source",
            textColor: fcWhite,
            backgroundColor: fcPink,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'This application is open source and is available on ',
                style: GoogleFonts.spartan(
                  color: fcColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
                children: <TextSpan>[
                  linkTextSpan(
                    text: 'Github (capps096github/fc_dashboard)',
                    link: "https://github.com/capps096github/fc_dashboard",
                  ),
                  const TextSpan(
                    text:
                        '. Feel free to clone it, use it for your own projects and above all contribute to it. Thanks\n\n',
                  ),
                ],
              ),
            ),
          ),

          // cc
          const FromXephas(
            textColor: fcBlue,
            builderColor: fcBlue,
          )
        ],
      ),
    );
  }

  TextSpan linkTextSpan({required String text, required String link}) {
    return TextSpan(
      text: text,
      recognizer: TapGestureRecognizer()
        ..onTap = () async {
          await linkLauncher(link);
        },
      style: const TextStyle(
        color: fcPink,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        height: 1.5,
      ),
    );
  }
}
