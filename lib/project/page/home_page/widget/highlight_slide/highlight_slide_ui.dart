import 'package:flutter/material.dart';

class HighlightSlide extends StatelessWidget {
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
                'Wonmen Collections',
                style: TextStyle(fontSize: 20),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
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
        SizedBox(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(width: 15),
              HighlightSlideItem(),
              HighlightSlideItem(),
              HighlightSlideItem(),
              HighlightSlideItem(),
              HighlightSlideItem(),
              HighlightSlideItem(),
              HighlightSlideItem(),
              HighlightSlideItem(),
            ],
          ),
        ),
      ],
    );
  }
}

class HighlightSlideItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: 100,
                height: 150,
                child: Image.network(
                  "https://images.pexels.com/photos/2028885/pexels-photo-2028885.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=500&w=750",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  boxShadow: [new BoxShadow(blurRadius: 2)],
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(10.0)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    '10%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Name Collection',
            maxLines: 1,
          ),
          Text(
            '\$1000.00',
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 12,
              fontWeight: FontWeight.w200,
            ),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.teal,
                size: 15,
              ),
              Icon(
                Icons.star,
                color: Colors.teal,
                size: 15,
              ),
              Icon(
                Icons.star_half,
                color: Colors.teal,
                size: 15,
              ),
              Icon(
                Icons.star_border,
                color: Colors.teal,
                size: 15,
              ),
              Icon(
                Icons.star_border,
                color: Colors.teal,
                size: 15,
              ),
              Text(
                '3.5',
                style: TextStyle(fontSize: 10),
              )
            ],
          )
        ],
      ),
    );
  }
}
