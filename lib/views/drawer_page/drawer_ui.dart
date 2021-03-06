import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../core/constants/drawer_enum.dart';
import '../../theme/app_theme.dart';
import 'drawer_page_view_model.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer(
      {Key? key,
      this.screenIndex,
      this.iconAnimationController,
      this.callBackIndex})
      : super(key: key);

  final AnimationController? iconAnimationController;
  final DrawerIndex? screenIndex;
  final Function(DrawerIndex)? callBackIndex;

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  DrawerPageViewModel model = DrawerPageViewModel();

  List<DrawerList>? drawerList;
  @override
  void initState() {
    setDrawerListArray();
    super.initState();
  }

  void setDrawerListArray() {
    drawerList = <DrawerList>[
      DrawerList(
        index: DrawerIndex.home,
        labelName: 'Home',
        icon: const Icon(CupertinoIcons.home),
      ),
      DrawerList(
        index: DrawerIndex.invite,
        labelName: 'Invite Friend',
        icon: const Icon(CupertinoIcons.group),
      ),
      DrawerList(
        index: DrawerIndex.share,
        labelName: 'Rate the app',
        icon: const Icon(CupertinoIcons.heart),
      ),
      DrawerList(
        index: DrawerIndex.about,
        labelName: 'About Us',
        icon: const Icon(CupertinoIcons.info),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.notWhite.withOpacity(0.5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          model.user?.uid != null
              ? Container(
                  width: size.width,
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        AnimatedBuilder(
                          animation: widget.iconAnimationController!,
                          builder: (BuildContext context, Widget? child) {
                            return ScaleTransition(
                              scale: AlwaysStoppedAnimation<double>(1.0 -
                                  (widget.iconAnimationController!.value) *
                                      0.2),
                              child: RotationTransition(
                                turns: AlwaysStoppedAnimation<double>(
                                    Tween<double>(begin: 0.0, end: 24.0)
                                            .animate(CurvedAnimation(
                                                parent: widget
                                                    .iconAnimationController!,
                                                curve: Curves.fastOutSlowIn))
                                            .value /
                                        360),
                                child: GestureDetector(
                                  onTap: () {
                                    model.navigateToEditProfileScreen();
                                  },
                                  child: Stack(
                                    children: [
                                      Hero(
                                        tag: "photoURL",
                                        child: Container(
                                          height: size.height * 0.125,
                                          width: size.width * 0.25,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            boxShadow: <BoxShadow>[
                                              BoxShadow(
                                                  color: AppTheme.grey
                                                      .withOpacity(0.6),
                                                  offset:
                                                      const Offset(2.0, 4.0),
                                                  blurRadius: 8),
                                            ],
                                          ),
                                          child: CircleAvatar(
                                            foregroundImage: NetworkImage(
                                                "${model.user!.photoURL}"),
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        bottom: 2,
                                        right: 5,
                                        child: CircleAvatar(
                                          radius: 10,
                                          backgroundColor: Colors.white,
                                          child: Center(
                                            child: Icon(
                                              CupertinoIcons.pencil,
                                              size: 15,
                                              color: AppTheme.primaryColor,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 4),
                          child: Text(
                            '${model.user!.displayName}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppTheme.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  width: size.width,
                  padding: const EdgeInsets.only(top: 40.0),
                ),
          const SizedBox(
            height: 4,
          ),
          Divider(
            height: 1,
            color: AppTheme.grey.withOpacity(0.6),
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0.0),
              itemCount: drawerList?.length,
              itemBuilder: (BuildContext context, int index) {
                return inkwell(drawerList![index]);
              },
            ),
          ),
          Divider(
            height: 1,
            color: AppTheme.grey.withOpacity(0.6),
          ),
          Column(
            children: <Widget>[
              model.user?.uid != null
                  ? ListTile(
                      title: const Text(
                        'Sign Out',
                        style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppTheme.darkText,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      trailing: const Icon(
                        CupertinoIcons.power,
                        color: Colors.red,
                      ),
                      onTap: () {
                        model.logout();
                      },
                    )
                  : ListTile(
                      title: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontFamily: AppTheme.fontName,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppTheme.darkText,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      trailing: const Icon(
                        CupertinoIcons.power,
                        color: AppTheme.primaryColor,
                        size: 30,
                      ),
                      onTap: () {
                        model.navigateToLoginScreen();
                      },
                    ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget inkwell(DrawerList listData) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.grey.withOpacity(0.1),
        highlightColor: Colors.transparent,
        onTap: () {
          navigationtoScreen(listData.index!);
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 6.0,
                    height: 46.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  listData.isAssetsImage
                      ? SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset(listData.imageName,
                              color: widget.screenIndex == listData.index
                                  ? Colors.black
                                  : AppTheme.nearlyBlack),
                        )
                      : Icon(listData.icon?.icon,
                          color: widget.screenIndex == listData.index
                              ? Colors.black
                              : AppTheme.nearlyBlack),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                  ),
                  Text(
                    listData.labelName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: widget.screenIndex == listData.index
                          ? Colors.black
                          : AppTheme.nearlyBlack,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            widget.screenIndex == listData.index
                ? AnimatedBuilder(
                    animation: widget.iconAnimationController!,
                    builder: (BuildContext context, Widget? child) {
                      return Transform(
                        transform: Matrix4.translationValues(
                            (MediaQuery.of(context).size.width * 0.75 - 64) *
                                (1.0 -
                                    widget.iconAnimationController!.value -
                                    1.0),
                            0.0,
                            0.0),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width * 0.75 - 64,
                            height: 46,
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor.withOpacity(0.4),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(28),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(28),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Future<void> navigationtoScreen(DrawerIndex indexScreen) async {
    widget.callBackIndex!(indexScreen);
  }
}

class DrawerList {
  DrawerList({
    this.isAssetsImage = false,
    this.labelName = '',
    this.icon,
    this.index,
    this.imageName = '',
  });

  String labelName;
  Icon? icon;
  bool isAssetsImage;
  String imageName;
  DrawerIndex? index;
}
