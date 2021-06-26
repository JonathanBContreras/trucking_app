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

class Weight{
  int id; //truck and trailer number combined
  double steers;
  double drives;
  double trailerTandoms;
  double tractor;
  double drvsAndTrtand;
  double fuelWeight;
  double grossWeight;

  Weight(this.steers, this.drives, this.trailerTandoms, this.tractor, this.drvsAndTrtand, this.grossWeight, this.fuelWeight);
  Weight.withId({this.id,this.steers, this.drives, this.trailerTandoms, this.tractor, this.drvsAndTrtand, this.grossWeight, this.fuelWeight});

  Map<String, dynamic> toMap(){
    final map = Map<String, dynamic>();
    map["id"] = id;
    map["steers"] = steers;
    map["drives"] = drives;
    map["trailerTandoms"] = trailerTandoms;
    map["tractor"] = tractor;
    map["drvsAndTrtand"]  = drvsAndTrtand;
    map["fuelWeight"] = fuelWeight;
    map["grossWeight"] = grossWeight;
    return map;
  }

  factory Weight.fromMap(Map<String, dynamic> map){
    return Weight.withId(
      id: map["id"],
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

class Address{
  String streetNameAndNumber;
  String cityName;
  String state;
  String zipcode;
  String distributorName;
  String date;
  String time;

  Address(this.streetNameAndNumber, this.cityName, this.state, this.zipcode, this.distributorName, this.date, this.time);

  Map<String, dynamic> toMap(){
    final map = Map<String, dynamic>();
    map["streetNameAndNumber"] = streetNameAndNumber;
    map["cityName"] = cityName;
    map["state"] = state;
    map["zipcode"] = zipcode;
    map["distributorName"] = distributorName;
    map["date"] = date;
    map["time"] = time;
    return map;
  }
}

class PickupLocation extends Address{
  PickupLocation(String streetNameAndNumber, String cityName, String state, String zipcode, String distributorName, String date, String time) : super(streetNameAndNumber, cityName, state, zipcode, distributorName, date, time);
}
class Destination extends Address{
  Destination(String streetNameAndNumber, String cityName, String state, String zipcode, String distributorName, String date, String time) : super(streetNameAndNumber, cityName, state, zipcode, distributorName, date, time);
}

class Fuel{
  String city;
  String state;
  String station;
  String highway;
  String mileMarker;
  double odometer;
  double dieselAmount;
  double dieselPrice;
  String def;
  double startingFuel;
  double endFuel;

  Fuel(this.city, this.state, this.station, this.highway, this.mileMarker, this.odometer, this.dieselAmount, this.dieselPrice, this.def, this.endFuel, this.startingFuel);

  Map<String, dynamic> toMap(){
    final map = Map<String, dynamic>();
    map["city"] = city;
    map["state"] = state;
    map["station"] = station;
    map["highway"] = highway;
    map["mileMarker"] = mileMarker;
    map["odometer"] = odometer;
    map["dieselAmount"] = dieselAmount;
    map["dieselPrice"] = dieselPrice;
    map["def"] = def;
    map["startingFuel"] = startingFuel;
    map["endFuel"] = endFuel;
    return map;
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
