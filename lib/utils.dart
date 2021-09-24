import 'package:flutter/cupertino.dart' as cupertino;
import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart';
import 'package:mycreditloans/constants.dart';
import 'package:mycreditloans/screens/root.dart';


/// Uses [cupertino.CupertinoPageRoute] on iOS and macOS
/// Uses [material.MaterialPageRoute] on the other platforms
///
Future<T?> platformPush<T>(BuildContext context, Widget screen) {
  switch (material.Theme.of(context).platform) {
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return Navigator.of(context).push<T>(cupertino.CupertinoPageRoute(
        builder: (context) => screen,
      ));
    default:
      return Navigator.of(context).push<T>(material.MaterialPageRoute(
        builder: (context) => screen,
      ));
  }
}

Widget buildCloseButton() {
  return Builder(builder: (context) {
    return IconButton(
      icon: Icon(Icons.close,color : Colors.black),
      splashRadius: Material.defaultSplashRadius / 2,
      onPressed: () => showPlatformAdaptiveDialog(context: context,
      title: Text("Esti sigur că vrei să închizi?"),
      content: Text("Vei pierde tot progresul."),
      primaryAction: () => platformPush(context, Root()),
      secondaryAction: () => Navigator.pop(context)
      ),color: Colors.black
      );
  });
}


Future<T?> showPlatformAdaptiveDialog<T>({
  required BuildContext context,
  Widget? title,
  Widget? content,
  VoidCallback? secondaryAction,
  VoidCallback? primaryAction,
  String secondaryLabel = 'Revino',
  String primaryLabel = 'Închide',
}) {
  switch (material.Theme.of(context).platform) {
    case TargetPlatform.iOS:
      return cupertino.showCupertinoDialog<T>(
        context: context,
        builder: (context) {
          return cupertino.CupertinoAlertDialog(
            title: title,
            content: content,
            actions: [
              if (secondaryAction != null)
                cupertino.CupertinoDialogAction(
                  child: Text(secondaryLabel),
                  onPressed: secondaryAction,
                ),
              if (primaryAction != null)
                cupertino.CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text(primaryLabel),
                  onPressed: primaryAction,
                ),
            ],
          );
        },
      );
    default:
      return material.showDialog<T>(
        context: context,
        builder: (context) {
          return material.AlertDialog(
            title: title,
            content: content,
            actions: [
              if (secondaryAction != null)
                material.TextButton(
                  child: Text(secondaryLabel , style : TextStyle(color: logoColor)),
                  onPressed: secondaryAction,
                ),
              if (primaryAction != null)
                material.InkWell(
                  onTap: primaryAction,
                  borderRadius: BorderRadius.circular(7),
                  child: material.Ink(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: material.Theme.of(context).primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        primaryLabel,
                        style: TextStyle(
                          color: material.Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      );
  }
}
