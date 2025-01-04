#!/bin/bash

# Base directory
base_dir="lib"

# Create the directory structure
mkdir -p $base_dir/core/config
mkdir -p $base_dir/core/constants
mkdir -p $base_dir/core/services
mkdir -p $base_dir/core/utils
mkdir -p $base_dir/features/auth/data/models
mkdir -p $base_dir/features/auth/data/repositories
mkdir -p $base_dir/features/auth/domain/usecases
mkdir -p $base_dir/features/auth/presentation/screens
mkdir -p $base_dir/features/auth/presentation/widgets
mkdir -p $base_dir/features/home/data/models
mkdir -p $base_dir/features/home/data/repositories
mkdir -p $base_dir/features/home/domain/usecases
mkdir -p $base_dir/features/home/presentation/screens
mkdir -p $base_dir/features/home/presentation/widgets
mkdir -p $base_dir/features/greeting_creator/data/models
mkdir -p $base_dir/features/greeting_creator/data/repositories
mkdir -p $base_dir/features/greeting_creator/domain/usecases
mkdir -p $base_dir/features/greeting_creator/presentation/screens
mkdir -p $base_dir/features/greeting_creator/presentation/widgets
mkdir -p $base_dir/features/quote_library/data/models
mkdir -p $base_dir/features/quote_library/data/repositories
mkdir -p $base_dir/features/quote_library/domain/usecases
mkdir -p $base_dir/features/quote_library/presentation/screens
mkdir -p $base_dir/features/quote_library/presentation/widgets
mkdir -p $base_dir/features/scheduling/data/models
mkdir -p $base_dir/features/scheduling/data/repositories
mkdir -p $base_dir/features/scheduling/domain/usecases
mkdir -p $base_dir/features/scheduling/presentation/screens
mkdir -p $base_dir/features/scheduling/presentation/widgets
mkdir -p $base_dir/shared/widgets
mkdir -p $base_dir/shared/theme
mkdir -p $base_dir/shared/extensions

# Create the files
touch $base_dir/core/config/{app_config.dart,theme_config.dart,api_config.dart}
touch $base_dir/core/constants/{app_constants.dart,assets_paths.dart,route_constants.dart}
touch $base_dir/core/services/{auth_service.dart,storage_service.dart,api_service.dart,sharing_service.dart,notification_service.dart}
touch $base_dir/core/utils/{date_formatter.dart,image_processor.dart,validators.dart}
touch $base_dir/features/auth/data/models/user_model.dart
touch $base_dir/features/auth/data/repositories/auth_repository.dart
touch $base_dir/features/auth/domain/usecases/{login_usecase.dart,register_usecase.dart}
touch $base_dir/features/auth/presentation/screens/{login_screen.dart,register_screen.dart}
touch $base_dir/features/auth/presentation/widgets/auth_form.dart
touch $base_dir/features/home/data/models/featured_content_model.dart
touch $base_dir/features/home/data/repositories/home_repository.dart
touch $base_dir/features/home/domain/usecases/get_featured_content_usecase.dart
touch $base_dir/features/home/presentation/screens/home_screen.dart
touch $base_dir/features/home/presentation/widgets/{daily_quote_card.dart,template_grid.dart,quick_actions.dart}
touch $base_dir/features/greeting_creator/data/models/{greeting_model.dart,template_model.dart}
touch $base_dir/features/greeting_creator/data/repositories/greeting_repository.dart
touch $base_dir/features/greeting_creator/domain/usecases/{create_greeting_usecase.dart,save_template_usecase.dart}
touch $base_dir/features/greeting_creator/presentation/screens/{creator_screen.dart,template_picker_screen.dart}
touch $base_dir/features/greeting_creator/presentation/widgets/{image_editor.dart,text_editor.dart,style_picker.dart}
touch $base_dir/features/quote_library/data/models/quote_model.dart
touch $base_dir/features/quote_library/data/repositories/quote_repository.dart
touch $base_dir/features/quote_library/domain/usecases/{get_quotes_usecase.dart,save_quote_usecase.dart}
touch $base_dir/features/quote_library/presentation/screens/quote_library_screen.dart
touch $base_dir/features/quote_library/presentation/widgets/{quote_card.dart,category_filter.dart}
touch $base_dir/features/scheduling/data/models/schedule_model.dart
touch $base_dir/features/scheduling/data/repositories/schedule_repository.dart
touch $base_dir/features/scheduling/domain/usecases/{create_schedule_usecase.dart,get_schedules_usecase.dart}
touch $base_dir/features/scheduling/presentation/screens/schedule_screen.dart
touch $base_dir/features/scheduling/presentation/widgets/{schedule_form.dart,schedule_list.dart}
touch $base_dir/shared/widgets/{app_bar.dart,bottom_nav.dart,loading_indicator.dart,error_view.dart}
touch $base_dir/shared/theme/{app_colors.dart,app_text_styles.dart,app_theme.dart}
touch $base_dir/shared/extensions/{context_extensions.dart,string_extensions.dart}
touch lib/main.dart

echo "Folders and files created successfully."
