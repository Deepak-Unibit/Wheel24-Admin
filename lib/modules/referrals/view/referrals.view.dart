import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel24_admin/modules/referrals/controller/referrals.controller.dart';
import '../../../components/text.component.dart';

class ReferralsView extends StatelessWidget {
  ReferralsView({super.key});

  final ReferralsController referralsController = ReferralsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.surfaceContainerLow.withOpacity(0.1),
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Referrals",
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
              children: [
                TextComponent(
                  text: "Telegram ID",
                  isColor: true,
                  width: 250,
                ),
                SizedBox(width: 20),
                TextComponent(
                  text: "Name",
                  isColor: true,
                  width: 250,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child:  ListView.separated(
                  itemCount: referralsController.referralsDataList.length,
                  separatorBuilder: (context, index) => Divider(
                      height: 20,
                      color: context.theme.colorScheme.onSurface
                          .withOpacity(0.15)),
                  itemBuilder: (context, index) => Row(
                    children: [
                      TextComponent(
                        text: referralsController.referralsDataList[index].telegramId ?? "",
                        isColor: true,
                        width: 250,
                      ),
                      const SizedBox(width: 20),
                      TextComponent(
                        text: referralsController.referralsDataList[index].firstName ?? "",
                        isColor: true,
                        width: 250,
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}


