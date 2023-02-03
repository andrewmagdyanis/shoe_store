import 'package:flutter/material.dart';
import 'package:shoe_store/widgets/text_field_container.dart';
import '../helpers/sizes_helpers.dart';

class RoundedInputField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final Function(String?)? onSave;
  final ValueChanged<String>? onSubmitted;
  final Function()? onEditingComplete;
  final bool readOnlyFlag;
  final String? errorText;
  final String? Function(String?)? validator;
  final Color iconColor;

  const RoundedInputField({
    required Key key,
    required this.iconColor,
    this.labelText,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onSave,
    this.readOnlyFlag = false,
    this.keyboardType = TextInputType.text,
    this.errorText,
    this.onEditingComplete,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: TextFieldContainer(
        key: ValueKey('TextFieldContainer $labelText'),
        child: Center(
          child: TextFormField(
            keyboardType: keyboardType,
            enableInteractiveSelection: true,
            onTap: onTap,
            validator: validator,
            onSaved: onSave,
            onFieldSubmitted: onSubmitted,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            readOnly: readOnlyFlag,
            scrollPadding: const EdgeInsets.all(0),
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: Theme.of(context).textTheme.subtitle2,
              errorText: errorText,
              filled: true,
              fillColor: Colors.transparent,
              contentPadding: EdgeInsets.only(
                bottom: displayHeight(context) * 0.02,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              icon: Icon(
                icon,
                color: iconColor,
              ),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.subtitle2,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
