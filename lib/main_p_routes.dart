class Routes {
  Routes._();

  // Splash Page
  static const String start = '/start';

  //navigator bar Root items
  static const String help = '/help'; // start page
  static const String scan = '/scan'; //scan page

  // names of subpages
  static const String plastic = 'plastic';
  static const String aluminum = 'aluminum';
  static const String battery = 'batt';
  static const String lawn = 'lawn';
  static const String hazard = 'hazard';
  static const String oil = 'oil';
  static const String electronics = 'elec';
  static const String glass = 'glass';
  static const String food = 'food';
  static const String tires = 'tires';
  static const String notFound = 'notfound';
  static const String invalid = 'invalid';
  static const String metal = 'metal';
  static const String miscellaneous = 'miscellaneous';
  static const String paper = 'paper';

  // nested directory items
  static const String nestedPlastic = '/scan/plastic';
  static String nestedBatteries = '/scan/batt';
  static String nestedLawn = '/scan/lawn';
  static String nestedHazard = '/scan/hazard';
  static String nestedOil = '/scan/oil';
  static String nestedElectronics = '/scan/elec';
  static String nestedGlass = '/scan/glass';
  static String nestedFood = '/scan/food';
  static String nestedTires = '/scan/tires';
  static String nestedNotFound = '/scan/notfound';
  static String nestedInvalid = '/scan/invalid';
  static String nestedAluminum = '/scan/aluminum';
  static String nestedPaper = '/scan/paper';
  static String nestedMetal = '/scan/metal';
}
