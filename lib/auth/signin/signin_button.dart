import '../../fc_exporter.dart';
import '../functions/github_auth.dart';

final isGithubButtonTappedProvider = StateProvider((ref) => false);

class GithubAuthButton extends ConsumerWidget {
  const GithubAuthButton({
    Key? key,
    this.text = "SIGN IN",
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context, ref) {
    final isButtonTapped = ref.watch(isGithubButtonTappedProvider.state).state;
    const color = fcWhite;

    return CircularProgressAppButton(
      isTapped: isButtonTapped,
      text: "$text WITH GITHUB",
      onTap: () async {
        // Unfocus Keyboard
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        // Gender Dialogoue
        await signInWithGitHub(ref: ref, context: context);
      },
      icon: Ionicons.logo_github,
      textColor: fcBlack,
      buttonColor: color,
    );
  }
}
