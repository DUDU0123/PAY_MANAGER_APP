import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:payee_info/core/constants/colors.dart';
import 'package:payee_info/core/constants/height_width.dart';
import 'package:payee_info/core/utils/navigator_key.dart';
import 'package:payee_info/view/widgets/common_widgets/text_widget_common.dart';
import 'package:payee_info/view_model/mobx/user_mobx.dart';
import 'package:provider/provider.dart';

Widget visitorListWidget() {
  final userMobx = Provider.of<UserMobx>(navigatorKey!.currentContext!);
  return Observer(builder: (_) {
    if (userMobx.visitors.isEmpty||userMobx.visitors==null) {
      return Center(
        child: TextWidgetCommon(
          text: "No Visitors",textColor: kGrey.withOpacity(0.8),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemBuilder: (context, index) {
        return ListTile(
          title: TextWidgetCommon(
            text: userMobx.visitors[index].name!,
            fontWeight: FontWeight.bold,
            textColor: kBlack,
            fontSize: 16,
          ),
          subtitle: TextWidgetCommon(
            text: userMobx.visitors[index].amount.toString(),
            fontWeight: FontWeight.w400,
            textColor: kBlack,
            fontSize: 15,
          ),
        );
      },
      separatorBuilder: (context, index) => kHeight10,
      itemCount: userMobx.visitors.length,
    );
  });
}
