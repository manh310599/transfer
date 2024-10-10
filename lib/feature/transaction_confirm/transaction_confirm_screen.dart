import 'package:flutter/material.dart';
import 'package:mb_transfer/feature/transaction_confirm/logic/transaction_confirm_logic.dart';
import 'package:mb_transfer/utils/dimens.dart';
import 'package:mb_transfer/utils/hex_color.dart';
import 'package:mb_transfer/widget/app_appbar.dart';
import 'package:mb_transfer/widget/app_button.dart';
import 'package:provider/provider.dart';

class TransactionConfirmScreen extends StatelessWidget {
  const TransactionConfirmScreen({
    super.key,
    required this.receive,
  });

  final int receive;

  @override
  Widget build(BuildContext context) {
    print('test 2: $receive');
    return Scaffold(
      appBar: AppAppbar.appBar('Transaction Confirmation', context),
      body: ChangeNotifierProvider(
        create: (context) => TransactionConfirmLogic(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingBody),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'TOTAL AMOUNT',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: HexColor.getColorFromHex('EF4E28'),
                    ),
              ),
              Text(
                '250,004,000 KHR',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 24),
              _form(context),
              const SizedBox(height: 16),
              _description(context, receive),
              const Spacer(),
              AppButton(AppButtonType.normal, 'Confirm', context, () {
                Navigator.pushNamed(context, '/confirmTransaction',arguments: receive);
              }).switchButton(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _description(BuildContext context, int receive) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        if (receive == 1) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Receive at',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: HexColor.getColorFromHex('06265F'),
                    ),
              ),
              Text(
                '21/10/2023  16:41',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: HexColor.getColorFromHex('06265F'),
                    ),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Transaction fee',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: HexColor.getColorFromHex('06265F'),
                  ),
            ),
            Text(
              '4,000 KHR',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: HexColor.getColorFromHex('06265F'),
                  ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Amount receives',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: HexColor.getColorFromHex('06265F'),
                  ),
            ),
            Text(
              '250,000,000 VND',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: HexColor.getColorFromHex('0177FB'),
                  ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Description',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: HexColor.getColorFromHex('06265F'),
                  ),
            ),
            Text(
              'CUSTOMER NAME transfers',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: HexColor.getColorFromHex('06265F'),
                  ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _form(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 4),
            Image.asset(
              'assets/images/mb.png',
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Form',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: HexColor.getColorFromHex('8C8C8C'),
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  'CUSTOMER NAME',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  '03701056378 | KHR',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Divider(color: HexColor.getColorFromHex('EDEDED'), thickness: 1),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 4),
            Image.asset(
              'assets/images/canadia.png',
              width: 32,
              height: 32,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'To',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: HexColor.getColorFromHex('8C8C8C'),
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  'CUSTOMER NAME',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                Text(
                  '8556999888 - Canadia Bank',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    ),
  );
}
