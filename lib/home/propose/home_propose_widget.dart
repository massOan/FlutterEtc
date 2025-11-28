import 'package:flutter/material.dart';
import 'package:flutteretc/api/model/propose_menu.dart';

class HomeDetailsProposeWidget extends StatelessWidget {
  final ProposeMenu proposeMenu;

  const HomeDetailsProposeWidget({Key? key, required this.proposeMenu})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text(
                proposeMenu.homeTitle,
                maxLines: 2,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
        SizedBox(
          width: 415,
          height: 180,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 20.0),
            scrollDirection: Axis.horizontal,
            itemCount: proposeMenu.proposeCats.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ProposePage(
                  //             categoryKey:
                  //                 proposeMenu.proposeCats[index].proposeKey)));
                },
                child: Container(
                  width: 130,
                  height: 130,
                  margin: EdgeInsets.only(right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: GestureDetector(
                          child: Container(
                            width: 130,
                            height: 112,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(proposeMenu
                                        .proposeCats[index].proposeImage ??
                                    ""),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        proposeMenu.proposeCats[index].proposeCategory1,
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
