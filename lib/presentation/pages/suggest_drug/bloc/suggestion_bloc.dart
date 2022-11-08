import 'package:bloc/bloc.dart';
import 'package:dose_calculator_for_vets/core/constants/enums.dart';
import 'package:dose_calculator_for_vets/core/exceptions.dart';
import 'package:dose_calculator_for_vets/core/locale/app_localization.dart';
import 'package:dose_calculator_for_vets/core/locale/translation_keys.dart';
import 'package:dose_calculator_for_vets/core/utils/logger.dart';

import '../../../../domain/usecases/drugs/suggest_drug_use_case.dart';

part 'suggestion_event.dart';
part 'suggestion_state.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  final SuggestDrugUseCase suggestDrugUseCase;
  SuggestionBloc(this.suggestDrugUseCase) : super(SuggestionState()) {
    on<SuggestionSubmitted>(_onSuggestionSubmitted);
  }

  void _onSuggestionSubmitted(SuggestionSubmitted event, emit) async {
    try {
      if (event.name.isEmpty || event.notes.isEmpty) {
        throw EmptyInputException();
      }
      final result = await suggestDrugUseCase(
          SuggestDrugParams(name: event.name, notes: event.notes));

      result.fold(
          (failure) => emit(SuggestionState(
              status: BlocStatus.failure, failureMessage: failure.message)),
          (success) => emit(SuggestionState(status: BlocStatus.success)));
    } catch (ex) {
      Logger.debugLog(ex.toString());
      emit(SuggestionState(
          status: BlocStatus.failure,
          failureMessage:
              AppLocalizations.instance.translate(TranslationKeys.emptyInput)));
    }
  }
}
