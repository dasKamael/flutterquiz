import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterquiz/src/domain/rating/services/rating.service.dart';
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
  late Future<bool> wasAlreadyRated = Future.value(false);

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
  void initState() {
    super.initState();
    checkWasAlreadyRated();
  }

  void checkWasAlreadyRated() async {
    wasAlreadyRated = Future.value(await ref.read(ratingServiceProvider).wasAlreadyRated(quizId: widget.quizId));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (wasSend) return const Text('Vielen dank für die Bewertung!');

    return FutureBuilder<bool>(
      future: wasAlreadyRated,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();
        if (snapshot.data == true) return const Text('Du hast dieses Quiz bereits bewertet!');
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
      },
    );
  }
}
