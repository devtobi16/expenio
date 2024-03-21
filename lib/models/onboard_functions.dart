import 'package:expenio_1/models/const_values.dart';

class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> demo_data = [
  OnBoard(
    image: image1,
    title: "Note Down Expenses",
    description: "Daily note your expenses to help manage money",
  ),
  OnBoard(
    image: image2,
    title: "Simple Money Management",
    description:
        "Get your notifications or alert when you do the over expenses",
  ),
  OnBoard(
    image: image3,
    title: "Easy to Track and Analyze",
    description:
        "Tracking your expense and helping to make sure you don't overspend",
  ),
];
