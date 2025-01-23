enum House {
  gryffindor,
  slytherin,
  ravenclaw,
  hufflepuff,
  not_in_house;
}

extension HouseExt on House {
  String get title {
    return switch (this) {
      House.gryffindor => 'Gryffindor',
      House.slytherin => 'Slytherin',
      House.ravenclaw => 'Ravenclaw',
      House.hufflepuff => 'Hufflepuff',
      House.not_in_house => 'Not in house',
    };
  }
}
