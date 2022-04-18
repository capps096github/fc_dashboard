import 'fc_exporter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: RootRestorationScope(
        restorationId: fcId,

        child: FirebaseConnect(),
      ),
    ),
  );
}
// Cephas@Github096