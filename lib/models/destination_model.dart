class DestinationModel{
  int id;
  String streetNameAndNumber;
  String city;
  String state;
  String zipcode;
  String distributor;
  String date;
  String time;

  DestinationModel(this.streetNameAndNumber, this.city, this.state, this.zipcode, this.distributor, this.date, this.time);
  DestinationModel.withId({this.id, this.streetNameAndNumber, this.city, this.state, this.zipcode, this.distributor, this.date, this.time});


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

  factory DestinationModel.fromMap(Map<String, dynamic> map){
    return DestinationModel.withId(
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
