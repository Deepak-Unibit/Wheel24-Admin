import 'package:flutter/material.dart';
import 'package:flutter_web_pagination/flutter_web_pagination.dart';
import 'package:get/get.dart';
import 'package:wheel24_admin/modules/cashOut/controller/cashOut.controller.dart';

import '../../../components/primaryButton.component.dart';
import '../../../components/text.component.dart';
import '../../../components/textField.component.dart';

class CashOutView extends StatelessWidget {
  CashOutView({super.key});

  final CashOutController cashOutController = CashOutController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor:
            context.theme.colorScheme.surfaceContainerLow.withOpacity(0.1),
        centerTitle: true,
        title: Text(
          "Cash Out Request",
          style: TextStyle(
            color: context.theme.colorScheme.onSurface,
          ),
        ),
        actions: [
          MaterialButton(
            onPressed: () => cashOutController.onRefresh(),
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
                  width: 270,
                  child: TextFieldComponent(
                    textEditingController: cashOutController.searchController,
                    hintText: "Search with Telegram Id/Phone No.",
                    textInputType: TextInputType.text,
                    maxLength: 100,
                    textInputAction: TextInputAction.search,
                    onSubmitted: cashOutController.onSearch,
                  ),
                ),
                const SizedBox(width: 10),
                PrimaryButtonComponent(
                  onClick: () => cashOutController.onSearch(),
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
                  width: Get.width <= 500 ? 1225 : 1800,
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
                            text: "Referral",
                            isHeading: true,
                            width: 80,
                          ),
                          SizedBox(width: 20),
                          TextComponent(
                            text: "Acc. Holder Name",
                            isHeading: true,
                            width: 200,
                          ),
                          SizedBox(width: 20),
                          TextComponent(
                            text: "Phone No.",
                            isHeading: true,
                            width: 100,
                          ),
                          SizedBox(width: 20),
                          TextComponent(
                            text: "UPI ID",
                            isHeading: true,
                            width: 250,
                          ),
                          SizedBox(width: 20),
                          TextComponent(
                            text: "Amount",
                            isHeading: true,
                            width: 80,
                          ),
                          SizedBox(width: 20),
                          TextComponent(
                            text: "Status",
                            isHeading: true,
                            width: 90,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Obx(
                          () => cashOutController.cashOutDataList.isEmpty
                              ? const Center(
                                  child: Text("No Data Found"),
                                )
                              : ListView.separated(
                                  itemCount:
                                      cashOutController.cashOutDataList.length,
                                  separatorBuilder: (context, index) => Divider(
                                      height: 20,
                                      color: context.theme.colorScheme.onSurface
                                          .withOpacity(0.15)),
                                  itemBuilder: (context, index) => Row(
                                    mainAxisAlignment: Get.width <= 500
                                        ? MainAxisAlignment.start
                                        : MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextComponent(
                                        text:
                                            "${(cashOutController.totalCount.value - ((cashOutController.currentPage.value - 1) * 20)) - index}",
                                        width: 60,
                                      ),
                                      const SizedBox(width: 20),
                                      TextComponent(
                                        text: cashOutController
                                                .cashOutDataList[index]
                                                .firstName ??
                                            "",
                                        width: 100,
                                      ),
                                      const SizedBox(width: 20),
                                      TextComponent(
                                        text: cashOutController
                                                .cashOutDataList[index]
                                                .telegramId ??
                                            "",
                                        width: 100,
                                      ),
                                      const SizedBox(width: 20),
                                      TextButtonComponent(
                                        text: cashOutController
                                            .cashOutDataList[index]
                                            .referralCount
                                            .toString(),
                                        width: 80,
                                        onClick: () =>
                                            cashOutController.onReferralClick(
                                                cashOutController
                                                        .cashOutDataList[index]
                                                        .userId ??
                                                    "",
                                                cashOutController
                                                        .cashOutDataList[index]
                                                        .referralCount ??
                                                    0),
                                      ),
                                      const SizedBox(width: 20),
                                      TextComponent(
                                        text: cashOutController
                                                .cashOutDataList[index]
                                                .accountHolderName ??
                                            "--",
                                        width: 200,
                                      ),
                                      const SizedBox(width: 20),
                                      TextComponent(
                                        text: cashOutController
                                                .cashOutDataList[index]
                                                .phoneNumber ??
                                            "--",
                                        width: 100,
                                      ),
                                      const SizedBox(width: 20),
                                      TextComponent(
                                        text: cashOutController
                                                .cashOutDataList[index].upiId ??
                                            "--",
                                        width: 250,
                                      ),
                                      const SizedBox(width: 20),
                                      TextComponent(
                                        text:
                                            "₹ ${cashOutController.cashOutDataList[index].amount} (${cashOutController.cashOutDataList[index].cashOutType == "spin" ? "S" : cashOutController.cashOutDataList[index].cashOutType == "cash" ? "C" : ""})",
                                        width: 80,
                                      ),
                                      const SizedBox(width: 20),
                                      TextButtonComponent(
                                        text: cashOutController
                                                    .cashOutDataList[index]
                                                    .status ==
                                                1
                                            ? "Pending"
                                            : cashOutController
                                                        .cashOutDataList[index]
                                                        .status ==
                                                    2
                                                ? "Success"
                                                : cashOutController
                                                            .cashOutDataList[
                                                                index]
                                                            .status ==
                                                        3
                                                    ? "Rejected"
                                                    : "",
                                        width: 90,
                                        onClick: () => cashOutController
                                            .onStatusClick(cashOutController
                                                    .cashOutDataList[index]
                                                    .id ??
                                                ""),
                                        isSuccess: cashOutController
                                                .cashOutDataList[index]
                                                .status ==
                                            2,
                                        isRejected: cashOutController
                                                .cashOutDataList[index]
                                                .status ==
                                            3,
                                        isPending: cashOutController
                                                .cashOutDataList[index]
                                                .status ==
                                            1,
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
                  onPageChanged: (value) =>
                      cashOutController.onPageChanged(value),
                  currentPage: cashOutController.currentPage.value,
                  totalPage: cashOutController.totalPages.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextButtonComponent extends StatelessWidget {
  const TextButtonComponent({
    super.key,
    required this.text,
    this.width = 160,
    required this.onClick,
    this.isSuccess = false,
    this.isRejected = false,
    this.isPending = false,
  });

  final String text;
  final double width;
  final Function onClick;
  final bool isSuccess;
  final bool isRejected;
  final bool isPending;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onClick(),
      minWidth: 0,
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          gradient: LinearGradient(
            colors: isSuccess
                ? [
                    Colors.green,
                    Colors.green,
                  ]
                : isRejected
                    ? [
                        Colors.red,
                        Colors.red,
                      ]
                    : isPending
                        ? [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.5),
                          ]
                        : [
                            context.theme.colorScheme.surfaceContainerLow
                                .withOpacity(0.5),
                            context.theme.colorScheme.surfaceContainerHigh
                                .withOpacity(0.5),
                          ],
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          maxLines: 4,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: context.theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
