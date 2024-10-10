import 'package:flutter/material.dart';
import 'package:mb_transfer/feature/tranfer_bank_account/screen/tranfer_bank_account_screen.dart';
import 'package:mb_transfer/utils/hex_color.dart';
import 'package:mb_transfer/widget/app_appbar.dart';

import 'feature/confirm_transaction/confirm_transaction_screen.dart';
import 'feature/setlement/setlement_screen.dart';
import 'feature/transaction/transaction_success/transaction_success_screen.dart';
import 'feature/transaction_confirm/transaction_confirm_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        // Lấy route name từ settings
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const TranferBankAccountScreen(),
            );
          case '/setlement':
            return MaterialPageRoute(
              builder: (context) => const SetlementScreen(),
            );
          case '/transactionConfirm':
            // Nhận giá trị truyền vào qua arguments
            final args = settings.arguments as int;

            return MaterialPageRoute(
              builder: (context) => TransactionConfirmScreen(receive: args),
            );
          case '/transactionSuccess':

            final args = settings.arguments;

            if (args is int) {
              final intValue = args; // Giá trị args đã là int
              return MaterialPageRoute(
                builder: (context) => TransactionSuccessScreen(
                  receive: intValue,
                ),
              );
            } else {
              const intValue = 0;
              return MaterialPageRoute(
                builder: (context) => const TransactionSuccessScreen(
                  receive: intValue, // Truyền giá trị mặc định
                ),
              );
            }

          case '/confirmTransaction':
            final args = settings.arguments;

            if (args is int) {
              final intValue = args; // Giá trị args đã là int
              return MaterialPageRoute(
                builder: (context) => ConfirmTransactionScreen(
                  receive: intValue,
                ),
              );
            } else {
              const intValue = 0;
              return MaterialPageRoute(
                builder: (context) => const ConfirmTransactionScreen(
                  receive: intValue, // Truyền giá trị mặc định
                ),
              );
            }

          default:
            return MaterialPageRoute(
                builder: (context) => MaterialApp(
                      home: Scaffold(
                        appBar: AppAppbar.appBar('404', context),
                        body: const Center(
                          child: Text('404'),
                        ),
                      ),
                    ) // Bạn có thể tạo một màn hình 404 nếu cần.
                );
        }
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: HexColor.getColorFromHex('0177FB'),
        fontFamily: 'AvertaStdCY',
      ),
    );
  }
}
