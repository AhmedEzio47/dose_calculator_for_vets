class HiveConstants {
  static const String dbName = 'dose_calc_db';
  static const String path = './';
  static Set<String> boxNames = Set.from(_boxes);

  static const List<String> _boxes = [calculationBox];
  static const String calculationBox = 'calculations';
}
