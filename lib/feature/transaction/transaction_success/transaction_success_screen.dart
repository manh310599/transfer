import 'package:flutter/material.dart';
import 'package:mb_transfer/feature/transaction/transaction_success/transaction_success_logic.dart';
import 'package:mb_transfer/widget/app_button.dart';
import 'package:mb_transfer/widget/dash_divider.dart';
import 'package:provider/provider.dart';

import '../../../utils/dimens.dart';
import '../../../utils/hex_color.dart';

class TransactionSuccessScreen extends StatelessWidget {
  const TransactionSuccessScreen({super.key, this.receive});

  final int? receive;

  @override
  Widget build(BuildContext context) {
    print(receive);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: ChangeNotifierProvider<TransactionSuccessLogic>(
          create: (context) =>
              TransactionSuccessLogic()..changeReceive(receive),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  width: double.maxFinite,
                ),
                const SizedBox(
                  height: 12.24,
                ),
                Image.asset('assets/icons/success.png'),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Transaction Successful!',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '250,004,000 KHR',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 32,
                ),
                _share(context),
                const SizedBox(
                  height: 16,
                ),
                _content(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final testTransaction = [
  // Transaction('Receive at', '21/10/2023  16:41'),
  Transaction('Transaction fee', '4,000 kHR'),
  Transaction('Amount received', '250,000,000 KHR'),
  Transaction('Transaction time', '09:41:20, 23/08/2021'),
  Transaction('Transaction code', '02384BCTN20596'),
  Transaction('External Txn Ref', '02384BCTN20596'),
  Transaction('Description', 'CUSTOMER NAME transfers'),
];

final testTransaction1 = [
  Transaction('Receive at', '21/10/2023  16:41'),
  Transaction('Transaction fee', '4,000 kHR'),
  Transaction('Amount received', '250,000,000 KHR'),
  Transaction('Transaction time', '09:41:20, 23/08/2021'),
  Transaction('Transaction code', '02384BCTN20596'),
  Transaction('External Txn Ref', '02384BCTN20596'),
  Transaction('Description', 'CUSTOMER NAME transfers'),
];

Widget _content(BuildContext context) {
  return Consumer<TransactionSuccessLogic>(
    builder:
        (BuildContext context, TransactionSuccessLogic value, Widget? child) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radiusCard),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/mb_colom.png'),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: HexColor.getColorFromHex('#8C8C8C'),
                                ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            'CUSTOMER NAME',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            '03701056378 | KHR',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: HexColor.getColorFromHex('545454'),
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Divider(
                    color: HexColor.getColorFromHex('EDEDED'),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/canadia.png',
                        scale: 0.6,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'To',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: HexColor.getColorFromHex('#8C8C8C'),
                                ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            'CUSTOMER NAME',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            '8556999888 - Canadia Bank',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: HexColor.getColorFromHex('545454'),
                                ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  DashedDivider(),
                  const SizedBox(
                    height: 8,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                value.receive == 0
                                    ? testTransaction[index].title
                                    : testTransaction1[index].title,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: HexColor.getColorFromHex('8C8C8C'),
                                    ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                value.receive == 0
                                    ? testTransaction[index].value
                                    : testTransaction1[index].value,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: HexColor.getColorFromHex('EDEDED'),
                        );
                      },
                      itemCount: value.receive == 0
                          ? testTransaction.length
                          : testTransaction1.length),
                  const SizedBox(
                    height: 11,
                  ),
                  AppButton(
                    AppButtonType.outline,
                    'Other transaction',
                    context,
                    () {},
                  ).switchButton(),
                  const SizedBox(
                    height: 16,
                  ),
                  AppButton(
                    AppButtonType.normal,
                    'Back to homepage',
                    context,
                    () {},
                  ).switchButton(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

Widget _share(BuildContext context) {
  return Container(
    height: 40,
    padding: const EdgeInsets.symmetric(horizontal: 16.5, vertical: 6),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radiusCard),
      border: Border.all(color: Colors.white, width: 2),
      color: Colors.transparent,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.share,
          color: Colors.white,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          'Share',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    ),
  );
}

class Transaction {
  final String title;
  final String value;

  Transaction(this.title, this.value);
}
