import 'dart:io';

import 'package:digprev_flutter/domain/models/responseCard/responseCard.dart';
import 'package:digprev_flutter/domain/models/user/user.dart';
import 'package:digprev_flutter/utils/formatters.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class ReportPdf {
  final ResponseCard _responseCard;
  final UserModel _userModel;

  ReportPdf({
    required ResponseCard responseCard,
    required UserModel userModel})
      : _responseCard = responseCard,
        _userModel= userModel;


  // Para Android/iOS (gera um arquivo)
  Future<File> generateReportPdf() async {
    final pw.Document doc = await _buildPdf();

    // No Android/iOS, salvar o arquivo
    final Directory directory = await getTemporaryDirectory();
    final File file = File('${directory.path}/report.pdf');
    await file.writeAsBytes(await doc.save());

    return file;
  }

  // Para Web (gera os bytes do PDF)
  Future<Uint8List> generateReportPdfBytes() async {
    final pw.Document doc = await _buildPdf();
    return await doc.save();
  }

  Future<pw.Document> _buildPdf() async {
    final pw.Document doc = pw.Document();

    // Carregar uma fonte compatível com Unicode
    final pw.Font customFont =
    pw.Font.ttf(await rootBundle.load('assets/fonts/RobotoSlabt.ttf'));

    doc.addPage(
      pw.MultiPage(
        pageTheme: pw.PageTheme(
          margin: pw.EdgeInsets.zero,
          theme: pw.ThemeData(defaultTextStyle: pw.TextStyle(font: customFont)),
        ),
        build: (pw.Context context) => _buildContent(context),
      ),
    );

    return doc;
  }


  _buildContent(pw.Context context) {
    return [
      pw.Padding(
          padding: const pw.EdgeInsets.only(top: 30, left: 25, right: 25),
          child: _buildContentClient()),
    ];
  }

  _buildContentClient() {
    return pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _titleText('Cliente'),
              pw.Text(_userModel.nome),
              _titleText('Email'),
              pw.Text(_userModel.email)
            ],
          ),
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.end, children: [
            _titleText('Número do cpf'),
            pw.Text(_userModel.cpf),
            _titleText('Data'),
            pw.Text(formatDate(DateTime.now()))
          ])
        ]);
  }

  _titleText(String text) {
    return pw.Padding(
        padding: const pw.EdgeInsets.only(top: 8),
        child: pw.Text(text,
            style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)));
  }

  _contentTable(pw.Context context) {}

}
