import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final Function() onPressed;
  final Widget icon;
  final bool iconVisible;

  const CustomButton({
    required this.color,
    required this.textColor,
    required this.text,
    required this.onPressed,
    required this.iconVisible,
    this.icon = const SizedBox(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        height: 48,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Row(
            mainAxisSize:
                MainAxisSize.min, // Ajusta el tamaño del Row al contenido
            children: [
              if (iconVisible) icon,
              if (iconVisible)
                const SizedBox(width: 8), // Espacio entre icono y texto
              Text(
                text,
                style: GoogleFonts.inter(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
