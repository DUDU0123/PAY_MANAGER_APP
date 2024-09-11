import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:payee_info/core/constants/colors.dart';
import 'package:payee_info/core/constants/height_width.dart';
import 'package:payee_info/core/utils/navigator_key.dart';
import 'package:payee_info/model/models/visitor_model/visitor_model.dart';
import 'package:payee_info/view/widgets/common_widgets/text_widget_common.dart';
import 'package:payee_info/view/widgets/home/home_small_widgets.dart';
import 'package:payee_info/view_model/mobx/user_mobx.dart';
import 'package:provider/provider.dart';

Widget userProfileCard() {
  final userMobx = Provider.of<UserMobx>(navigatorKey!.currentContext!);
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Center(
            child: Observer(
              builder: (_) => Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kGrey.withOpacity(0.2),
                  border: userMobx.isDataEdited
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
        ],
      ),
    ),
  );
}
Widget visitorsTitle() {
  final userMobx = Provider.of<UserMobx>(navigatorKey!.currentContext!);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const TextWidgetCommon(
        text: "Visitors",
        fontSize: 18,
        textColor: kBlack,
        fontWeight: FontWeight.w500,
      ),
      ElevatedButton.icon(
        icon: const Icon(
          Icons.person_add_outlined,
          color: kBlack,
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: kWhite,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {
          final Visitor visitor = Visitor(
              amount: 1000, name: 'Visitor ${userMobx.visitors.length + 1}');
          userMobx.addVisitor(visitor: visitor);
        },
        label: const TextWidgetCommon(
          text: "Add visitors",
          fontSize: 16,
          textColor: kBlack,
          fontWeight: FontWeight.w500,
        ),
      )
    ],
  );
}