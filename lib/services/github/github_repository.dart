// * for sample of repo json, check data/repos.json

class GithubRepository {
  // repo Id
  final int id;

  // repo name
  final String name;

  // repo full name
  final String fullName;

  // repo description
  final String? description;

  // language
  final String? language;

  // stargazers count
  final int stargazersCount;

  // is private
  final bool isPrivate;

  // * is fork
  final bool isFork;

  // forks
  final int forksCount;

  // forks url (onclick of Forks Icon)
  final String forksUrl;

  // * has issues
  final bool hasIssues;

  // open issues count
  final int openIssuesCount;

  // * watchers count
  final int watchersCount;

  //* repo url
  final String url;

  //* repo html url
  // will be opened using link launcher
  final String htmlUrl;

  // * repo clone url
  final String cloneUrl;

  // * repo ssh url
  final String sshUrl;

  // * repo git url
  final String gitUrl;

  // visibility - private or public
  final String visibility;

  // * dates
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime pushedAt;

  // *
  // is archived
  final bool archived;

  // is disabled
  final bool disabled;






  GithubRepository({
    required this.id,
    required this.name,
    required this.fullName,
    required this.description,
    required this.language,
    required this.stargazersCount,
    required this.isPrivate,
    required this.isFork,
    required this.forksCount,
    required this.forksUrl,
    required this.hasIssues,
    required this.openIssuesCount,
    required this.watchersCount,
    required this.url,
    required this.htmlUrl,
    required this.cloneUrl,
    required this.sshUrl,
    required this.gitUrl,
    required this.visibility,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    required this.archived,
    required this.disabled,
  });

  factory GithubRepository.fromJson(Map<String, dynamic> json) {
    return GithubRepository(
      id: json['id'] as int,
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      description: json['description'] as String?,
      language: json['language'] as String?,
      stargazersCount: json['stargazers_count'] as int,
      isPrivate: json['private'] as bool,
      isFork: json['fork'] as bool,
      forksCount: json['forks_count'] as int,
      forksUrl: json['forks_url'] as String,
      hasIssues: json['has_issues'] as bool,
      openIssuesCount: json['open_issues_count'] as int,
      watchersCount: json['watchers'] as int,
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      cloneUrl: json['clone_url'] as String,
      sshUrl: json['ssh_url'] as String,
      gitUrl: json['git_url'] as String,
      visibility: json['visibility'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      pushedAt: DateTime.parse(json['pushed_at'] as String),
      archived: json['archived'] as bool,
      disabled: json['disabled'] as bool,
    );
  }

  // toJson factory
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'full_name': fullName,
      'description': description,
      'language': language,
      'stargazers_count': stargazersCount,
      'private': isPrivate,
      'fork': isFork,
      'forks_count': forksCount,
      'forks_url': forksUrl,
      'has_issues': hasIssues,
      'open_issues_count': openIssuesCount,
      'watchers': watchersCount,
      'url': url,
      'html_url': htmlUrl,
      'clone_url': cloneUrl,
      'ssh_url': sshUrl,
      'git_url': gitUrl,
      'visibility': visibility,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'pushed_at': pushedAt.toIso8601String(),
      'archived': archived,
      'disabled': disabled,
    };
  }

  // get repo from id
  @override
  String toString() {
    return 'GthubRepository{id: $id, name: $name, fullName: $fullName, description: $description, language: $language, stargazersCount: $stargazersCount, isPrivate: $isPrivate, isFork: $isFork, forksCount: $forksCount, forksUrl: $forksUrl, hasIssues: $hasIssues, openIssuesCount: $openIssuesCount, watchersCount: $watchersCount, url: $url, htmlUrl: $htmlUrl, cloneUrl: $cloneUrl, sshUrl: $sshUrl, gitUrl: $gitUrl, visibility: $visibility, createdAt: $createdAt, updatedAt: $updatedAt, pushedAt: $pushedAt, archived: $archived, disabled: $disabled}';
  }
}
