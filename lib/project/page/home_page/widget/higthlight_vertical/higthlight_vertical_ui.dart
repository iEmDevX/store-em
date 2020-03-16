import 'package:flutter/material.dart';

class HigthlightVerticalUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 10, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Blog Collections',
                style: TextStyle(fontSize: 20),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.teal,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        HigthlightVerticalUiItem(),
        HigthlightVerticalUiItem(),
        HigthlightVerticalUiItem(),
      ],
    );
  }
}

class HigthlightVerticalUiItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 65,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    child: Image.network(
                      "https://images.pexels.com/photos/3766257/pexels-photo-3766257.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=200&w=500",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Review of FastAPI powered by the Slant community. ',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '19/06/2019 15:03',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
