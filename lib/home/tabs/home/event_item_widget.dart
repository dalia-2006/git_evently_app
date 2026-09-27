import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islami/model/event.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/size_utils.dart';

class EventItemWidget extends StatelessWidget {
  final Event event ;
  const EventItemWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {

    var height = context.height;
    var width = context.width;

    return Container(
      height: height * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            event.eventImage
          ),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).canvasColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
            margin:  EdgeInsets.all(16),
            alignment: Alignment.center,
            width: width * 0.12,
            height: height * 0.04,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border.all(
                color: Theme.of(context).canvasColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                  DateFormat('dd MMM').format(event.eventDate).toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border.all(
                color: Theme.of(context).canvasColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  event.eventTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                IconButton(
                  onPressed: () {
                    // todo: add to favourite
                  },
                  icon: Image.asset(
                 AppAssets.heart,color: Theme.of(context).cardColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
