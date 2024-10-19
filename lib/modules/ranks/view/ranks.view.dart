import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel24_admin/modules/ranks/controller/ranks.controller.dart';
import '../../../components/text.component.dart';

class RanksView extends StatelessWidget {
  RanksView({super.key});

  final RanksController ranksController = RanksController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.surfaceContainerLow.withOpacity(0.1),
        centerTitle: true,
        title: Text(
          "Ranks",
          style: TextStyle(
            color: context.theme.colorScheme.onSurface,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 400,
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            TextComponent(
                              text: "Rank",
                              isHeading: true,
                              width: 70,
                            ),
                            TextComponent(
                              text: "Name",
                              isHeading: true,
                              width: 120,
                            ),
                            SizedBox(width: 20),
                            TextComponent(
                              text: "Telegram Id",
                              isHeading: true,
                              width: 100,
                            ),
                            SizedBox(width: 20),
                            TextComponent(
                              text: "Referrals",
                              isHeading: true,
                              width: 70,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child:  Obx(
                                ()=> ranksController.ranksDataList.isEmpty ? const Center(child: Text("No Data Found"),) : ListView.separated(
                              itemCount: ranksController.ranksDataList.length,
                              separatorBuilder: (context, index) => Divider(
                                  height: 20,
                                  color: context.theme.colorScheme.onSurface
                                      .withOpacity(0.15)),
                              itemBuilder: (context, index) => Row(
                                children: [
                                  TextComponent(
                                    text: "${index+1}",
                                    width: 70,
                                  ),
                                  TextComponent(
                                    text: "${ranksController.ranksDataList[index].firstName}",
                                    width: 120,
                                  ),
                                  const SizedBox(width: 20),
                                  TextComponent(
                                    text: "${ranksController.ranksDataList[index].telegramId}",
                                    width: 100,
                                  ),
                                  const SizedBox(width: 20),
                                  TextComponent(
                                    text: "${ranksController.ranksDataList[index].referralCount}",
                                    width: 70,
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
            ],
          ),
        ),
      ),
    );
  }
}
