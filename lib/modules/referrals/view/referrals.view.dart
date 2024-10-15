import 'package:flutter/material.dart';
import 'package:flutter_web_pagination/flutter_web_pagination.dart';
import 'package:get/get.dart';
import 'package:wheel24_admin/modules/referrals/controller/referrals.controller.dart';
import '../../../components/text.component.dart';

class ReferralsView extends StatelessWidget {
  ReferralsView({super.key, required this.id});

  final ReferralsController referralsController = ReferralsController();
  final String id;

  @override
  Widget build(BuildContext context) {
    referralsController.init(id);
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.surfaceContainerLow.withOpacity(0.1),
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
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 800,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          TextComponent(
                            text: "Sl. No.",
                            isHeading: true,
                            width: 100,
                          ),
                          TextComponent(
                            text: "Telegram ID",
                            isHeading: true,
                            width: 250,
                          ),
                          SizedBox(width: 20),
                          TextComponent(
                            text: "Name",
                            isHeading: true,
                            width: 250,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child:  Obx(
                              ()=> referralsController.referralsDataList.isEmpty ? const Center(child: Text("No Data Found"),) : ListView.separated(
                            itemCount: referralsController.referralsDataList.length,
                            separatorBuilder: (context, index) => Divider(
                                height: 20,
                                color: context.theme.colorScheme.onSurface
                                    .withOpacity(0.15)),
                            itemBuilder: (context, index) => Row(
                              children: [
                                TextComponent(
                                  text: "${(referralsController.totalCount.value - ((referralsController.currentPage.value-1)*20))-index}",
                                  width: 100,
                                ),
                                TextComponent(
                                  text: referralsController.referralsDataList[index].telegramId ?? "",
                                  width: 250,
                                ),
                                const SizedBox(width: 20),
                                TextComponent(
                                  text: referralsController.referralsDataList[index].firstName ?? "",
                                  width: 250,
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
                    ()=> WebPagination(
                  onPageChanged: (value) => referralsController.onPageChanged(value),
                  currentPage: referralsController.currentPage.value,
                  totalPage: referralsController.totalPages.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


