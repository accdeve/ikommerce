import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ikommerce/utils/colors.dart';
import 'package:ikommerce/utils/typography.dart';

enum InputType {
  text,
  password,
  search,
  field,
  phone,
  number,
  option,
  price,
  date,
  page,
  benefit,
  email
}

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final String? initialValue;
  final InputType inputType;
  final TextEditingController? controller;
  final Function(String val)? onChanged;
  final Function(String val)? onFieldSubmitted;
  final String? Function(String? val)? validator;
  final AutovalidateMode? autoValidateMode;
  final TextInputType? keyboardType;
  final String? prefixText;
  final TextAlign? textAlign;
  final bool enabled;
  final Color fillColor;
  final void Function()? onTap;
  final bool? isLoading;
  final bool? autofocus;
  final bool? readOnly;
  final bool? isDense;
  final bool? isHint;
  final Widget? prefixIcons;
  final Widget? suffixIcons;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final bool isUsingPadding;
  final bool isCompact;

  const CustomTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.inputType = InputType.text,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.prefixText,
    this.textAlign,
    this.enabled = true,
    this.fillColor = white,
    this.onTap,
    this.isLoading = false,
    this.autofocus = false,
    this.readOnly = false,
    this.isDense = false,
    this.isHint,
    this.padding,
    this.textStyle,
    this.maxLength,
    this.inputFormatter,
    this.onFieldSubmitted,
    this.initialValue,
    this.focusNode,
    this.validator,
    this.prefixIcons,
    this.suffixIcons,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.isUsingPadding = true,
    this.isCompact = false,
  });

  @override
  State<CustomTextField> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<CustomTextField> {
  bool? _obscureText;
  final FocusNode _focus = FocusNode();
  bool _showEmailError = false;
  bool _showPasswordError = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.inputType == InputType.password ? true : false;
  }

  void _handleValidation(String value) {
    setState(() {
      if (widget.inputType == InputType.email && !value.contains('@')) {
        _showEmailError = true;
      } else {
        _showEmailError = false;
      }

      if (widget.inputType == InputType.password && value.length < 8) {
        _showPasswordError = true;
      } else {
        _showPasswordError = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          inputFormatters: widget.inputFormatter,
          autofocus: widget.autofocus!,
          onTap: widget.onTap,
          readOnly:
              widget.inputType == InputType.option || widget.readOnly == true,
          focusNode: _focus,
          textAlign: TextAlign.start,
          maxLength: widget.maxLength,
          maxLines: widget.inputType == InputType.field
              ? 5
              : widget.inputType == InputType.benefit
                  ? 2
                  : 1,
          keyboardType: widget.keyboardType,
          onChanged: (value) {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
            _handleValidation(value);
          },
          autovalidateMode: widget.autoValidateMode,
          onFieldSubmitted: widget.onFieldSubmitted,
          validator: widget.validator,
          initialValue: widget.initialValue,
          controller: widget.controller,
          style: widget.textStyle != null
              ? widget.enabled
                  ? widget.textStyle!.copyWith(color: black)
                  : widget.textStyle!.copyWith(color: grey)
              : widget.enabled
                  ? const TextStyle()
                  : const TextStyle(),
          obscureText: _obscureText!,
          decoration: InputDecoration(
            counter: const SizedBox.shrink(),
            isDense: widget.isDense,
            errorMaxLines: 2,
            prefixIcon: widget.prefixIcons,
            contentPadding: EdgeInsets.symmetric(
  horizontal: 12,
  vertical: widget.isCompact ? 10 : 12,
),

            hintText: widget.inputType == InputType.phone && _focus.hasFocus
                ? null
                : widget.hintText,
            hintStyle: widget.isHint == false ? null : poppinsBody16Regular.copyWith(color: black.withOpacity(0.7)),
            filled: false,
            fillColor: widget.enabled ? widget.fillColor : white,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: black.withOpacity(0.5), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: _showEmailError || _showPasswordError
                      ? red
                      : Color(0xffc9c9c9),
                  width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: _showEmailError || _showPasswordError
                      ? red
                      : primary,
                  width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: danger, width: 2),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: danger, width: 2),
            ),
            suffixIcon: widget.isLoading!
                ? const SizedBox(
                    width: 0,
                    height: 0,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: CircularProgressIndicator(color: primary),
                    ))
                : widget.inputType == InputType.password
                    ? GestureDetector(
                        onTap: () =>
                            setState(() => _obscureText = !_obscureText!),
                        child: Icon(
                          _obscureText!
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: editTextIcon,
                        ),
                      )
                    : widget.suffixIcons,
          ),
        ),
        if (_showEmailError)
          Text(
            'Email harus mengandung tanda @',
            style: poppinsBody12Light.copyWith(color: red),
          ),
        if (_showPasswordError)
          Text(
            'Password minimal 8 karakter',
            style: poppinsBody12Light.copyWith(color: red),
          ),
        SizedBox(height: widget.isUsingPadding ? 8 : 0)
      ],
    );
  }
}
