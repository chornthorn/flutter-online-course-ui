import 'package:e_learning_online_course/models/pricing_model.dart';
import 'package:e_learning_online_course/utils/colors.util.dart';
import 'package:e_learning_online_course/views/widgets/button_icon.widget.dart';
import 'package:e_learning_online_course/views/widgets/button_navigation.widget.dart';
import 'package:e_learning_online_course/views/widgets/course_category_card.widget.dart';
import 'package:e_learning_online_course/views/widgets/course_item_card.widget.dart';
import 'package:e_learning_online_course/views/widgets/popver.widget.dart';
import 'package:e_learning_online_course/views/widgets/pricing_item_card.widget.dart';
import 'package:e_learning_online_course/views/widgets/visa_item_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PricingPage extends StatefulWidget {
  @override
  _PricingPageState createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  var _isSelectedPrice = false;
  final List _listPricing = [
    {
      "id": 1,
      "title": "Free Trial",
      "subtitle": "14 Days",
      "price": "0",
    },
    {
      "id": 2,
      "title": "Medium",
      "subtitle": "10 courses/mo.",
      "price": "14.99",
    },
    {
      "id": 3,
      "title": "Intermediate",
      "subtitle": "50 courses/mo.",
      "price": "39.99",
    }
  ];

  @override
  Widget build(BuildContext context) {
    var mHeight = MediaQuery.of(context).size.height;
    var mWidth = MediaQuery.of(context).size.width;
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: mHeight * .45,
              decoration: BoxDecoration(
                color: cSalmonMain,
              ),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: ButtonIcon(
                            icon: Icons.arrow_back,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: ButtonIcon(
                            icon: Icons.menu,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: mHeight,
              width: mWidth,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    height: mHeight * .3,
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      isPortrait ? 'Pick\nyour plan' : 'Pick your plan',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 25),
                    height: mHeight * .7,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(60)),
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Positioned(
                          top: 0,
                          child: Container(
                            height: 8,
                            width: 120,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SafeArea(
                          top: false,
                          child: ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: ListView.builder(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 16),
                                  itemCount: _listPricing.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return PricingItemCard(
                                      title: _listPricing[index]['title'],
                                      subtitle: _listPricing[index]['subtitle'],
                                      price: _listPricing[index]['price'],
                                      isSelected: _listPricing[index]['id'] == 1
                                          ? _isSelectedPrice
                                          : false,
                                      onPressed: () {
                                        if (_isSelectedPrice) {
                                          setState(() {
                                            _isSelectedPrice = false;
                                          });
                                        } else {
                                          setState(() {
                                            _isSelectedPrice = true;
                                          });
                                        }
                                      },
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: cSelectedBorder),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          _handleFABPressed();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 40),
                                          child: Row(
                                            children: [
                                              Container(
                                                child: SvgPicture.asset(
                                                    'assets/icons/visa_card.svg'),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Text(
                                                  'Visa Card *079',
                                                  style: TextStyle(
                                                    color: cHeadingText,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              Icon(
                                                Icons.keyboard_arrow_down,
                                                color: cHeadingText,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 35),
                                  child: Text(
                                    'Terms & Conditions',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.only(right: 22, left: 22, bottom: 16),
        color: Colors.white,
        child: ButtonNavigation(
          onPressed: () {},
          title: 'Continue with payment',
        ),
      ),
    );
  }
  void _handleFABPressed() {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Popover(
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                VisaItemCard(
                  icon: 'assets/icons/visa_card.svg',
                  title: 'Visa Card',
                  subtitle: 'Number: 492 4884 516 029',
                  iconRight: 'assets/icons/selected_icon.svg',
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                VisaItemCard(
                  icon: 'assets/icons/visa_card.svg',
                  title: 'Visa Card',
                  subtitle: 'Number: 450 4628 488 535',
                  iconRight: 'assets/icons/unselected_icon.svg',
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
