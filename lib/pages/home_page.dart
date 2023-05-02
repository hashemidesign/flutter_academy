import 'package:flutter/material.dart';
import 'package:flutter_academy/widgets/header.dart';

import '../res/assets.dart';
import '../widgets/call_to_action.dart';
import '../widgets/course_card.dart';
import '../widgets/featured_section.dart';
import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          AppBar(
            title: const Text("Flutter Academy"),
          ),
          const Header(),
          const SizedBox(height: 40.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Recent Courses",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: 450.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CourseCard(
                  title: "Taking Flutter to Web",
                  image: Assets.course,
                  description:
                  "Flutter web is stable. But there are no proper course focused on Flutter web. So, In this course we will learn what Flutter web is good for and we will build a production grade application along the way.",
                  onActionPressed: () {},
                ),
                const SizedBox(width: 20.0),
                CourseCard(
                  title: "Taking Flutter to Web",
                  image: Assets.course,
                  description:
                  "Flutter web is stable. But there are no proper course focused on Flutter web. So, In this course we will learn what Flutter web is good for and we will build a production grade application along the way.",
                  onActionPressed: () {},
                ),
              ],
            ),
          ),
          Center(
            child: FeaturedSection(
              image: Assets.instructor,
              title: "Start teaching today",
              description:
              "Instructors from around the world teach millions of students on Udemy. We provide the tools and skills to teach what you love.",
              buttonLabel: "Become an instructor",
              onActionPressed: () {},
            ),
          ),
          Center(
            child: FeaturedSection(
              imageLeft: false,
              image: Assets.instructor,
              title: "Transform your life through education",
              description:
              "Education changes your life beyond your imagination. Education enables you to achieve your dreams.",
              buttonLabel: "Start learning",
              onActionPressed: () {},
            ),
          ),
          const CallToAction(),
          Center(
            child: FeaturedSection(
              imageLeft: false,
              image: Assets.instructor,
              title: "Know your instructors",
              description:
              "Know your instructors. We have chosen the best of them to give you highest quality courses.",
              buttonLabel: "Browse",
              onActionPressed: () {},
            ),
          ),
          const Footer(),
        ],
      ),
    );
  }
}