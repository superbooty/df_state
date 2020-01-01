import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/utils/text_utils.dart';
import 'package:http/http.dart' as http;

class LocationFetcher with ChangeNotifier {
  StoreLocations _locations;

  StoreLocations get storeLocations {
    return this._locations;
  }

  Future<void> fetchStoreLocationsForZip(zipCode) async {
    final contentURL =
        'https://maps.levi.com/api/getAsyncLocations?template=search&level=search&radius=50&search=$zipCode';

    final data = await http.get(contentURL);
    final Map<String, dynamic> respBody = json.decode(data.body);
    _locations = StoreLocations.fromMap(respBody);

    if(_locations != null && _locations.markers != null) {
      for (Marker m in _locations.markers) {
        m.infoMap = TextUtils.toJSONMap(TextUtils.removeAllHtmlTags(m.info));
      }
    }

    print('Got Locations...');
    notifyListeners();
  }
}

class StoreLocations with ChangeNotifier {
  final double lat;
  final double lng;
  final String originLat;
  final String originLng;
  final List<Marker> markers;
  final Options options;

  StoreLocations({
    this.lat,
    this.lng,
    this.originLat,
    this.originLng,
    this.markers,
    this.options,
  });

  factory StoreLocations.fromJson(String str) =>
      StoreLocations.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StoreLocations.fromMap(Map<String, dynamic> json) => StoreLocations(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lng: json["lng"] == null ? null : json["lng"].toDouble(),
        originLat: json["originLat"] == null ? null : json["originLat"],
        originLng: json["originLng"] == null ? null : json["originLng"],
        markers: json["markers"] == null
            ? null
            : List<Marker>.from(json["markers"].map((x) => Marker.fromMap(x))),
        options:
            json["options"] == null ? null : Options.fromMap(json["options"]),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
        "originLat": originLat == null ? null : originLat,
        "originLng": originLng == null ? null : originLng,
        "markers": markers == null
            ? null
            : List<dynamic>.from(markers.map((x) => x.toMap())),
        "options": options == null ? null : options.toMap(),
      };
}

class Marker {
  final String lat;
  final String lng;
  final String tooltip;
  final String info;
  final String iconUrl;
  final bool clickable;
  final String locationId;
  final List<Specialty> specialties;
  Map<String, dynamic> infoMap;

  Marker({
    this.lat,
    this.lng,
    this.tooltip,
    this.info,
    this.iconUrl,
    this.clickable,
    this.locationId,
    this.specialties,
  });

  factory Marker.fromJson(String str) => Marker.fromMap(json.decode(str));

  String get storeType {
    for(Specialty specialty in this.specialties) {
      if (specialty.group == 'Store Type') {
        return specialty.name;
      }
    }
    return '';
  }

  String toJson() => json.encode(toMap());

  factory Marker.fromMap(Map<String, dynamic> json) => Marker(
        lat: json["lat"] == null ? null : json["lat"],
        lng: json["lng"] == null ? null : json["lng"],
        tooltip: json["tooltip"] == null ? null : json["tooltip"],
        info: json["info"] == null ? null : json["info"],
        iconUrl: json["iconURL"] == null ? null : json["iconURL"],
        clickable: json["clickable"] == null ? null : json["clickable"],
        locationId: json["locationId"] == null ? null : json["locationId"],
        specialties: json["specialties"] == null
            ? null
            : List<Specialty>.from(
                json["specialties"].map((x) => Specialty.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "lat": lat == null ? null : lat,
        "lng": lng == null ? null : lng,
        "tooltip": tooltip == null ? null : tooltip,
        "info": info == null ? null : info,
        "iconURL": iconUrl == null ? null : iconUrl,
        "clickable": clickable == null ? null : clickable,
        "locationId": locationId == null ? null : locationId,
        "specialties": specialties == null
            ? null
            : List<dynamic>.from(specialties.map((x) => x.toMap())),
      };
}

class Specialty {
  final String name;
  final String order;
  final String group;
  final String spid;
  final int value;

  Specialty({
    this.name,
    this.order,
    this.group,
    this.spid,
    this.value,
  });

  factory Specialty.fromJson(String str) => Specialty.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Specialty.fromMap(Map<String, dynamic> json) => Specialty(
        name: json["name"] == null ? null : json["name"],
        order: json["order"] == null ? null : json["order"],
        group: json["group"] == null ? null : json["group"],
        spid: json["spid"] == null ? null : json["spid"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "order": order == null ? null : order,
        "group": group == null ? null : group,
        "spid": spid == null ? null : spid,
        "value": value == null ? null : value,
      };
}

class Options {
  final String render;
  final String listContainer;
  final int psid;
  final String radius;
  final int limit;
  final String did;
  final dynamic lat;
  final dynamic lng;
  final bool optionsAsync;
  final String search;

  Options({
    this.render,
    this.listContainer,
    this.psid,
    this.radius,
    this.limit,
    this.did,
    this.lat,
    this.lng,
    this.optionsAsync,
    this.search,
  });

  factory Options.fromJson(String str) => Options.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Options.fromMap(Map<String, dynamic> json) => Options(
        render: json["render"] == null ? null : json["render"],
        listContainer:
            json["listContainer"] == null ? null : json["listContainer"],
        psid: json["psid"] == null ? null : json["psid"],
        radius: json["radius"] == null ? null : json["radius"],
        limit: json["limit"] == null ? null : json["limit"],
        did: json["did"] == null ? null : json["did"],
        lat: json["lat"],
        lng: json["lng"],
        optionsAsync: json["async"] == null ? null : json["async"],
        search: json["search"] == null ? null : json["search"],
      );

  Map<String, dynamic> toMap() => {
        "render": render == null ? null : render,
        "listContainer": listContainer == null ? null : listContainer,
        "psid": psid == null ? null : psid,
        "radius": radius == null ? null : radius,
        "limit": limit == null ? null : limit,
        "did": did == null ? null : did,
        "lat": lat,
        "lng": lng,
        "async": optionsAsync == null ? null : optionsAsync,
        "search": search == null ? null : search,
      };
}
