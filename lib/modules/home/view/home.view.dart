import 'package:flutter/material.dart';
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
        centerTitle: true,
        title: Text(
          "Cash Out Request",
          style: TextStyle(
            color: context.theme.colorScheme.onSurface,
          ),
        ),
        backgroundColor:
            context.theme.colorScheme.surfaceContainerLow.withOpacity(0.1),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextComponent(
                  text: "Name",
                  isColor: true,
                  width: 250,
                ),
                TextComponent(
                  text: "Referral",
                  isColor: false,
                  width: 80,
                ),
                TextComponent(
                  text: "Acc. Holder Name",
                  isColor: true,
                  width: 250,
                ),
                TextComponent(
                  text: "Phone No.",
                  isColor: false,
                ),
                TextComponent(
                  text: "UPI ID",
                  isColor: true,
                  width: 250,
                ),
                TextComponent(
                  text: "Amount",
                  isColor: false,
                ),
                TextComponent(
                  text: "Status",
                  isColor: false,
                  width: 90,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(
                () => ListView.separated(
                  itemCount: homeController.cashOutDataList.length,
                  separatorBuilder: (context, index) => Divider(
                      height: 20,
                      color: context.theme.colorScheme.onSurface
                          .withOpacity(0.15)),
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextComponent(
                        text: homeController
                                .cashOutDataList[index].userId?.firstName ??
                            "",
                        isColor: true,
                        width: 250,
                      ),
                      TextButtonComponent(
                        text: homeController.cashOutDataList[index].userId?.referralCount.toString() ?? "",
                        isColor: false,
                        width: 80,
                        onClick: ()=>homeController.onReferralClick(homeController.cashOutDataList[index].userId?.id ?? ""),
                      ),
                      TextComponent(
                        text: homeController.cashOutDataList[index].userId
                                ?.accountHolderName ??
                            "",
                        isColor: true,
                        width: 250,
                      ),
                      TextComponent(
                        text: homeController
                                .cashOutDataList[index].userId?.phoneNumber ??
                            "",
                        isColor: false,
                      ),
                      TextComponent(
                        text: homeController
                                .cashOutDataList[index].userId?.upiId ??
                            "",
                        isColor: true,
                        width: 250,
                      ),
                      TextComponent(
                        text: homeController.cashOutDataList[index].amount
                                .toString(),
                        isColor: false,
                      ),
                      TextButtonComponent(
                        text: homeController.cashOutDataList[index].status==1 ? "Pending" : homeController.cashOutDataList[index].status==2 ? "Success" : homeController.cashOutDataList[index].status==3 ? "Rejected" : "",
                        isColor: false,
                        width: 90,
                        onClick: ()=>homeController.onStatusClick(homeController.cashOutDataList[index].id??""),
                      ),
                    ],
                  ),
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
    required this.isColor,
    this.width = 160, required this.onClick,
  });

  final String text;
  final bool isColor;
  final double width;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: ()=> onClick(),
      minWidth: 0,
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        color: false
            ? context.theme.colorScheme.onSurface.withOpacity(0.25)
            : Colors.transparent,
        child: Text(
          text,
          maxLines: 4,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: context.theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
