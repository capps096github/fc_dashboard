import 'package:firebase_auth/firebase_auth.dart';

final currentAppUser = FirebaseAuth.instance.currentUser;

// user anme and password
final String? userName = currentAppUser?.displayName;
final String? userEmail = currentAppUser?.email;
final  userToken = currentAppUser?.providerData[0].providerId;
