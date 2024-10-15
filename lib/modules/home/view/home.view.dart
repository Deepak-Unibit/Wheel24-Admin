import 'package:flutter/material.dart';
import 'package:flutter_web_pagination/flutter_web_pagination.dart';
import 'package:get/get.dart';
import 'package:wheel24_admin/modules/home/controller/home.controller.dart';

import '../../../components/text.component.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor:
            context.theme.colorScheme.surfaceContainerLow.withOpacity(0.1),
        centerTitle: true,
        title: Text(
          "Users List",
          style: TextStyle(
            color: context.theme.colorScheme.onSurface,
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () => homeController.onCashOutClick(),
            minWidth: 0,
            padding: const EdgeInsets.only(right: 20),
            visualDensity: VisualDensity.compact,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Icon(
              Icons.account_balance_wallet_outlined,
              size: 28,
              color: context.theme.colorScheme.onSurface,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextComponent(
                  text: "Telegram Id",
                  isColor: true,
                  width: 120,
                ),
                TextComponent(text: "Name", isColor: false, width: 250),
                TextComponent(
                  text: "Earned Amount",
                  isColor: true,
                  width: 250,
                ),
                TextComponent(
                  text: "Referral",
                  isColor: false,
                ),
                TextComponent(
                  text: "Status",
                  isColor: true,
                  width: 80,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(
                () =>homeController.userDataList.isEmpty ? const Center(child: Text("No Data Found"),) : ListView.separated(
                  itemCount: homeController.userDataList.length,
                  separatorBuilder: (context, index) => Divider(
                    height: 20,
                    color: context.theme.colorScheme.onSurface.withOpacity(0.15),
                  ),
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextComponent(
                        text:
                            homeController.userDataList[index].telegramId ?? "",
                        isColor: true,
                        width: 120,
                      ),
                      TextComponent(
                          text: homeController.userDataList[index].firstName ??
                              "",
                          isColor: false,
                          width: 250),
                      TextComponent(
                        text: homeController.userDataList[index].earnedAmount
                            .toString(),
                        isColor: true,
                        width: 250,
                      ),
                      TextComponent(
                        text: homeController.userDataList[index].referralCount
                            .toString(),
                        isColor: false,
                      ),
                      TextComponent(
                        text: homeController.userDataList[index].status ?? false
                            ? "Active"
                            : "Inactive",
                        isColor: true,
                        width: 80,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Obx(
                ()=> WebPagination(
                onPageChanged: (value) => homeController.onPageChanged(value),
                currentPage: homeController.currentPage.value,
                totalPage: homeController.totalPages.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
