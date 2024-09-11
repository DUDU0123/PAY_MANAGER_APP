import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:payee_info/core/constants/height_width.dart';
import 'package:payee_info/core/utils/message_show_helper.dart';
import 'package:payee_info/core/utils/navigator_key.dart';
import 'package:payee_info/view/widgets/home/home_body_widgets.dart';
import 'package:payee_info/view/widgets/home/home_small_widgets.dart';
import 'package:payee_info/view/widgets/home/visitor_list_widget.dart';
import 'package:payee_info/view_model/mobx/user_mobx.dart';
import 'package:provider/provider.dart';

Widget homeBody({
  required TextEditingController amountController,
}) {
  final userMobx = Provider.of<UserMobx>(navigatorKey!.currentContext!);
  bool isSnackbarShown = false;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      userProfileCard(),
      kHeight15,
      Observer(builder: (_) {
        return userAmountEditWidget(
          controller: amountController,
          amount: userMobx.paymentAmount,
          onChanged: (value) {
            if (value.isNotEmpty) {
              int amount = int.parse(amountController.text);
              if (amount <= 0 || amount > 2500) {
                if (!isSnackbarShown) {
                  isSnackbarShown = true;
                  MessageShowHelper.showSnackbar(
                    context: navigatorKey!.currentContext!,
                    snackBarContent: "Amount must be in range 1-2500",
                  );
                }
              }
              userMobx.updatePaymentAmount(value);
            } else {
              userMobx.updatePaymentAmount('0');
              isSnackbarShown = false;
            }
          },
        );
      }),
      kHeight10,
      Observer(
        builder: (_) {
          return paymentMethodToggle(
            isCash: userMobx.paymentMethod == 'cash',
            onToggle: (isCash) {
              userMobx.paymentMethod = isCash ? 'cash' : 'UPI';
              userMobx.isDataEdited = true;
            },
          );
        },
      ),
      kHeight25,
      visitorsTitle(),
      Expanded(
        child: visitorListWidget(),
      ),
    ],
  );
}
