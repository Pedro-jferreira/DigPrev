import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/section/section.dart';
import 'package:digprev_flutter/domain/models/sectionAnswer/sectionAnswer.dart';
import 'package:digprev_flutter/domain/models/stage/stage.dart';

/// Helper para manipulação e extração de seções dentro de um estágio.
class SectionHelper {
  /// Retorna apenas as seções que possuem subseções diretas
  /// (ou seja, os "pais").
  ///
  /// Se uma seção contém subseções, ela será incluída na lista retornada.
  /// No entanto, subseções aninhadas não serão incluídas neste método.
  ///
  /// ### Exemplo:
  /// ```dart
  /// List<Section> parentSections =
  /// SectionHelper.getSectionsWithSubSections(stage);
  /// ```
  ///
  /// - **Parâmetros**:
  ///   - [stage]: O estágio contendo as seções a serem filtradas.
  /// - **Retorno**: Uma lista contendo apenas as seções que possuem subseções.
  static List<Section> getSectionsWithSubSections(Stage stage) {
    return stage.sections
        .where(
          (Section s) => s.subSections != null && s.subSections!.isNotEmpty,
        )
        .toList();
  }

  /// Retorna todas as seções que **não** possuem subseções, achatando a
  /// hierarquia.
  ///
  /// Se uma seção possui subseções, apenas as subseções finais
  /// (as folhas da árvore)
  /// serão incluídas no retorno. Se a seção não possui subseções, ela mesma
  /// será incluída.
  ///
  /// ### Exemplo:
  /// ```dart
  /// List<Section> leafSections = SectionHelper.flattenSections(stage);
  /// ```
  ///
  /// - **Parâmetros**:
  ///   - [stage]: O estágio contendo as seções a serem processadas.
  /// - **Retorno**: Uma lista contendo apenas as seções terminais
  /// (sem subseções).
  static List<Section> flattenSections(Stage stage) {
    final List<Section> result = <Section>[];

    void extractSections(Section section) {
      if (section.subSections != null && section.subSections!.isNotEmpty) {
        for (Section sub in section.subSections!) {
          extractSections(sub);
        }
      } else {
        result.add(section);
      }
    }

    for (Section section in stage.sections) {
      extractSections(section);
    }

    return result;
  }
  static List<SectionAnswer> flattenSectionAnswer(ResponseCard responseCard) {
    final List<SectionAnswer> result = <SectionAnswer>[];

    void extractSections(SectionAnswer section) {
      if (section.subSectionsAnswers != null && section.subSectionsAnswers!.isNotEmpty) {
        for (SectionAnswer sub in section.subSectionsAnswers!) {
          extractSections(sub);
        }
      } else {
        result.add(section);
      }
    }

    for (SectionAnswer section in responseCard.sections) {
      extractSections(section);
    }

    return result;
  }
}
