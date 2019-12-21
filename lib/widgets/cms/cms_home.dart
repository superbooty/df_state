import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snaplist/snaplist.dart';

import '../../widgets/cms/cms_hero.dart';
import '../../providers/cms_content.dart';

class CMSHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**
     * Use SnapList to create the scrollable view
     */
    return Consumer<CmsContent>(
      builder: (ctx, contentModules, child) => SnapList(
        builder: (context, i, data) => ChangeNotifierProvider.value(
            value: contentModules.moduleContent[i].mbHeroV1,
            child: contentModules.moduleContent[i].mbHeroV1 != null
                ? CMSHero()
                : SizedBox()),
        count: contentModules.moduleContent.length,
        separatorProvider: (i, data) {
          return contentModules.moduleContent[i].mbHeroV1 != null
              ? Size(5, 5)
              : Size(0, 0);
        },
        sizeProvider: (i, data) {
          return contentModules.moduleContent[i].mbHeroV1 != null
              ? Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height)
              : Size(0, 0);
        },
      ),
    );
  }
}
