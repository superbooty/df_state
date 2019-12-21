import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../providers/hero_content.dart';

// generated https://app.quicktype.io/

class MarketingModules {
    final List<RefMarketingModulesV1> refMarketingModulesV1;

    MarketingModules({
        this.refMarketingModulesV1,
    });

    factory MarketingModules.fromRawJson(String str) => MarketingModules.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MarketingModules.fromJson(Map<String, dynamic> json) => MarketingModules(
        refMarketingModulesV1: json["ref__marketing_modules_v1"] == null ? null : List<RefMarketingModulesV1>.from(json["ref__marketing_modules_v1"].map((x) => RefMarketingModulesV1.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ref__marketing_modules_v1": refMarketingModulesV1 == null ? null : List<dynamic>.from(refMarketingModulesV1.map((x) => x.toJson())),
    };
}

class RefMarketingModulesV1 {
    final Locale locale;
    final String uid;
    final Acl acl;
    final String contentTypeUid;
    final bool inProgress;
    final int version;
    final Workflow workflow;
    final DateTime createdAt;
    final CreatedBy createdBy;
    final String deviceVisibility;
    final List<Mb> mb;
    final List<dynamic> sectionBgColor;
    final String storyPurpose;
    final String storyShortname;
    final List<dynamic> tags;
    final String title;
    final DateTime updatedAt;
    final CreatedBy updatedBy;
    final PublishDetails publishDetails;

    RefMarketingModulesV1({
        this.locale,
        this.uid,
        this.acl,
        this.contentTypeUid,
        this.inProgress,
        this.version,
        this.workflow,
        this.createdAt,
        this.createdBy,
        this.deviceVisibility,
        this.mb,
        this.sectionBgColor,
        this.storyPurpose,
        this.storyShortname,
        this.tags,
        this.title,
        this.updatedAt,
        this.updatedBy,
        this.publishDetails,
    });

    factory RefMarketingModulesV1.fromRawJson(String str) => RefMarketingModulesV1.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RefMarketingModulesV1.fromJson(Map<String, dynamic> json) => RefMarketingModulesV1(
        locale: json["locale"] == null ? null : localeValues.map[json["locale"]],
        uid: json["uid"] == null ? null : json["uid"],
        acl: json["ACL"] == null ? null : Acl.fromJson(json["ACL"]),
        contentTypeUid: json["_content_type_uid"] == null ? null : json["_content_type_uid"],
        inProgress: json["_in_progress"] == null ? null : json["_in_progress"],
        version: json["_version"] == null ? null : json["_version"],
        workflow: json["_workflow"] == null ? null : Workflow.fromJson(json["_workflow"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        createdBy: json["created_by"] == null ? null : createdByValues.map[json["created_by"]],
        deviceVisibility: json["device_visibility"] == null ? null : json["device_visibility"],
        mb: json["mb"] == null ? null : List<Mb>.from(json["mb"].map((x) => Mb.fromJson(x))),
        sectionBgColor: json["section_bg_color"] == null ? null : List<dynamic>.from(json["section_bg_color"].map((x) => x)),
        storyPurpose: json["story_purpose"] == null ? null : json["story_purpose"],
        storyShortname: json["story_shortname"] == null ? null : json["story_shortname"],
        tags: json["tags"] == null ? null : List<dynamic>.from(json["tags"].map((x) => x)),
        title: json["title"] == null ? null : json["title"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"] == null ? null : createdByValues.map[json["updated_by"]],
        publishDetails: json["publish_details"] == null ? null : PublishDetails.fromJson(json["publish_details"]),
    );

    Map<String, dynamic> toJson() => {
        "locale": locale == null ? null : localeValues.reverse[locale],
        "uid": uid == null ? null : uid,
        "ACL": acl == null ? null : acl.toJson(),
        "_content_type_uid": contentTypeUid == null ? null : contentTypeUid,
        "_in_progress": inProgress == null ? null : inProgress,
        "_version": version == null ? null : version,
        "_workflow": workflow == null ? null : workflow.toJson(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "created_by": createdBy == null ? null : createdByValues.reverse[createdBy],
        "device_visibility": deviceVisibility == null ? null : deviceVisibility,
        "mb": mb == null ? null : List<dynamic>.from(mb.map((x) => x.toJson())),
        "section_bg_color": sectionBgColor == null ? null : List<dynamic>.from(sectionBgColor.map((x) => x)),
        "story_purpose": storyPurpose == null ? null : storyPurpose,
        "story_shortname": storyShortname == null ? null : storyShortname,
        "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
        "title": title == null ? null : title,
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "updated_by": updatedBy == null ? null : createdByValues.reverse[updatedBy],
        "publish_details": publishDetails == null ? null : publishDetails.toJson(),
    };
}

class Acl {
    Acl();

    factory Acl.fromRawJson(String str) => Acl.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Acl.fromJson(Map<String, dynamic> json) => Acl(
    );

    Map<String, dynamic> toJson() => {
    };
}

enum CreatedBy { BLTE0_B0_F91_F2_C358_C52, BLT71_EFD957_A88_EA670, BLT3_CC830403_C9_BF68_F }

final createdByValues = EnumValues({
    "blt3cc830403c9bf68f": CreatedBy.BLT3_CC830403_C9_BF68_F,
    "blt71efd957a88ea670": CreatedBy.BLT71_EFD957_A88_EA670,
    "blte0b0f91f2c358c52": CreatedBy.BLTE0_B0_F91_F2_C358_C52
});

enum Locale { EN }

final localeValues = EnumValues({
    "en": Locale.EN
});

class Mb with ChangeNotifier{
    final MbHeroV1 mbHeroV1;
    final MbSpacerV1 mbSpacerV1;
    final MbDoorwayColumnV1 mbDoorwayColumnV1;
    final MbProductCarouselV1 mbProductCarouselV1;

    Mb({
        this.mbHeroV1,
        this.mbSpacerV1,
        this.mbDoorwayColumnV1,
        this.mbProductCarouselV1,
    });

    factory Mb.fromRawJson(String str) => Mb.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Mb.fromJson(Map<String, dynamic> json) => Mb(
        mbHeroV1: json["mb__hero_v1"] == null ? null : MbHeroV1.fromJson(json["mb__hero_v1"]),
        mbSpacerV1: json["mb__spacer_v1"] == null ? null : MbSpacerV1.fromJson(json["mb__spacer_v1"]),
        mbDoorwayColumnV1: json["mb__doorway_column_v1"] == null ? null : MbDoorwayColumnV1.fromJson(json["mb__doorway_column_v1"]),
        mbProductCarouselV1: json["mb__product_carousel_v1"] == null ? null : MbProductCarouselV1.fromJson(json["mb__product_carousel_v1"]),
    );

    Map<String, dynamic> toJson() => {
        "mb__hero_v1": mbHeroV1 == null ? null : mbHeroV1.toJson(),
        "mb__spacer_v1": mbSpacerV1 == null ? null : mbSpacerV1.toJson(),
        "mb__doorway_column_v1": mbDoorwayColumnV1 == null ? null : mbDoorwayColumnV1.toJson(),
        "mb__product_carousel_v1": mbProductCarouselV1 == null ? null : mbProductCarouselV1.toJson(),
    };
}

class MbDoorwayColumnV1 with ChangeNotifier{
    final String eyebrowText;
    final String eyebrowColor;
    final String signpost;
    final String signpostColor;
    final List<DoorwayMedia> doorwayMedia;

    MbDoorwayColumnV1({
        this.eyebrowText,
        this.eyebrowColor,
        this.signpost,
        this.signpostColor,
        this.doorwayMedia,
    });

    factory MbDoorwayColumnV1.fromRawJson(String str) => MbDoorwayColumnV1.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MbDoorwayColumnV1.fromJson(Map<String, dynamic> json) => MbDoorwayColumnV1(
        eyebrowText: json["eyebrow_text"] == null ? null : json["eyebrow_text"],
        eyebrowColor: json["eyebrow_color"] == null ? null : json["eyebrow_color"],
        signpost: json["signpost"] == null ? null : json["signpost"],
        signpostColor: json["signpost_color"] == null ? null : json["signpost_color"],
        doorwayMedia: json["doorway_media"] == null ? null : List<DoorwayMedia>.from(json["doorway_media"].map((x) => DoorwayMedia.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "eyebrow_text": eyebrowText == null ? null : eyebrowText,
        "eyebrow_color": eyebrowColor == null ? null : eyebrowColor,
        "signpost": signpost == null ? null : signpost,
        "signpost_color": signpostColor == null ? null : signpostColor,
        "doorway_media": doorwayMedia == null ? null : List<dynamic>.from(doorwayMedia.map((x) => x.toJson())),
    };
}

class DoorwayMedia {
    final String doorwayName;
    final String doorwayNameLine2;
    final BgImageDesktop image;
    final String imgAltText;
    final dynamic mediaVideo;
    final BgImageDesktop bgImage;
    final String bgImgAltText;
    final String promoText;
    final String bgColorPromo;
    final CtaLinkPrimary ctaLinkPrimary;
    final CtaLink ctaLinkSecondary;

    DoorwayMedia({
        this.doorwayName,
        this.doorwayNameLine2,
        this.image,
        this.imgAltText,
        this.mediaVideo,
        this.bgImage,
        this.bgImgAltText,
        this.promoText,
        this.bgColorPromo,
        this.ctaLinkPrimary,
        this.ctaLinkSecondary,
    });

    factory DoorwayMedia.fromRawJson(String str) => DoorwayMedia.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DoorwayMedia.fromJson(Map<String, dynamic> json) => DoorwayMedia(
        doorwayName: json["doorway_name"] == null ? null : json["doorway_name"],
        doorwayNameLine2: json["doorway_name_line_2"] == null ? null : json["doorway_name_line_2"],
        image: json["image"] == null ? null : BgImageDesktop.fromJson(json["image"]),
        imgAltText: json["img_alt_text"] == null ? null : json["img_alt_text"],
        mediaVideo: json["media_video"],
        bgImage: json["bg_image"] == null ? null : BgImageDesktop.fromJson(json["bg_image"]),
        bgImgAltText: json["bg_img_alt_text"] == null ? null : json["bg_img_alt_text"],
        promoText: json["promo_text"] == null ? null : json["promo_text"],
        bgColorPromo: json["bg_color_promo"] == null ? null : json["bg_color_promo"],
        ctaLinkPrimary: json["cta_link_primary"] == null ? null : CtaLinkPrimary.fromJson(json["cta_link_primary"]),
        ctaLinkSecondary: json["cta_link_secondary"] == null ? null : CtaLink.fromJson(json["cta_link_secondary"]),
    );

    Map<String, dynamic> toJson() => {
        "doorway_name": doorwayName == null ? null : doorwayName,
        "doorway_name_line_2": doorwayNameLine2 == null ? null : doorwayNameLine2,
        "image": image == null ? null : image.toJson(),
        "img_alt_text": imgAltText == null ? null : imgAltText,
        "media_video": mediaVideo,
        "bg_image": bgImage == null ? null : bgImage.toJson(),
        "bg_img_alt_text": bgImgAltText == null ? null : bgImgAltText,
        "promo_text": promoText == null ? null : promoText,
        "bg_color_promo": bgColorPromo == null ? null : bgColorPromo,
        "cta_link_primary": ctaLinkPrimary == null ? null : ctaLinkPrimary.toJson(),
        "cta_link_secondary": ctaLinkSecondary == null ? null : ctaLinkSecondary.toJson(),
    };
}

class BgImageDesktop {
    final String uid;
    final DateTime createdAt;
    final DateTime updatedAt;
    final CreatedBy createdBy;
    final CreatedBy updatedBy;
    final ContentType contentType;
    final String fileSize;
    final List<dynamic> tags;
    final String filename;
    final String url;
    final List<dynamic> acl;
    final bool isDir;
    final int version;
    final String title;
    final PublishDetails publishDetails;
    final String parentUid;

    BgImageDesktop({
        this.uid,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
        this.contentType,
        this.fileSize,
        this.tags,
        this.filename,
        this.url,
        this.acl,
        this.isDir,
        this.version,
        this.title,
        this.publishDetails,
        this.parentUid,
    });

    factory BgImageDesktop.fromRawJson(String str) => BgImageDesktop.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BgImageDesktop.fromJson(Map<String, dynamic> json) => BgImageDesktop(
        uid: json["uid"] == null ? null : json["uid"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"] == null ? null : createdByValues.map[json["created_by"]],
        updatedBy: json["updated_by"] == null ? null : createdByValues.map[json["updated_by"]],
        contentType: json["content_type"] == null ? null : contentTypeValues.map[json["content_type"]],
        fileSize: json["file_size"] == null ? null : json["file_size"],
        tags: json["tags"] == null ? null : List<dynamic>.from(json["tags"].map((x) => x)),
        filename: json["filename"] == null ? null : json["filename"],
        url: json["url"] == null ? null : json["url"],
        acl: json["ACL"] == null ? null : List<dynamic>.from(json["ACL"].map((x) => x)),
        isDir: json["is_dir"] == null ? null : json["is_dir"],
        version: json["_version"] == null ? null : json["_version"],
        title: json["title"] == null ? null : json["title"],
        publishDetails: json["publish_details"] == null ? null : PublishDetails.fromJson(json["publish_details"]),
        parentUid: json["parent_uid"] == null ? null : json["parent_uid"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid == null ? null : uid,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "created_by": createdBy == null ? null : createdByValues.reverse[createdBy],
        "updated_by": updatedBy == null ? null : createdByValues.reverse[updatedBy],
        "content_type": contentType == null ? null : contentTypeValues.reverse[contentType],
        "file_size": fileSize == null ? null : fileSize,
        "tags": tags == null ? null : List<dynamic>.from(tags.map((x) => x)),
        "filename": filename == null ? null : filename,
        "url": url == null ? null : url,
        "ACL": acl == null ? null : List<dynamic>.from(acl.map((x) => x)),
        "is_dir": isDir == null ? null : isDir,
        "_version": version == null ? null : version,
        "title": title == null ? null : title,
        "publish_details": publishDetails == null ? null : publishDetails.toJson(),
        "parent_uid": parentUid == null ? null : parentUid,
    };
}

enum ContentType { IMAGE_JPEG }

final contentTypeValues = EnumValues({
    "image/jpeg": ContentType.IMAGE_JPEG
});

class PublishDetails {
    final Environment environment;
    final Locale locale;
    final DateTime time;
    final CreatedBy user;

    PublishDetails({
        this.environment,
        this.locale,
        this.time,
        this.user,
    });

    factory PublishDetails.fromRawJson(String str) => PublishDetails.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PublishDetails.fromJson(Map<String, dynamic> json) => PublishDetails(
        environment: json["environment"] == null ? null : environmentValues.map[json["environment"]],
        locale: json["locale"] == null ? null : localeValues.map[json["locale"]],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        user: json["user"] == null ? null : createdByValues.map[json["user"]],
    );

    Map<String, dynamic> toJson() => {
        "environment": environment == null ? null : environmentValues.reverse[environment],
        "locale": locale == null ? null : localeValues.reverse[locale],
        "time": time == null ? null : time.toIso8601String(),
        "user": user == null ? null : createdByValues.reverse[user],
    };
}

enum Environment { BLTEB30_F6958_E622256 }

final environmentValues = EnumValues({
    "blteb30f6958e622256": Environment.BLTEB30_F6958_E622256
});

class CtaLinkPrimary {
    final String linkUrl;
    final bool targetBlank;

    CtaLinkPrimary({
        this.linkUrl,
        this.targetBlank,
    });

    factory CtaLinkPrimary.fromRawJson(String str) => CtaLinkPrimary.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CtaLinkPrimary.fromJson(Map<String, dynamic> json) => CtaLinkPrimary(
        linkUrl: json["link_url"] == null ? null : json["link_url"],
        targetBlank: json["target_blank"] == null ? null : json["target_blank"],
    );

    Map<String, dynamic> toJson() => {
        "link_url": linkUrl == null ? null : linkUrl,
        "target_blank": targetBlank == null ? null : targetBlank,
    };
}

class CtaLink {
    final String linkText;
    final String linkUrl;
    final bool targetBlank;
    final String ctaStyle;

    CtaLink({
        this.linkText,
        this.linkUrl,
        this.targetBlank,
        this.ctaStyle,
    });

    factory CtaLink.fromRawJson(String str) => CtaLink.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CtaLink.fromJson(Map<String, dynamic> json) => CtaLink(
        linkText: json["link_text"] == null ? null : json["link_text"],
        linkUrl: json["link_url"] == null ? null : json["link_url"],
        targetBlank: json["target_blank"] == null ? null : json["target_blank"],
        ctaStyle: json["cta_style"] == null ? null : json["cta_style"],
    );

    Map<String, dynamic> toJson() => {
        "link_text": linkText == null ? null : linkText,
        "link_url": linkUrl == null ? null : linkUrl,
        "target_blank": targetBlank == null ? null : targetBlank,
        "cta_style": ctaStyle == null ? null : ctaStyle,
    };
}


class BgMedia {
    final String opacity;
    final BgImageDesktop bgImageDesktop;
    final dynamic bgVideoDesktop;
    final BgImageDesktop bgImageMobile;
    final dynamic bgVideoMobile;
    final String imgAltText;

    BgMedia({
        this.opacity,
        this.bgImageDesktop,
        this.bgVideoDesktop,
        this.bgImageMobile,
        this.bgVideoMobile,
        this.imgAltText,
    });

    factory BgMedia.fromRawJson(String str) => BgMedia.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BgMedia.fromJson(Map<String, dynamic> json) => BgMedia(
        opacity: json["opacity"] == null ? null : json["opacity"],
        bgImageDesktop: json["bg_image_desktop"] == null ? null : BgImageDesktop.fromJson(json["bg_image_desktop"]),
        bgVideoDesktop: json["bg_video_desktop"],
        bgImageMobile: json["bg_image_mobile"] == null ? null : BgImageDesktop.fromJson(json["bg_image_mobile"]),
        bgVideoMobile: json["bg_video_mobile"],
        imgAltText: json["img_alt_text"] == null ? null : json["img_alt_text"],
    );

    Map<String, dynamic> toJson() => {
        "opacity": opacity == null ? null : opacity,
        "bg_image_desktop": bgImageDesktop == null ? null : bgImageDesktop.toJson(),
        "bg_video_desktop": bgVideoDesktop,
        "bg_image_mobile": bgImageMobile == null ? null : bgImageMobile.toJson(),
        "bg_video_mobile": bgVideoMobile,
        "img_alt_text": imgAltText == null ? null : imgAltText,
    };
}

class BottomBar {
    final bool visible;
    final String headline;
    final String bgColor;
    final List<dynamic> ctaLinks;

    BottomBar({
        this.visible,
        this.headline,
        this.bgColor,
        this.ctaLinks,
    });

    factory BottomBar.fromRawJson(String str) => BottomBar.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BottomBar.fromJson(Map<String, dynamic> json) => BottomBar(
        visible: json["visible"] == null ? null : json["visible"],
        headline: json["headline"] == null ? null : json["headline"],
        bgColor: json["bg_color"] == null ? null : json["bg_color"],
        ctaLinks: json["cta_links"] == null ? null : List<dynamic>.from(json["cta_links"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "visible": visible == null ? null : visible,
        "headline": headline == null ? null : headline,
        "bg_color": bgColor == null ? null : bgColor,
        "cta_links": ctaLinks == null ? null : List<dynamic>.from(ctaLinks.map((x) => x)),
    };
}

class OverlaidContent {
    final String contentAlignment;
    final String textColor;
    final Eyebrow eyebrow;
    final Headline headline;
    final String subcopy;
    final String legalCopy;
    final List<CtaLink> ctaLinks;

    OverlaidContent({
        this.contentAlignment,
        this.textColor,
        this.eyebrow,
        this.headline,
        this.subcopy,
        this.legalCopy,
        this.ctaLinks,
    });

    factory OverlaidContent.fromRawJson(String str) => OverlaidContent.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OverlaidContent.fromJson(Map<String, dynamic> json) => OverlaidContent(
        contentAlignment: json["content_alignment"] == null ? null : json["content_alignment"],
        textColor: json["text_color"] == null ? null : json["text_color"],
        eyebrow: json["eyebrow"] == null ? null : Eyebrow.fromJson(json["eyebrow"]),
        headline: json["headline"] == null ? null : Headline.fromJson(json["headline"]),
        subcopy: json["subcopy"] == null ? null : json["subcopy"],
        legalCopy: json["legal_copy"] == null ? null : json["legal_copy"],
        ctaLinks: json["cta_links"] == null ? null : List<CtaLink>.from(json["cta_links"].map((x) => CtaLink.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "content_alignment": contentAlignment == null ? null : contentAlignment,
        "text_color": textColor == null ? null : textColor,
        "eyebrow": eyebrow == null ? null : eyebrow.toJson(),
        "headline": headline == null ? null : headline.toJson(),
        "subcopy": subcopy == null ? null : subcopy,
        "legal_copy": legalCopy == null ? null : legalCopy,
        "cta_links": ctaLinks == null ? null : List<dynamic>.from(ctaLinks.map((x) => x.toJson())),
    };
}

class Eyebrow {
    final String eyebrowText;
    final dynamic eyebrowImage;
    final String imgAltText;

    Eyebrow({
        this.eyebrowText,
        this.eyebrowImage,
        this.imgAltText,
    });

    factory Eyebrow.fromRawJson(String str) => Eyebrow.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Eyebrow.fromJson(Map<String, dynamic> json) => Eyebrow(
        eyebrowText: json["eyebrow_text"] == null ? null : json["eyebrow_text"],
        eyebrowImage: json["eyebrow_image"],
        imgAltText: json["img_alt_text"] == null ? null : json["img_alt_text"],
    );

    Map<String, dynamic> toJson() => {
        "eyebrow_text": eyebrowText == null ? null : eyebrowText,
        "eyebrow_image": eyebrowImage,
        "img_alt_text": imgAltText == null ? null : imgAltText,
    };
}

class Headline {
    final String headlineText;
    final dynamic headlineImage;
    final String imgAltText;

    Headline({
        this.headlineText,
        this.headlineImage,
        this.imgAltText,
    });

    factory Headline.fromRawJson(String str) => Headline.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Headline.fromJson(Map<String, dynamic> json) => Headline(
        headlineText: json["headline_text"] == null ? null : json["headline_text"],
        headlineImage: json["headline_image"],
        imgAltText: json["img_alt_text"] == null ? null : json["img_alt_text"],
    );

    Map<String, dynamic> toJson() => {
        "headline_text": headlineText == null ? null : headlineText,
        "headline_image": headlineImage,
        "img_alt_text": imgAltText == null ? null : imgAltText,
    };
}

class MbProductCarouselV1 with ChangeNotifier{
    final TextAndCtaContent textAndCtaContent;
    final List<Carousel> carousel;

    MbProductCarouselV1({
        this.textAndCtaContent,
        this.carousel,
    });

    factory MbProductCarouselV1.fromRawJson(String str) => MbProductCarouselV1.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MbProductCarouselV1.fromJson(Map<String, dynamic> json) => MbProductCarouselV1(
        textAndCtaContent: json["text_and_cta_content"] == null ? null : TextAndCtaContent.fromJson(json["text_and_cta_content"]),
        carousel: json["carousel"] == null ? null : List<Carousel>.from(json["carousel"].map((x) => Carousel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "text_and_cta_content": textAndCtaContent == null ? null : textAndCtaContent.toJson(),
        "carousel": carousel == null ? null : List<dynamic>.from(carousel.map((x) => x.toJson())),
    };
}

class Carousel {
    final String doorwayName;
    final String doorwayNameLine2;
    final BgImageDesktop mediaImage;
    final String imgAltText;
    final dynamic mediaVideo;
    final CtaLinkPrimary doorwayLink;

    Carousel({
        this.doorwayName,
        this.doorwayNameLine2,
        this.mediaImage,
        this.imgAltText,
        this.mediaVideo,
        this.doorwayLink,
    });

    factory Carousel.fromRawJson(String str) => Carousel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Carousel.fromJson(Map<String, dynamic> json) => Carousel(
        doorwayName: json["doorway_name"] == null ? null : json["doorway_name"],
        doorwayNameLine2: json["doorway_name_line_2"] == null ? null : json["doorway_name_line_2"],
        mediaImage: json["media_image"] == null ? null : BgImageDesktop.fromJson(json["media_image"]),
        imgAltText: json["img_alt_text"] == null ? null : json["img_alt_text"],
        mediaVideo: json["media_video"],
        doorwayLink: json["doorway_link"] == null ? null : CtaLinkPrimary.fromJson(json["doorway_link"]),
    );

    Map<String, dynamic> toJson() => {
        "doorway_name": doorwayName == null ? null : doorwayName,
        "doorway_name_line_2": doorwayNameLine2 == null ? null : doorwayNameLine2,
        "media_image": mediaImage == null ? null : mediaImage.toJson(),
        "img_alt_text": imgAltText == null ? null : imgAltText,
        "media_video": mediaVideo,
        "doorway_link": doorwayLink == null ? null : doorwayLink.toJson(),
    };
}

class TextAndCtaContent {
    final String headline;
    final String subcopy;
    final List<CtaLink> ctaLinks;

    TextAndCtaContent({
        this.headline,
        this.subcopy,
        this.ctaLinks,
    });

    factory TextAndCtaContent.fromRawJson(String str) => TextAndCtaContent.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory TextAndCtaContent.fromJson(Map<String, dynamic> json) => TextAndCtaContent(
        headline: json["headline"] == null ? null : json["headline"],
        subcopy: json["subcopy"] == null ? null : json["subcopy"],
        ctaLinks: json["cta_links"] == null ? null : List<CtaLink>.from(json["cta_links"].map((x) => CtaLink.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "headline": headline == null ? null : headline,
        "subcopy": subcopy == null ? null : subcopy,
        "cta_links": ctaLinks == null ? null : List<dynamic>.from(ctaLinks.map((x) => x.toJson())),
    };
}

class MbSpacerV1 with ChangeNotifier{
    final String selectVerticalSpacingAmount;

    MbSpacerV1({
        this.selectVerticalSpacingAmount,
    });

    factory MbSpacerV1.fromRawJson(String str) => MbSpacerV1.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MbSpacerV1.fromJson(Map<String, dynamic> json) => MbSpacerV1(
        selectVerticalSpacingAmount: json["select_vertical_spacing_amount"] == null ? null : json["select_vertical_spacing_amount"],
    );

    Map<String, dynamic> toJson() => {
        "select_vertical_spacing_amount": selectVerticalSpacingAmount == null ? null : selectVerticalSpacingAmount,
    };
}

class Workflow {
    final String uid;
    final DateTime updatedAt;
    final CreatedBy updatedBy;
    final int version;

    Workflow({
        this.uid,
        this.updatedAt,
        this.updatedBy,
        this.version,
    });

    factory Workflow.fromRawJson(String str) => Workflow.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Workflow.fromJson(Map<String, dynamic> json) => Workflow(
        uid: json["uid"] == null ? null : json["uid"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"] == null ? null : createdByValues.map[json["updated_by"]],
        version: json["version"] == null ? null : json["version"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid == null ? null : uid,
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "updated_by": updatedBy == null ? null : createdByValues.reverse[updatedBy],
        "version": version == null ? null : version,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}