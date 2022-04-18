import '../../fc_exporter.dart';
import '../body/delete_account_btn.dart';

AppBar userProfileAppbar({
  required BuildContext context,
  required User? user,
}) {
  return AppBar(
      backgroundColor: userProfileColor,
      title: Image.asset(
        "icons/fc.png",
        height: 40,
        width: 40,
      ),
      actions: [
        if (user != null)
          PopupMenuButton(
            padding: EdgeInsets.zero,
            onSelected: (_) => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.more_vert,
              color: fcWhite,
            ),
            itemBuilder: (context) => [
              const PopupMenuItem(
                enabled: false,
                padding: EdgeInsets.zero,
                child: DeleteAccountButton(),
              )
            ],
          ),
      ],
      leading: BackButton(
        onPressed: () {
          // pop back to the next previous screen
          context.go(homePath);
        },
      ));
}
