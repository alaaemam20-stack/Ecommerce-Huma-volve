import 'package:ecommerce_app_huma_volve/features/details/peresentation/view/widgets/share_product_button.dart';
import 'package:ecommerce_app_huma_volve/features/details/peresentation/view_model/details_cubit.dart';
import 'package:ecommerce_app_huma_volve/features/details/peresentation/view_model/details_states.dart';
import 'package:ecommerce_app_huma_volve/features/home/domain/entity/home_product_entity.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme.dart';
import '../widgets/color_selector.dart';
import '../widgets/size_selector.dart';
import '../../../../../core/widgets/primary_button.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late Color _selectedColor;
  late String _selectedSize;

  final List<Color> _colors = [Colors.black, Colors.brown, Colors.blueGrey];

  final List<String> _sizes = ['S', 'M', 'L', 'XL'];

  @override
  void initState() {
    super.initState();

    _selectedColor = _colors.first;
    _selectedSize = _sizes[1];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<DetailsCubit>().getProductDetails(widget.productId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state is DetailsInitial || state is DetailsLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is DetailsError) {
          return Scaffold(
            backgroundColor: AppTheme.background,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 48,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 16),
                    Text(state.message, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<DetailsCubit>().getProductDetails(
                          widget.productId,
                        );
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (state is DetailsSuccess) {
          final product = state.product;
          final imageUrl = product.images.isNotEmpty
              ? product.images.first
              : '';

          return Scaffold(
            backgroundColor: AppTheme.background,
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 400,
                  pinned: true,
                  backgroundColor: AppTheme.background,

                  leading: IconButton(
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 16),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.favorite_border, size: 18),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ShareProductButton(productId: widget.productId),
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Hero(
                      tag: 'product-${product.id}',
                      child: imageUrl.isNotEmpty
                          ? Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 60,
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: Icon(
                                Icons.image_not_supported_outlined,
                                size: 60,
                              ),
                            ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(32),
                      ),
                    ),
                    transform: Matrix4.translationValues(0, -32, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  product.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(fontSize: 28, height: 1.2),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                '\$${product.price.toStringAsFixed(2)}',
                                style: Theme.of(context).textTheme.headlineLarge
                                    ?.copyWith(
                                      color: AppTheme.primary,
                                      fontSize: 24,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Description',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product.description,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(height: 1.6, fontSize: 16),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Select Color',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          ColorSelector(
                            colors: _colors,
                            selectedColor: _selectedColor,
                            onColorSelected: (color) {
                              setState(() {
                                _selectedColor = color;
                              });
                            },
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Select Size',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          SizeSelector(
                            sizes: _sizes,
                            selectedSize: _selectedSize,
                            onSizeSelected: (size) {
                              setState(() {
                                _selectedSize = size;
                              });
                            },
                          ),
                          const SizedBox(height: 32),
                          PrimaryButton(
                            text: 'Add to Cart',
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${product.title} added to cart',
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: AppTheme.primary,
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
