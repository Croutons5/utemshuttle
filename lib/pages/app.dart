import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shuttle/model/app-model.dart';
import 'package:shuttle/model/map/map-model.dart';
import 'package:shuttle/model/user/user-model.dart';
import 'package:shuttle/pages/maps-page.dart';
import 'package:shuttle/widget/item-bar.dart';
import 'package:shuttle/widget/list-page.dart';

class AppPage extends StatefulWidget {
  @override
  State createState() {
    return _AppPage();
  }
}

class _AppPage extends State<AppPage> {
  AppModel appModel;
  UserModel userModel;

  @override
  Widget build(BuildContext context) {
    final itemStyle = Theme.of(context).textTheme.body1;
    List<BubbleBottomBarItem> items = [
      BubbleBottomBarItem(
          backgroundColor: Colors.grey[300],
          icon: Icon(
            Icons.dashboard,
            color: Colors.black,
          ),
          activeIcon: Icon(
            Icons.dashboard,
            color: Colors.grey,
          ),
          title: Text(
            "Dashboard",
            style: itemStyle,
          )),
      BubbleBottomBarItem(
          backgroundColor: Colors.grey[300],
          icon: Icon(
            Icons.more_horiz,
            color: Colors.black,
          ),
          activeIcon: Icon(
            Icons.more_horiz,
            color: Colors.grey,
          ),
          title: Text(
            "Misc",
            style: itemStyle,
          )),
    ];
    return Scaffold(
      extendBody: true,
      drawer: Drawer(
        child: Container(
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(userModel.user != null
                      ? 'Name: ' + userModel.user.displayName.toString()
                      : ''),
                  Text(userModel.user != null
                      ? 'Email: ' + userModel.user.email.toString()
                      : ''),
                  SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: ScopedModel(
          child:
              ScopedModelDescendant<AppModel>(builder: (context, child, model) {
            return listWidget[model.index];
          }),
          model: appModel),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[200],
        isExtended: true,
        elevation: 10.0,
        shape:
            BeveledRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ScopedModel(model: MapModel(), child: MapPage()))),
        child: Icon(
          Icons.my_location,
          color: Colors.grey,
        ),
      ),
      bottomNavigationBar:
          ScopedModelDescendant<AppModel>(builder: (context, child, model) {
        return BubbleBottomBar(
            hasInk: true,
            inkColor: Colors.grey,
            fabLocation: BubbleBottomBarFabLocation.end,
            currentIndex: model.index,
            onTap: model.changeIndex,
            opacity: 0.5,
            hasNotch: true,
            items: items);
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    appModel = ScopedModel.of(context);
    userModel = ScopedModel.of(context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
