// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
//
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:fourtrainer/src/application/scramble_handler.dart';
// import 'package:fourtrainer/src/domain/case.dart';
//
// import '../domain/app_state.dart';
// import '../domain/session.dart';
// import '../domain/session_time.dart';
// import '../domain/settings_config.dart';
//
// class AppController {
//   final scrambleHandler = ScrambleHandler();
//
//   AppController() {
//     storage.read(key: 'appState').then(
//       (value) {
//         if (value != null) {
//           final appState = AppState.fromJsonMap(jsonDecode(value));
//           if (appState != null) {
//             final scramble = scrambleHandler.generateScramble(appState.sessions[appState.selectedSessionIndex].config);
//             state.value = appState.copyWith(scramble: () => scramble?.$1, currentCase: scramble?.$2);
//           }
//         }
//       },
//     );
//   }
//
//   final ValueNotifier<AppState> state = ValueNotifier(
//     AppState(
//       selectedSessionIndex: 0,
//       sessions: [
//         Session(
//           id: '1',
//           name: 'Default',
//           times: [],
//           config: SettingsConfig.initial(),
//         ),
//       ],
//     ),
//   );
//
//   final storage = const FlutterSecureStorage();
//
//   void updateState(AppState newState) {
//     storage.write(key: 'appState', value: jsonEncode(newState.toJsonMap()));
//     state.value = newState;
//   }
//
//   Future<void> onKeyEventHandler(KeyEvent value) async {
//     final state = this.state.value;
//
//     if (value is! KeyUpEvent) {
//       return;
//     }
//     switch (value.logicalKey) {
//       case LogicalKeyboardKey.space:
//         if (state.isTimerRunning) {
//           final now = DateTime.now();
//           final difference = now.difference(state.timerStartTime!);
//           final session = state.sessions[state.selectedSessionIndex];
//
//           final time = SessionTime(
//             duration: difference,
//             when: now,
//             scramble: state.scramble,
//             caseUsed: state.currentCase,
//           );
//
//           final updatedSessionTimeList = List<SessionTime>.from(session.times)..add(time);
//           final updatedSession = session.copyWith(times: updatedSessionTimeList);
//
//           final updatedSessionList = List<Session>.from(state.sessions)..[state.selectedSessionIndex] = updatedSession;
//
//           if (session.config.repeatEachCaseOnce) {
//             updatedSession.config.casesSelected.remove(state.currentCase);
//           }
//
//           final scramble = scrambleHandler.generateScramble(updatedSession.config);
//
//           updateState(
//             state.copyWith(
//               sessions: updatedSessionList,
//               timerStartTime: () => null,
//               lastTime: time,
//               scramble: () => scramble?.$1,
//               lastCase: state.currentCase,
//               currentCase: scramble?.$2,
//             ),
//           );
//         } else {
//           final now = DateTime.now();
//           updateState(
//             state.copyWith(
//               timerStartTime: () => now,
//             ),
//           );
//         }
//     }
//   }
//
//   void onDeleteSessionTimesHandler(int index) {
//     final oldSessionsCopy = List<Session>.from(state.value.sessions);
//     final newSession = oldSessionsCopy[state.value.selectedSessionIndex].copyWith(times: []);
//     final newSessionsList = oldSessionsCopy..[state.value.selectedSessionIndex] = newSession;
//
//     updateState(
//       state.value.copyWith(
//         sessions: newSessionsList,
//       ),
//     );
//   }
//
//   void onEditSessionTimeHandler((SessionTime, bool) value) {
//     final session = state.value.sessions[state.value.selectedSessionIndex];
//
//     final item = session.times.firstWhere((e) => e.when == value.$1.when);
//     final timeIndex = session.times.indexOf(item);
//     final shouldDelete = value.$2;
//
//     if (shouldDelete) {
//       final newSession = List<SessionTime>.from(session.times);
//       newSession.removeAt(timeIndex);
//
//       final oldSessionsCopy = List<Session>.from(state.value.sessions);
//       final newSessionsList = oldSessionsCopy..[state.value.selectedSessionIndex] = session.copyWith(times: newSession);
//
//       updateState(
//         state.value.copyWith(
//           sessions: newSessionsList,
//         ),
//       );
//     } else {
//       final newSession = List<SessionTime>.from(session.times);
//       newSession[timeIndex] = value.$1;
//
//       final oldSessionsCopy = List<Session>.from(state.value.sessions);
//       final newSessionsList = oldSessionsCopy..[state.value.selectedSessionIndex] = session.copyWith(times: newSession);
//
//       updateState(
//         state.value.copyWith(
//           sessions: newSessionsList,
//         ),
//       );
//     }
//   }
//
//   void onSessionChangedRequestedHandler(int sessionIndex) {}
//
//   void configUpdateHandler(SettingsConfig config) {
//     final scramble = scrambleHandler.generateScramble(config);
//
//     final oldSessionsCopy = List<Session>.from(state.value.sessions);
//     final newSession = oldSessionsCopy[state.value.selectedSessionIndex].copyWith(config: config);
//     final newSessionsList = oldSessionsCopy..[state.value.selectedSessionIndex] = newSession;
//
//     updateState(
//       state.value.copyWith(
//         sessions: newSessionsList,
//         scramble: () => scramble?.$1,
//         currentCase: scramble?.$2,
//       ),
//     );
//   }
//
//   void onRepeatCasePressedHandler(Case repeatCase) {
//     final oldSessionCopy = List<Session>.from(state.value.sessions);
//     final newSession = oldSessionCopy[state.value.selectedSessionIndex].copyWith(
//       config: oldSessionCopy[state.value.selectedSessionIndex].config.addCases([repeatCase]),
//     );
//     final newSessionsList = oldSessionCopy..[state.value.selectedSessionIndex] = newSession;
//
//     final newScramble = scrambleHandler.generateScramble(newSession.config);
//
//     updateState(
//       state.value.copyWith(
//         sessions: newSessionsList,
//         scramble: () => newScramble?.$1,
//         currentCase: newScramble?.$2,
//       ),
//     );
//   }
// }
