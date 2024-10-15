import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel24_admin/modules/cashOut/controller/cashOut.controller.dart';

import '../../../components/text.component.dart';

class CashOutView extends StatelessWidget {
  CashOutView({super.key});

  final CashOutController cashOutController = CashOutController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.surfaceContainerLow.withOpacity(0.1),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Cash Out Request",
          style: TextStyle(
            color: context.theme.colorScheme.onSurface,
          ),
        ),
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
                  itemCount: cashOutController.cashOutDataList.length,
                  separatorBuilder: (context, index) => Divider(
                      height: 20,
                      color: context.theme.colorScheme.onSurface
                          .withOpacity(0.15)),
                  itemBuilder: (context, index) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextComponent(
                        text: cashOutController
                                .cashOutDataList[index].userId?.firstName ??
                            "",
                        isColor: true,
                        width: 250,
                      ),
                      TextButtonComponent(
                        text: cashOutController.cashOutDataList[index].userId?.referralCount.toString() ?? "",
                        isColor: false,
                        width: 80,
                        onClick: ()=>cashOutController.onReferralClick(cashOutController.cashOutDataList[index].userId?.id ?? ""),
                      ),
                      TextComponent(
                        text: cashOutController.cashOutDataList[index].userId
                                ?.accountHolderName ??
                            "",
                        isColor: true,
                        width: 250,
                      ),
                      TextComponent(
                        text: cashOutController
                                .cashOutDataList[index].userId?.phoneNumber ??
                            "",
                        isColor: false,
                      ),
                      TextComponent(
                        text: cashOutController
                                .cashOutDataList[index].userId?.upiId ??
                            "",
                        isColor: true,
                        width: 250,
                      ),
                      TextComponent(
                        text: cashOutController.cashOutDataList[index].amount
                                .toString(),
                        isColor: false,
                      ),
                      TextButtonComponent(
                        text: cashOutController.cashOutDataList[index].status==1 ? "Pending" : cashOutController.cashOutDataList[index].status==2 ? "Success" : cashOutController.cashOutDataList[index].status==3 ? "Rejected" : "",
                        isColor: false,
                        width: 90,
                        onClick: ()=>cashOutController.onStatusClick(cashOutController.cashOutDataList[index].id??""),
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
