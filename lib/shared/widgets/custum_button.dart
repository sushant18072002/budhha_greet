// import 'package:flutter/material.dart';
// import '../theme/app_colors.dart';

// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//   final bool isLoading;
//   final bool isOutlined;
//   final IconData? icon;
//   final Color? backgroundColor;
//   final Color? textColor;

//   const CustomButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//     this.isLoading = false,
//     this.isOutlined = false,
//     this.icon,
//     this.backgroundColor,
//     this.textColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final buttonStyle = isOutlined
//         ? OutlinedButton.styleFrom(
//             foregroundColor: textColor ?? AppColors.deepSaffron,
//             side: BorderSide(
//               color: backgroundColor ?? AppColors.deepSaffron,
//               width: 2,
//             ),
//           )
//         : ElevatedButton.styleFrom(
//             backgroundColor: backgroundColor ?? AppColors.deepSaffron,
//             foregroundColor: textColor ?? AppColors.mindfulWhite,
//           );

//     final child = isLoading
//         ? const SizedBox(
//             width: 24,
//             height: 24,
//             child: CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation<Color>(AppColors.mindfulWhite),
//               strokeWidth: 2,
//             ),
//           )
//         : Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               if (icon != null) ...[
//                 Icon(icon),
//                 const SizedBox(width: 8),
//               ],
//               Text(text),
//             ],
//           );

//     return isOutlined
//         ? OutlinedButton(
//             onPressed: isLoading ? null : onPressed,
//             style: buttonStyle,
//             child: child,
//           )
//         : ElevatedButton(
//             onPressed: isLoading ? null : onPressed,
//             style: buttonStyle,
//             child: child,
//           );
//   }
// }