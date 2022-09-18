class UserInfoModel {
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _phone;
  String? _email;
  String? _emailVerified;
  String? _phoneVerified;
  String? _country;
  String? _street;
  String? _town;
  String? _longitude;
  String? _latitude;
  String? _placeId;
  String? _fullAddress;
  get id => this._id;

  set id(value) => this._id = value;

  String? get firstName => this._firstName;

  set firstName(value) => this._firstName = value;

  String? get lastName => this._lastName;

  set lastName(value) => this._lastName = value;

  get phone => this._phone;

  set phone(value) => this._phone = value;

  get email => this._email;

  set email(value) => this._email = value;

  get emailVerified => this._emailVerified;

  set emailVerified(value) => this._emailVerified = value;

  get phoneVerified => this._phoneVerified;

  set phoneVerified(value) => this._phoneVerified = value;

  get country => this._country;

  set country(value) => this._country = value;

  get street => this._street;

  set street(value) => this._street = value;

  get town => this._town;

  set town(value) => this._town = value;

  get longitude => this._longitude;

  set longitude(value) => this._longitude = value;

  get latitude => this._latitude;

  set latitude(value) => this._latitude = value;

  get placeId => this._placeId;

  set placeId(value) => this._placeId = value;

  get fullAddress => this._fullAddress;

  set fullAddress(value) => this._fullAddress = value;

  UserInfoModel({
    id,
    firstName,
    lastName,
    phone,
    email,
    emailVerified,
    phoneVerified,
    country,
    street,
    town,
    latitude,
    longitude,
    placeId,
    fullAddress,
  }) {
    this._id = id;
    this._firstName = firstName;
    this._lastName = lastName;
    this._phone = phone;
    this._email = email;
    this._emailVerified = emailVerified;
    this._phoneVerified = phoneVerified;
    this._country = country;
    this._street = street;
    this._town = town;
    this._latitude = latitude;
    this._longitude = longitude;
    this._placeId = placeId;
    this._fullAddress = fullAddress;
  }

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    // {sub: d5b56669-c1b3-4e18-b515-78b17294f368,
    // custom:country: Nepal,
    // email_verified: false,
    // custom:firstname: Ranjan,
    // custom:street: 4 Hospitrall Galli Baneswor, 3,
    // custom:town: Kathmandu,
    // custom:lastname: Shrestha,
    //  phone_number_verified: true,
    //  phone_number: +9779843813046,
    //   email: runjawon@gmail.com
    //   }

    _id = json['sub'];
    _firstName = json['custom:firstname'];
    _lastName = json['custom:lastname'];
    _phone = json['phone_number'];
    _email = json['email'];
    _emailVerified = json['email_verified'];
    _phoneVerified = json['phone_number_verified'];
    // country = json['custom:country'];
    street = json['custom:street'];
    town = json['custom:town'];
    longitude = json['custom:longitude'];
    latitude = json['custom:latitude'];
    placeId = json['custom:placeId'];
    _fullAddress = json['custom:fullAddress'];

    // _latitude = '22.655244';
    // _longitude = '113.787048';
    // _placeId = 'xxxxxxxxxxxxxxx';
    // _street = 'ddddd';
    // _town = 'Kathmandu';
    // _fullAddress = "full address";
    _country = "Nepal";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['first_name'] = this._firstName;
    data['last_name'] = this._lastName;
    data['phone'] = this._phone;
    data['email'] = this._email;
    data['email_verified'] = this._emailVerified;
    data['phone_verified'] = this._phoneVerified;
    data['country'] = this._country;
    data['street'] = this._street;
    data['town'] = this._town;
    data['longitude'] = this._longitude;
    data['latitude'] = this._latitude;
    data['placeId'] = this._placeId;
    data['fullAddress'] = this._fullAddress;

    return data;
  }
}
