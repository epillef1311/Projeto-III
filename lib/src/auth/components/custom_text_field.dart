import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon; // Variável captura ícone
  final String label; // variável captura título do campo
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key, 
    required this.icon, 
    required this.label,
    this.isSecret = false,
    this.inputFormatters,
    }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}
class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Espaçamento de 15 entre os campos
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.isSecret 
              ? IconButton(
                  onPressed: ()=> setState(() {isObscure = !isObscure; }
                  ),
              icon: 
                Icon(isObscure ? Icons.visibility_off : Icons.visibility),
                )
                :null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          )
        ),
      ),
    );
    
  }
}
