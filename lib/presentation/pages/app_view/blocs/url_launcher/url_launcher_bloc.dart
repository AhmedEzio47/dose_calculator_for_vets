import 'package:bloc/bloc.dart';

import '../../../../../domain/usecases/url_launcher/launch_url_use_case.dart';

part 'url_launcher_event.dart';
part 'url_launcher_state.dart';

class UrlLauncherBloc extends Bloc<UrlLauncherEvent, UrlLauncherState> {
  final LaunchUrlUseCase launchUrlUseCase;
  UrlLauncherBloc({required this.launchUrlUseCase})
      : super(UrlLauncherInitial()) {
    on<UrlLaunched>(_onUrlLaunched);
  }

  void _onUrlLaunched(UrlLaunched event, Emitter<UrlLauncherState> emit) async {
    final result = await launchUrlUseCase(UrlParams(url: event.url));
    result.fold((failure) => emit(UrlLauncherFailure()), (r) {});
  }
}
