class TrailerModel{
  int id;
  String trailerNum;
  String licensePlate;
  String state;

  TrailerModel(this.trailerNum, this.licensePlate, this.state);
  TrailerModel.withId({this.id, this.trailerNum, this.licensePlate, this.state});

  Map<String, dynamic> toMap(){
    final map = Map<String, dynamic>();
    map["id"] = id;
    map["trailerNum"] = trailerNum;
    map["licensePlate"] = licensePlate;
    map["state"] = state;
    return map;
  }

  factory TrailerModel.fromMap(Map<String, dynamic> map){
    return TrailerModel.withId(
      id: map["id"],
      trailerNum: map["trailerNum"],
      licensePlate: map["license_plate"],
      state: map["state"],
    );
  }
}