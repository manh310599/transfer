import 'package:flutter/material.dart';
import 'package:mb_transfer/utils/dimens.dart';
import 'package:mb_transfer/utils/hex_color.dart';
import 'package:mb_transfer/widget/app_appbar.dart';
import 'package:mb_transfer/widget/app_button.dart';

class TranferBankAccountScreen extends StatelessWidget {
  const TranferBankAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppbar.appBar('Transfer to Bank account', context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingBody),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              _from(context),
              const SizedBox(
                height: 20,
              ),
              _to(context),
              const Spacer(),
              AppButton(AppButtonType.normal, 'Next', context, () {
                Navigator.pushNamed(context, '/setlement');
              },).switchButton(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _to(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'To',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radiusCard),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Select beneficiary bank',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: HexColor.getColorFromHex('8C8C8C')),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/canadia.png'),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Canadia Bank',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                    ),
                  ],
                )
              ],
            ),
            Icon(
              Icons.arrow_drop_down_rounded,
              color: Theme.of(context).primaryColor,
              size: 50,
            )
          ],
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radiusCard),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Account number',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: HexColor.getColorFromHex('8C8C8C')),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  '0789454545',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: HexColor.getColorFromHex('333333'),
                      ),
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'USD',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: HexColor.getColorFromHex('00AB56'),
                      ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Image.asset(
                  'assets/images/archive.png',
                ),
              ],
            )
          ],
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: HexColor.getColorFromHex('EDEDED'),
          borderRadius: BorderRadius.circular(radiusCard),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.maxFinite,
            ),
            Text(
              'Account name',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: HexColor.getColorFromHex('8C8C8C')),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'CUSTOMER NAME',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 16,
      ),
      Row(
        children: [
          Expanded(
            flex: 200,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radiusCard),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Amount',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: HexColor.getColorFromHex('8C8C8C')),
                  ),
                  Text(
                    '250,000,000',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 127,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radiusCard),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Currency',
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: HexColor.getColorFromHex('8C8C8C')),
                      ),
                      Text(
                        'KHR',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 8,),
                  Icon(Icons.arrow_drop_down_rounded,
                    color: Theme.of(context).primaryColor,
                    size: 30,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      const SizedBox(
        height: 16,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radiusCard),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.maxFinite,
            ),
            Text(
              'Description',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: HexColor.getColorFromHex('8C8C8C')),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'CUSTOMER NAME transfers',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _from(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'From',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radiusCard),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CUSTOMER NAME',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              '8099999939',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: HexColor.getColorFromHex(
                      '8C8C8C',
                    ),
                  ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '300,000,000 KHR',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: HexColor.getColorFromHex(
                          'EF4E28',
                        ),
                        fontSize: 20,
                      ),
                ),
                GestureDetector(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'CHANGE',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Theme.of(context).primaryColor),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Theme.of(context).primaryColor,
                        size: 12,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
