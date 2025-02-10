import 'package:flutter/material.dart';
import 'package:guia_moteis_app/domain/entities/category_entity.dart';
import 'package:guia_moteis_app/domain/entities/period_entity.dart';
import 'package:guia_moteis_app/domain/entities/suite_entity.dart';
import 'package:guia_moteis_app/ui/themes/theme_app.dart';

class SuiteDescription extends StatelessWidget {
  final SuiteEntity suiteInfo;
  const SuiteDescription({super.key, required this.suiteInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildContainer(
          context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildImage(suiteInfo.photos.first),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  suiteInfo.name,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        _buildContainer(
          context,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: suiteInfo.categoryItems.map(_buildCategoryItem).toList(),
          ),
        ),
        _buildContainer(
          context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: suiteInfo.periods.map(_buildPeriodItem).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildContainer(BuildContext context, {required Widget child}) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.81,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: ThemeApp.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.image_not_supported, size: 70),
      ),
    );
  }

  Widget _buildPeriodItem(PeriodEntity period) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                period.formattedTime,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              _buildPrice(period),
              if (period.discount != null) _buildDiscountBadge(period),
            ],
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  Widget _buildPrice(PeriodEntity period) {
    final hasDiscount = period.discount != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (hasDiscount)
          Text(
            'R\$ ${period.value.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.red,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        Text(
          'R\$ ${period.totalValue.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: hasDiscount ? Colors.green : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildDiscountBadge(PeriodEntity period) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          '-${period.discount!.discount.toStringAsFixed(0)}%',
          style: TextStyle(
            color: Colors.green[800],
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(CategoryItemEntity item) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.network(
        item.icon,
        width: 30,
        height: 30,
        errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.image_not_supported, size: 40),
      ),
    );
  }
}
