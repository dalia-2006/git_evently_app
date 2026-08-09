import 'package:flutter/material.dart';
import 'package:islami/home/widgets/custom_text_field.dart';
import 'package:islami/utils/app_styles.dart';

import '../../../utils/size_utils.dart';
import '../home/event_item_widget.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.04,
        ),
        child: Column(
          spacing: height * 0.02,
          children: [
            CustomTextField(
              suffixIcon: Icon(
                Icons.search_rounded,
                color: Theme.of(context).cardColor,
              ),
              hintText: "Search for Events",
              hintStyle: AppStyles.reg14grey,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return EventItemWidget();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: context.height * 0.01);
                },
                itemCount: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
