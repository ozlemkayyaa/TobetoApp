import 'package:flutter/material.dart';
import 'package:tobeto/utils/constants/sizes.dart';

class AboutWidget extends StatelessWidget {
  final String baslangic;
  final String bitis;
  final String tahminiSure;
  final String egitimTuru;
  final String kategori;
  final String seviye;
  final String icerik;
  final String? gorev;
  final String? video;
  final String? eEgitim;
  final String ureticiFirma;

  const AboutWidget({
    super.key,
    required this.baslangic,
    required this.bitis,
    required this.tahminiSure,
    required this.egitimTuru,
    required this.kategori,
    required this.seviye,
    required this.icerik,
    this.gorev,
    this.video,
    this.eEgitim,
    required this.ureticiFirma,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: TSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var entry in {
            "Başlangıç": baslangic,
            "Bitiş": bitis,
            "Tahmini Süre": tahminiSure,
            "Eğitim Türü": egitimTuru,
            "Kategori": kategori,
            "Seviye": seviye,
            "İçerik": icerik,
            if (gorev != null) "Görev": gorev!,
            if (video != null) "Video": video!,
            if (eEgitim != null) "E-Eğitim": eEgitim!,
            "Üretici Firma": ureticiFirma,
          }.entries)
            Padding(
              padding: const EdgeInsets.only(
                  left: TSizes.md,
                  right: TSizes.md,
                  top: TSizes.xs,
                  bottom: TSizes.xs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    entry.key,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    entry.value,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          const SizedBox(height: 16),
          Padding(
            padding:
                const EdgeInsets.only(left: 12.0, right: 12, top: 4, bottom: 4),
            child: Text(
              "Açıklama",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 8.0, right: 8, top: 4, bottom: 4),
            child: Text(
              "Etkili İletişim Gelişim Yolculuğu'nun amacı günümüzün en önemli konularından biri olan temel iletişim ve etkili iletişim becerileri konularında çalışan yetkinliğinin artmasını sağlamaktır.",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }
}
