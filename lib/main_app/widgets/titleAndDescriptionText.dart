
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pure.international.snackskitty.customer/main_app/resources/appConst.dart';
import 'package:pure.international.snackskitty.customer/main_app/utils/controller/sizeConfig.dart';

class TitleDescriptionText extends StatelessWidget {
  final GetSizeConfig sizeConfig = Get.find();

  final String title;
  final String description;

  TitleDescriptionText({
    required this.title,
    required this.description,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: AppConst.textTitleColor,
              fontSize: sizeConfig.getPixels(18)
          ),
        ),
        SizedBox(height: sizeConfig.height*10,),
        RichText(
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: description.length > 230 ? description.substring(0,230) + '...' : description,
            style: TextStyle(
              color: AppConst.textBodyColor
            ),
            children: [
              description.length > 230 ? TextSpan(
                recognizer: TapGestureRecognizer()..onTap = () {
                  Get.dialog(Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                        height: sizeConfig.height*400,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                title,
                                style: TextStyle(
                                    color: AppConst.textTitleColor,
                                    fontSize: sizeConfig.getPixels(18)
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  description
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
                },
                text: 'See full',
                style: TextStyle(
                  color: AppConst.blue
                ),
              ) : WidgetSpan(child: Text('.',style: TextStyle(
                  color: AppConst.textBodyColor
              ),))
            ]
          )
        )
      ],
    );
  }
}
