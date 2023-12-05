import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelTxt, hintTxt;
  final bool? obscured;
  final AutovalidateMode autoValidateMode;
  final TextInputType? inputType;
  const CustomTextField({
    super.key,
    this.labelTxt = "",
    this.onChanged,
    this.obscured = false,
    this.inputType = TextInputType.text,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.onSuffixIconPressed,
    this.onPrefixIconPressed,
    this.hintTxt,
    this.autoValidateMode = AutovalidateMode.disabled,
  });
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final IconData? suffixIcon, prefixIcon;
  final void Function()? onSuffixIconPressed, onPrefixIconPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        validator: validator,
        keyboardType: inputType,
        obscureText: obscured ?? false,
        style: const TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        onChanged: onChanged,
        autovalidateMode: autoValidateMode,
        decoration: InputDecoration(
          helperText: hintTxt,
          helperStyle: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 69, 69, 69),
          ),
          hintText: hintTxt,
          suffixIcon: IconButton(
            icon: Icon(suffixIcon),
            onPressed: onSuffixIconPressed,
          ),
          prefixIcon: IconButton(
            icon: Icon(prefixIcon),
            onPressed: onPrefixIconPressed,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 22, 21, 21),
            ),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          labelText: labelTxt,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 97, 96, 96),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
