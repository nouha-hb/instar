import 'package:flutter/material.dart';

class StepItem {
  static Step makeStep(
      {
        required StepState state, 
        required bool isActive,
      required String title,
      required String location,
      required String date,}) {
    return Step(
      state: state,
        isActive:isActive,
        title: Text(title),
        content: const SizedBox(),
        // subtitle: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text(location),
        //     Text(date),
        //   ],
        // )
        );
  }
}
