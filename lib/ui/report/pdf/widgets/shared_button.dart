import 'dart:io';

import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/user/user.dart';
import 'package:digprev_flutter/ui/report/pdf/viewModels/pdf_ViewModel.dart';
import 'package:digprev_flutter/ui/report/pdf/widgets/report_PDF.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf/src/pdf/page_format.dart';
import 'package:printing/printing.dart';
import 'package:result_dart/src/result_dart_base.dart';
import 'package:share_plus/share_plus.dart';

class SharedButton extends StatelessWidget {
  const SharedButton({
    required this.responseCardId,
    required this.viewModel,
    super.key,
    this.color,
  });

  final String responseCardId;
  final Color? color;
  final ReportPdfViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.share),
      color: color ?? Theme.of(context).colorScheme.primary,
      onPressed: () async {
        final ResultDart<(ResponseCard, UserModel), Exception> result =
            await viewModel.findData(responseCardId);
        result.fold(((ResponseCard, UserModel) onSuccess) async {
          final ReportPdf reportPdf = ReportPdf(
            responseCard: onSuccess.$1,
            userModel: onSuccess.$2,
          );
          await _sharePdf(reportPdf);
        }, (Exception onError) {});
      },
    );
  }

  Future<void> _sharePdf(ReportPdf reportPdf) async {
    if (kIsWeb) {
      // Gera os bytes do PDF
      final Uint8List pdfBytes = await reportPdf.generateReportPdfBytes();

      // Exibe o PDF na tela para impressão ou download
      await Printing.layoutPdf(
        onLayout: (format) async => pdfBytes,
      );
    } else {
      // No Android/iOS, salvar o arquivo e compartilhar
      final File file = await reportPdf.generateReportPdf();
      if (await file.exists()) {
        await Share.shareXFiles([XFile(file.path)], text: 'Confira este relatório!');
      }
    }
  }
}
