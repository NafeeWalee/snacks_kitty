import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pure.international.snackskitty.customer/main_app/resources/appConst.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  StarRating({
    @required this.rating,
    this.size = 20
});
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: size,
      unratedColor: AppConst.greyLight,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      ignoreGestures: true,
      onRatingUpdate: (double value) {  },
    );
  }
}
