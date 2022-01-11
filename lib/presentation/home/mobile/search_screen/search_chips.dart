import 'package:MD_Shorts/presentation/routes/routes.gr.dart';
import 'package:MD_Shorts/shared_preferences/search_shared_preference.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SearchScreenChips extends StatefulWidget {
  const SearchScreenChips({Key? key}) : super(key: key);

  @override
  State<SearchScreenChips> createState() => _SearchScreenChipsState();
}

class _SearchScreenChipsState extends State<SearchScreenChips> {
  Future<List<String>> getUserData() async {
    var searches = await SearchHistoryNotifier().getSearches();
    return Future.value(searches); // return your response
  }

  bool changed = false;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: getUserData(), // function where you call your api
      builder: (BuildContext context, AsyncSnapshot<List<String>> searches) {
        // AsyncSnapshot<Your object type>
        if (searches.connectionState == ConnectionState.waiting) {
          return const Center(child: Text('loading...'));
        } else {
          if (searches.hasError) {
            return Center(child: Text('Error: ${searches.error}'));
          } else {
            return searches.data!.isNotEmpty
                ? Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Wrap(
                          spacing: 2,
                          clipBehavior: Clip.hardEdge,
                          children: [
                            for (var search in searches.data!)
                              Container(
                                margin: const EdgeInsets.all(4),
                                height: 35,
                                padding: EdgeInsets.zero,
                                child: Chip(
                                  labelPadding: EdgeInsets.zero,
                                  label: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(7),
                                    ),
                                    child: Text(search),
                                    onPressed: () => context.router.popAndPush(
                                        CustomBottomNavigationBarRoute(
                                            index: 1, search: search)),
                                  ),
                                  onDeleted: () async {
                                    await SearchHistoryNotifier().clear(search);
                                    getUserData();
                                    setState(() {
                                      changed = !changed;
                                    });
                                  },
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.black,
                                  elevation: 0.0,
                                  padding: const EdgeInsets.all(0),
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        width: 0.9,
                                        color: Color(0xFFbdbdbd),
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(35.0)),
                                ),
                              ),
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: () async {
                            await SearchHistoryNotifier().clearAll();
                            getUserData();
                            setState(() {
                              changed = !changed;
                            });
                          },
                          child: const Text("Clear"))
                    ],
                  )
                : const SizedBox(
                    height: 0,
                  );
          }
        }
      },
    );
  }
}
