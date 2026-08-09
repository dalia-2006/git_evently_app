import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:islami/home/widgets/common_container.dart';
import 'package:islami/home/widgets/custom_elevated_button.dart';
import 'package:islami/home/widgets/custom_text_field.dart';
import 'package:islami/home/widgets/row_widget.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:provider/provider.dart';
import '../home/tabs/home/tab_bar_item_widget.dart';
import '../home/widgets/arrow_back_widget.dart';
import '../l10n/app_localizations.dart';
import '../provider/app_theme_Provider.dart';
import '../utils/app_routes.dart';
import '../utils/size_utils.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  int selectedIndex = 0;
  var formKey = GlobalKey<FormState>();
  String eventTitle = '';

  String eventDescription = '';

  DateTime? selectedEventDate;
  String formatDate = '';
  TimeOfDay? selectedEventTime;
  String formatTime = '';
  String selectedEventName = '';
  String selectedEventImage = '';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    List<String> eventImgLight = [
      AppAssets.sport_light,
      AppAssets.book_club_light,
      AppAssets.meeting_light,
      AppAssets.exhibition_light,
      AppAssets.birthday_light,
    ];
    List<String> eventImgDark = [
      AppAssets.sport_dark,
      AppAssets.book_club_dark,
      AppAssets.meeting_dark,
      AppAssets.exhibition_dark,
      AppAssets.birthday_dark,
    ];
    List<String> addEventList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.birthday,
    ];
    selectedEventName = addEventList[selectedIndex];
    // selectedEventImage= themeProvider.appTheme.isDark?eventImgDark[selectedIndex]:eventImgLight[selectedIndex];
    return DefaultTabController(
      length: 5,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: ArrowBackWidget(
              icon: IconButton(
                onPressed: () {
                  //todo : navigate to home
                  Navigator.of(context).pushNamed(AppRoutes.homeRouteName);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Theme.of(context).focusColor,
                  size: 30,
                ),
              ),
            ),
            title: Text(
              AppLocalizations.of(context)!.addEvent,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.only(
              left: context.width * 0.02,
              right: context.width * 0.02,
              bottom: context.height * 0.02,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: context.height * 0.02,
                  children: [
                    CommonContainer1(
                      img: themeProvider.appTheme.isDark
                          ? eventImgDark[selectedIndex]
                          : eventImgLight[selectedIndex],
                    ),
                    TabBar(
                      isScrollable: true,
                      onTap: (index) {
                        selectedIndex = index;
                        setState(() {});
                      },
                      labelPadding: EdgeInsets.symmetric(
                        horizontal: context.width * 0.01,
                      ),
                      tabAlignment: TabAlignment.start,
                      tabs: addEventList.map((eventName) {
                        return TabBarItemWidget(
                          isSelected:
                              selectedIndex == addEventList.indexOf(eventName),
                          eventName: eventName,
                        );
                      }).toList(),
                    ),
                    Text(
                      AppLocalizations.of(context)!.title,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    CustomTextField(
                      hintText: AppLocalizations.of(context)!.eventTitle,
                      errorStyle: AppStyles.reg12Red,
                      onChanged: (text) {
                        eventTitle = text;
                      },
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Enter Event Title";
                        }
                        return null;
                      },
                    ),
                    Text(
                      AppLocalizations.of(context)!.description,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),

                    CustomTextField(
                      hintText: AppLocalizations.of(context)!.eventDescription,
                      errorStyle: AppStyles.reg12Red,
                      maxLines: 6,
                      onChanged: (text) {
                        eventDescription = text;
                      },
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return "Please Enter Event Description";
                        }
                        return null;
                      },
                    ),
                    RowWidget(
                      img: themeProvider.appTheme.isDark
                          ? AppAssets.dateDark
                          : AppAssets.dateLight,
                      title: AppLocalizations.of(context)!.eventDate,
                      description: selectedEventDate == null
                          ? AppLocalizations.of(context)!.chooseDate
                          : formatDate,
                      onChooseClick: onChooseDate,
                    ),
                    RowWidget(
                      img: themeProvider.appTheme.isDark
                          ? AppAssets.timeDark
                          : AppAssets.timeLight,
                      title: AppLocalizations.of(context)!.eventTime,
                      description: selectedEventTime == null
                          ? AppLocalizations.of(context)!.chooseTime
                          : formatTime,
                      onChooseClick: onChooseTime,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomElevatedButton(
                          onPressed: () {
                            addEvent();
                          },
                          child: Text(
                            AppLocalizations.of(context)!.addEvent,
                            style: AppStyles.med20White,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addEvent() {
    // todo : adda event
    if (formKey.currentState?.validate() == true) {
      Navigator.of(context).pushNamed(AppRoutes.eventDetailsRouteName);
    }
  }

  void onChooseDate() async {
    var chooseDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chooseDate != null) {
      selectedEventDate = chooseDate;
      formatDate = DateFormat('dd / MM / yyyy').format(selectedEventDate!);
      setState(() {});
    }
  }

  void onChooseTime() async {
    var chooseTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (chooseTime == null) {
      selectedEventTime = chooseTime;
      formatTime = chooseTime!.format(context);
      setState(() {});
    }
  }
}
