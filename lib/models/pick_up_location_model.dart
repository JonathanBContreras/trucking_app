class PickupLocationModel {
  int id;
  String streetNameAndNumber;
  String city;
  String state;
  String zipcode;
  String distributor;
  String date;
  String time;

  PickupLocationModel(this.streetNameAndNumber, this.city, this.state, this.zipcode, this.distributor, this.date, this.time);
  PickupLocationModel.withId({this.id, this.streetNameAndNumber, this.city, this.state, this.zipcode, this.distributor, this.date, this.time});


  Map<String, dynamic> toMap(){
    final map = Map<String, dynamic>();
    map["streetNameAndNumber"] = streetNameAndNumber;
    map["city"] = city;
    map["state"] = state;
    map["zipcode"] = zipcode;
    map["distributor"] = distributor;
    map["date"] = date;
    map["time"] = time;
    return map;
  }

  factory PickupLocationModel.fromMap(Map<String, dynamic> map){
    return PickupLocationModel.withId(
      id: map["id"],
      streetNameAndNumber: map["streetNameAndNumber"],
      city: map["city"],
      state: map["state"],
      zipcode: map["zipcode"],
      distributor: map["distributor"],
      date: map["date"],
      time: map["time"],
    );
  }
}