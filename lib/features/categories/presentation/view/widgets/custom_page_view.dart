import 'package:chairy_app/core/utils/app_colors.dart';
import 'package:chairy_app/core/utils/dimensions.dart';
import 'package:chairy_app/features/categories/presentation/view/widgets/custom_item_page_view.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageView extends StatefulWidget {
  const CustomPageView({super.key});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.9,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Dimensions.height500 * 0.88,
          child: PageView.builder(
            controller: _pageController,
            itemCount: 3,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return const CustomItemPageView();
            },
          ),
        ),
        SizedBox(height: Dimensions.height20),
        AnimatedSmoothIndicator(
          activeIndex: _currentPage,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: AppColors.primaryColor,
            dotWidth: Dimensions.width34,
            dotHeight: Dimensions.height10,
          ),
        ),
      ],
    );
  }
}
