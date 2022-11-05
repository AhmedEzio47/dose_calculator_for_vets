import 'package:dose_calculator_for_vets/core/constants/app_colors.dart';
import 'package:dose_calculator_for_vets/presentation/pages/home/widgets/active_principle_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class ActivePrincipleBottomSheet extends StatefulWidget {
  ActivePrincipleBottomSheet({Key? key}) : super(key: key);

  @override
  State<ActivePrincipleBottomSheet> createState() =>
      _ActivePrincipleBottomSheetState();
}

class _ActivePrincipleBottomSheetState
    extends State<ActivePrincipleBottomSheet> {
  var activePrinciples = ['Dexa', 'Salma', 'Ahmed'];

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                      hintText: 'Search active principles',
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColors.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                  controller: _controller,
                ),
                suggestionsCallback: (query) => activePrinciples.where(
                    (element) =>
                        element.toLowerCase().contains(query.toLowerCase())),
                itemBuilder: (context, text) =>
                    ActivePrincipleItem(text: text.toString()),
                onSaved: (text) => _controller.text = text.toString(),
                onSuggestionSelected: (text) {
                  _controller.text = text.toString();
                }),
          )
        ],
      ),
    );
  }
}
