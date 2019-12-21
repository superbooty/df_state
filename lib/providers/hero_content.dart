import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/marketing_modules.dart';

class MbHeroV1 with ChangeNotifier{
    final BgMedia bgMedia;
    final OverlaidContent overlaidContent;
    final BottomBar bottomBar;

    MbHeroV1({
        this.bgMedia,
        this.overlaidContent,
        this.bottomBar,
    });

    factory MbHeroV1.fromRawJson(String str) => MbHeroV1.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MbHeroV1.fromJson(Map<String, dynamic> json) => MbHeroV1(
        bgMedia: json["bg_media"] == null ? null : BgMedia.fromJson(json["bg_media"]),
        overlaidContent: json["overlaid_content"] == null ? null : OverlaidContent.fromJson(json["overlaid_content"]),
        bottomBar: json["bottom_bar"] == null ? null : BottomBar.fromJson(json["bottom_bar"]),
    );

    Map<String, dynamic> toJson() => {
        "bg_media": bgMedia == null ? null : bgMedia.toJson(),
        "overlaid_content": overlaidContent == null ? null : overlaidContent.toJson(),
        "bottom_bar": bottomBar == null ? null : bottomBar.toJson(),
    };
}