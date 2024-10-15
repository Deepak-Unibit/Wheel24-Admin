import 'package:flutter/material.dart';
import 'package:flutter_web_pagination/flutter_web_pagination.dart';
import 'package:get/get.dart';
import 'package:wheel24_admin/components/primaryButton.component.dart';
import 'package:wheel24_admin/modules/home/controller/home.controller.dart';

import '../../../components/text.component.dart';
import '../../../components/textField.component.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  width: 320,
                  child: TextFieldComponent(
                    textEditingController: homeController.searchController,
                    hintText: "Search with Telegram Id/Phone No.",
                    textInputType: TextInputType.text,
                    maxLength: 100,
                  ),
                ),
                const SizedBox(width: 20),
                PrimaryButtonComponent(
                  onClick: () => homeController.onSearch(),
                  text: "Search",
                  height: 40,
                  width: 90,
                  fontSize: 16,
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextComponent(
                  text: "Name",
                  isHeading: true,
                  width: 200,
                ),
                TextComponent(
                  text: "Telegram Id",
                  isHeading: true,
                  width: 120,
                ),
                TextComponent(
                  text: "Earned Amount",
                  isHeading: true,
                  width: 250,
                ),
                TextComponent(
                  text: "Referral",
                  isHeading: true,
                ),
                TextComponent(
                  text: "Status",
                  isHeading: true,
                  width: 80,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(
                () => homeController.userDataList.isEmpty
                    ? const Center(
                        child: Text("No Data Found"),
                      )
                    : ListView.separated(
                        itemCount: homeController.userDataList.length,
                        separatorBuilder: (context, index) => Divider(
                          height: 20,
                          color: context.theme.colorScheme.onSurface
                              .withOpacity(0.15),
                        ),
                        itemBuilder: (context, index) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextComponent(
                              text: homeController
                                  .userDataList[index].firstName ??
                                  "",
                              width: 200,
                            ),
                            TextComponent(
                              text: homeController
                                      .userDataList[index].telegramId ??
                                  "",
                              width: 120,
                            ),
                            TextComponent(
                              text: homeController
                                  .userDataList[index].earnedAmount
                                  .toString(),
                              width: 250,
                            ),
                            TextComponent(
                              text: homeController
                                  .userDataList[index].referralCount
                                  .toString(),
                            ),
                            TextComponent(
                              text: homeController.userDataList[index].status ??
                                      false
                                  ? "Active"
                                  : "Inactive",
                              width: 80,
                            ),
                          ],
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 10),
            Obx(
              () => WebPagination(
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
