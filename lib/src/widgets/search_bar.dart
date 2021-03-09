import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Theme.of(context).buttonColor),
      width: double.infinity,
      height: 90,
      child: GestureDetector(
        onTap: () {
          print(size.height);
        },
        child: Container(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Icon(
                Icons.search,
                size: 30.0,
                color: Theme.of(context).hintColor,
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  "Search...",
                  style: Theme.of(context).textTheme.button,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
