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
      builder: (ctx, contentModules, child) => PageView.builder(
        itemCount: contentModules.heroContent.length,
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: contentModules.heroContent[i].mbHeroV1,
          child: CMSHero(),
        ),
        onPageChanged: (page) {
          print(
              'Pange :: ${contentModules.heroContent[page].mbHeroV1.overlaidContent.headline.headlineText}');
        },
      ),
    );
  }
}
