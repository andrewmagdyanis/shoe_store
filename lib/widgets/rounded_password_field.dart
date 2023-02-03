import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shoe_store/widgets/text_field_container.dart';
import '../../colors_constants.dart';
import '../helpers/sizes_helpers.dart';

class RoundedPasswordField extends StatefulWidget {
  @override
  _RoundedPasswordFieldState createState() {
    return _RoundedPasswordFieldState();
  }

  final ValueChanged<String>? onChanged;
  final String? labelText;
  final String? hintText;
  final ValueChanged<String>? onSubmitted;
  final bool? errorFlag;
  final String? errorText;
  final double? heightRatio;
  final  String? Function(String?)? validator;
  final Function(String?)? onSave;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const RoundedPasswordField({
    required Key key,
    this.labelText,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.errorText,
    this.errorFlag = false,
    this.heightRatio,
    this.validator,
    this.onSave,
    this.controller,
    this.keyboardType,
  }) : super(key: key);
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool visibleFlag = false;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Stack(
        children: <Widget>[
          TextFieldContainer(
            key: const ValueKey('TextFieldContainer pass'),

            heightRatio: widget.heightRatio,
            child: Center(
              child: TextFormField(
                controller: widget.controller,
                validator: widget.validator,
                onSaved: widget.onSave,
                obscureText: !visibleFlag,
                onFieldSubmitted: widget.onSubmitted,
                onChanged: widget.onChanged,
                cursorColor: kPrimaryColor,
                scrollPadding: const EdgeInsets.all(0),
                decoration: InputDecoration(
                  labelText: widget.labelText,
                  labelStyle: Theme.of(context).textTheme.subtitle2,
                  errorText: widget.errorText,
                  filled: true,
                  fillColor: Colors.transparent,

                  contentPadding: EdgeInsets.only(
                    bottom: displayHeight(context) * 0.02,
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  // isCollapsed: true,
                  isDense: true,
                  icon: const Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  suffixIcon: null,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Positioned(
            width: displayWidth(context) * 0.15,
            height: widget.heightRatio == null
                ? 65
                : (displayHeight(context) * widget.heightRatio!),
            right: displayWidth(context) * 0.05,
            top: displayHeight(context) * 0.007,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(displayHeight(context) / 30),
                    bottomRight: Radius.circular(displayHeight(context) / 30)),
              ),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                focusColor: Colors.red,
                splashColor: Colors.red,
                onTap: () {
                  setState(() {
                    visibleFlag ^= true;
                    if (kDebugMode) {
                      print(visibleFlag);
                    }
                  });
                },
                onTapCancel: () {
                  setState(() {
                    visibleFlag = true;
                  });
                },
                child: Icon(
                  (visibleFlag) ? Icons.visibility : Icons.visibility_off,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
