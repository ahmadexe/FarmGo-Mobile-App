import 'package:cached_network_image/cached_network_image.dart';
import 'package:farmgo/models/article.dart';
import 'package:farmgo/providers/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../configs/custom_colors.dart';
import '../configs/defined_colors.dart';
import '../utils/url_utils.dart';

class NewsCard extends StatelessWidget {
  final bool isMain;
  final Article article;
  const NewsCard({required this.article, this.isMain = false, super.key});

  @override
  Widget build(BuildContext context) {
    AppProvider app = AppProvider.state(context);
    return GestureDetector(
      onTap: () {
        UrlUtils.launchTheUrl(article.url!);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: isMain ? 300.h : 100.h,
        decoration: BoxDecoration(
            color: isMain ? fieldContrastDark : Colors.transparent,
            border: Border.all(
              color: customPrimaryColorDark,
            ),
            borderRadius:
                BorderRadius.all(Radius.circular(app.radius.lightCurve))),
        child: isMain
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 8,
                      child: SizedBox(
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: article.urlToImage!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: app.space.y4),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          UrlUtils.launchTheUrl(article.url!);
                        },
                        child: Row(
                          children: [
                            Expanded(
                              flex: 16,
                              child: Text(article.title!,
                                  style: app.text.t1b,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            const Expanded(
                              child: Icon(Icons.arrow_forward, size: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(article.description!,
                          style: app.text.t2.copyWith(color: textColorGrey),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    UrlUtils.launchTheUrl(article.url!);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SizedBox(
                            height: double.infinity,
                            child: CachedNetworkImage(
                              imageUrl: article.urlToImage!,
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(width: app.space.x2),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(article.title!,
                                style: app.text.t1b,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                            SizedBox(
                              width: 300,
                              height: 60,
                              child: Text(article.description!,
                                  style:
                                      app.text.t2.copyWith(color: textColorGrey),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
