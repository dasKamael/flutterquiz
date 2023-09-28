import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/ratings/services/rating.service.dart';
import 'package:flutterquiz/src/presentation/design_system/widgets/ui_elevated_button.dart';

class UserRating extends ConsumerStatefulWidget {
  const UserRating({super.key, required this.quizId});

  final String quizId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserRatingState();
}

class _UserRatingState extends ConsumerState<UserRating> {
  bool wasRated = false;
  bool wasSend = false;
  bool isLoading = false;

  double rating = 0;

  void sendRating() async {
    setState(() {
      isLoading = true;
    });
    if (wasRated) {
      await ref.read(ratingServiceProvider).sendRating(rating: rating, quizId: widget.quizId);
      setState(() {
        wasSend = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (wasSend) return const Text('Vielen dank für die Bewertung!');

    return Column(
      children: [
        const Text('Wie hat dir das Quiz gefallen?'),
        const SizedBox(height: 20),
        RatingBar(
          allowHalfRating: true,
          ratingWidget: RatingWidget(
            full: const Icon(Icons.star, color: Colors.amber),
            half: const Icon(Icons.star_half, color: Colors.amberAccent),
            empty: const Icon(Icons.star_border, color: Colors.grey),
          ),
          onRatingUpdate: (value) {
            setState(() {
              rating = value;
              wasRated = true;
            });
          },
        ),
        const SizedBox(height: 20),
        if (isLoading) const CircularProgressIndicator(color: Colors.white),
        if (wasRated && !isLoading)
          UiElevatedButton(
            onPressed: sendRating,
            child: const Text('Bewertung abschicken'),
          ),
      ],
    );
  }
}
