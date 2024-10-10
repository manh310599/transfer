import 'package:flutter/material.dart';
import 'package:mb_transfer/feature/confirm_transaction/logic/confirm_transation_logic.dart';
import 'package:mb_transfer/utils/dimens.dart';
import 'package:mb_transfer/widget/app_appbar.dart';
import 'package:mb_transfer/widget/app_button.dart';
import 'package:provider/provider.dart';

import '../../widget/otp_input_widget.dart';

class ConfirmTransactionScreen extends StatelessWidget {
  const ConfirmTransactionScreen({super.key, this.receive});

  final int? receive;

  @override
  Widget build(BuildContext context) {
    print('test 1: $receive');
    return ChangeNotifierProvider<ConfirmTransationLogic>(
      create: (context) => ConfirmTransationLogic()..init(),
      child: Scaffold(
          appBar: AppAppbar.appBar('Confirm Transaction', context),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingBody),
              child: Consumer<ConfirmTransationLogic>(
                builder: (BuildContext context, ConfirmTransationLogic value, Widget? child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(radiusCard),
                        ),
                        child: Column(
                          children: [
                            RichText(
                                text: TextSpan(
                                    text:
                                    'Please enter the OTP code sent to your phone number ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                      fontWeight: FontWeight.w400,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: '0789123456',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                        '. Please enter OTP code to confirm the transaction.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ])),
                            const SizedBox(
                              height: 48,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: OtpInputWidget(
                                length: 6,
                                onCompleted: (p0) {
                                  print(p0);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      _resendOTP(context,value),
                      const SizedBox(height: 36,),
                      AppButton(AppButtonType.normal, 'Confirm', context, () {
                        Navigator.pushNamed(context, '/transactionSuccess',arguments: receive);
                      },).switchButton(),
                    ],
                  );
                },
            
              ),
            ),
          )),
    );
  }
}

Widget _resendOTP(BuildContext context,ConfirmTransationLogic value) {
  String minutes = (value.remainingSeconds ~/ 60).toString().padLeft(2, '0');
  String seconds = (value.remainingSeconds % 60).toString().padLeft(2, '0');

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Resend OTP',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.w600,
            ),
      ),
      const SizedBox(
        width: 16,
      ),
      Text(
        '$minutes:$seconds',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.w600,
            ),
      ),
    ],
  );
}
