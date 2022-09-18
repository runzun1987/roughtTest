class Cities {
  static const List<String> _citiesTier1 = [
    'Kathmandu',
    'Bhaktapur',
    'Lalitpur',
  ];
  static const List<String> _citiesTier2 = [
    'Banepa',
    'Dhulikhel',
  ];
  static const List<String> _citiesTier3 = [
    'Pokhara',
    'Chitwan',
    'Butwal',
    'Bhairahawa',
    'Nepalgunj',
    'Biratnagar',
    'Itahari',
    'Dharan',
    'Hetauda',
    'Birgunj',
    'Birtamode',
    'Kakarvitta',
    'Damak',
    'Morang',
  ];

  static List<String> get citiesTier1 => _citiesTier1;
  static List<String> get citiesTier2 => _citiesTier2;
  static List<String> get citiesTier3 => _citiesTier3;

  static int getTier(String? town) {
    if (citiesTier1.contains(town)) {
      return 1;
    } else if (citiesTier2.contains(town)) {
      return 2;
    } else if (citiesTier3.contains(town)) {
      return 3;
    } else {
      return 1;
    }
  }

  static List<String> get allCities => [
        ..._citiesTier1,
        ..._citiesTier2,
        ..._citiesTier3,
      ];
}
