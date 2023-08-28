import 'package:flutter/material.dart';
import 'package:mobile_store/constants/size_config.dart';
import 'package:mobile_store/widgets/infomation_widgets/address_list.dart';
import 'package:mobile_store/widgets/infomation_widgets/nav_tab.dart';
import 'package:mobile_store/widgets/infomation_widgets/user_information.dart';
import 'package:mobile_store/widgets/order_tab.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/promotion_tab.dart';
import 'package:mobile_store/cubit/app_cubits.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({super.key});

  @override
  State<InformationPage> createState() => _InformationPage();
}

class _InformationPage extends State<InformationPage> {
  int _currentTab = 0;

  final screens = [
    const Expanded(
        child: Column(
      children: [
        Expanded(child: UserInformation()),
        Expanded(child: AddressList())
      ],
    )),
    const Expanded(child: OrderTab()),
    const Expanded(child: PromotionTab())
  ];

  void onNavBarClicked(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[300],
        // appBar: AppBar(title: const Text('Mobile Store'),),
        appBar: CustomAppBar(
          logged: true,
          title: '',
          showUserInfo: true,
          context: context,
          user: AppCubits.userData,
        ),
        body: Column(children: [
          SizedBox(
            height: 9,
          ),
          NavBarUserInfor(onNavBarClicked: onNavBarClicked),
          screens[_currentTab],
        ]));
  }
}
