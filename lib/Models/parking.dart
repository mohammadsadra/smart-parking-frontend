class Parking {
  String? guid;
  String? name;
  String? description;
  String? address;
  String? city;
  String? phone;
  int? totalCapacity;
  int? freeCapacity;
  int? reservedCapacity;
  int? reservedFreeCapacity;
  double? latitude;
  double? longitude;
  double? cost;
  String? workingHours;
  String? workingDays;
  String? picture;
  int? ownerId;

  Parking(
      {this.guid,
      this.name,
      this.description,
      this.address,
      this.city,
      this.phone,
      this.totalCapacity,
      this.freeCapacity,
      this.reservedCapacity,
      this.reservedFreeCapacity,
      this.latitude,
      this.longitude,
      this.cost,
      this.workingHours,
      this.workingDays,
      this.picture,
      this.ownerId});

  Parking.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    name = json['name'];
    description = json['description'];
    address = json['address'];
    city = json['city'];
    phone = json['phone'];
    totalCapacity = json['total_capacity'];
    freeCapacity = json['free_capacity'];
    reservedCapacity = json['reserved_capacity'];
    reservedFreeCapacity = json['reserved_free_capacity'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    cost = json['cost'];
    workingHours = json['working_hours'];
    workingDays = json['working_days'];
    picture = json['picture'];
    ownerId = json['owner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['guid'] = this.guid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['address'] = this.address;
    data['city'] = this.city;
    data['phone'] = this.phone;
    data['total_capacity'] = this.totalCapacity;
    data['free_capacity'] = this.freeCapacity;
    data['reserved_capacity'] = this.reservedCapacity;
    data['reserved_free_capacity'] = this.reservedFreeCapacity;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['cost'] = this.cost;
    data['working_hours'] = this.workingHours;
    data['working_days'] = this.workingDays;
    data['picture'] = this.picture;
    data['owner_id'] = this.ownerId;
    return data;
  }
}