import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInputWidget extends StatefulWidget {
  final int length;
  final void Function(String) onCompleted;

  const OtpInputWidget({super.key, required this.length, required this.onCompleted});

  @override
  _OtpInputWidgetState createState() => _OtpInputWidgetState();
}

class _OtpInputWidgetState extends State<OtpInputWidget> {
  List<TextEditingController> _controllers = [];
  List<FocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  String get _otpCode {
    return _controllers.map((controller) => controller.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(3, (index) {
          return Expanded(
            child: _otpTextField(index),
          );
        }),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "-",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),

        ...List.generate(3, (index) {
          return Expanded(
            child: _otpTextField(index + 3), // Offset để tính đúng ô
          );
        }),
      ],
    );
  }

  Widget _otpTextField(int index) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,  // Đảm bảo textAlign là center
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),  // Padding 8px cho cả chiều ngang và chiều dọc
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
        ),
        onChanged: (value) {
          // Nếu đã nhập vào ô hiện tại
          if (value.length == 1) {
            // Focus ô tiếp theo nếu có
            if (index < widget.length - 1) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            } else {
              FocusScope.of(context).unfocus();
              widget.onCompleted(_otpCode);
            }
          } else if (value.isEmpty && index > 0) {
            // Quay lại ô trước đó nếu người dùng xóa ký tự hiện tại
            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
          }
        },
        onTap: () {
          // Kiểm tra các ô trước đó có được nhập chưa
          bool previousFieldsFilled = true;
          for (int i = 0; i < index; i++) {
            if (_controllers[i].text.isEmpty) {
              previousFieldsFilled = false;
              // Focus về ô trống gần nhất trước đó
              FocusScope.of(context).requestFocus(_focusNodes[i]);
              break;
            }
          }

          if (!previousFieldsFilled) {
            // Ngăn không cho focus vào ô hiện tại nếu ô trước chưa nhập
            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
          }
        },
      ),
    );
  }

}
