import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wineadore/configs/app_theme.dart';
import 'package:wineadore/utils/helper.dart';
import 'package:wineadore/widgets/k_primary_button.dart';
import 'package:wineadore/widgets/k_text.dart';

class HomePage extends StatelessWidget {
  final Rx<bool> isDescExpanded = false.obs;
  final Rx<bool> isTasteExpanded = false.obs;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              Helper.customAppBar(
                bgColor: Colors.white,
              ),
              _wineImage(),
              const SizedBox(height: 30),
              _topSection(),
              const SizedBox(height: 24),
              Container(
                height: 24,
                color: AppTheme.primaryBackground,
              ),
              const SizedBox(height: 24),
              _descriptionSection(),
              const SizedBox(height: 24),
              Container(
                height: 24,
                color: AppTheme.primaryBackground,
              ),
              const SizedBox(height: 24),
              _tasteSection(),
              const SizedBox(height: 24),
              Container(
                height: 24,
                color: AppTheme.primaryBackground,
              ),
              const SizedBox(height: 24),
              _pairingSection(),
              const SizedBox(height: 24),
              Container(
                height: 24,
                color: AppTheme.primaryBackground,
              ),
              const SizedBox(height: 24),
              _reviewSection(),
              const SizedBox(height: 32),
            ],
          ),
        ),
        bottomNavigationBar: _bottomNav(),
      ),
    );
  }

  Widget _wineImage() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 80,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: Helper.getRadius(100),
                image: const DecorationImage(
                  image: AssetImage('assets/winery/ex_winery.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Image.asset(
            'assets/wine/ex_wine.png',
            height: 400,
            fit: BoxFit.fitHeight,
          ),
        ],
      ),
    );
  }

  Widget _topSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Pricing
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const KText(
                    text: '\$57.50',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryLightColor,
                          borderRadius: Helper.getRadius(3),
                        ),
                        child: const KText(
                          text: '-7%',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const KText(
                        text: '\$61.50',
                        fontSize: 12,
                        color: AppTheme.secondaryText,
                      )
                    ],
                  )
                ],
              ),

              // Rating Card
              Container(
                padding: const EdgeInsets.fromLTRB(8, 6, 6, 6),
                decoration: BoxDecoration(
                  borderRadius: Helper.getRadius(5),
                  border: Border.all(
                    color: AppTheme.placeholderText,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/star_solid.svg',
                      height: 16,
                    ),
                    const SizedBox(width: 4),
                    const KText(
                      text: '4.9',
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(width: 4),
                    const KText(
                      text: '(11,7 k)',
                      color: AppTheme.secondaryText,
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const KText(
            text: 'Reserva da Família Tinto',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'PlayfairDisplay',
          ),
          const SizedBox(height: 6),

          // Winery Info
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: AppTheme.secondaryText,
              ),
              children: [
                const TextSpan(
                  text: "Monte da Ravasqueira",
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Container(
                    height: 10,
                    width: 10,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: Helper.getRadius(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/country/portugal.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const TextSpan(
                  text: "Alentejo, Portugal",
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Grapes
          SizedBox(
            height: 25,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  child: KText(
                    text: 'Grapes',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: Helper.getRadius(5),
                      color: AppTheme.primaryBackground),
                  child: const KText(
                    text: 'Touriga Nacional (50%)',
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: Helper.getRadius(5),
                      color: AppTheme.primaryBackground),
                  child: const KText(
                    text: 'Syrah (50%)',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _descriptionSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KText(
            text:
                'The Ravasqueira Reserva da Família Red 2020 is a tribute to the José de Mello family and the result of an in-depth analysis of the vineyard in 2014, which resulted in the selection of the plots with the grape varieties that most stood out for their elegance, concentration, and character, the pillars of this Monte da Ravasqueira Reserve range',
            isOverflow: !isDescExpanded.value,
            maxLines: 3,
          ),
          const SizedBox(height: 8),
          RichText(
            text: const TextSpan(
              style: TextStyle(
                color: AppTheme.blackText,
              ),
              children: [
                TextSpan(
                  text: "Aging : ",
                  style: TextStyle(
                    color: AppTheme.secondaryText,
                  ),
                ),
                TextSpan(
                  text: "12 months French Oak Barrels",
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _descCard(
                  label: 'Type',
                  value: 'Red Wine',
                ),
              ),
              Expanded(
                child: _descCard(
                  label: 'Alcohol',
                  value: '13.5%',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _descCard(
                  label: 'Decant',
                  value: '1 hour',
                ),
              ),
              Expanded(
                child: _descCard(
                  label: 'Serving',
                  value: '16-18 °C',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _descCard({
    String? label,
    String? value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KText(
          text: label,
          fontSize: 12,
          color: AppTheme.secondaryText,
        ),
        const SizedBox(height: 4),
        KText(
          text: value,
          fontWeight: FontWeight.w700,
        ),
      ],
    );
  }

  Widget _tasteSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const KText(
            text: 'Taste Notes',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 4),
          const KText(
            text: 'Based on our expert taste',
            fontSize: 10,
            color: AppTheme.secondaryText,
          ),
          const SizedBox(height: 8),
          const KText(
            text:
                'Dark, deep and opaque in colour, this wine is a clear reflection of the balance between the Touriga Nacional and the Syrah grape varieties. When tasted it presents ripe black fruit in healthy coexistence with vegetable, floral and spice notes. The ageing both in barrels and in the bottle has provided a fine structure profile with polished but present tannins, providing a tension in the mouth making it perfect for complex dishes.',
            isOverflow: true,
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          _linearTaste(
            startLabel: 'Light',
            endLabel: 'Bold',
            value: 0.8,
          ),
          const SizedBox(height: 8),
          _linearTaste(
            startLabel: 'Smooth',
            endLabel: 'Sweet',
            value: 0.6,
          ),
          const SizedBox(height: 8),
          _linearTaste(
            startLabel: 'Dry',
            endLabel: 'Sweet',
            value: 0.4,
          ),
          const SizedBox(height: 8),
          _linearTaste(
            startLabel: 'Soft',
            endLabel: 'Acidic',
            value: 0.6,
          ),
        ],
      ),
    );
  }

  Widget _linearTaste({
    required String startLabel,
    required String endLabel,
    double value = 0,
  }) {
    return Row(
      children: [
        Expanded(
          child: KText(
            text: startLabel,
            fontSize: 12,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.end,
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: Get.width * 0.5,
          child: ClipRRect(
            borderRadius: Helper.getRadius(5),
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: AppTheme.greyBackground,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: KText(
            text: endLabel,
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  Widget _pairingSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          KText(
            text: 'Food Pairing',
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: 8),
          KText(
            text: 'Italian dishes, steak',
          ),
        ],
      ),
    );
  }

  Widget _reviewSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              KText(
                text: 'Reviews',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              KText(
                text: 'view all',
                fontSize: 12,
              ),
            ],
          ),
          const SizedBox(height: 24),
          _reviewCard(
            name: 'Sanchia Jodie',
            time: '10 days ago',
            rating: 4.5,
            review: 'Very nice one. I bought it in supermarket, didn\'t know what to expect. But i love it. Bold, complex, full of black fruits and cloves',
          ),
          const SizedBox(height: 16),
          const Divider(
            color: AppTheme.placeholderText,
          ),
          const SizedBox(height: 16),
          _reviewCard(
            name: 'Komang Yoga',
            time: '22 days ago',
            rating: 4.0,
            review: 'Beautiful deep color well balanced tannins, black fruit on the nose, hints of plum with a little spice. Great marriage between touriga national and syrah. Very well done reminds me of a french Bordeaux.',
          ),
          const SizedBox(height: 16),
          const Divider(
            color: AppTheme.placeholderText,
          ),
          const SizedBox(height: 16),
          _reviewCard(
            name: 'Luiz Pinheiro',
            time: '2 months ago',
            rating: 5.0,
            review: 'Good! Fair but not amazingly memorable.',
          ),
        ],
      ),
    );
  }

  Widget _reviewCard({
    required String name,
    required String time,
    required double rating,
    required String review,
  }){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 15,
              backgroundColor: AppTheme.greyBackground,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KText(
                    text: name,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 2),
                  KText(
                    text: time,
                    fontSize: 12,
                    color: AppTheme.secondaryText,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              'assets/icons/star_solid.svg',
              height: 16,
            ),
            const SizedBox(width: 4),
            const KText(
              text: '4.5',
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        const SizedBox(height: 8),
        KText(
          text: review,
          isOverflow: true,
          maxLines: 3,
        ),
      ],
    );
  }
  
  Widget _bottomNav() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: Helper.getShadow(
            color: AppTheme.greyBackground,
            blurRadius: 15,
            offset: const Offset(0, -4),
          ),
        ),
        child: KPrimaryButton(
          onTap: () => Helper.snackbarSoon(),
          text: 'Add to Cart',
        ),
      ),
    );
  }
}
