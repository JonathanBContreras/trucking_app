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

class Arrival{
  String bolNumber;
  String poNumber;
  String ldNumber;
  String cfNumber;
  String odometer0;
  String odometer1;
  String milesDriven;
  String seal;
  String hours;
  String weight;
  String pcs;
  String palletLength;
  String maxPayload;
  String expenses;

  Arrival(this.bolNumber, this.poNumber, this.ldNumber, this.cfNumber, this.odometer0, this.odometer1, this.milesDriven, this.seal, this.weight, this.pcs, this.palletLength, this.maxPayload, this.expenses);

  Map<String, dynamic> toMap(){
    final map = Map<String, dynamic>();
    map["bolNumber"] = bolNumber;
    map["poNumber"] = poNumber;
    map["ldNumber"] = ldNumber;
    map["cfNumber"] = cfNumber;
    map["odometer0"] = odometer0;
    map["odometer1"] = odometer1;
    map["milesDriven"] = milesDriven;
    map["seal"] = seal;
    map["hours"] = hours;
    map["weight"] = weight;
    map["pcs"] = pcs;
    map["palletLength"] = palletLength;
    map["maxPayload"] = expenses;
    return map;
  }
}
