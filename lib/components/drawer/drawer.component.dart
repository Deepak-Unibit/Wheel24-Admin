import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'drawer.controller.dart';

class DrawerComponent extends StatelessWidget {
  DrawerComponent({super.key, required this.scaffoldKey});

  final DrawerComponentController drawerComponentController =
      DrawerComponentController();
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    drawerComponentController.init(scaffoldKey);
    return Drawer(
      shape: const RoundedRectangleBorder(),
      backgroundColor: context.theme.colorScheme.surface,
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 30),
          buildListTile(
            context,
            title: 'Cash Out',
            icon: Icons.account_balance_wallet_outlined,
            onTap: drawerComponentController.onCashOutClick,
          ),
          buildListTile(
            context,
            title: 'Ranks',
            icon: Icons.leaderboard_outlined,
            onTap: drawerComponentController.onRanksClick,
          ),
          buildListTileToggleButton(
            context,
            title: 'Restrict IP',
            switchValue: drawerComponentController.isIPRestrict,
            onClick: drawerComponentController.onIPRestrictChange,
          ),
          buildListTileToggleButton(
            context,
            title: 'Cash Reward',
            switchValue: drawerComponentController.isCashReward,
            onClick: drawerComponentController.onCashRewardChange,
          ),
        ],
      ),
    );
  }

  ListTile buildListTileToggleButton(
    BuildContext context, {
    required String title,
    required RxBool switchValue,
    required Function onClick,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      visualDensity: VisualDensity.compact,
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      title: Text(
        title.tr,
        style: TextStyle(
          color: context.theme.colorScheme.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: SizedBox(
        height: 30,
        width: 45,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Obx(
            () => Switch(
              value: switchValue.value,
              onChanged: (bool value) => onClick(value),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              splashRadius: 0,
              focusColor: Colors.transparent,
              trackOutlineColor: WidgetStatePropertyAll(
                  context.theme.colorScheme.onSurface.withOpacity(0.5)),
              trackOutlineWidth: const WidgetStatePropertyAll(1),
              thumbColor:
                  WidgetStatePropertyAll(context.theme.colorScheme.onSurface),
            ),
          ),
        ),
      ),
    );
  }

  ListTile buildListTile(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Function onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      visualDensity: VisualDensity.compact,
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      title: Text(
        title.tr,
        style: TextStyle(
          color: context.theme.colorScheme.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: Icon(icon, color: context.theme.colorScheme.onSurface),
      onTap: () => onTap(),
    );
  }
}
