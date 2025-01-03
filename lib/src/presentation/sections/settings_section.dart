// import 'package:flutter/material.dart';
// import 'package:fourtrainer/src/domain/algs.dart';
// import 'package:fourtrainer/src/presentation/helpers/four_grid_painter.dart';
//
// import '../../domain/case.dart';
// import '../../domain/settings_config.dart';
//
// class SettingsSection extends StatelessWidget {
//   const SettingsSection({
//     required this.config,
//     required this.onRepeatCasePressed,
//     this.lastCase,
//     super.key,
//   });
//
//   final SettingsConfig config;
//   final Case? lastCase;
//
//   final void Function(Case) onRepeatCasePressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       width: 250,
//       height: double.infinity,
//       child: Card(
//         child: Column(
//           children: [
//             Text(
//               'Statistics:',
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             Text('You have ${config.casesSelected.length} cases selected'),
//             if (lastCase case final last?) ...[
//               const Spacer(),
//               GridWidget(
//                 gridColors: last.ui,
//               ),
//               Text(
//                 last.displayName,
//                 style: Theme.of(context).textTheme.titleMedium,
//                 textAlign: TextAlign.center,
//               ),
//               const Spacer(),
//               ListTile(
//                 title: Text(
//                   'Setup: ',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//                 subtitle: Text(
//                   last.setupMoves,
//                   style: Theme.of(context).textTheme.titleLarge,
//                 ),
//               ),
//               ListTile(
//                 title: Text(
//                   'Alg: ',
//                   style: Theme.of(context).textTheme.titleMedium,
//                 ),
//                 subtitle: Text(
//                   last.alg,
//                   style: Theme.of(context).textTheme.titleLarge,
//                 ),
//               ),
//               const Spacer(),
//               if (!config.casesSelected.contains(last)) ...[
//                 OutlinedButton(
//                   onPressed: () {
//                     onRepeatCasePressed(last);
//                   },
//                   child: const Text('REPEAT ME!'),
//                 ),
//                 const SizedBox(height: 16),
//               ],
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
