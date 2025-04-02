# Цвета
RED=\033[0;31m
GREEN=\033[0;32m
NC=\033[0m # No Color

# Установка зависимостей
install:
	npm ci

# Линт
lint:
	npx eslint .

# Автофиксы линтера
lint-fix:
	npx eslint . --fix

# Публикация в dry-run режиме
publish:
	npm publish --dry-run

# Глобальная локальная установка CLI
link:
	npm link

# Объединённая проверка: линт + тесты с цветами и выводом
check:
	@echo "🔍 Проверка линтера..."
	@if npm run lint; then \
		echo "$(GREEN)✅ Линтер пройден успешно$(NC)"; \
	else \
		echo "$(RED)❌ Ошибки линтера$(NC)"; \
		exit 1; \
	fi
	@echo "🧪 Запуск тестов..."
	@if npm test; then \
		echo "$(GREEN)✅ Все тесты прошли$(NC)"; \
	else \
		echo "$(RED)❌ Ошибки в тестах$(NC)"; \
		exit 1; \
	fi