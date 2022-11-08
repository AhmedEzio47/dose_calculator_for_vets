import 'package:dose_calculator_for_vets/core/locale/app_localization.dart';
import 'package:dose_calculator_for_vets/core/locale/translation_keys.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

class RateAppBuilder extends StatelessWidget {
  const RateAppBuilder({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return RateMyAppBuilder(
        rateMyApp: RateMyApp(
          minDays: 7,
          minLaunches: 10,
          remindDays: 7,
          remindLaunches: 10,
        ),
        builder: (_) => child,
        onInitialized: (context, rateMyApp) {
          if (rateMyApp.shouldOpenDialog) {
            rateMyApp.showRateDialog(
              context,
              title: AppLocalizations.instance
                  .translate(TranslationKeys.rateThisApp), // The dialog title.
              message: AppLocalizations.instance.translate(
                  TranslationKeys.rateThisAppMessage), // The dialog message.
              rateButton: AppLocalizations.instance.translate(
                  TranslationKeys.rate), // The dialog "rate" button text.
              noButton: AppLocalizations.instance.translate(
                  TranslationKeys.noThanks), // The dialog "no" button text.
              laterButton: AppLocalizations.instance.translate(TranslationKeys
                  .maybeLater), // The dialog "later" button text.
              listener: (button) {
                // The button click listener (useful if you want to cancel the click event).
                switch (button) {
                  case RateMyAppDialogButton.rate:
                    print('Clicked on "Rate".');
                    break;
                  case RateMyAppDialogButton.later:
                    print('Clicked on "Later".');
                    break;
                  case RateMyAppDialogButton.no:
                    print('Clicked on "No".');
                    break;
                }

                return true; // Return false if you want to cancel the click event.
              },
              dialogStyle: const DialogStyle(), // Custom dialog styles.
              onDismissed: () => rateMyApp.callEvent(RateMyAppEventType
                  .laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
              // contentBuilder: (context, defaultContent) => content, // This one allows you to change the default dialog content.
              // actionsBuilder: (context) => [], // This one allows you to use your own buttons.
            );
          }
        });
  }
}
