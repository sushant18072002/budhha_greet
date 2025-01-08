@echo off
:: Base models directory
set "base_dir=lib\shared\models"

:: Create main directories
mkdir "%base_dir%\app_config"
mkdir "%base_dir%\entities"
mkdir "%base_dir%\layout"
mkdir "%base_dir%\style"
mkdir "%base_dir%\validation"
mkdir "%base_dir%\analytics"

:: Create model files
:: App Config
type nul > "%base_dir%\app_config\app_config.dart"
type nul > "%base_dir%\app_config\metadata.dart"
type nul > "%base_dir%\app_config\system_config.dart"
type nul > "%base_dir%\app_config\language_config.dart"
type nul > "%base_dir%\app_config\app_settings.dart"
type nul > "%base_dir%\app_config\theme_config.dart"
type nul > "%base_dir%\app_config\connectivity_config.dart"
type nul > "%base_dir%\app_config\api_config.dart"
type nul > "%base_dir%\app_config\cache_config.dart"

:: Entities
type nul > "%base_dir%\entities\entities.dart"
type nul > "%base_dir%\entities\language.dart"
type nul > "%base_dir%\entities\category.dart"
type nul > "%base_dir%\entities\author.dart"
type nul > "%base_dir%\entities\source.dart"
type nul > "%base_dir%\entities\quote.dart"
type nul > "%base_dir%\entities\background.dart"
type nul > "%base_dir%\entities\template.dart"
type nul > "%base_dir%\entities\translation.dart"

:: Layout
type nul > "%base_dir%\layout\position.dart"
type nul > "%base_dir%\layout\size.dart"
type nul > "%base_dir%\layout\safe_area.dart"
type nul > "%base_dir%\layout\layout_config.dart"
type nul > "%base_dir%\layout\element_layout.dart"
type nul > "%base_dir%\layout\orientation_layout.dart"

:: Style
type nul > "%base_dir%\style\style.dart"
type nul > "%base_dir%\style\typography.dart"
type nul > "%base_dir%\style\font_size.dart"
type nul > "%base_dir%\style\style_colors.dart"
type nul > "%base_dir%\style\visual_data.dart"
type nul > "%base_dir%\style\visual_effects.dart"

:: Validation
type nul > "%base_dir%\validation\validation_rules.dart"
type nul > "%base_dir%\validation\quote_validation.dart"
type nul > "%base_dir%\validation\template_validation.dart"
type nul > "%base_dir%\validation\text_validation.dart"
type nul > "%base_dir%\validation\typography_validation.dart"

:: Analytics
type nul > "%base_dir%\analytics\analytics_config.dart"
type nul > "%base_dir%\analytics\tracking_config.dart"
type nul > "%base_dir%\analytics\reporting_config.dart"
type nul > "%base_dir%\analytics\metrics.dart"
type nul > "%base_dir%\analytics\audit.dart"

echo Model structure created successfully.