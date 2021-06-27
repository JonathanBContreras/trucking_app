class FuelModel{
  int id;
  String city;
  String state;
  String station;
  String highway;
  String mileMarker;
  String odometer;
  String dieselAmount;
  String dieselPrice;
  String def;
  String startingFuel;
  String endFuel;

  FuelModel(this.city, this.state, this.station, this.highway, this.mileMarker, this.odometer, this.dieselAmount, this.dieselPrice, this.def, this.endFuel, this.startingFuel);
  FuelModel.withId({this.id, this.city, this.state, this.station, this.highway, this.mileMarker, this.odometer, this.dieselAmount, this.dieselPrice, this.def, this.endFuel, this.startingFuel});


  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map["id"] = id;
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

  factory FuelModel.fromMap(Map<String, dynamic> map){
    return FuelModel.withId(
      id: map["id"],
      city: map["city"],
      state: map["state"],
      station: map["station"],
      highway: map["highway"],
      mileMarker: map["highway"],
      odometer: map["odometer"],
      dieselPrice: map["dieselPrice"],
      def: map["def"],
      startingFuel: map["startingFuel"],
      endFuel: map["endFuel"],
    );
  }
}