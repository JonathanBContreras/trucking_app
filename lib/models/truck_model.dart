class TruckModel{
  int id;
  String fleetNum;
  String licensePlate;
  String state;

  TruckModel(this.fleetNum, this.licensePlate,this.state);
  TruckModel.withId({this.id,this.fleetNum, this.licensePlate,this.state});

  Map<String, dynamic> toMap(){
    final map = Map<String, dynamic>();
    map["id"] = id;
    map["fleetNum"] = fleetNum;
    map["licensePlate"] = licensePlate;
    map["state"] = state;
    return map;
  }

  factory TruckModel.fromMap(Map<String, dynamic> map){
    return TruckModel.withId(
      id: map["id"],
      fleetNum: map["fleetNum"],
      licensePlate: map["license_plate"],
      state: map["state"],
    );
  }
}

