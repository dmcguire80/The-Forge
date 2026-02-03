# Project Templates

This directory contains templates for starting new projects with The Forge.

## Available Templates

### .gitignore-template

A comprehensive `.gitignore` file for React/TypeScript/Firebase projects with security best practices.

**Features:**
- Excludes `node_modules`, build artifacts, and logs
- Protects environment variables
- **Security:** Excludes `.agent/` and `.github/workflows/` for public repos
- Excludes Firebase and Gemini debug files
- Editor and OS file exclusions

**Usage:**

```bash
# Copy to your project
cp /path/to/The-Forge/templates/.gitignore-template your-project/.gitignore

# For PUBLIC repositories (recommended):
# The .agent/ and .github/workflows/ are already uncommented

# For PRIVATE repositories:
# You can comment out .agent/ and .github/workflows/ if you want to include them
```

**Important for Public Repositories:**

Always exclude these directories from public repos:
- `.agent/` - Contains your custom agents and proprietary skills
- `.github/workflows/` - Contains deployment secrets and logic
- `.gemini/` - Contains Antigravity artifacts

## Future Templates

Coming soon:
- `react-firebase-app/` - Complete React + Firebase starter
- `vite-typescript-starter/` - Minimal Vite + TypeScript setup
- `package.json-template` - Standard dependencies and scripts
- `tsconfig.json-template` - TypeScript configuration
- `eslint-prettier-template/` - Linting and formatting setup
