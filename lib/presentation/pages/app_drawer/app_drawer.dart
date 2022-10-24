import 'dart:io';

import 'package:dose_calculator_for_vets/core/constants/app_assets.dart';
import 'package:dose_calculator_for_vets/core/constants/app_constants.dart';
import 'package:dose_calculator_for_vets/core/locale/app_localization.dart';
import 'package:dose_calculator_for_vets/core/locale/translation_keys.dart';
import 'package:dose_calculator_for_vets/presentation/pages/app_drawer/widgets/drawer_item.dart';
import 'package:dose_calculator_for_vets/presentation/pages/app_view/blocs/url_launcher/url_launcher_bloc.dart';
import 'package:dose_calculator_for_vets/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_view/blocs/theme/theme_bloc.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Image.asset(AppAssets.appIcon),
          ),
          const Divider(),
          DrawerItem(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(AppRoutes.history);
            },
            icon: Icons.book,
            text: AppLocalizations.instance.translate(TranslationKeys.history),
          ),
          const Divider(),
          DrawerItem(
            onTap: () => context.read<ThemeBloc>().add(ThemeChangedEvent()),
            icon: Icons.brush,
            text: AppLocalizations.instance
                .translate(TranslationKeys.switchTheme),
          ),
          const Divider(),
          if (Platform.isAndroid)
            DrawerItem(
              onTap: () {
                Navigator.of(context).pop();
                context.read<UrlLauncherBloc>().add(UrlLaunched(
                    url: Platform.isAndroid ? AppConstants.playStoreUrl : ''));
              },
              icon: Icons.star,
              text: AppLocalizations.instance
                  .translate(TranslationKeys.reviewApp),
            ),
          if (Platform.isAndroid) const Divider(),
          DrawerItem(
            onTap: () {
              Navigator.of(context).pop();
              context
                  .read<UrlLauncherBloc>()
                  .add(UrlLaunched(url: AppConstants.donationUrl));
            },
            icon: Icons.currency_bitcoin,
            text: AppLocalizations.instance.translate(TranslationKeys.donate),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
