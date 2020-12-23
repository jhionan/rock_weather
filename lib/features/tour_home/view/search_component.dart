import 'package:flutter/material.dart';

class SearchComponent extends StatefulWidget {
  final Function(String value) onChanged;
  final Function(String value) onSubmitted;

  const SearchComponent({Key key, this.onChanged, this.onSubmitted})
      : super(key: key);
  @override
  _SearchComponentState createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      textInputAction: TextInputAction.search,
      autofocus: false,
      decoration: InputDecoration(
          fillColor: Colors.white,
          hoverColor: Colors.white,
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _searchController.clear();
                widget.onChanged(_searchController.text);
              }),
          labelText: 'Search'),
    );
  }
}
