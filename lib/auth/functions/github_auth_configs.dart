/// To get your [CLIENT_ID] and [CLIENT_SECRET]:
/// 1. Visit https://github.com/settings/developers.
/// 2. Create a new OAuth application.
/// 3. Set **Home Page URL** to `https://react-native-firebase-testing.firebaseapp.com`.
/// 4. Set **Authorization callback URL** to `https://react-native-firebase-testing.firebaseapp.com/__/auth/handler`.
Map<String, String> gitHubConfig = {
  'CLIENT_ID': 'c102b858e74eac7569cb',
  'CLIENT_SECRET': '54e814ad2f9484030fffaf0a304209f6fd694164',
  'REDIRECT_URL':
      'https://fluttercommdashboard.firebaseapp.com/__/auth/handler',
};

// GITHub OAuth scopes for
// * -- user
//user information
//gist
//email
//public_key(read and write)
//repo_hook(read and write)

// * -- repo
// repo
// repo_status
// repo_deployment
// public_repo
// delete_repo
// repo_hook (read and write)

// * -- org
// org
// org_hook (read and write)
// org_member (read and write)

// * -- keys
// public_key (read and write)

// * -- notifications
// * -- admin permissions

const githubScopes =
    "user,gist,user:email,user:follow,public_repo,repo,repo_deployment,repo_hook,repo:status,delete_repo,notifications,read:org,write:org,read:public_key,write:public_key,read:repo_hook,write:repo_hook,admin:org,admin:org_hook,admin:public_key,admin:repo_hook,admin:repo_status,admin:repo_deployment,admin:delete_repo,admin:notifications";
