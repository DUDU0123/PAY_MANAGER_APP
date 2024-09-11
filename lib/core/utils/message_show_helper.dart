import 'package:flutter/material.dart';
import 'package:payee_info/core/constants/colors.dart';
import 'package:payee_info/core/utils/navigator_key.dart';
import 'package:payee_info/view/widgets/common_widgets/text_widget_common.dart';

class MessageShowHelper {
 static void showDialogBox({
    required BuildContext context,
    required String dialogTitle,
    required String dialogContent,
    required String actionButtonName,
    required void Function()? buttonActionMethod,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: TextWidgetCommon(
          text: dialogTitle,
          fontSize: 18,
        ),
        content: TextWidgetCommon(
          fontSize: 16,
          text: dialogContent,
        ),
        actions: [
          commonTextButton(
            buttonActionMethod: () {
              navigatorKey?.currentState?.pop();
            },
            buttonText: 'Cancel',
          ),
          commonTextButton(
            buttonActionMethod: buttonActionMethod,
            buttonText: actionButtonName,
          ),
        ],
      ),
    );
  }

 static void showSnackbar({
    required BuildContext context,
    required String snackBarContent,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        content: TextWidgetCommon(
          text: snackBarContent,textColor: kWhite,
          fontSize: 16,
        ),
        backgroundColor: kOrange,
        duration: const Duration(seconds: 1,),
      ),
    );
  }
}
Widget commonTextButton({
  required String buttonText,
  required void Function()? buttonActionMethod,
}) {
  return TextButton(
    onPressed: buttonActionMethod,
    child: TextWidgetCommon(
      fontSize: 18,
      text: buttonText,
    ),
  );
}