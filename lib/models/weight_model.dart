class WeightModel{
  int id;
  String tripNum;
  String steers;
  String drives;
  String trailerTandoms;
  String tractor;
  String drvsAndTrtand;
  String fuelWeight;
  String grossWeight;

  WeightModel(this.tripNum, this.steers, this.drives, this.trailerTandoms, this.tractor, this.drvsAndTrtand, this.grossWeight, this.fuelWeight);
  WeightModel.withId({this.id, this.tripNum, this.steers, this.drives, this.trailerTandoms, this.tractor, this.drvsAndTrtand, this.fuelWeight, this.grossWeight});

  Map<String, dynamic> toMap(){
    final map = Map<String, dynamic>();
    map["id"] = id;
    map["tripNum"] = tripNum;
    map["steers"] = steers;
    map["drives"] = drives;
    map["trailerTandoms"] = trailerTandoms;
    map["tractor"] = tractor;
    map["drvsAndTrtand"]  = drvsAndTrtand;
    map["fuelWeight"] = fuelWeight;
    map["grossWeight"] = grossWeight;
    return map;
  }

  factory WeightModel.fromMap(Map<String, dynamic> map){
    return WeightModel.withId(
      id: map["id"],
      tripNum: map["tripNum"],
      steers: map["steers"],
      drives: map["drives"],
      trailerTandoms: map["trailerTandoms"],
      tractor: map["tractor"],
      drvsAndTrtand: map["drvsAndTrtand"],
      fuelWeight: map["fuelWeight"],
      grossWeight: map["grossWeight"],
    );
  }
}