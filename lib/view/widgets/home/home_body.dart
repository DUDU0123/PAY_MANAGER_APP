import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:payee_info/core/constants/colors.dart';
import 'package:payee_info/core/constants/height_width.dart';
import 'package:payee_info/core/utils/navigator_key.dart';
import 'package:payee_info/view/widgets/home/home_small_widgets.dart';
import 'package:payee_info/view/widgets/home/visitor_list_widget.dart';
import 'package:payee_info/view_model/mobx/user_mobx.dart';
import 'package:provider/provider.dart';

Widget homeBody({
  required TextEditingController amountController,
}) {
  final userMobx = Provider.of<UserMobx>(navigatorKey!.currentContext!);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Center(
        child: Observer(
          builder: (_) => Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kGrey.withOpacity(0.2),
              border: userMobx.paymentMethod == 'UPI'
                  ? Border.all(color: kGreen, width: 3)
                  : null,
            ),
            child: userMobx.userProfilePictureUrl.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      userMobx.userProfilePictureUrl,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Icon(
                    Icons.person,
                    size: 100,
                  ),
          ),
        ),
      ),
      kHeight10,
      Center(
        child: Observer(
          builder: (_) => userNameShowWidget(
            userName: userMobx.userName,
          ),
        ),
      ),
      Center(
        child: Observer(
          builder: (_) => userAmountShowWidget(
            amount: userMobx.paymentAmount,
          ),
        ),
      ),
      kHeight15,
      Observer(
        builder: (_) => userAmountEditWidget(
          controller: amountController,
          amount: userMobx.paymentAmount,
          onChanged: (value) {
            userMobx.updatePaymentAmount(value);
          },
        ),
      ),
      kHeight10,
      Observer(
        builder: (_) {
          return paymentMethodToggle(
            isCash: userMobx.paymentMethod ==
                'cash', // true if paymentMethod is 'cash'
            onToggle: (isCash) {
              userMobx.paymentMethod = isCash
                  ? 'cash'
                  : 'UPI'; // Set the paymentMethod based on the toggle
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
