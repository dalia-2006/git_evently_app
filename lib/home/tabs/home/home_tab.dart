import 'package:cloud_firestore/cloud_firestore.dart' show QuerySnapshot;
import 'package:flutter/material.dart';
import 'package:islami/home/tabs/home/event_item_widget.dart';
import 'package:islami/home/tabs/home/tab_bar_item_widget.dart';
import 'package:islami/l10n/app_localizations.dart';
import 'package:islami/provider/user_provider.dart';
import 'package:islami/utils/app_color.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/firebase_utils.dart';
import 'package:provider/provider.dart';
import '../../../model/event.dart';
import '../../../provider/app_language_provider.dart';
import '../../../provider/app_theme_Provider.dart';
import '../../../utils/size_utils.dart';

class HomeTab extends StatefulWidget {
  int selectedIndex = 0;

   HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;
  List<Event>eventsList =[];
  List<Event>filterList =[];
  @override
  void initState(){
    super.initState();
    getAllEvents();
  }
  @override
  Widget build(BuildContext context) {

    var userProvider =Provider.of<UserProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    List<String> eventsNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.bookClub,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.birthday,
    ];

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.04,
          ),
          child: DefaultTabController(
            length: eventsNameList.length,
            child: Column(
              spacing: context.height * 0.01,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        AppLocalizations.of(context)!.welcome,
                        style: AppStyles.reg14grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // todo : change theme
                        themeProvider.changeTheme(themeProvider.isDark ?ThemeMode.light:ThemeMode.dark);
                      },
                      icon: themeProvider.appTheme.isDark
                          ? Icon(
                              Icons.brightness_2_outlined,
                              color: AppColor.mainDarkColor,
                              size: 25,
                            )
                          : Icon(
                              Icons.wb_sunny_outlined,
                              color: AppColor.mainLightColor,
                              size: 25,
                            ),
                    ),
                    Container(
                      width: 50,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: (){
                          //todo : change language
                          languageProvider.changeLanguage(languageProvider.isEnglish?'ar':'en');
                        },
                        child: Text(
                          AppLocalizations.of(context)!.en,
                          style: AppStyles.semi14White,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  userProvider.currentUser!.name,
                  style: Theme.of(context).textTheme.headlineLarge,
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
                  tabs: eventsNameList.map((eventName) {
                    return TabBarItemWidget(
                      isSelected:
                          selectedIndex == eventsNameList.indexOf(eventName),
                      eventName: eventName,
                    );
                  }).toList(),
                ),
               Expanded(
                   child:StreamBuilder<List<Event >>(
                       stream: getAllEvents(),
                       builder: (context, snapshot){
                         if(snapshot.hasError){
                           return Center(child: Text(snapshot.error.toString(),
                               style: Theme.of(context).textTheme.titleMedium,));
                         }else if(snapshot.connectionState == ConnectionState.waiting){
                           return Center(child:CircularProgressIndicator(color: AppColor.disableColor,),);
                         }else if (!snapshot.hasData || snapshot.data!.isEmpty ){
                           return Center(child: Text('No Event Founded',style: Theme.of(context).textTheme.titleMedium,),);
                         }else{
                            eventsList = snapshot.data! ;
                             if(selectedIndex == 0){
                               filterList = eventsList ;
                             }else {
                              filterList = eventsList.where((event){
                                 return event.eventCategoryIndex == selectedIndex;
                               }).toList();
                              filterList.sort((event1, event2) {
                                return event1.eventDate.compareTo(event2.eventDate);
                              },
                              );
                             }
                            /// OR
                            // selectedIndex == 0 ? getAllEvents() : getFilterEvents();
                            return filterList.isEmpty
                                ?
                            Center(child: Text('No ${eventsNameList[selectedIndex] } events',style: Theme.of(context).textTheme.titleMedium,),)
                            :
                              ListView.separated(
                              itemBuilder: (context, index) {
                                return EventItemWidget(event: filterList[index],);
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: context.height * 0.01);
                              },
                              itemCount: filterList.length,
                            );
                         }
                       },
                   ),
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // void getAllEvents () async{
  //  var querySnapshot = await FirebaseUtils.getEventCollection().get();
  //  eventsList =querySnapshot.docs.map((doc) {
  //    return doc.data();
  //  },).toList();
  //  setState(() {
  //
  //  });
  // }
///=====================================================
Stream<List<Event>> getAllEvents(){
  Stream<QuerySnapshot<Event>> stream = FirebaseUtils.getEventCollection().snapshots();
   return stream.map((querySnapshot){
    return querySnapshot.docs.map((doc){
      return doc.data();
    }).toList() ;
  });
}
///========================================================
//   Stream<List<Event>> getAllEvents(){
//     Stream<QuerySnapshot<Event>> stream = FirebaseUtils.getEventCollection()
//         .orderBy('event_date').snapshots();
//     return stream.map((querySnapshot){
//       return querySnapshot.docs.map((doc){
//         return doc.data();
//       }).toList() ;
//     });
//   }
//
//   Stream<List<Event>> getFilterEvents(){
//     Stream<QuerySnapshot<Event>> stream = FirebaseUtils.getEventCollection()
//         .where('event_category_index',isEqualTo: selectedIndex)
//         .orderBy('event_date').snapshots();
//     return stream.map((querySnapshot){
//       return querySnapshot.docs.map((doc){
//         return doc.data();
//       }).toList() ;
//     });
//   }
}
