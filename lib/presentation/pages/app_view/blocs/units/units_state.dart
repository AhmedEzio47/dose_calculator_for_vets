part of 'units_bloc.dart';

enum MassUnitValues { kg, lb }

class UnitsState {
  final MassUnitValues massUnit;
  UnitsState(this.massUnit);

  @override
  toString() => massUnit == MassUnitValues.kg ? 'Kg' : 'Lb';
}
