import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payee_info/core/constants/colors.dart';
import 'package:payee_info/core/utils/navigator_key.dart';
import 'package:payee_info/model/models/visitor_model/visitor_model.dart';
import 'package:payee_info/view/widgets/common_widgets/text_field_common_widget.dart';
import 'package:payee_info/view/widgets/common_widgets/text_widget_common.dart';
import 'package:payee_info/view_model/mobx/user_mobx.dart';

Widget visitorsAddButton({
  required UserMobx userMobx,
}) {
  return FloatingActionButton.extended(
    backgroundColor: kWhite,
    onPressed: () {
      final Visitor visitor = Visitor(
          amount: 1000, name: 'Visitor ${userMobx.visitors.length + 1}');
      userMobx.addVisitor(visitor: visitor);
    },
    label: const TextWidgetCommon(
      text: "Add Visitor",
      fontWeight: FontWeight.bold,
      textColor: kBlack,
      fontSize: 16,
    ),
  );
}

Widget userAmountShowWidget({required String amount}) {
  return TextWidgetCommon(
    text: amount,
    fontWeight: FontWeight.w500,
    textColor: kBlack,
    fontSize: 18,
  );
}

Widget userAmountEditWidget({
  required String amount,
  required Function(String) onChanged,
  required TextEditingController controller,
}) {
  return SizedBox(
    width: MediaQuery.of(navigatorKey!.currentContext!).size.width / 2,
    child: TextFieldCommon(
      style: GoogleFonts.alegreyaSansSc(),
      onChanged: onChanged,
      keyboardType: TextInputType.number,
      controller: controller,
      textAlign: TextAlign.start,
      border: const OutlineInputBorder(),
      hintText: "Enter amount",
      labelText: "Edit amount",
    ),
  );
}

Widget paymentMethodToggle({
  required bool isCash,
  required Function(bool) onToggle,
}) {
  return Row(
    children: [
      const TextWidgetCommon(text: 'CASH'),
      Switch(
        value: !isCash,
        onChanged: (value) {
          onToggle(!value);
        },
      ),
      const TextWidgetCommon(text: 'UPI'),
    ],
  );
}

Widget userNameShowWidget({required String userName}) {
  return TextWidgetCommon(
    text: userName,
    fontWeight: FontWeight.bold,
    textColor: kBlack,
    fontSize: 20,
  );
}

Widget homeAppBar({
  required UserMobx userMobx,
  required TextEditingController controller,
}) {
  return AppBar(
    title: const TextWidgetCommon(text: "Payee Manager"),
    actions: [
      TextButton(
        onPressed: () {
          userMobx.clearData();
          controller.text = '2500';
        },
        child: const TextWidgetCommon(text: "Clear data"),
      ),
    ],
  );
}

Widget visitorsTitle() {
  return const TextWidgetCommon(
    text: "Visitors",
    fontSize: 18,
    textColor: kBlack,
    fontWeight: FontWeight.w500,
  );
}
