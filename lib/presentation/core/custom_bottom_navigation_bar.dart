import 'package:MD_Shorts/application/page_selected/page_selected_bloc.dart';
import 'package:MD_Shorts/presentation/home/mobile/bookmark_screen/bookmark_page.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/home_page_sidebar.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/search_screen_page.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/user_search_screen_page.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final String search;
  final int index;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  CustomBottomNavigationBar({Key? key, this.search = "", this.index = 0})
      : super(key: key);

  Widget tabSwitch(int i, String search) {
    switch (i) {
      case 0:
        return index == 1 ? UserSearchPage(search: search) : const SearchPage();
      case 1:
        return const BookmarkPage();
      default:
        return const SearchPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (index == 1) {
      UserSearchPage(search: search);
    }
    if (index == 7) {
      const BookmarkPage();
    }
    return BlocProvider(
      create: (context) => PageSelectedBloc(),
      child: Dismissible(
        resizeDuration: null,
        key: const ValueKey(0),
        onDismissed: (dismissDirection) {
          if (dismissDirection == DismissDirection.endToStart) {
            context.router.popAndPush(HomePageRoute());
          }
        },
        child: BlocBuilder<PageSelectedBloc, PageSelectedState>(
          builder: (context, state) {
            if (index == 3) {
              context
                  .read<PageSelectedBloc>()
                  .add(PageSelectedEvent.changeLastIndex(index));
            }
            String title = state.lastIndex == 0 ? "Discover" : "Bookmarks";
            return Scaffold(
              key: _key,
              appBar: AppBar(
                title: Text(title),
                centerTitle: true,
                shadowColor: Colors.white,
                actions: [
                  TextButton.icon(
                    onPressed: () {
                      context.router.navigate(HomePageRoute());
                    },
                    icon: const Text("Feed"),
                    label: const Icon(Icons.arrow_right_outlined),
                  )
                ],
              ),
              endDrawer: const HomePageSideBar(),
              bottomNavigationBar: CustomNavigationBar(
                iconSize: 30.0,
                selectedColor: const Color(0xff040307),
                strokeColor: const Color(0x30040307),
                unSelectedColor: const Color(0xff040307),
                backgroundColor: Colors.white,
                onTap: (val) {
                  if (index == 1 || index == 3) {
                    context.router
                        .push(CustomBottomNavigationBarRoute(index: val));
                  } else if (val < 2) {
                    context
                        .read<PageSelectedBloc>()
                        .add(PageSelectedEvent.changeLastIndex(val));
                  } else {
                    _key.currentState!.openEndDrawer();
                  }
                },
                items: [
                  CustomNavigationBarItem(
                    icon: const FaIcon(FontAwesomeIcons.compass),
                    selectedIcon: const FaIcon(
                      FontAwesomeIcons.solidCompass,
                      color: Color(0xFF015397),
                    ),
                  ),
                  // CustomNavigationBarItem(
                  //   icon: const Icon(Icons.search),
                  //   selectedIcon: const Icon(
                  //     Icons.search,
                  //     color: Color(0xFF015397),
                  //   ),
                  // ),
                  CustomNavigationBarItem(
                    icon: const Icon(Icons.bookmark_border_outlined),
                    selectedIcon: const Icon(
                      Icons.bookmark,
                      color: Color(0xFF015397),
                    ),
                  ),
                  CustomNavigationBarItem(
                    icon: const Icon(
                      Icons.account_circle_outlined,
                    ),
                    selectedIcon: const Icon(
                      Icons.account_circle,
                      color: Color(0xFF015397),
                    ),
                  ),
                ],
                currentIndex: state.lastIndex,
              ),
              body: tabSwitch(state.lastIndex, search),
            );
          },
        ),
      ),
    );
  }
}
