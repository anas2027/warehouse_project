import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/add_medcine_getx/add_medcine_binding.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/alert_getx/alert_binding.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/dashboard_getx/dashboard_binding.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/my_wallet_getx/my_wallet_binding.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/order_detail_getx/order_detail_binding.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/recive_order_getx/recive_order_binding.dart';
import 'package:warehouse_project/feature/home_page/presention/page/add_medcine_page.dart';
import 'package:warehouse_project/feature/home_page/presention/page/alert_page.dart';
import 'package:warehouse_project/feature/home_page/presention/page/drawer/dashboard_page.dart';
import 'package:warehouse_project/feature/home_page/presention/page/edit_medcine_page.dart';
import 'package:warehouse_project/feature/home_page/presention/page/my_wallet_page.dart';
import 'package:warehouse_project/feature/home_page/presention/page/order_detail_page.dart';
import 'package:warehouse_project/feature/home_page/presention/page/recive_order_page.dart';

import 'feature/auth/presention/get_x/auth_binding.dart';
import 'feature/auth/presention/page/login_page.dart';
import 'feature/home_page/presention/get_x/edit_medcine_getx/edit_medcine_binding.dart';
import 'feature/home_page/presention/get_x/home_page_getx/home_page_binding.dart';
import 'feature/home_page/presention/page/home_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//https://www.productsfromjamaica.com/wp-content/uploads/cetamol-pai-reliver-1-e1605223774844.jpg
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, getPages: [
      GetPage(name: '/', page: (() => Register()), binding: AuthBinding()),
      GetPage(
          name: '/homePage',
          page: (() => HomePageScreen()),
          binding: HomePageBindings()),
      GetPage(
          name: '/AddMedcinePage',
          page: () => AddMedcinePage(),
          binding: AddMedcineBinding()),
      GetPage(
        name: '/EditMedcinePage',
        page: () => EditMedcinePage(),
        binding: EditMedcineBinding(),
      ),
      GetPage(
          name: '/Mywallet',
          page: (() => MyWallet()),
          binding: MyWalletBinding()),
      GetPage(
          name: '/Reciveorder',
          page: () => Reciveorder(),
          binding: ReciveOrderBinding()),
      GetPage(
          name: '/orderDetail',
          page: () => OrderDetailPage(),
          binding: OrderDetailBinding()),
      GetPage(
          name: '/alertPage', page: () => Alertpage(), binding: AlertBinding()),
      GetPage(
          name: '/Dashboard',
          page: () => DashBoardPage(),
          binding: dashboardBinding()),
    ]);
  }
}
