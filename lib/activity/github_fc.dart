import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../fc_exporter.dart';

Future<List<GithubRepository>> fetchGithubRepos() async {
  String githubUsername = "capps096github";
  String url = "https://api.github.com/users/$githubUsername/repos";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // this is a list of repos
    // final repos = response.body;

    // copy to clipboard
    await Clipboard.setData(ClipboardData(text: response.body));

    // map the repos into a list of GthubRepository objects
    List<GithubRepository> repos = [];
    List<Map<String, dynamic>> data = List.from(jsonDecode(response.body));
    for (Map<String, dynamic> n in data) {
      repos.add(GithubRepository.fromJson(n));
    }

    return repos;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class GithubDashboard extends StatefulWidget {
  const GithubDashboard({Key? key}) : super(key: key);

  @override
  _GithubDashboardState createState() => _GithubDashboardState();
}

class _GithubDashboardState extends State<GithubDashboard> {
  late Future<List<GithubRepository>> futureRepos;

  @override
  void initState() {
    super.initState();
    futureRepos = fetchGithubRepos();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<GithubRepository>>(
        future: futureRepos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data.toString());
          } else if (snapshot.hasError) {
            return Container(
              child: Text('${snapshot.error}'),
              color: fcError,
            );
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
