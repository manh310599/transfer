import 'package:flutter/material.dart';
import 'package:mb_transfer/feature/setlement/logic/setlement_logic.dart';
import 'package:mb_transfer/utils/hex_color.dart';
import 'package:mb_transfer/widget/app_button.dart';
import 'package:provider/provider.dart';

import '../../widget/app_appbar.dart';

class SetlementScreen extends StatelessWidget {
  const SetlementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SetlementLogic>(
      create: (context) => SetlementLogic(),
      child: Scaffold(
        appBar: AppAppbar.appBar('Setlement', context),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Settlement Options',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                _card(context),
                const SizedBox(height: 24,),
                Column(
                  children: [
                    Row(
                      children: [
                        Text('Settlement:',style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),),
                        const Spacer(),
                        Text('Realtime (Bakong large value)',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: <Widget>[
                        Text('Transaction fee:',style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),),
                        const Spacer(),
                        Text('4,000 KHR',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Consumer<SetlementLogic>(builder: (context, value, child) {
                  return AppButton(AppButtonType.normal, 'Next', context,() {
                    Navigator.pushNamed(context, '/transactionConfirm',arguments: value.currentIndex);
                  },).switchButton();
                },)
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _card(BuildContext context) {
  return Consumer<SetlementLogic>(
    builder: (BuildContext context, SetlementLogic value, Widget? child) {
      return Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                value.changeIndex(0);
              },
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/clock.png',
                      color: value.currentIndex == 0
                          ? Theme.of(context).primaryColor
                          : HexColor.getColorFromHex('333333'),
                      width: 62,
                      height: 62,
                    ),
                    const SizedBox(height: 26),
                    Text(
                      'Realtime',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: value.currentIndex == 0
                            ? Theme.of(context).primaryColor
                            : HexColor.getColorFromHex('333333'),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Bakong large value',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: HexColor.getColorFromHex('8C8C8C'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: () {
                value.changeIndex(1);
              },
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/calander.png',
                      width: 62,
                      height: 62,
                      color: value.currentIndex == 1
                          ? Theme.of(context).primaryColor
                          : HexColor.getColorFromHex('333333'),
                    ),
                    const SizedBox(height: 26),
                    Text(
                      'Fund will be received next day',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: value.currentIndex == 1
                            ? Theme.of(context).primaryColor
                            : HexColor.getColorFromHex('333333'),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Bakong large value',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: HexColor.getColorFromHex('8C8C8C'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
