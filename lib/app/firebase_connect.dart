import '../fc_exporter.dart';
import '../firebase_options.dart';
import 'fc_dashboard.dart';

///This Connects the FC App to Firebase
class FirebaseConnect extends ConsumerWidget {
  const FirebaseConnect({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final firebaseConnector = ref.watch(_firebaseProvider);

    return firebaseConnector.when(
      data: (_) => const FCDashboard(),
      loading: () => Container(
        color: fcColor,
        child: Center(
          child: Image.asset(
            "icons/fc.png",
            height: 56,
            width: 56,
          ),
        ),
      ),
      error: (error, stackTrace) => ErrorWidget(error),
    );
  }
}

final _firebaseProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
});
