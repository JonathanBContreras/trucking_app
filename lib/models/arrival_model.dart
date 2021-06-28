class ArrivalModel{
  int id;
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

  ArrivalModel(this.bolNumber, this.poNumber, this.ldNumber, this.cfNumber, this.odometer0, this.odometer1, this.milesDriven, this.seal, this.hours, this.weight, this.pcs, this.palletLength, this.maxPayload);
  ArrivalModel.withId({this.id, this.bolNumber, this.poNumber, this.ldNumber, this.cfNumber, this.odometer0, this.odometer1, this.milesDriven, this.seal, this.hours, this.weight, this.pcs, this.palletLength, this.maxPayload});


  Map<String, dynamic> toMap(){
    final map = Map<String, dynamic>();
    map["id"] = id;
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
    return map;
  }
  factory ArrivalModel.fromMap(Map<String, dynamic> map){
    return ArrivalModel.withId(
      id: map["id"],
      bolNumber: map["bolNumber"],
      poNumber: map["poNumber"],
      ldNumber: map["ldNumber"],
      cfNumber: map["cfNumber"],
      odometer0: map["odometer0"],
      odometer1: map["odometer1"],
      milesDriven: map["milesDriven"],
      seal: map["seal"],
      hours: map["hours"],
      weight: map["weight"],
      pcs: map["pcs"],
      palletLength: map["palletLength"],
    );
  }
}