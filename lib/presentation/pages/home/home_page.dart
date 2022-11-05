import 'package:dose_calculator_for_vets/core/constants/app_constants.dart';
import 'package:dose_calculator_for_vets/core/constants/enums.dart';
import 'package:dose_calculator_for_vets/core/locale/app_localization.dart';
import 'package:dose_calculator_for_vets/core/locale/translation_keys.dart';
import 'package:dose_calculator_for_vets/presentation/pages/app_drawer/app_drawer.dart';
import 'package:dose_calculator_for_vets/presentation/pages/home/widgets/active_principle_bottom_sheet.dart';
import 'package:dose_calculator_for_vets/presentation/pages/home/widgets/home_header.dart';
import 'package:dose_calculator_for_vets/presentation/pages/home/widgets/result_dialog.dart';
import 'package:dose_calculator_for_vets/presentation/widgets/app_dialog.dart';
import 'package:dose_calculator_for_vets/presentation/widgets/app_snack_bar.dart';
import 'package:dose_calculator_for_vets/presentation/widgets/edit_field.dart';
import 'package:dose_calculator_for_vets/presentation/widgets/general_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_view/blocs/units/units_bloc.dart';
import 'bloc/calculator_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _concentrationController =
      TextEditingController();

  final TextEditingController _quantityController = TextEditingController();

  final TextEditingController _dosePerUnitMassController =
      TextEditingController();

  final TextEditingController _animalMassController = TextEditingController();

  final List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).iconTheme.color,
              ));
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<UnitsBloc, UnitsState>(
          builder: (context, unitsState) {
            return BlocListener<CalculatorBloc, CalculatorState>(
              listenWhen: (prev, current) =>
                  prev.status != current.status ||
                  prev.calculation != current.calculation,
              listener: (context, state) {
                if (state.status == BlocStatus.success) {
                  _concentrationController.clear();
                  _quantityController.clear();
                  _dosePerUnitMassController.clear();
                  _animalMassController.clear();
                  if (state.finalDose != null) {
                    AppDialog.show(
                        context: context,
                        child: ResultDialog(finalDose: state.finalDose!));
                  }
                } else if (state.status == BlocStatus.failure) {
                  AppSnackBar.show(
                      context: context,
                      message: state.failureMessage,
                      snackBarType: SnackBarTypes.error);
                }

                if (state.calculation != null) {
                  _concentrationController.text =
                      state.calculation!.concentration.toString();
                  _quantityController.text =
                      state.calculation!.quantity.toString();
                  _dosePerUnitMassController.text =
                      AppConstants.massUnit == MassUnitValues.kg
                          ? state.calculation!.dosePerUnitMass.toString()
                          : state.calculation!.dosePerUnitMass
                              .toStringAsFixed(AppConstants.decimalPrecision);
                  _animalMassController.text =
                      AppConstants.massUnit == MassUnitValues.kg
                          ? state.calculation!.animalMass.toString()
                          : state.calculation!.animalMass
                              .toStringAsFixed(AppConstants.decimalPrecision);
                  setState(() {});
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const HomeHeader(),
                    EditField(
                      focusNode: _focusNodes[0],
                      controller: _concentrationController,
                      inputAction: TextInputAction.next,
                      hint: '',
                      label: AppLocalizations.instance
                          .translate(TranslationKeys.drugConcentration),
                      inputType: TextInputType.number,
                      onSubmit: (val) {
                        _focusNodes[1].requestFocus();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    EditField(
                      focusNode: _focusNodes[1],
                      controller: _quantityController,
                      inputAction: TextInputAction.next,
                      hint: '',
                      label: AppLocalizations.instance
                          .translate(TranslationKeys.quantity),
                      inputType: TextInputType.number,
                      onSubmit: (val) {
                        _focusNodes[2].requestFocus();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: EditField(
                            focusNode: _focusNodes[2],
                            controller: _dosePerUnitMassController,
                            inputAction: TextInputAction.next,
                            hint: '',
                            label: AppLocalizations.instance.translate(
                              TranslationKeys.dosePerUnitMass,
                              param1: unitsState.toString(),
                            ),
                            inputType: TextInputType.number,
                            onSubmit: (val) {
                              _focusNodes[3].requestFocus();
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GeneralBtn(
                            width: 100,
                            height: 50,
                            fontSize: 16,
                            onPressed: () => showModalBottomSheet(
                                context: context,
                                builder: (_) => ActivePrincipleBottomSheet()),
                            text: AppLocalizations.instance
                                .translate(TranslationKeys.activePrinciple)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    EditField(
                      focusNode: _focusNodes[3],
                      controller: _animalMassController,
                      inputAction: TextInputAction.done,
                      hint: '',
                      label: AppLocalizations.instance.translate(
                        TranslationKeys.animalMass,
                        param1: unitsState.toString(),
                      ),
                      inputType: TextInputType.number,
                      onSubmit: (val) => _calculate(context),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    GeneralBtn(
                      onPressed: () => _calculate(context),
                      text: AppLocalizations.instance
                          .translate(TranslationKeys.calculate),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _calculate(BuildContext context) {
    context.read<CalculatorBloc>().add(CalculateEvent(
          concentration: _concentrationController.text,
          quantity: _quantityController.text,
          dosePerUnitMass: _dosePerUnitMassController.text,
          animalMass: _animalMassController.text,
        ));
  }
}
