import '../../fc_exporter.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppButton.small(
        onTap: () {
          //  delete account logic here
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "DELETE ACCOUNT",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.spartan(
                        color: fcWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const ThickHorizontalDivider(dividerColor: fcWhite),
                ],
              ),
              contentPadding: EdgeInsets.zero,
              backgroundColor: fcError,
              content: Container(
                decoration: BoxDecoration(
                  color: fcWhite,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Are you sure you want to delete your account?",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    AppButton(
                      text: "CANCEL",
                      onTap: () {
                        //  pop
                        Navigator.of(context).pop();
                      },
                      textColor: fcColor,
                      buttonColor: fcWhite,
                    ),
                    AppButton(
                      text: "DELETE",
                      onTap: () async {
                        //  delete account logic here
                        try {
                          await FirebaseAuth.instance.currentUser!.delete();
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'requires-recent-login') {
                            // ignore: avoid_print
                            print(
                                'The user must reauthenticate before this operation can be executed.');
                          }
                        }

                        //  pop
                        Navigator.of(context).pop();
                      },
                      textColor: fcError,
                      buttonColor: fcWhite,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        textColor: fcWhite,
        buttonColor: fcError,
        text: "DELETE ACCOUNT",
      ),
    );
  }
}
