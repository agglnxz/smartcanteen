class TransactionModelGalang {
  final String trxId;
  final double totalHargaFinal;
  final String status;
  final List<Map<String, dynamic>> items;

  TransactionModelGalang({
    required this.trxId,
    required this.totalHargaFinal,
    required this.status,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      'trxId': trxId,
      'totalFinal': totalHargaFinal,
      'status': status,
      'items': items,
    };
  }

  factory TransactionModelGalang.fromJson(Map<String, dynamic> json) {
    return TransactionModelGalang(
      trxId: json['trxId'],
      totalHargaFinal: json['totalFinal'],
      status: json['status'],
      items: List<Map<String, dynamic>>.from(json['items']),
    );
  }
}
