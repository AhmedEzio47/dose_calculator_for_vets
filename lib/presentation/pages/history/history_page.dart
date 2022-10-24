import 'package:dose_calculator_for_vets/core/locale/app_localization.dart';
import 'package:dose_calculator_for_vets/core/locale/translation_keys.dart';
import 'package:dose_calculator_for_vets/presentation/pages/history/widgets/history_item.dart';
import 'package:dose_calculator_for_vets/presentation/widgets/app_snack_bar.dart';
import 'package:dose_calculator_for_vets/presentation/widgets/bloc_state_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/enums.dart';
import 'bloc/history_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.book,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(AppLocalizations.instance.translate(TranslationKeys.history)),
          ],
        ),
      ),
      body: BlocConsumer<HistoryBloc, HistoryState>(
        listener: (_, state) {
          if (state.status == BlocStatus.failure) {
            AppSnackBar.show(
                context: context,
                message: state.failureMessage,
                snackBarType: SnackBarTypes.error);
          }
        },
        builder: (context, state) {
          return BlocStateBuilder(
              status: state.status,
              readyWidget: ListView.builder(
                  itemCount: state.calculations.length,
                  itemBuilder: (_, index) => HistoryItem(
                        calculation: state.calculations[index],
                        onDelete: () => context
                            .read<HistoryBloc>()
                            .add(DeleteItemEvent(index)),
                      )));
        },
      ),
    );
  }
}
