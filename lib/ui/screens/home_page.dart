import 'package:dining_experience/core/state_manager/search_for_place.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../widgets/single_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _searchController;
  late FocusNode _focusNode;

  void getLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

  }

  @override
  void initState() {
    super.initState();
    getLocation();
    _focusNode = FocusNode();

    _searchController = TextEditingController();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchedList = Provider.of<MysterySearchProvider>(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey[100],
          title: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(17)),
            height: 40,
            child: SizedBox(
              width: 230,
              child: TextField(
                focusNode: _focusNode,
                autofocus: true,
                controller: _searchController,
                maxLines: 1,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                textCapitalization: TextCapitalization.sentences,
                onChanged: (value) {
                  _searchController.text.toLowerCase();
                  searchedList.searchQuery(value.toLowerCase());
                },
                decoration: const InputDecoration(
                    hintText: 'Search',
                    contentPadding: EdgeInsets.all(
                      10,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 15,
                    ),
                    border: InputBorder.none),
              ),
            ),
          ),
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: _searchController.text.isEmpty ||
                (searchedList.Businesses?.businesses?.isEmpty??false)
                ? Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: _searchController.text.isNotEmpty
                    ? const Text(
                  'No Matches found :(',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(fontSize: 24, color: Colors.black),
                )
                    : SizedBox(
                  height: 100,
                  child: Image.asset(
                    'assets/search.png',
                  ),
                ),
              ),
            )
                : _showSearchResults(listOfBusiness: searchedList.Businesses?.businesses??[])),
      ),
    );
  }

  Widget _showSearchResults({var listOfBusiness}) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: listOfBusiness.length??0,
        itemBuilder: (context, index) {
          final item = listOfBusiness[index];
          return SingleItemOnSearch(oneBusiness: item,);
        });
  }
}