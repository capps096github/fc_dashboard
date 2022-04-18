// * for sample of event json, check data/events.json

// get GithubEvent Class from json above

class GithubEvent {
  // event id
  final String id;

  // event type
  final String type;

  // event actor / user
  final GithubActor actor;

  // repo
  final GithubEventRepo repo;

  // public or private
  final bool public;

  // created at
  final DateTime createdAt;

  // payload
  final GithubEventPayload payload;

  GithubEvent({
    required this.id,
    required this.type,
    required this.actor,
    required this.repo,
    required this.public,
    required this.createdAt,
    required this.payload,
  });

  // get github event from json, however the repo will be got by ID
  factory GithubEvent.fromJson(Map<String, dynamic> json) {
    return GithubEvent(
      id: json['id'] as String,
      type: getStringForType(json['type'] as String),
      actor: GithubActor.fromJson(json['actor'] as Map<String, dynamic>),
      repo: GithubEventRepo.fromJson(json['repo'] as Map<String, dynamic>),
      public: json['public'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      payload:
          GithubEventPayload.fromJson(json['payload'] as Map<String, dynamic>),
    );
  }

  //EC: https://developer.github.com/v3/activity/events/types/, made human readable and added past tense where applicable
  static String getStringForType(String type) {
    if (type == "CheckRunEvent") return "Checked Run";
    if (type == "CheckSuiteEvent") return "Checked Suite";
    if (type == "CommitCommentEvent") return "Commit Commented";
    if (type == "ContentReferenceEvent") return "Content Referenced";
    if (type == "CreateEvent") return "Created";
    if (type == "DeleteEvent") return "Deleted";
    if (type == "DeployKeyEvent") return "Deployed Key";
    if (type == "DeploymentEvent") return "Deployed";
    if (type == "DeploymentStatusEvent") return "Deployment Status";
    if (type == "DownloadEvent") return "Downloaded";
    if (type == "FollowEvent") return "Followed";
    if (type == "ForkEvent") return "Forked";
    if (type == "ForkApplyEvent") return "Applied Fork";
    if (type == "GitHubAppAuthorizationEvent") return "GitHub AppAuthorization";
    if (type == "GistEvent") return "Gist";
    if (type == "GollumEvent") return "Gollum";
    if (type == "InstallationEvent") return "Installation";
    if (type == "InstallationRepositoriesEvent") {
      return "Installation Repositories";
    }
    if (type == "IssueCommentEvent") return "Commented on Issue";
    if (type == "IssuesEvent") return "Issues";
    if (type == "LabelEvent") return "Labelled";
    if (type == "MarketplacePurchaseEvent") return "Marketplace Purchase";
    if (type == "MemberEvent") return "Member";
    if (type == "MembershipEvent") return "Membership";
    if (type == "MetaEvent") return "Meta";
    if (type == "MilestoneEvent") return "Milestone";
    if (type == "OrganizationEvent") return "Organization";
    if (type == "OrgBlockEvent") return "Org Blocked";
    if (type == "PackageEvent") return "Packaged";
    if (type == "PageBuildEvent") return "PageBuild";
    if (type == "ProjectCardEvent") return "Project Card";
    if (type == "ProjectColumnEvent") return "Project Column";
    if (type == "ProjectEvent") return "Project";
    if (type == "PublicEvent") return "Public";
    if (type == "PullRequestEvent") return "Pull Requested";
    if (type == "PullRequestReviewEvent") return "Reviewed Pull Request";
    if (type == "PullRequestReviewCommentEvent") {
      return "Commented Pull Request Review";
    }
    if (type == "PushEvent") return "Pushed";
    if (type == "ReleaseEvent") return "Released";
    if (type == "RepositoryDispatchEvent") return "Repository Dispatch";
    if (type == "RepositoryEvent") return "Repository";
    if (type == "RepositoryImportEvent") return "Repository Import";
    if (type == "RepositoryVulnerabilityAlertEvent") {
      return "Repository Vulnerability Alert";
    }
    if (type == "SecurityAdvisoryEvent") return "Security Advisory";
    if (type == "SponsorshipEvent") return "Sponsorship";
    if (type == "StarEvent") return "Starred";
    if (type == "StatusEvent") return "Status";
    if (type == "TeamEvent") return "Team";
    if (type == "TeamAddEvent") return "Team Added";
    if (type == "WatchEvent") return "Watched";
    return type;
  }

  // generate a random color from fcColors list basing on the above string types e.g. "PushEvent" gets fcColors[0]

}

//  GithubActor Class for a given event
class GithubActor {
  // actor id
  final int id;

  // actor login
  final String login;

  // actor display login
  final String displayLogin;

  // actor url
  final String url;

  GithubActor({
    required this.id,
    required this.login,
    required this.displayLogin,
    required this.url,
  });

  // get actor from json
  // e.g
  // "actor": {
  //   "id": 811495,
  //   "login": "Bugzer0",
  //   "display_login": "Bugzer0",
  //   "gravatar_id": "",
  //   "url": "https://api.github.com/users/Bugzer0",
  //   "avatar_url": "https://avatars.githubusercontent.com/u/811495?"
  // },
  factory GithubActor.fromJson(Map<String, dynamic> json) {
    return GithubActor(
      id: json['id'] as int,
      login: json['login'] as String,
      displayLogin: json['display_login'] as String,
      url: json['url'] as String,
    );
  }
}

// get GithubEventRepository Class from json above
// it has id, name and url as properties
class GithubEventRepo {
  // repo id
  final int id;

  // repo name
  final String name;

  // repo url
  final String url;

  GithubEventRepo({
    required this.id,
    required this.name,
    required this.url,
  });

  // get repo from json
  // e.g
  // "repo": {
  //   "id": 113233163,
  //   "name": "fluttercommunity/chewie",
  //   "url": "https://api.github.com/repos/fluttercommunity/chewie"
  // },
  factory GithubEventRepo.fromJson(Map<String, dynamic> json) {
    return GithubEventRepo(
      id: json['id'] as int,
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }
}

// get GithubEventPayload Class from json above
// it has action and target as properties
class GithubEventPayload {
  // action this is the major one
  final String? action;

  // other contents of the payload include the following
  // issue, pull_request, release, repository, and organization etc

  GithubEventPayload({
    this.action,
  });

  // get payload from json
  factory GithubEventPayload.fromJson(Map<String, dynamic> json) {
    return GithubEventPayload(
      action: json['action'] as String?,
    );
  }
}
