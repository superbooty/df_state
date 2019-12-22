import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

import '../../widgets/transformers/page_view_transformers.dart';
import '../../widgets/cms/cms_hero.dart';
import '../../providers/cms_content.dart';

class CMSHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /**
     * Use SnapList to create the scrollable view
     */
    return Consumer<CmsContent>(
      builder: (ctx, contentModules, child) => TransformerPageView(
        loop: true,
        itemCount: contentModules.heroContent.length,
        transformer: new AccordionTransformer(),
        itemBuilder: (ctx, i) { 
          return ChangeNotifierProvider.value(
            value: contentModules.heroContent[i].mbHeroV1,
            child: const CMSHero(),
          );
        },
        
        onPageChanged: (page) {
          print(
              'Pange :: ${contentModules.heroContent[page].mbHeroV1.overlaidContent.headline.headlineText}');
        },
      ),
    );
  }
}
