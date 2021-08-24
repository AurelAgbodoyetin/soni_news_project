import 'package:flutter/material.dart';
import 'package:soni_news_project/utils/colors.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search something",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            flex: 1,
            child: TextButton.icon(
              style: TextButton.styleFrom(
                shape: StadiumBorder(),
              ),
              onPressed: () {
                //TODO Handle onPressed
              },
              icon: Icon(Icons.search),
              label: SizedBox.shrink(),
            ),
          )
        ],
      ),
    );
  }
}
