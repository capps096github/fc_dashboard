import 'package:github_sign_in/github_sign_in.dart';

import '../../fc_exporter.dart';
import '../signin/signin_button.dart';
import 'github_auth_configs.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> signInWithGitHub(
    {required WidgetRef ref, required BuildContext context}) async {
  ref.read(isGithubButtonTappedProvider.notifier).state = true;

  try {
    if (isFCWeb) {
      // Create a new provider
      GithubAuthProvider githubProvider = GithubAuthProvider();

      // Once signed in, return the UserCredential
      await _auth.signInWithPopup(githubProvider);
    } else {
      // Create a GitHubSignIn instance
      final GitHubSignIn gitHubSignIn = GitHubSignIn(
        clientId: gitHubConfig['CLIENT_ID']!,
        clientSecret: gitHubConfig['CLIENT_SECRET']!,
        redirectUrl: gitHubConfig['REDIRECT_URL']!,
        scope:
            "user,gist,user:email,repo,read:org,read:public_key,read:repo_hook,read:gpg_key,read:repo_network,read:org,user:follow,write:repo_hook,write:gpg_key,write:public_key,write:repo_network,write:org",
      );

      // Trigger the sign-in flow
      final result = await gitHubSignIn.signIn(context);
      final token = result.token;

      if (token != null) {
        // Create a credential from the access token
        final githubAuthCredential = GithubAuthProvider.credential(token);

        // Once signed in, return the UserCredential
        await _auth.signInWithCredential(githubAuthCredential);
      }
    }
  } on FirebaseAuthException catch (e) {
    // print
    // ignore: avoid_print
    print("e.message: ${e.message}");
  } finally {
    ref.read(isGithubButtonTappedProvider.notifier).state = false;
    // ignore: avoid_print
    print("User Signed In");
  }
}
