# Project Scaffolding Makefile
# This Makefile helps scaffold the project with custom names

# Default values
PROJECT_NAME ?= my-app
DISPLAY_NAME ?= My App

# Derived values
PROJECT_SLUG := $(shell echo $(PROJECT_NAME) | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9-]/-/g')

# Colors for output
GREEN := \033[0;32m
RED := \033[0;31m
YELLOW := \033[0;33m
NC := \033[0m # No Color

.PHONY: help scaffold scaffold-interactive check-deps clean-scaffold validate-name

# Default target - show help
help:
	@echo "$(GREEN)Project Scaffolding Tool$(NC)"
	@echo ""
	@echo "Usage:"
	@echo "  make scaffold PROJECT_NAME=<name> DISPLAY_NAME=<display-name>"
	@echo "  make scaffold-interactive"
	@echo ""
	@echo "Targets:"
	@echo "  $(YELLOW)scaffold$(NC)              - Scaffold project with provided names"
	@echo "  $(YELLOW)scaffold-interactive$(NC)  - Interactive scaffolding (prompts for names)"
	@echo "  $(YELLOW)clean-scaffold$(NC)        - Reset to default template values"
	@echo "  $(YELLOW)validate-name$(NC)         - Validate project name format"
	@echo ""
	@echo "Examples:"
	@echo "  make scaffold PROJECT_NAME=awesome-app DISPLAY_NAME=\"Awesome App\""
	@echo "  make scaffold-interactive"
	@echo ""
	@echo "Current values:"
	@echo "  PROJECT_NAME: $(PROJECT_NAME)"
	@echo "  DISPLAY_NAME: $(DISPLAY_NAME)"
	@echo "  PROJECT_SLUG: $(PROJECT_SLUG)"

# Check if required tools are installed
check-deps:
	@command -v node >/dev/null 2>&1 || { echo "$(RED)Error: Node.js is required but not installed.$(NC)" >&2; exit 1; }

# Validate project name format
validate-name:
	@if [ "$(PROJECT_NAME)" = "my-app" ]; then \
		echo "$(RED)Error: Please provide a custom PROJECT_NAME$(NC)"; \
		echo "Usage: make scaffold PROJECT_NAME=your-app-name DISPLAY_NAME=\"Your App Name\""; \
		exit 1; \
	fi
	@echo "$(GREEN)✓ Project name validated: $(PROJECT_SLUG)$(NC)"

# Main scaffolding target
scaffold: check-deps validate-name
	@echo "$(GREEN)🚀 Scaffolding project...$(NC)"
	@echo "  Project Name: $(PROJECT_NAME)"
	@echo "  Display Name: $(DISPLAY_NAME)"
	@echo "  Project Slug: $(PROJECT_SLUG)"
	@echo ""
	
	@# Update package.json
	@echo "$(YELLOW)Updating package.json...$(NC)"
	@node -e " \
		const fs = require('fs'); \
		const packageJson = JSON.parse(fs.readFileSync('package.json', 'utf8')); \
		packageJson.name = '$(PROJECT_SLUG)'; \
		fs.writeFileSync('package.json', JSON.stringify(packageJson, null, 2) + '\n'); \
	"
	@echo "$(GREEN)✓ Updated package.json$(NC)"
	
	@# Update app.json
	@echo "$(YELLOW)Updating app.json...$(NC)"
	@node -e " \
		const fs = require('fs'); \
		const appJson = JSON.parse(fs.readFileSync('app.json', 'utf8')); \
		appJson.expo.name = '$(DISPLAY_NAME)'; \
		appJson.expo.slug = '$(PROJECT_SLUG)'; \
		appJson.expo.scheme = '$(PROJECT_SLUG)'; \
		fs.writeFileSync('app.json', JSON.stringify(appJson, null, 2) + '\n'); \
	"
	@echo "$(GREEN)✓ Updated app.json$(NC)"
	
	@# Update README.md
	@echo "$(YELLOW)Updating README.md...$(NC)"
	@sed -i.bak 's/my-app/$(PROJECT_SLUG)/g' README.md && rm README.md.bak
	@echo "$(GREEN)✓ Updated README.md$(NC)"
	
	@# Update convex.json with placeholders
	@echo "$(YELLOW)Updating convex.json...$(NC)"
	@node -e " \
		const fs = require('fs'); \
		const convexJson = JSON.parse(fs.readFileSync('convex.json', 'utf8')); \
		convexJson.project = '<$(PROJECT_SLUG)-project-id>'; \
		convexJson.team = '<your-team>'; \
		convexJson.prodUrl = 'https://<$(PROJECT_SLUG)-project-id>.convex.cloud'; \
		fs.writeFileSync('convex.json', JSON.stringify(convexJson, null, 2) + '\n'); \
	"
	@echo "$(GREEN)✓ Updated convex.json with placeholders$(NC)"
	
	@echo ""
	@echo "$(GREEN)✨ Scaffolding complete!$(NC)"
	@echo ""
	@echo "Your project \"$(DISPLAY_NAME)\" ($(PROJECT_SLUG)) is ready."
	@echo ""
	@echo "$(YELLOW)Next steps:$(NC)"
	@echo "1. Run 'pnpm install' to install dependencies"
	@echo "2. Run 'pnpm dev' to start the development server"
	@echo "3. When ready to deploy to Convex, run 'npx convex deploy'"
	@echo "   (This will update convex.json with your actual project details)"

# Interactive scaffolding
scaffold-interactive: check-deps
	@echo "$(GREEN)🚀 Interactive Project Scaffolding$(NC)"
	@echo ""
	@read -p "Enter project name (e.g., my-awesome-app): " project_name; \
	read -p "Enter display name (e.g., My Awesome App): " display_name; \
	$(MAKE) scaffold PROJECT_NAME="$$project_name" DISPLAY_NAME="$$display_name"

# Reset to template defaults
clean-scaffold: check-deps
	@echo "$(YELLOW)Resetting to template defaults...$(NC)"
	
	@# Reset package.json
	@node -e " \
		const fs = require('fs'); \
		const packageJson = JSON.parse(fs.readFileSync('package.json', 'utf8')); \
		packageJson.name = 'my-app'; \
		fs.writeFileSync('package.json', JSON.stringify(packageJson, null, 2) + '\n'); \
	"
	
	@# Reset app.json
	@node -e " \
		const fs = require('fs'); \
		const appJson = JSON.parse(fs.readFileSync('app.json', 'utf8')); \
		appJson.expo.name = 'my-app'; \
		appJson.expo.slug = 'my-app'; \
		appJson.expo.scheme = 'my-app'; \
		fs.writeFileSync('app.json', JSON.stringify(appJson, null, 2) + '\n'); \
	"
	
	@# Reset README.md (only if current slug is not my-app)
	@current_name=$$(node -e "console.log(JSON.parse(require('fs').readFileSync('package.json', 'utf8')).name)"); \
	if [ "$$current_name" != "my-app" ]; then \
		sed -i.bak "s/$$current_name/my-app/g" README.md && rm README.md.bak; \
	fi
	
	@# Reset convex.json
	@node -e " \
		const fs = require('fs'); \
		const convexJson = JSON.parse(fs.readFileSync('convex.json', 'utf8')); \
		delete convexJson.project; \
		delete convexJson.team; \
		delete convexJson.prodUrl; \
		fs.writeFileSync('convex.json', JSON.stringify(convexJson, null, 2) + '\n'); \
	"
	
	@echo "$(GREEN)✓ Reset complete$(NC)"

# Install dependencies (convenience target)
install:
	pnpm install

# Development server (convenience target)
dev:
	pnpm dev

# Full setup: scaffold and install
setup: scaffold install
	@echo "$(GREEN)✓ Project setup complete! Run 'make dev' to start.$(NC)"