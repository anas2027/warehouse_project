import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:warehouse_project/core/colors/colors.dart';
import 'package:warehouse_project/core/constant/constants.dart';
import 'package:warehouse_project/feature/home_page/presention/get_x/dashboard_getx/dashboard_controller.dart';

class DashBoardPage extends StatelessWidget {
  DashboardController controller = Get.find();
  MyColors colors = MyColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.appbar,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextDefault(
                      maxLine: 1,
                      colorText: colors.textcolors,
                      fontWeight: FontWeight.bold,
                      fontsize: 30,
                      textOverflow: TextOverflow.ellipsis,
                      contentText: 'Most pharamacy purhsed'),
                  Divider(
                    color: colors.appbar,
                    thickness: 3,
                  ),
                  GetBuilder<DashboardController>(builder: (controller) {
                    if (controller.phmostsale.isEmpty) {
                      return CircularProgressIndicator();
                    } else {
                      return SizedBox(
                        height: 530,
                        child: ListView.separated(
                            itemBuilder: (context, index) => ListTile(
                                  leading: const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assests/image/pharmacy.png'),
                                      maxRadius: 33),
                                  title: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: TextDefault(
                                        maxLine: 2,
                                        colorText: colors.textcolors,
                                        fontWeight: FontWeight.bold,
                                        fontsize: 26,
                                        textOverflow: TextOverflow.ellipsis,
                                        contentText:
                                            '${controller.phmostsale[index].name_ph}'),
                                  ),
                                  visualDensity: VisualDensity(vertical: 3),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: TextDefault(
                                        maxLine: 2,
                                        colorText: colors.textcolors,
                                        fontWeight: FontWeight.bold,
                                        fontsize: 15,
                                        textOverflow: TextOverflow.ellipsis,
                                        contentText:
                                            '${controller.phmostsale[index].email} \n owner: ${controller.phmostsale[index].name} '),
                                  ),
                                  trailing: Padding(
                                    padding: const EdgeInsets.only(top: 30),
                                    child: TextDefault(
                                        maxLine: 2,
                                        colorText: colors.textcolors,
                                        fontWeight: FontWeight.bold,
                                        fontsize: 15,
                                        textOverflow: TextOverflow.ellipsis,
                                        contentText:
                                            'city: ${controller.phmostsale[index].city} \n owner: ${controller.phmostsale[index].phone} '),
                                  ),
                                ),
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: colors.appbar,
                                thickness: 3,
                              );
                            },
                            itemCount: controller.phmostsale.length),
                      );
                    }
                  })
                ],
              ),
          separatorBuilder: (context, index) {
            return SizedBox();
          },
          itemCount: 1),
    );
  }
}
