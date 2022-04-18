import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:http/http.dart' as http;

import '../exporter.dart';

const String githubUsername = "fluttercommunity";

class GithubRestApi {
  /// ? This fetches a list of Github Repos
  static final githubReposProvider = FutureProvider<List<GithubRepository>>(
    (ref) async {
      // String githubUsername = "capps096github";
      String url = "https://api.github.com/users/$githubUsername/repos";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // copy response.body to clipboard
        // await Clipboard.setData(ClipboardData(text: response.body.toString()));

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
        throw Exception('Failed to load repos');
      }
    },
  );

//? number of repos
  static final githubReposCountProvider = StateProvider<int>(
    (ref) =>
        ref.watch(githubReposProvider).whenData((repos) => repos.length).value!,
  );

//? This fetches the recent GithubEvent happening in the Flutter community
  static final githubEventsProvider = FutureProvider<List<GithubEvent>>(
    (ref) async {
      String url = "https://api.github.com/users/$githubUsername/events";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // copy response.body to clipboard
        // await Clipboard.setData(ClipboardData(text: response.body.toString()));

        // map the repos into a list of GthubRepository objects
        List<GithubEvent> events = [];
        List<Map<String, dynamic>> data = List.from(jsonDecode(response.body));
        for (Map<String, dynamic> n in data) {
          events.add(GithubEvent.fromJson(n));
        }

        return events;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load events');
      }
    },
  );

  //? get repo from url "https://api.github.com/repos/fluttercommunity/{repoName}"
  static final githubRepoFromUrlProvider =
      FutureProvider.family<GithubRepository, String>(
    (ref, repoUrl) async {
      String url = repoUrl;

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // copy response.body to clipboard
        await Clipboard.setData(ClipboardData(text: response.body.toString()));

        return GithubRepository.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load repo');
      }
    },
  );

  //? get repo from name passed to this url "https://api.github.com/repos/fluttercommunity/{repoName}"
  static final githubRepoFromNameProvider =
      FutureProvider.family<GithubRepository, String>(
    (ref, repoName) async {
      String url = "https://api.github.com/repos/fluttercommunity/$repoName";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // copy response.body to clipboard
        // await Clipboard.setData(ClipboardData(text: response.body.toString()));

        return GithubRepository.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load repo');
      }
    },
  );

  // acess an organisation
  static final githubOrganisationProvider = FutureProvider<String>(
    (ref) async {
      String url = "https://api.github.com/orgs/$githubUsername";

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // copy response.body to clipboard
        await Clipboard.setData(ClipboardData(text: response.body.toString()));

        return jsonDecode(response.body).toString();
        // return GithubOrganisation.fromJson(jsonDecode(response.body));
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load organisation');
      }
    },
  );
}
