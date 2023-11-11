// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/weather-provider.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key});
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final subProvider = Provider.of<WeatherProvider>(context, listen: false);
    return SizedBox(
      child: Container(
        margin: const EdgeInsets.fromLTRB(30, 70, 30, 30),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: TextField(
            controller: searchController,
            // onChanged: (value) =>
            //     subProvider.fetchData(city: value),
            onEditingComplete: () {
              if (searchController.text != '') {
                subProvider.fetchData(city: searchController.text);
                FocusScope.of(context).unfocus();
              }
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                    )))),
      ),
    );
  }
}
