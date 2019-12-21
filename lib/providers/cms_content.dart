import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/marketing_modules.dart';

const contentJson = '''
{
    "ref__marketing_modules_v1": [
        {
            "locale": "en",
            "uid": "blt08227480b7088a63",
            "ACL": {},
            "_content_type_uid": "marketing_modules_v1",
            "_in_progress": false,
            "_version": 1,
            "_workflow": {
                "uid": "bltaa33fbb357034216",
                "updated_at": "2019-10-23T14:34:27.142Z",
                "updated_by": "blt71efd957a88ea670",
                "version": 1
            },
            "created_at": "2019-10-23T14:34:27.145Z",
            "created_by": "blt71efd957a88ea670",
            "device_visibility": "responsive",
            "mb": [
                {
                    "mb__hero_v1": {
                        "bg_media": {
                            "opacity": "30%",
                            "bg_image_desktop": {
                                "uid": "blt3d1194ab6ff90b0a",
                                "created_at": "2019-10-15T13:13:20.328Z",
                                "updated_at": "2019-10-15T13:13:20.328Z",
                                "created_by": "blte0b0f91f2c358c52",
                                "updated_by": "blte0b0f91f2c358c52",
                                "content_type": "image/jpeg",
                                "file_size": "6279371",
                                "tags": [],
                                "filename": "H_Music_Project.jpg",
                                "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/blt3d1194ab6ff90b0a/5da5c5f0b4524f686fd799d1/H_Music_Project.jpg",
                                "ACL": [],
                                "is_dir": false,
                                "_version": 1,
                                "title": "H_Music_Project.jpg",
                                "publish_details": {
                                    "environment": "blteb30f6958e622256",
                                    "locale": "en",
                                    "time": "2019-10-18T09:33:13.145Z",
                                    "user": "blt71efd957a88ea670"
                                }
                            },
                            "bg_video_desktop": null,
                            "bg_image_mobile": {
                                "uid": "blt272b37be2701d872",
                                "created_at": "2019-10-15T13:12:54.165Z",
                                "updated_at": "2019-10-15T13:12:54.165Z",
                                "created_by": "blte0b0f91f2c358c52",
                                "updated_by": "blte0b0f91f2c358c52",
                                "content_type": "image/jpeg",
                                "file_size": "2575914",
                                "tags": [],
                                "filename": "H_MFallback_Music_Project.jpg",
                                "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/blt272b37be2701d872/5da5c5d61a18ec672d9bc0aa/H_MFallback_Music_Project.jpg",
                                "ACL": [],
                                "is_dir": false,
                                "_version": 1,
                                "title": "H_MFallback_Music_Project.jpg",
                                "publish_details": {
                                    "environment": "blteb30f6958e622256",
                                    "locale": "en",
                                    "time": "2019-10-18T09:33:13.145Z",
                                    "user": "blt71efd957a88ea670"
                                }
                            },
                            "bg_video_mobile": null,
                            "img_alt_text": ""
                        },
                        "overlaid_content": {
                            "content_alignment": "Center",
                            "text_color": "Light",
                            "eyebrow": {
                                "eyebrow_text": "",
                                "eyebrow_image": null,
                                "img_alt_text": ""
                            },
                            "headline": {
                                "headline_text": "YOUR VOICE YOUR WAY",
                                "headline_image": null,
                                "img_alt_text": ""
                            },
                            "subcopy": "",
                            "legal_copy": "",
                            "cta_links": [
                                {
                                    "cta_style": "Light Button",
                                    "link_text": "WATCH THE DOCUMENTARY",
                                    "link_url": "https://www.youtube.com/watch?v=6d9iyNSC5i0",
                                    "target_blank": false
                                }
                            ]
                        },
                        "bottom_bar": {
                            "visible": false,
                            "headline": "",
                            "bg_color": "#c41230EE",
                            "cta_links": []
                        }
                    }
                },
                {
                    "mb__spacer_v1": {
                        "select_vertical_spacing_amount": "XL"
                    }
                }
            ],
            "section_bg_color": [],
            "story_purpose": "Brand",
            "story_shortname": "Music Project Use Your Voice",
            "tags": [],
            "title": "EU_October_19_HP_Hero_Music_Project_Use_Your_Voice_EEU",
            "updated_at": "2019-10-23T14:34:27.145Z",
            "updated_by": "blt71efd957a88ea670",
            "publish_details": {
                "environment": "blteb30f6958e622256",
                "locale": "en",
                "time": "2019-10-31T16:00:10.779Z",
                "user": "blt71efd957a88ea670"
            }
        },
        {
            "locale": "en",
            "ACL": {},
            "_content_type_uid": "marketing_modules_v1",
            "_in_progress": false,
            "_version": 2,
            "_workflow": {
                "uid": "bltaa33fbb357034216",
                "updated_at": "2019-10-23T14:14:59.386Z",
                "updated_by": "blt71efd957a88ea670",
                "version": 1
            },
            "created_at": "2019-10-23T14:14:59.390Z",
            "created_by": "blt71efd957a88ea670",
            "device_visibility": "responsive",
            "mb": [
                {
                    "mb__doorway_column_v1": {
                        "eyebrow_text": "",
                        "eyebrow_color": "",
                        "signpost": "SHOP",
                        "signpost_color": "",
                        "doorway_media": [
                            {
                                "doorway_name": "",
                                "doorway_name_line_2": "",
                                "image": {
                                    "uid": "bltd9b8c6f465e2906f",
                                    "created_at": "2019-10-15T13:21:24.031Z",
                                    "updated_at": "2019-10-15T13:21:24.031Z",
                                    "created_by": "blte0b0f91f2c358c52",
                                    "updated_by": "blte0b0f91f2c358c52",
                                    "content_type": "image/jpeg",
                                    "file_size": "1004358",
                                    "tags": [],
                                    "filename": "19H2_Levis_HP_October_CD1.jpg.jpg",
                                    "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/bltd9b8c6f465e2906f/5da5c7d441cfbe67ebcd7d9a/19H2_Levis_HP_October_CD1.jpg.jpg",
                                    "ACL": [],
                                    "is_dir": false,
                                    "_version": 1,
                                    "title": "19H2_Levis_HP_October_CD1.jpg.jpg",
                                    "publish_details": {
                                        "environment": "blteb30f6958e622256",
                                        "locale": "en",
                                        "time": "2019-10-23T14:13:08.887Z",
                                        "user": "blt71efd957a88ea670"
                                    }
                                },
                                "img_alt_text": "",
                                "media_video": null,
                                "bg_image": {
                                    "uid": "bltd4a5de9c6cb215e6",
                                    "created_at": "2019-10-15T13:21:36.594Z",
                                    "updated_at": "2019-10-15T13:21:36.594Z",
                                    "created_by": "blte0b0f91f2c358c52",
                                    "updated_by": "blte0b0f91f2c358c52",
                                    "content_type": "image/jpeg",
                                    "file_size": "1066561",
                                    "tags": [],
                                    "filename": "19H2_Levis_HP_October_CD1_B.jpg.jpg",
                                    "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/bltd4a5de9c6cb215e6/5da5c7e07ad68468b4383fad/19H2_Levis_HP_October_CD1_B.jpg.jpg",
                                    "ACL": [],
                                    "is_dir": false,
                                    "_version": 1,
                                    "title": "19H2_Levis_HP_October_CD1_B.jpg.jpg",
                                    "publish_details": {
                                        "environment": "blteb30f6958e622256",
                                        "locale": "en",
                                        "time": "2019-10-23T14:13:08.887Z",
                                        "user": "blt71efd957a88ea670"
                                    }
                                },
                                "bg_img_alt_text": "",
                                "promo_text": "",
                                "bg_color_promo": "#C41230",
                                "cta_link_primary": {
                                    "link_url": "/c/levi_clothing_women",
                                    "target_blank": false
                                },
                                "cta_link_secondary": {
                                    "link_text": "WOMEN",
                                    "link_url": "/c/levi_clothing_women",
                                    "target_blank": false
                                }
                            },
                            {
                                "doorway_name": "",
                                "doorway_name_line_2": "",
                                "image": {
                                    "uid": "blt42417d83eabe4003",
                                    "created_at": "2019-10-15T13:23:23.166Z",
                                    "updated_at": "2019-10-15T13:23:23.166Z",
                                    "created_by": "blte0b0f91f2c358c52",
                                    "updated_by": "blte0b0f91f2c358c52",
                                    "content_type": "image/jpeg",
                                    "file_size": "701233",
                                    "tags": [],
                                    "filename": "19H2_Levis_HP_October_CD2.jpg.jpg",
                                    "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/blt42417d83eabe4003/5da5c84ba031496723ee8b2c/19H2_Levis_HP_October_CD2.jpg.jpg",
                                    "ACL": [],
                                    "is_dir": false,
                                    "_version": 1,
                                    "title": "19H2_Levis_HP_October_CD2.jpg.jpg",
                                    "publish_details": {
                                        "environment": "blteb30f6958e622256",
                                        "locale": "en",
                                        "time": "2019-10-23T14:13:08.887Z",
                                        "user": "blt71efd957a88ea670"
                                    }
                                },
                                "img_alt_text": "",
                                "media_video": null,
                                "bg_image": null,
                                "bg_img_alt_text": "",
                                "promo_text": "",
                                "bg_color_promo": "#C41230",
                                "cta_link_primary": {
                                    "link_url": "/c/levi_clothing_men",
                                    "target_blank": false
                                },
                                "cta_link_secondary": {
                                    "link_text": "MEN",
                                    "link_url": "/c/levi_clothing_men",
                                    "target_blank": false
                                }
                            }
                        ]
                    }
                },
                {
                    "mb__spacer_v1": {
                        "select_vertical_spacing_amount": "XL"
                    }
                }
            ],
            "section_bg_color": [],
            "story_purpose": "Product",
            "story_shortname": "Doorways Delivery 3",
            "tags": [],
            "title": "EU_October_19_HP_Column_Doorways_D3",
            "uid": "blt61d454e55fd523ef",
            "updated_at": "2019-10-23T17:34:12.386Z",
            "updated_by": "blt71efd957a88ea670",
            "publish_details": {
                "environment": "blteb30f6958e622256",
                "locale": "en",
                "time": "2019-10-25T08:02:33.313Z",
                "user": "blt71efd957a88ea670"
            }
        },
        {
            "locale": "en",
            "ACL": {},
            "_content_type_uid": "marketing_modules_v1",
            "_in_progress": false,
            "_version": 4,
            "_workflow": {
                "uid": "bltaa33fbb357034216",
                "updated_at": "2019-10-23T12:36:19.784Z",
                "updated_by": "blt71efd957a88ea670",
                "version": 1
            },
            "created_at": "2019-10-23T12:36:19.787Z",
            "created_by": "blt71efd957a88ea670",
            "device_visibility": "responsive",
            "mb": [
                {
                    "mb__hero_v1": {
                        "bg_media": {
                            "opacity": "30%",
                            "bg_image_desktop": {
                                "uid": "blt2df82a0b2492b695",
                                "created_at": "2019-10-15T13:45:23.163Z",
                                "updated_at": "2019-10-15T13:45:23.163Z",
                                "created_by": "blte0b0f91f2c358c52",
                                "updated_by": "blte0b0f91f2c358c52",
                                "content_type": "image/jpeg",
                                "file_size": "3386186",
                                "tags": [],
                                "filename": "19H2_Levis_HP_October_H_D_Outwerwear-Puffers.jpg.jpg",
                                "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/blt2df82a0b2492b695/5da5cd7360f9536373288116/19H2_Levis_HP_October_H_D_Outwerwear-Puffers.jpg.jpg",
                                "ACL": [],
                                "is_dir": false,
                                "_version": 1,
                                "title": "19H2_Levis_HP_October_H_D_Outwerwear-Puffers.jpg.jpg",
                                "publish_details": {
                                    "environment": "blteb30f6958e622256",
                                    "locale": "en",
                                    "time": "2019-10-23T13:27:34.415Z",
                                    "user": "blt71efd957a88ea670"
                                }
                            },
                            "bg_video_desktop": null,
                            "bg_image_mobile": {
                                "uid": "blt32d80570217598b0",
                                "created_at": "2019-10-15T13:45:23.561Z",
                                "updated_at": "2019-10-15T13:45:23.561Z",
                                "created_by": "blte0b0f91f2c358c52",
                                "updated_by": "blte0b0f91f2c358c52",
                                "content_type": "image/jpeg",
                                "file_size": "2458817",
                                "tags": [],
                                "filename": "19H2_Levis_HP_October_H_M_Outwerwear-Puffers.jpg.jpg",
                                "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/blt32d80570217598b0/5da5cd731a18ec672d9bc100/19H2_Levis_HP_October_H_M_Outwerwear-Puffers.jpg.jpg",
                                "ACL": [],
                                "is_dir": false,
                                "_version": 1,
                                "title": "19H2_Levis_HP_October_H_M_Outwerwear-Puffers.jpg.jpg",
                                "publish_details": {
                                    "environment": "blteb30f6958e622256",
                                    "locale": "en",
                                    "time": "2019-10-23T13:27:34.415Z",
                                    "user": "blt71efd957a88ea670"
                                }
                            },
                            "bg_video_mobile": null,
                            "img_alt_text": ""
                        },
                        "overlaid_content": {
                            "content_alignment": "Center",
                            "text_color": "Light",
                            "eyebrow": {
                                "eyebrow_text": "",
                                "eyebrow_image": null,
                                "img_alt_text": ""
                            },
                            "headline": {
                                "headline_text": "NEW IN OUTERWEAR",
                                "headline_image": null,
                                "img_alt_text": ""
                            },
                            "subcopy": "Get cosy in puffers.",
                            "legal_copy": "",
                            "cta_links": [
                                {
                                    "cta_style": "Light Button",
                                    "link_text": "SHOP MEN",
                                    "link_url": "/c/levi_clothing_men_outerwear",
                                    "target_blank": false
                                },
                                {
                                    "cta_style": "Light Button",
                                    "link_text": "SHOP WOMEN",
                                    "link_url": "/c/levi_clothing_women_outerwear",
                                    "target_blank": false
                                }
                            ]
                        },
                        "bottom_bar": {
                            "visible": false,
                            "headline": "",
                            "bg_color": "#c41230EE",
                            "cta_links": []
                        }
                    }
                },
                {
                    "mb__spacer_v1": {
                        "select_vertical_spacing_amount": "XL"
                    }
                },
                {
                    "mb__product_carousel_v1": {
                        "text_and_cta_content": {
                            "headline": "Cold-weather essentials",
                            "subcopy": "Colder days are looking good.",
                            "cta_links": [
                                {
                                    "link_text": "SHOP MEN",
                                    "link_url": "/c/levi_clothing_men_outerwear",
                                    "target_blank": false
                                },
                                {
                                    "link_text": "SHOP WOMEN",
                                    "link_url": "/c/levi_clothing_women_outerwear",
                                    "target_blank": false
                                }
                            ]
                        },
                        "carousel": [
                            {
                                "doorway_name": "",
                                "doorway_name_line_2": "",
                                "media_image": {
                                    "uid": "blt2121d62b2aa91e6a",
                                    "created_at": "2019-10-15T13:51:46.334Z",
                                    "updated_at": "2019-10-15T13:51:46.334Z",
                                    "created_by": "blte0b0f91f2c358c52",
                                    "updated_by": "blte0b0f91f2c358c52",
                                    "content_type": "image/jpeg",
                                    "file_size": "659059",
                                    "tags": [],
                                    "filename": "SH_Carousel_Outerwear-Puffer_1.jpg",
                                    "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/blt2121d62b2aa91e6a/5da5cef23c3a9367e61d43b0/SH_Carousel_Outerwear-Puffer_1.jpg",
                                    "ACL": [],
                                    "is_dir": false,
                                    "_version": 1,
                                    "title": "SH_Carousel_Outerwear-Puffer_1.jpg",
                                    "publish_details": {
                                        "environment": "blteb30f6958e622256",
                                        "locale": "en",
                                        "time": "2019-10-23T13:27:34.415Z",
                                        "user": "blt71efd957a88ea670"
                                    }
                                },
                                "img_alt_text": "",
                                "media_video": null,
                                "doorway_link": {
                                    "link_url": "/p/791340000",
                                    "target_blank": false
                                }
                            },
                            {
                                "doorway_name": "",
                                "doorway_name_line_2": "",
                                "media_image": {
                                    "uid": "blt2dc3302476f004f6",
                                    "created_at": "2019-10-15T13:52:05.905Z",
                                    "updated_at": "2019-10-15T13:52:05.905Z",
                                    "created_by": "blte0b0f91f2c358c52",
                                    "updated_by": "blte0b0f91f2c358c52",
                                    "content_type": "image/jpeg",
                                    "file_size": "920491",
                                    "tags": [],
                                    "filename": "SH_Carousel_Outerwear-Puffer_2.jpg",
                                    "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/blt2dc3302476f004f6/5da5cf05da02b165ecb5c6e3/SH_Carousel_Outerwear-Puffer_2.jpg",
                                    "ACL": [],
                                    "is_dir": false,
                                    "_version": 1,
                                    "title": "SH_Carousel_Outerwear-Puffer_2.jpg",
                                    "publish_details": {
                                        "environment": "blteb30f6958e622256",
                                        "locale": "en",
                                        "time": "2019-10-23T13:27:34.415Z",
                                        "user": "blt71efd957a88ea670"
                                    }
                                },
                                "img_alt_text": "",
                                "media_video": null,
                                "doorway_link": {
                                    "link_url": "/p/795900002",
                                    "target_blank": false
                                }
                            },
                            {
                                "doorway_name": "",
                                "doorway_name_line_2": "",
                                "media_image": {
                                    "uid": "blt79929f1446a2cf83",
                                    "created_at": "2019-10-15T13:53:08.618Z",
                                    "updated_at": "2019-10-15T13:53:08.618Z",
                                    "created_by": "blte0b0f91f2c358c52",
                                    "updated_by": "blte0b0f91f2c358c52",
                                    "content_type": "image/jpeg",
                                    "file_size": "918365",
                                    "tags": [],
                                    "filename": "SH_Carousel_Outerwear-Puffer_3.jpg",
                                    "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/blt79929f1446a2cf83/5da5cf441a18ec672d9bc116/SH_Carousel_Outerwear-Puffer_3.jpg",
                                    "ACL": [],
                                    "is_dir": false,
                                    "_version": 1,
                                    "title": "SH_Carousel_Outerwear-Puffer_3.jpg",
                                    "publish_details": {
                                        "environment": "blteb30f6958e622256",
                                        "locale": "en",
                                        "time": "2019-10-23T13:27:34.415Z",
                                        "user": "blt71efd957a88ea670"
                                    }
                                },
                                "img_alt_text": "",
                                "media_video": null,
                                "doorway_link": {
                                    "link_url": "/p/565850007",
                                    "target_blank": false
                                }
                            },
                            {
                                "doorway_name": "",
                                "doorway_name_line_2": "",
                                "media_image": {
                                    "uid": "bltc3f8151b16253ee3",
                                    "created_at": "2019-10-15T13:53:26.202Z",
                                    "updated_at": "2019-10-15T13:53:26.202Z",
                                    "created_by": "blte0b0f91f2c358c52",
                                    "updated_by": "blte0b0f91f2c358c52",
                                    "content_type": "image/jpeg",
                                    "file_size": "883934",
                                    "tags": [],
                                    "filename": "SH_Carousel_Outerwear-Puffer_4.jpg",
                                    "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/bltc3f8151b16253ee3/5da5cf563c3a9367e61d43be/SH_Carousel_Outerwear-Puffer_4.jpg",
                                    "ACL": [],
                                    "is_dir": false,
                                    "_version": 1,
                                    "title": "SH_Carousel_Outerwear-Puffer_4.jpg",
                                    "publish_details": {
                                        "environment": "blteb30f6958e622256",
                                        "locale": "en",
                                        "time": "2019-10-23T13:27:34.415Z",
                                        "user": "blt71efd957a88ea670"
                                    }
                                },
                                "img_alt_text": "",
                                "media_video": null,
                                "doorway_link": {
                                    "link_url": "/p/791340000",
                                    "target_blank": false
                                }
                            },
                            {
                                "doorway_name": "",
                                "doorway_name_line_2": "",
                                "media_image": {
                                    "uid": "bltffabbfa0113fe6fc",
                                    "created_at": "2019-10-15T13:53:43.479Z",
                                    "updated_at": "2019-10-15T13:53:43.479Z",
                                    "created_by": "blte0b0f91f2c358c52",
                                    "updated_by": "blte0b0f91f2c358c52",
                                    "content_type": "image/jpeg",
                                    "file_size": "902114",
                                    "tags": [],
                                    "filename": "SH_Carousel_Outerwear-Puffer_5.jpg",
                                    "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/bltffabbfa0113fe6fc/5da5cf67e5aefb63f5caa6ec/SH_Carousel_Outerwear-Puffer_5.jpg",
                                    "ACL": [],
                                    "is_dir": false,
                                    "_version": 1,
                                    "title": "SH_Carousel_Outerwear-Puffer_5.jpg",
                                    "publish_details": {
                                        "environment": "blteb30f6958e622256",
                                        "locale": "en",
                                        "time": "2019-10-23T13:27:34.415Z",
                                        "user": "blt71efd957a88ea670"
                                    }
                                },
                                "img_alt_text": "",
                                "media_video": null,
                                "doorway_link": {
                                    "link_url": "/p/835710002",
                                    "target_blank": false
                                }
                            }
                        ]
                    }
                },
                {
                    "mb__spacer_v1": {
                        "select_vertical_spacing_amount": "XL"
                    }
                }
            ],
            "section_bg_color": [],
            "story_purpose": "Product",
            "story_shortname": "Outerwear_Puffers",
            "tags": [],
            "title": "EU_October_19_HP_Hero_Outerwear_Puffers",
            "uid": "blt88f059eedb4b7f35",
            "updated_at": "2019-10-25T07:56:51.685Z",
            "updated_by": "blt71efd957a88ea670",
            "publish_details": {
                "environment": "blteb30f6958e622256",
                "locale": "en",
                "time": "2019-10-25T08:01:40.223Z",
                "user": "blt71efd957a88ea670"
            }
        },
        {
            "locale": "en",
            "ACL": {},
            "_in_progress": false,
            "_version": 3,
            "created_at": "2019-10-31T16:00:46.203Z",
            "created_by": "blt71efd957a88ea670",
            "device_visibility": "responsive",
            "mb": [
                {
                    "mb__doorway_column_v1": {
                        "eyebrow_text": "REIMAGINE NEUTRAL",
                        "eyebrow_color": "",
                        "signpost": "PATTERN",
                        "signpost_color": "",
                        "doorway_media": [
                            {
                                "doorway_name": "You'll want to be seen in these.",
                                "doorway_name_line_2": "",
                                "image": {
                                    "uid": "blt51a58883f420e8a6",
                                    "created_at": "2019-10-23T10:46:07.902Z",
                                    "updated_at": "2019-10-23T10:46:07.902Z",
                                    "created_by": "blt71efd957a88ea670",
                                    "updated_by": "blt71efd957a88ea670",
                                    "content_type": "image/jpeg",
                                    "file_size": "661419",
                                    "tags": [],
                                    "filename": "19H2_Levis_HP_October_CD4.jpg",
                                    "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/blt51a58883f420e8a6/5db02f6f56458c6b3fc173af/19H2_Levis_HP_October_CD4.jpg",
                                    "ACL": [],
                                    "is_dir": false,
                                    "_version": 1,
                                    "title": "19H2_Levis_HP_October_CD4.jpg",
                                    "publish_details": {
                                        "environment": "blteb30f6958e622256",
                                        "locale": "en",
                                        "time": "2019-10-23T13:27:49.279Z",
                                        "user": "blt71efd957a88ea670"
                                    }
                                },
                                "img_alt_text": "",
                                "media_video": null,
                                "bg_image": null,
                                "bg_img_alt_text": "",
                                "promo_text": "",
                                "bg_color_promo": "#C41230",
                                "cta_link_primary": {
                                    "link_url": "/c/levi_men_collections_camo",
                                    "target_blank": false
                                },
                                "cta_link_secondary": {
                                    "link_text": "SHOP MEN",
                                    "link_url": "/c/levi_men_collections_camo",
                                    "target_blank": false
                                }
                            },
                            {
                                "doorway_name": "These favourites go fast.",
                                "doorway_name_line_2": "",
                                "image": {
                                    "uid": "blt587a5cd0bc07e821",
                                    "created_at": "2019-10-23T10:42:27.292Z",
                                    "updated_at": "2019-10-23T10:42:27.292Z",
                                    "created_by": "blt71efd957a88ea670",
                                    "updated_by": "blt71efd957a88ea670",
                                    "content_type": "image/jpeg",
                                    "file_size": "923965",
                                    "tags": [],
                                    "filename": "19H2_Levis_HP_October_CD3.jpg",
                                    "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/blt587a5cd0bc07e821/5db02e93e9effa6ba5295dff/19H2_Levis_HP_October_CD3.jpg",
                                    "ACL": [],
                                    "is_dir": false,
                                    "_version": 1,
                                    "title": "19H2_Levis_HP_October_CD3.jpg",
                                    "publish_details": {
                                        "environment": "blteb30f6958e622256",
                                        "locale": "en",
                                        "time": "2019-10-23T13:27:49.279Z",
                                        "user": "blt71efd957a88ea670"
                                    }
                                },
                                "img_alt_text": "",
                                "media_video": null,
                                "bg_image": {
                                    "uid": "blt3b7358502a113238",
                                    "created_at": "2019-10-23T10:42:33.755Z",
                                    "updated_at": "2019-10-23T10:42:33.755Z",
                                    "created_by": "blt71efd957a88ea670",
                                    "updated_by": "blt71efd957a88ea670",
                                    "content_type": "image/jpeg",
                                    "file_size": "540847",
                                    "tags": [],
                                    "filename": "19H2_Levis_HP_October_CD3_B.jpg",
                                    "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/blt3b7358502a113238/5db02e996af83b6d7032c70c/19H2_Levis_HP_October_CD3_B.jpg",
                                    "ACL": [],
                                    "is_dir": false,
                                    "_version": 1,
                                    "title": "19H2_Levis_HP_October_CD3_B.jpg",
                                    "publish_details": {
                                        "environment": "blteb30f6958e622256",
                                        "locale": "en",
                                        "time": "2019-10-23T13:27:49.279Z",
                                        "user": "blt71efd957a88ea670"
                                    }
                                },
                                "bg_img_alt_text": "",
                                "promo_text": "",
                                "bg_color_promo": "#C41230",
                                "cta_link_primary": {
                                    "link_url": "/c/levi_women_collection_leopard",
                                    "target_blank": false
                                },
                                "cta_link_secondary": {
                                    "link_text": "SHOP WOMEN",
                                    "link_url": "/c/levi_women_collection_leopard",
                                    "target_blank": false
                                }
                            }
                        ]
                    }
                },
                {
                    "mb__product_carousel_v1": {
                        "text_and_cta_content": {
                            "headline": "New Styles",
                            "subcopy": "The playful prints that never go out of style.",
                            "cta_links": [
                                {
                                    "link_text": "SHOP MEN",
                                    "link_url": "/c/levi_men_collections_camo",
                                    "target_blank": false
                                },
                                {
                                    "link_text": "SHOP WOMEN",
                                    "link_url": "/c/levi_women_collection_leopard",
                                    "target_blank": false
                                }
                            ]
                        },
                        "carousel": [
                            {
                                "doorway_name": "",
                                "doorway_name_line_2": "",
                                "media_image": {
                                    "uid": "blt839b46424b77e0e2",
                                    "created_at": "2019-10-16T10:46:55.164Z",
                                    "updated_at": "2019-10-16T10:46:55.164Z",
                                    "created_by": "blte0b0f91f2c358c52",
                                    "updated_by": "blte0b0f91f2c358c52",
                                    "content_type": "image/jpeg",
                                    "file_size": "1118346",
                                    "tags": [],
                                    "filename": "SH_Carousel_Leopard-Plaid_2.jpg",
                                    "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/blt839b46424b77e0e2/5da6f51f0ef9ac63784857d9/SH_Carousel_Leopard-Plaid_2.jpg",
                                    "ACL": [],
                                    "is_dir": false,
                                    "_version": 1,
                                    "title": "SH_Carousel_Leopard-Plaid_2.jpg",
                                    "publish_details": {
                                        "environment": "blteb30f6958e622256",
                                        "locale": "en",
                                        "time": "2019-10-23T13:27:49.279Z",
                                        "user": "blt71efd957a88ea670"
                                    }
                                },
                                "img_alt_text": "",
                                "media_video": null,
                                "doorway_link": {
                                    "link_url": "/p/186720185",
                                    "target_blank": false
                                }
                            },
                            {
                                "doorway_name": "",
                                "doorway_name_line_2": "",
                                "media_image": {
                                    "uid": "blt0bf272da08b140ac",
                                    "created_at": "2019-10-16T10:47:21.031Z",
                                    "updated_at": "2019-10-16T10:47:21.031Z",
                                    "created_by": "blte0b0f91f2c358c52",
                                    "updated_by": "blte0b0f91f2c358c52",
                                    "content_type": "image/jpeg",
                                    "file_size": "1269509",
                                    "tags": [],
                                    "filename": "SH_Carousel_Leopard-Plaid_4.jpg",
                                    "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/blt0bf272da08b140ac/5da6f53960f953637328868a/SH_Carousel_Leopard-Plaid_4.jpg",
                                    "ACL": [],
                                    "is_dir": false,
                                    "_version": 1,
                                    "title": "SH_Carousel_Leopard-Plaid_4.jpg",
                                    "publish_details": {
                                        "environment": "blteb30f6958e622256",
                                        "locale": "en",
                                        "time": "2019-10-23T13:27:49.279Z",
                                        "user": "blt71efd957a88ea670"
                                    }
                                },
                                "img_alt_text": "",
                                "media_video": null,
                                "doorway_link": {
                                    "link_url": "/p/795570000",
                                    "target_blank": false
                                }
                            },
                            {
                                "doorway_name": "",
                                "doorway_name_line_2": "",
                                "media_image": {
                                    "uid": "blt3b773ed11f6de219",
                                    "created_at": "2019-10-16T10:47:31.915Z",
                                    "updated_at": "2019-10-16T10:47:31.915Z",
                                    "created_by": "blte0b0f91f2c358c52",
                                    "updated_by": "blte0b0f91f2c358c52",
                                    "content_type": "image/jpeg",
                                    "file_size": "390019",
                                    "tags": [],
                                    "filename": "SH_Carousel_Leopard-Plaid_5.jpg",
                                    "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/blt3b773ed11f6de219/5da6f543e5aefb63f5caadb9/SH_Carousel_Leopard-Plaid_5.jpg",
                                    "ACL": [],
                                    "is_dir": false,
                                    "_version": 1,
                                    "title": "SH_Carousel_Leopard-Plaid_5.jpg",
                                    "publish_details": {
                                        "environment": "blteb30f6958e622256",
                                        "locale": "en",
                                        "time": "2019-10-23T13:27:49.279Z",
                                        "user": "blt71efd957a88ea670"
                                    }
                                },
                                "img_alt_text": "",
                                "media_video": null,
                                "doorway_link": {
                                    "link_url": "/p/381150025",
                                    "target_blank": false
                                }
                            },
                            {
                                "doorway_name": "",
                                "doorway_name_line_2": "",
                                "media_image": {
                                    "uid": "bltaf3060bc1a3eed87",
                                    "created_at": "2019-10-16T10:47:45.639Z",
                                    "updated_at": "2019-10-16T10:47:45.639Z",
                                    "created_by": "blte0b0f91f2c358c52",
                                    "updated_by": "blte0b0f91f2c358c52",
                                    "content_type": "image/jpeg",
                                    "file_size": "1006984",
                                    "tags": [],
                                    "filename": "SH_Carousel_Leopard-Plaid_6.jpg",
                                    "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/bltaf3060bc1a3eed87/5da6f551b4524f686fd79fa1/SH_Carousel_Leopard-Plaid_6.jpg",
                                    "ACL": [],
                                    "is_dir": false,
                                    "_version": 1,
                                    "title": "SH_Carousel_Leopard-Plaid_6.jpg",
                                    "publish_details": {
                                        "environment": "blteb30f6958e622256",
                                        "locale": "en",
                                        "time": "2019-10-23T13:27:49.279Z",
                                        "user": "blt71efd957a88ea670"
                                    }
                                },
                                "img_alt_text": "",
                                "media_video": null,
                                "doorway_link": {
                                    "link_url": "/p/795700002",
                                    "target_blank": false
                                }
                            }
                        ]
                    }
                },
                {
                    "mb__spacer_v1": {
                        "select_vertical_spacing_amount": "XL"
                    }
                }
            ],
            "section_bg_color": [],
            "story_purpose": "Product",
            "story_shortname": "Leopard_Camo",
            "tags": [],
            "title": "Eu_October_19_HP_CD_Leopard_Camo_Eastern",
            "uid": "blt775fbaaa0131e8b0",
            "updated_at": "2019-11-15T11:45:20.829Z",
            "updated_by": "blt71efd957a88ea670",
            "publish_details": {
                "environment": "blteb30f6958e622256",
                "locale": "en",
                "time": "2019-11-15T11:45:24.764Z",
                "user": "blt71efd957a88ea670"
            },
            "_content_type_uid": "marketing_modules_v1"
        },
        {
            "locale": "en",
            "uid": "blt552a039ef660c094",
            "title": "EU HP September - Hero - Core Denim",
            "story_shortname": "Truckers & Core Denim bottoms",
            "story_purpose": "Product",
            "mb": [
                {
                    "mb__hero_v1": {
                        "bg_media": {
                            "opacity": "30%",
                            "bg_image_desktop": {
                                "uid": "blt533e779bb285ef80",
                                "created_at": "2019-09-13T22:50:09.826Z",
                                "updated_at": "2019-09-13T22:50:09.826Z",
                                "created_by": "blt3cc830403c9bf68f",
                                "updated_by": "blt3cc830403c9bf68f",
                                "content_type": "image/jpeg",
                                "file_size": "1088196",
                                "tags": [],
                                "filename": "19H2_Levis_HP_September_H_Core_denim.jpg",
                                "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/blt533e779bb285ef80/5d7c1d2139b84c70851d42d2/19H2_Levis_HP_September_H_Core_denim.jpg",
                                "ACL": [],
                                "is_dir": false,
                                "parent_uid": "blt613b1f1a4f069633",
                                "_version": 1,
                                "title": "19H2_Levis_HP_September_H_Core_denim.jpg",
                                "publish_details": {
                                    "environment": "blteb30f6958e622256",
                                    "locale": "en",
                                    "time": "2019-09-20T05:43:42.431Z",
                                    "user": "blt3cc830403c9bf68f"
                                }
                            },
                            "bg_video_desktop": null,
                            "bg_image_mobile": {
                                "uid": "blt59868dea2dc89191",
                                "created_at": "2019-09-13T22:50:09.456Z",
                                "updated_at": "2019-09-13T22:50:09.456Z",
                                "created_by": "blt3cc830403c9bf68f",
                                "updated_by": "blt3cc830403c9bf68f",
                                "content_type": "image/jpeg",
                                "file_size": "514639",
                                "tags": [],
                                "filename": "19H2_Levis_HP_September_H_Core_denim_M.jpg",
                                "url": "https://images.contentstack.io/v3/assets/blt2d702d64bab5cd4d/blt59868dea2dc89191/5d7c1d211ec6f77b9b7f07be/19H2_Levis_HP_September_H_Core_denim_M.jpg",
                                "ACL": [],
                                "is_dir": false,
                                "parent_uid": "blt613b1f1a4f069633",
                                "_version": 1,
                                "title": "19H2_Levis_HP_September_H_Core_denim_M.jpg",
                                "publish_details": {
                                    "environment": "blteb30f6958e622256",
                                    "locale": "en",
                                    "time": "2019-09-20T05:43:42.431Z",
                                    "user": "blt3cc830403c9bf68f"
                                }
                            },
                            "bg_video_mobile": null,
                            "img_alt_text": "Truckers and Core Denim bottoms"
                        },
                        "overlaid_content": {
                            "content_alignment": "Center",
                            "text_color": "Light",
                            "eyebrow": {
                                "eyebrow_text": "",
                                "eyebrow_image": null,
                                "img_alt_text": ""
                            },
                            "headline": {
                                "headline_text": "Denim on denim",
                                "headline_image": null,
                                "img_alt_text": ""
                            },
                            "subcopy": "",
                            "legal_copy": "",
                            "cta_links": [
                                {
                                    "cta_style": "Light Button",
                                    "link_text": "Shop women",
                                    "link_url": "/c/levi_clothing_women/facets/productitemtype/trucker%20jean%20jacket/productitemtype/jeans",
                                    "target_blank": false
                                },
                                {
                                    "cta_style": "Light Button",
                                    "link_text": "Shop Men",
                                    "link_url": "/c/levi_clothing_men/facets/productitemtype/jeans/productitemtype/trucker%20jean%20jacket",
                                    "target_blank": false
                                }
                            ]
                        },
                        "bottom_bar": {
                            "visible": false,
                            "headline": "",
                            "bg_color": "#c41230EE",
                            "cta_links": []
                        }
                    }
                }
            ],
            "section_bg_color": [],
            "tags": [],
            "device_visibility": "responsive",
            "_version": 7,
            "created_by": "blt71efd957a88ea670",
            "updated_by": "blt71efd957a88ea670",
            "created_at": "2019-09-18T10:29:38.632Z",
            "updated_at": "2019-10-04T23:22:15.273Z",
            "_content_type_uid": "marketing_modules_v1",
            "ACL": {},
            "_workflow": {
                "uid": "bltaa33fbb357034216",
                "updated_at": "2019-09-18T10:29:38.629Z",
                "updated_by": "blt71efd957a88ea670",
                "version": 1
            },
            "_in_progress": false,
            "publish_details": {
                "environment": "blteb30f6958e622256",
                "locale": "en",
                "time": "2019-10-05T06:23:07.602Z",
                "user": "blt71efd957a88ea670"
            }
        }
    ]
}
''';

class CmsContent with ChangeNotifier {
  List<RefMarketingModulesV1> _modules = [];

  List<RefMarketingModulesV1> get modules {
    return [..._modules];
  }

  List<Mb> _modContent = [];
  List<Mb> get moduleContent {
    return [..._modContent];
  }

  void  setModuleContent() {
    List<Mb> modContent = [];
    for (RefMarketingModulesV1 marketingModules in this._modules) {
      for (Mb mb in marketingModules.mb) {
        modContent.add(mb);
      }
    }
    _modContent = modContent;
  }

  Future<void> fetchCMSContent() async {
    final contentURL =
        'https://www.levi.com/omni-cms-gw-exp-api/v1/levicom/online/homepage?country=US&language=en_US&type=homepage_v2&include[]=ref__marketing_layout_v1.ref__marketing_modules_v1';
    final data = await http.get(contentURL);

    final Map<String, dynamic> respBody = json.decode(data.body);
    final respModules = respBody['entries'][0]['ref__marketing_layout_v1'][0]
        ['ref__marketing_modules_v1'];

    // final decodedJson = json.decode(contentJson) as Map<String, dynamic>;
    // final decodedJson = json.decode(respModules) as Map<String, dynamic>;
    //_modules =
    _modules = MarketingModules.fromJson({'ref__marketing_modules_v1': respModules}).refMarketingModulesV1;
    //await Future<void>.value(null);
    this.setModuleContent();
    notifyListeners();
  }
}
