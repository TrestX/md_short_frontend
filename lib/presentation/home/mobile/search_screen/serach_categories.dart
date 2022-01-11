import 'package:MD_Shorts/application/category/search_category_bloc/bloc/searchcategory_bloc.dart';
import 'package:MD_Shorts/presentation/home/mobile/search_screen/categories_skeleton_view.dart';
import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class SearchCategories extends StatelessWidget {
//   const SearchCategories({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: SizedBox(
//         height: 115,
//         child: Scaffold(
//           body: BlocBuilder<SearchcategoryBloc, SearchcategoryState>(
//               builder: (context, state) {
//             return state.map(
//               initial: (_) => Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 // ignore: prefer_const_literals_to_create_immutables
//                 children: [const CategoriesSkeleton()],
//               ),
//               loadInProgress: (_) => Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 // ignore: prefer_const_literals_to_create_immutables
//                 children: [const CategoriesSkeleton()],
//               ),
//               loadSuccess: (categories) => SizedBox(
//                 height: 115,
//                 child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: categories.userCategory.length,
//                     itemBuilder: (_, i) {
//                       return GestureDetector(
//                         onTap: () => context.router.popAndPush(
//                             CustomBottomNavigationBarRoute(
//                                 index: 1,
//                                 search:
//                                     categories.userCategory[i].categoryName)),
//                         child: SizedBox(
//                           width: 120,
//                           child: Container(
//                             margin: const EdgeInsets.only(right: 13),
//                             padding: EdgeInsets.zero,
//                             child: Column(children: [
//                               Center(
//                                 child: CircleAvatar(
//                                   radius: MediaQuery.of(context).size.width >
//                                           750
//                                       ? 39
//                                       : MediaQuery.of(context).size.width > 375
//                                           ? 39
//                                           : MediaQuery.of(context).size.width >
//                                                   280
//                                               ? 29
//                                               : 24,
//                                   child: CircleAvatar(
//                                     radius: MediaQuery.of(context).size.width >
//                                             750
//                                         ? 39
//                                         : MediaQuery.of(context).size.width >
//                                                 375
//                                             ? 39
//                                             : MediaQuery.of(context)
//                                                         .size
//                                                         .width >
//                                                     280
//                                                 ? 29
//                                                 : 24,
//                                     backgroundColor:
//                                         const Color.fromRGBO(1, 83, 151, 0.6),
//                                     child: const Align(
//                                       alignment: Alignment.bottomRight,
//                                       child: null,
//                                     ),
//                                   ),
//                                   backgroundImage: NetworkImage(
//                                       categories.userCategory[i].imageUrl),
//                                 ),
//                               ),
//                               const SizedBox(height: 10),
//                               Text(
//                                 categories.userCategory[i].categoryName,
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                     fontSize: 10,
//                                     fontWeight: FontWeight.w600,
//                                     color: Colors.grey),
//                               )
//                             ]),
//                           ),
//                         ),
//                       );
//                     }),
//               ),
//               loadFailure: (_) => Container(),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }


class SearchCategories extends StatelessWidget {
  SearchCategories({Key? key}) : super(key: key);
  final List<String> searchList = ['My Feed','All News','Top News','Trending'];
  final List<String> searchImageList = ['tabs','square','star','trend'];
  final Map<String, IconData> iconMapping = {
  'tabs' : FontAwesomeIcons.layerGroup,
  'star' : FontAwesomeIcons.star,
  'square' : FontAwesomeIcons.thLarge,
  'trend': FontAwesomeIcons.chartLine
};
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 115,
        child: Scaffold(
          body: SizedBox(
                height: 115,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: searchList.length,
                    itemBuilder: (_, i) {
                      return GestureDetector(
                        onTap: () => context.router.navigate(ViewAllPageRoute(title: searchList[i])),
                        child: SizedBox(
                          width: 100,
                          child: Container(
                            margin: const EdgeInsets.only(right: 13),
                            padding: EdgeInsets.zero,
                            child: Column(children: [
                              Center(
                                child: CircleAvatar(
                                  radius: MediaQuery.of(context).size.width >
                                          750
                                      ? 39
                                      : MediaQuery.of(context).size.width > 375
                                          ? 39
                                          : MediaQuery.of(context).size.width >
                                                  280
                                              ? 29
                                              : 24,
                                  child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.width >
                                            750
                                        ? 39
                                        : MediaQuery.of(context).size.width >
                                                375
                                            ? 39
                                            : MediaQuery.of(context)
                                                        .size
                                                        .width >
                                                    280
                                                ? 29
                                                : 24,
                                    backgroundColor:
                                        const Color.fromRGBO(1, 83, 151, 1),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Icon(iconMapping[searchImageList[i]],color: const Color.fromRGBO(255, 255, 255, 1)),
                                    ),
                                  ),
                                  backgroundImage: const AssetImage(""),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                searchList[i],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey),
                              )
                            ]),
                          ),
                        ),
                      );
                    }),
              ),
            )
        ),
      );
  }
}

