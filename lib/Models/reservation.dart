class Reservation {
  int? id;
  String? guid;
  int? parkingId;
  int? user;
  String? startTime;
  String? endTime;
  double? cost;
  bool? paid;
  String? status;

  Reservation(
      {this.id,
      this.guid,
      this.parkingId,
      this.user,
      this.startTime,
      this.endTime,
      this.cost,
      this.paid,
      this.status});

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guid = json['guid'];
    parkingId = json['parking_id'];
    user = json['user'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    cost = json['cost'];
    paid = json['paid'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['guid'] = this.guid;
    data['parking_id'] = this.parkingId;
    data['user'] = this.user;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['cost'] = this.cost;
    data['paid'] = this.paid;
    data['status'] = this.status;
    return data;
  }
}
