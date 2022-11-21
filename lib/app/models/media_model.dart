/*
 * File name: media_model.dart
 * Last modified: 2022.02.14 at 11:29:09
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/global_service.dart';
import 'parents/model.dart';

class Media extends Model {
  String id;
  String name;
  String url;
  String thumb;
  String icon;
  String size;
  String collectionName;

  Media({String id, String url, String thumb, String icon}) {
    this.id = id ?? UniqueKey().toString();
    this.url =
        url ?? "${Get.find<GlobalService>().baseUrl}images/image_default.png";
    this.thumb =
        thumb ?? "${Get.find<GlobalService>().baseUrl}images/image_default.png";
    this.icon =
        icon ?? "${Get.find<GlobalService>().baseUrl}images/image_default.png";
    this.collectionName = collectionName ?? "image";
  }

  Media.fromJson(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      name = jsonMap['name'];
      url = jsonMap['url'];
      thumb = jsonMap['thumb'];
      icon = jsonMap['icon'];
      size = jsonMap['formatted_size'];
      collectionName = jsonMap['collection_name'];
    } catch (e) {
      url = "${Get.find<GlobalService>().baseUrl}images/image_default.png";
      thumb = "${Get.find<GlobalService>().baseUrl}images/image_default.png";
      icon = "${Get.find<GlobalService>().baseUrl}images/image_default.png";
      collectionName = "image";

      print(e);
    }
  }

  Map<String, dynamic> toJson() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["url"] = url;
    map["thumb"] = thumb;
    map["icon"] = icon;
    map["formatted_size"] = size;
    map["collection_name"] = collectionName;

    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is Media &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          url == other.url &&
          thumb == other.thumb &&
          icon == other.icon &&
          size == other.size &&
          collectionName == other.collectionName;

  @override
  int get hashCode =>
      super.hashCode ^
      id.hashCode ^
      name.hashCode ^
      url.hashCode ^
      thumb.hashCode ^
      icon.hashCode ^
      size.hashCode ^
      collectionName.hashCode;
}
