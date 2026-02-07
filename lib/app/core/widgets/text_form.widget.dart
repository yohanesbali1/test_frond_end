import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:testing_front_end_dev/app/core/theme/theme.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController? controller;
  final bool isEditable;
  final String hintText;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final bool isDropdown;
  final List<String>? dropdownItems;
  final String? value;
  final bool isPassword;
  final bool isDate; // baru untuk date picker

  const CustomInputField({
    Key? key,
    this.controller,
    this.isEditable = true,
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.isDropdown = false,
    this.dropdownItems,
    this.value,
    this.isPassword = false,
    this.isDate = false,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  Future<void> _pickDate() async {
    DateTime initialDate = DateTime.now();
    if (widget.controller?.text.isNotEmpty ?? false) {
      try {
        initialDate = DateFormat('yyyy-MM-dd').parse(widget.controller!.text);
      } catch (_) {}
    }

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      String formatted = DateFormat('yyyy-MM-dd').format(picked);
      widget.controller?.text = formatted;
      widget.onChanged?.call(formatted);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isDropdown) {
      return DropdownButtonFormField<String>(
        value: widget.value,
        items: widget.dropdownItems
            ?.map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: GoogleFonts.barlow(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: (val) {
          if (val != null) widget.onChanged?.call(val);
        },
        style: GoogleFonts.barlow(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        hint: Text(
          widget.hintText,
          style: TextStyle(
            color: secondaryTextColor, // warna hint
            fontSize: 14,
          ),
        ),
        dropdownColor: bgsecondColor,
        decoration: _buildDecoration(),
      );
    }

    return TextField(
      controller: widget.controller,
      enabled: widget.isEditable,
      readOnly: widget.isDate, // kalau date, readOnly true
      onChanged: widget.isDate ? null : (val) => widget.onChanged?.call(val),
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      style: GoogleFonts.barlow(fontSize: 14, fontWeight: FontWeight.w400),
      decoration: _buildDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.isDate
            ? Icon(Icons.calendar_today)
            : null,
      ),
      onTap: widget.isDate ? _pickDate : null,
    );
  }

  InputDecoration _buildDecoration({Widget? suffixIcon}) {
    return InputDecoration(
      hintText: widget.hintText,
      hintStyle: GoogleFonts.barlow(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: secondaryTextColor,
      ),
      isDense: true,
      contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      fillColor: bgInput,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: borderMain, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderMain, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: mainColor, width: 2),
      ),
      suffixIcon: suffixIcon,
    );
  }
}
