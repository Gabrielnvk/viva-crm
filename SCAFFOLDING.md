# Project Scaffolding Guide

This template project includes a scaffolding system to automatically rename the project from the default "my-app" to your custom project name.

## Prerequisites

The scaffolding system requires:

- Node.js (which is already required for the project)

## Quick Start

### Option 1: Non-Interactive (Recommended for CI/CD)

```bash
make scaffold PROJECT_NAME=awesome-app DISPLAY_NAME="Awesome App"
```

### Option 2: Interactive

```bash
make scaffold-interactive
```

You'll be prompted to enter:

- Project name (e.g., `awesome-app`)
- Display name (e.g., `Awesome App`)

### Option 3: Full Setup (Scaffold + Install)

```bash
make setup PROJECT_NAME=awesome-app DISPLAY_NAME="Awesome App"
```

This will scaffold the project and install dependencies in one command.

## What Gets Updated

The scaffolding process updates the following files:

1. **package.json**
   - `name`: Changed to your project slug

2. **app.json**
   - `expo.name`: Changed to your display name
   - `expo.slug`: Changed to your project slug
   - `expo.scheme`: Changed to your project slug (for deep linking)

3. **README.md**
   - References to `my-app` are replaced with your project slug

4. **convex.json**
   - Adds placeholder values for Convex deployment:
     - `project`: `<your-project-slug-project-id>`
     - `team`: `<your-team>`
     - `prodUrl`: `https://<your-project-slug-project-id>.convex.cloud`
   - These placeholders will be replaced with actual values when you run `npx convex deploy`

## Project Name Validation

The project name is automatically converted to a valid slug:

- Converted to lowercase
- Non-alphanumeric characters (except hyphens) are replaced with hyphens
- Example: `My Awesome App!` → `my-awesome-app-`

## Available Commands

```bash
# Show help and current configuration
make

# Scaffold with custom names
make scaffold PROJECT_NAME=<name> DISPLAY_NAME="<display name>"

# Interactive scaffolding
make scaffold-interactive

# Reset to template defaults
make clean-scaffold

# Validate project name format
make validate-name

# Install dependencies
make install

# Start development server
make dev

# Full setup (scaffold + install)
make setup PROJECT_NAME=<name> DISPLAY_NAME="<display name>"
```

## Examples

### Example 1: E-commerce App

```bash
make scaffold PROJECT_NAME=shop-ease DISPLAY_NAME="ShopEase"
```

### Example 2: Social Media App

```bash
make scaffold PROJECT_NAME=social-connect DISPLAY_NAME="Social Connect"
```

### Example 3: Reset to Template

If you need to reset the project back to template defaults:

```bash
make clean-scaffold
```

## CI/CD Integration

For automated deployments, you can use environment variables:

```bash
PROJECT_NAME=my-production-app DISPLAY_NAME="My Production App" make scaffold
```

Or in a GitHub Action:

```yaml
- name: Scaffold Project
  run: make scaffold PROJECT_NAME=${{ env.PROJECT_NAME }} DISPLAY_NAME="${{ env.DISPLAY_NAME }}"
```

## Troubleshooting

### Permission Denied

Make sure the Makefile is executable:

```bash
chmod +x Makefile
```

### Project Name Not Changing

Ensure you're providing the PROJECT_NAME parameter:

```bash
# Wrong
make scaffold

# Correct
make scaffold PROJECT_NAME=my-new-app DISPLAY_NAME="My New App"
```