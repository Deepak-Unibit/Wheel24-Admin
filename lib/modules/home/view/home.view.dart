import 'package:flutter/material.dart';
import 'package:flutter_web_pagination/flutter_web_pagination.dart';
import 'package:get/get.dart';
import 'package:wheel24_admin/components/primaryButton.component.dart';
import 'package:wheel24_admin/helper/date.helper.dart';
import 'package:wheel24_admin/modules/home/controller/home.controller.dart';
import '../../../components/drawer/drawer.component.dart';
import '../../../components/text.component.dart';
import '../../../components/textField.component.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.scaffoldStateKey,
      backgroundColor: context.theme.colorScheme.surface,
      drawer: DrawerComponent(scaffoldKey: homeController.scaffoldStateKey),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Builder(builder: (context) {
          return AppBar(
            backgroundColor:
                context.theme.colorScheme.surfaceContainerLow.withOpacity(0.1),
            centerTitle: true,
            title: Text(
              "Users List",
              style: TextStyle(
                color: context.theme.colorScheme.onSurface,
              ),
            ),
            leading: MaterialButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              minWidth: 0,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              visualDensity: VisualDensity.compact,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              child: Icon(
                Icons.menu_outlined,
                size: 28,
                color: context.theme.colorScheme.onSurface,
              ),
            ),
            actions: [
              MaterialButton(
                onPressed: () => homeController.onRefresh(),
                minWidth: 0,
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Icon(
                  Icons.refresh,
                  size: 24,
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(width: 20),
            ],
          );
        }),
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
                  width: 260,
                  child: TextFieldComponent(
                    textEditingController: homeController.searchController,
                    hintText: "Search with Telegram Id/Phone No.",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    maxLength: 100,
                    onSubmitted: homeController.onSearch,
                  ),
                ),
                const SizedBox(width: 10),
                PrimaryButtonComponent(
                  onClick: () => homeController.onSearch(),
                  text: "Search",
                  height: 40,
                  width: 70,
                  fontSize: 14,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: Get.width <= 500 ? 860 : 1800,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: Get.width <= 500
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.spaceBetween,
                        children: const [
                          TextComponent(
                            text: "Sl. No.",
                            isHeading: true,
                            width: 60,
                          ),
                          SizedBox(width: 20),
                          TextComponent(
                            text: "Name",
                            isHeading: true,
                            width: 100,
                          ),
                          SizedBox(width: 20),
                          TextComponent(
                            text: "Telegram Id",
                            isHeading: true,
                            width: 100,
                          ),
                          SizedBox(width: 20),
                          TextComponent(
                            text: "Phone No.",
                            isHeading: true,
                            width: 100,
                          ),
                          SizedBox(width: 20),
                          TextComponent(
                            text: "Earned Amount",
                            isHeading: true,
                            width: 120,
                          ),
                          SizedBox(width: 20),
                          TextComponent(
                            text: "Referral",
                            isHeading: true,
                            width: 65,
                          ),
                          SizedBox(width: 20),
                          TextComponent(
                            text: "Joined Date",
                            isHeading: true,
                            width: 190,
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
                                    mainAxisAlignment: Get.width <= 500
                                        ? MainAxisAlignment.start
                                        : MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextComponent(
                                        text:
                                            "${(homeController.totalCount.value - ((homeController.currentPage.value - 1) * 20)) - index}",
                                        width: 60,
                                      ),
                                      const SizedBox(width: 20),
                                      TextComponent(
                                        text: homeController.userDataList[index]
                                                .firstName ??
                                            "",
                                        width: 100,
                                      ),
                                      const SizedBox(width: 20),
                                      TextComponent(
                                        text: homeController.userDataList[index]
                                                .telegramId ??
                                            "",
                                        width: 100,
                                      ),
                                      const SizedBox(width: 20),
                                      TextComponent(
                                        text: homeController.userDataList[index]
                                                .phoneNumber ??
                                            "--",
                                        width: 100,
                                      ),
                                      const SizedBox(width: 20),
                                      TextComponent(
                                        text:
                                            "₹ ${((homeController.userDataList[index].earnedAmount ?? 0.0) * 100).truncate() / 100}",
                                        width: 120,
                                      ),
                                      const SizedBox(width: 20),
                                      TextComponent(
                                        text: homeController
                                            .userDataList[index].referralCount
                                            .toString(),
                                        width: 65,
                                      ),
                                      const SizedBox(width: 20),
                                      TextComponent(
                                        text: DateHelper().dateFormatNull(
                                            date: homeController
                                                    .userDataList[index]
                                                    .createdAt ??
                                                "",
                                            format: "dd-MM-yyyy hh:mm:ss a"),
                                        width: 190,
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(
                () => WebPagination(
                  onPageChanged: (value) => homeController.onPageChanged(value),
                  currentPage: homeController.currentPage.value,
                  totalPage: homeController.totalPages.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
