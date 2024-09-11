import 'package:flutter/material.dart';
import 'package:payee_info/view/widgets/home/home_body.dart';
import 'package:provider/provider.dart';
import 'package:payee_info/view_model/mobx/user_mobx.dart';
import 'package:payee_info/view/widgets/home/home_small_widgets.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userMobx = Provider.of<UserMobx>(context, listen: false);
      userMobx.fetchUser();
    });
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userMobx = Provider.of<UserMobx>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: homeAppBar(userMobx: userMobx, controller: amountController),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: homeBody(amountController: amountController),
          ),
        ),
      ),
      floatingActionButton: visitorsAddButton(userMobx: userMobx),
    );
  }
}

