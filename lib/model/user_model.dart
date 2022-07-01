class UserCRMModel {
  String? userid;
  String? company;
  String? isPreffered;
  String? vat;
  String? phonenumber;
  String? country;
  String? city;
  String? zip;
  String? state;
  String? address;
  String? website;
  String? datecreated;
  String? active;
  String? leadid;
  String? billingStreet;
  String? billingCity;
  String? billingState;
  String? billingZip;
  String? billingCountry;
  String? shippingStreet;
  String? shippingCity;
  String? shippingState;
  String? shippingZip;
  String? shippingCountry;
  String? longitude;
  String? latitude;
  String? defaultLanguage;
  String? defaultCurrency;
  String? showPrimaryContact;
  String? isSupplier;
  String? stripeId;
  String? registrationConfirmed;
  String? addedfrom;
  String? loyPoint;
  List<String>? customfields;

  UserCRMModel(
      {this.userid,
      this.company,
      this.isPreffered,
      this.vat,
      this.phonenumber,
      this.country,
      this.city,
      this.zip,
      this.state,
      this.address,
      this.website,
      this.datecreated,
      this.active,
      this.leadid,
      this.billingStreet,
      this.billingCity,
      this.billingState,
      this.billingZip,
      this.billingCountry,
      this.shippingStreet,
      this.shippingCity,
      this.shippingState,
      this.shippingZip,
      this.shippingCountry,
      this.longitude,
      this.latitude,
      this.defaultLanguage,
      this.defaultCurrency,
      this.showPrimaryContact,
      this.isSupplier,
      this.stripeId,
      this.registrationConfirmed,
      this.addedfrom,
      this.loyPoint,
      this.customfields});

  UserCRMModel.fromJson(Map<String, dynamic> json) {
    userid = json['userid'];
    company = json['company'];
    isPreffered = json['is_preffered'];
    vat = json['vat'];
    phonenumber = json['phonenumber'];
    country = json['country'];
    city = json['city'];
    zip = json['zip'];
    state = json['state'];
    address = json['address'];
    website = json['website'];
    datecreated = json['datecreated'];
    active = json['active'];
    leadid = json['leadid'];
    billingStreet = json['billing_street'];
    billingCity = json['billing_city'];
    billingState = json['billing_state'];
    billingZip = json['billing_zip'];
    billingCountry = json['billing_country'];
    shippingStreet = json['shipping_street'];
    shippingCity = json['shipping_city'];
    shippingState = json['shipping_state'];
    shippingZip = json['shipping_zip'];
    shippingCountry = json['shipping_country'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    defaultLanguage = json['default_language'];
    defaultCurrency = json['default_currency'];
    showPrimaryContact = json['show_primary_contact'];
    isSupplier = json['is_supplier'];
    stripeId = json['stripe_id'];
    registrationConfirmed = json['registration_confirmed'];
    addedfrom = json['addedfrom'];
    loyPoint = json['loy_point'];
    customfields = json['customfields'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userid'] = this.userid;
    data['company'] = this.company;
    data['is_preffered'] = this.isPreffered;
    data['vat'] = this.vat;
    data['phonenumber'] = this.phonenumber;
    data['country'] = this.country;
    data['city'] = this.city;
    data['zip'] = this.zip;
    data['state'] = this.state;
    data['address'] = this.address;
    data['website'] = this.website;
    data['datecreated'] = this.datecreated;
    data['active'] = this.active;
    data['leadid'] = this.leadid;
    data['billing_street'] = this.billingStreet;
    data['billing_city'] = this.billingCity;
    data['billing_state'] = this.billingState;
    data['billing_zip'] = this.billingZip;
    data['billing_country'] = this.billingCountry;
    data['shipping_street'] = this.shippingStreet;
    data['shipping_city'] = this.shippingCity;
    data['shipping_state'] = this.shippingState;
    data['shipping_zip'] = this.shippingZip;
    data['shipping_country'] = this.shippingCountry;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['default_language'] = this.defaultLanguage;
    data['default_currency'] = this.defaultCurrency;
    data['show_primary_contact'] = this.showPrimaryContact;
    data['is_supplier'] = this.isSupplier;
    data['stripe_id'] = this.stripeId;
    data['registration_confirmed'] = this.registrationConfirmed;
    data['addedfrom'] = this.addedfrom;
    data['loy_point'] = this.loyPoint;
    data['customfields'] = this.customfields;
    return data;
  }
}
