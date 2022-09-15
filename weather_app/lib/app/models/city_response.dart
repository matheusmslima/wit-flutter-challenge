class CityResponse {
  List<Data>? data;

  CityResponse({this.data});

  CityResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() => 'CityResponse(data: $data)';
}

class Data {
  double? latitude;
  double? longitude;
  String? type;
  String? name;
  String? number;
  String? postalCode;
  String? street;
  String? region;
  String? regionCode;
  String? county;
  String? locality;
  String? administrativeArea;
  String? country;
  String? countryCode;
  String? continent;
  String? label;

  Data({
    this.latitude,
    this.longitude,
    this.type,
    this.name,
    this.number,
    this.postalCode,
    this.street,
    this.region,
    this.regionCode,
    this.county,
    this.locality,
    this.administrativeArea,
    this.country,
    this.countryCode,
    this.continent,
    this.label,
  });

  Data.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    type = json['type'];
    name = json['name'];
    number = json['number'];
    postalCode = json['postal_code'];
    street = json['street'];
    region = json['region'];
    regionCode = json['region_code'];
    county = json['county'];
    locality = json['locality'];
    administrativeArea = json['administrative_area'];
    country = json['country'];
    countryCode = json['country_code'];
    continent = json['continent'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['type'] = type;
    data['name'] = name;
    data['number'] = number;
    data['postal_code'] = postalCode;
    data['street'] = street;
    data['region'] = region;
    data['region_code'] = regionCode;
    data['county'] = county;
    data['locality'] = locality;
    data['administrative_area'] = administrativeArea;
    data['country'] = country;
    data['country_code'] = countryCode;
    data['continent'] = continent;
    data['label'] = label;
    return data;
  }

  @override
  String toString() {
    return 'Data(latitude: $latitude, longitude: $longitude, type: $type, name: $name, number: $number, postalCode: $postalCode, street: $street, region: $region, regionCode: $regionCode, county: $county, locality: $locality, administrativeArea: $administrativeArea, country: $country, countryCode: $countryCode, continent: $continent, label: $label)';
  }
}
