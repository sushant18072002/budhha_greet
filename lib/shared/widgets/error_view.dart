// import 'package:flutter/material.dart';
// import '../theme/app_colors.dart';
// import '../theme/app_text_styles.dart';

// class ErrorView extends StatelessWidget {
//   final String message;
//   final VoidCallback? onRetry;

//   const ErrorView({
//     super.key,
//     required this.message,
//     this.onRetry,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.error_outline,
//               size: 48,
//               color: AppColors.error,
//             ),
//             const SizedBox(height: 16),
//             Text(
//               message,
//               style: AppTextStyles.bodyLarge,
//               textAlign: TextAlign.center,
//             ),
//             if (onRetry != null) ...[
//               const SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: onRetry,
//                 child: const Text('Retry'),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }