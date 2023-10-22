import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/core/colors/colors.dart';
import 'package:warehouse_project/core/constant/constants.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/order_detail_getx/order_detail_controller.dart';

class OrderDetailPage extends StatelessWidget {
  OrderDetailController controller = Get.find();
  Color defaulColor = Color.fromARGB(255, 235, 233, 233);
  MyColors colors = MyColors();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: defaulColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: defaulColor,
      ),
      body: GetBuilder<OrderDetailController>(
        builder: (controller) {
          if (controller.orderDetail.isNotEmpty) {
            return ListView.separated(
                itemBuilder: (context, index) => SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: size.height * 0.8,
                            width: size.width * 0.9,
                            color: Color.fromARGB(255, 249, 255, 252),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assests/image/pharmacy.png'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: TextDefault(
                                            maxLine: 1,
                                            colorText: colors.textcolors,
                                            fontWeight: FontWeight.bold,
                                            fontsize: 30,
                                            textOverflow: TextOverflow.ellipsis,
                                            contentText:
                                                '${controller.orderDetail[index].name_ph}'),
                                      )
                                    ],
                                  ),
                                  Container(
                                    height: 15,
                                    color: defaulColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Container(
                                        color:
                                            Color.fromARGB(255, 223, 219, 219),
                                        height: 150,
                                        width: 200,
                                        child: Image(
                                            image: NetworkImage(
                                                '${controller.orderDetail[index].image}')),
                                      ),
                                    ),
                                  ),
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 30,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText:
                                          '${controller.orderDetail[index].name_med}:'),
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 25,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText:
                                          '${controller.orderDetail[index].mg}'),
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 25,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText:
                                          '${controller.orderDetail[index].exp}'),
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 25,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText:
                                          '${controller.orderDetail[index].descrption}'),
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 25,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText:
                                          '${controller.orderDetail[index].price_pharmacy}'),
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 25,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText:
                                          '${controller.orderDetail[index].price_customer}'),
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 25,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText:
                                          '${controller.orderDetail[index].quantity}'),
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 25,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText:
                                          '${controller.orderDetail[index].name_ph}'),
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 25,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText:
                                          '${controller.orderDetail[index].quantity}'),
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 25,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText:
                                          '${controller.orderDetail[index].city}'),
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 25,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText:
                                          '${controller.orderDetail[index].street}'),
                                  TextDefault(
                                      maxLine: 1,
                                      colorText: colors.textcolors,
                                      fontWeight: FontWeight.bold,
                                      fontsize: 25,
                                      textOverflow: TextOverflow.ellipsis,
                                      contentText:
                                          '${controller.orderDetail[index].phone}'),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            indent: 80,
                            endIndent: 80,
                            thickness: 2,
                            color: Color.fromARGB(255, 31, 31, 30),
                          )
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: size.height * 0.03,
                    ),
                itemCount: controller.orderDetail.length);
          } else {
            return controller.isloading
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextDefault(
                          maxLine: 2,
                          colorText: colors.textcolors,
                          fontWeight: FontWeight.bold,
                          fontsize: 30,
                          textOverflow: TextOverflow.ellipsis,
                          contentText: 'No Added Medcine to this Order '),
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: colors.textcolors,
                    ),
                  );
          }
        },
      ),
    );
  }
}
