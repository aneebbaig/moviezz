import 'package:flutter/material.dart';
import '/utils/color_constant.dart';
import '/widget/custom_text.dart';
import '/widget/rate_icon_display.dart';

import '../utils/math_util.dart';
import 'common_imageview.dart';

class MovieCardView extends StatelessWidget {
  final String poster;
  final String name;
  final String date;
  final num rate;
  final num id;
  final Color color;
  final String genre;
  final bool isTopMostMovie;
  final String overView;
  final EdgeInsetsGeometry padding;
  final GestureTapCallback? onTap;

  const MovieCardView({
    Key? key,
    required this.poster,
    required this.name,
    required this.date,
    required this.id,
    required this.color,
    required this.rate,
    required this.genre,
    required this.onTap,
    required this.padding,
    required this.isTopMostMovie,
    required this.overView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: getMargin(
            top: 8.0,
            bottom: 8.0,
          ),
          decoration: BoxDecoration(
            color: isTopMostMovie
                ? ColorConstant.blueColor
                : ColorConstant.gray900,
            borderRadius: BorderRadius.circular(
              getHorizontalSize(
                8.00,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    getHorizontalSize(
                      4.00,
                    ),
                  ),
                  bottomLeft: Radius.circular(
                    getHorizontalSize(
                      4.00,
                    ),
                  ),
                ),
                child: CommonImageView(
                  url: "https://image.tmdb.org/t/p/w500/$poster",
                  height: getVerticalSize(
                    170.00,
                  ),
                  width: getHorizontalSize(
                    110.00,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: getVerticalSize(
                    170.00,
                  ),
                  child: Padding(
                    padding: getPadding(
                      left: 15,
                      right: 15,
                      top: 15,
                      bottom: 15,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        isTopMostMovie
                            ? Row(
                                children: [
                                  CommonImageView(
                                    svgPath: "assets/award_ribbon.svg",
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  CustomTextWidget(
                                    text: "Top movie this week",
                                    fontSize: 14,
                                    textAlign: TextAlign.left,
                                    fontWeight: FontWeight.w400,
                                    spacingHeight: 1.33,
                                    color: color.withOpacity(0.8),
                                  ),
                                ],
                              )
                            : Container(),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                            width: getHorizontalSize(
                              151.00,
                            ),
                            child: CustomTextWidget(
                              text: name,
                              fontSize: 16,
                              textAlign: TextAlign.left,
                              fontWeight: FontWeight.w500,
                              spacingHeight: 1.25,
                              color: ColorConstant.whiteA700,
                            )),
                        Container(
                          width: getHorizontalSize(
                            double.infinity,
                          ),
                          margin: getMargin(
                            top: 7,
                            right: 10,
                          ),
                          child: CustomTextWidget(
                            text: "$genre\n${date.split("-").first}",
                            fontSize: 11,
                            textAlign: TextAlign.left,
                            fontWeight: FontWeight.w400,
                            spacingHeight: 1.33,
                            color: color.withOpacity(0.8),
                          ),
                        ),
                        Spacer(),
                        Container(
                          margin: getMargin(
                            top: 19,
                            right: 10,
                          ),
                          child: Flex(
                            direction: Axis.horizontal,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Container(
                                  color: color.withOpacity(0.05),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        RateDisplay(
                                          value: ((rate * 5) / 10),
                                        ),
                                        CustomTextWidget(
                                          text:
                                              "  ${num.parse(((rate * 5) / 10).toStringAsFixed(1))}/5",
                                          fontSize: 12,
                                          textAlign: TextAlign.left,
                                          fontWeight: FontWeight.w400,
                                          spacingHeight: 1.00,
                                          color: color,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
