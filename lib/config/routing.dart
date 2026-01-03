import 'package:fourtrainer/features/generation/case_finder.dart';
import 'package:fourtrainer/features/poll_discover/poll_discover_ruf_page.dart';
import 'package:fourtrainer/features/sheet/four_cycle_sheet.dart';
import 'package:fourtrainer/features/toilet_ll/tll_page.dart';

import '../features/edge_pairing_trainer/edge_pairing_trainer_page.dart';
import '../features/generation/image_gen_view.dart';
import '../features/generation/oll_image_helper_page.dart';
import '../features/poll_discover/poll_discover_page.dart';
import '../features/sheet/case_switcher.dart';
import '../features/sheet/images.dart';

getAppRoutes() => {
      '/': (context) => const EdgePairingTrainerPage(),
      '/hledous': (context) => const CaseFinderPage(),
      '/tapous': (context) => const OllImageHelperPage(),
      '/generate': (context) => const ImageGenPage(),
      '/tll': (context) => const TllPage(),
      '/poll': (context) => const POllDiscoverPage(),
      '/poll/ruf': (context) => const POllRUFDiscoverPage(),
      '/fourcycles': (context) => const FourCycleSheet(),
      '/goodluck': (context) => const ImagesSheet(),
      '/switchoun': (context) => const CaseSwitcher(),
    };
