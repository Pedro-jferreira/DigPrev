import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';

class SectionHelper {
  static List<Section> getSection(Stage stage) {
    final List<Section> sections = <Section>[];
    for (Section s in stage.sections) {
      if (s.questions.isEmpty && s.subSections != null) {
        sections.add(s);
        continue;
      }

      sections.add(s);
    }
      return sections;
  }
}
