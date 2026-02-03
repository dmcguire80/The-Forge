# Git Workflow & Branch Strategy

## Overview

This document outlines the Git workflow and branching strategy for all repositories. We follow GitHub Flow with feature branches and pull requests.

## Branch Strategy

### Main Branches

#### `main`
- **Purpose:** Production-ready code
- **Protection:** Protected branch, requires PR approval
- **Deployment:** Auto-deploys to production on merge
- **Never commit directly to main**

### Supporting Branches

#### Feature Branches
- **Naming:** `feature/description-of-feature`
- **Purpose:** New features and enhancements
- **Examples:**
  - `feature/add-bill-templates`
  - `feature/export-to-csv`
  - `feature/dark-mode-toggle`

#### Bugfix Branches
- **Naming:** `bugfix/description-of-bug`
- **Purpose:** Bug fixes
- **Examples:**
  - `bugfix/fix-bill-sorting`
  - `bugfix/date-calculation-error`
  - `bugfix/authentication-timeout`

#### Hotfix Branches
- **Naming:** `hotfix/description-of-issue`
- **Purpose:** Critical production fixes
- **Examples:**
  - `hotfix/security-vulnerability`
  - `hotfix/data-loss-prevention`

#### Docs Branches
- **Naming:** `docs/description-of-changes`
- **Purpose:** Documentation updates
- **Examples:**
  - `docs/update-readme`
  - `docs/add-api-documentation`

#### Chore Branches
- **Naming:** `chore/description-of-task`
- **Purpose:** Maintenance tasks, dependency updates
- **Examples:**
  - `chore/update-dependencies`
  - `chore/refactor-components`

---

## Workflow

### 1. Starting New Work

```bash
# Ensure you're on main and up to date
git checkout main
git pull origin main

# Create a new feature branch
git checkout -b feature/your-feature-name

# Verify you're on the new branch
git branch
```

### 2. Making Changes

```bash
# Make your changes
# Edit files, add features, fix bugs

# Check what changed
git status
git diff

# Stage changes
git add .

# Commit with descriptive message
git commit -m "feat: add bill template functionality

- Created template CRUD operations
- Added template selection UI
- Implemented template-to-bill conversion"

# Push to remote
git push origin feature/your-feature-name
```

### 3. Creating a Pull Request

```bash
# Using GitHub CLI
gh pr create \
  --title "Add bill template functionality" \
  --body "Implements bill templates feature.

## Changes
- Template CRUD operations
- Template selection UI
- Template-to-bill conversion

## Testing
- Tested template creation
- Tested template usage
- All tests passing

Closes #123"

# Or push and create PR on GitHub web interface
git push origin feature/your-feature-name
# Then visit GitHub and click "Create Pull Request"
```

### 4. Code Review & Merge

```bash
# After PR approval, merge via GitHub UI
# Or using CLI:
gh pr merge --squash --delete-branch

# Update your local main
git checkout main
git pull origin main

# Delete local feature branch
git branch -d feature/your-feature-name
```

---

## Commit Message Convention

Follow [Conventional Commits](https://www.conventionalcommits.org/):

### Format

```
<type>(<scope>): <subject>

<body>

<footer>
```

### Types

- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation changes
- `style:` Code style changes (formatting, no logic change)
- `refactor:` Code refactoring
- `perf:` Performance improvements
- `test:` Adding or updating tests
- `chore:` Maintenance tasks
- `ci:` CI/CD changes
- `security:` Security improvements

### Examples

```bash
# Feature
git commit -m "feat: add bill export to CSV functionality"

# Bug fix
git commit -m "fix: correct date calculation in bill sorting"

# Documentation
git commit -m "docs: update README with installation instructions"

# Security
git commit -m "security: exclude sensitive directories from public repo"

# With body
git commit -m "feat: add bill templates

- Created template model
- Implemented CRUD operations
- Added UI for template management

Closes #45"
```

---

## Pull Request Guidelines

### PR Title

Use the same convention as commit messages:

```
feat: Add bill template functionality
fix: Correct bill sorting algorithm
docs: Update deployment guide
```

### PR Description Template

```markdown
## Description
Brief description of what this PR does.

## Changes
- Change 1
- Change 2
- Change 3

## Testing
- [ ] Tested locally
- [ ] All tests passing
- [ ] No console errors
- [ ] Responsive design verified

## Screenshots (if applicable)
![Description](url-to-screenshot)

## Related Issues
Closes #123
Relates to #456
```

### PR Checklist

Before creating a PR:

- [ ] Code follows project style guidelines
- [ ] Self-review completed
- [ ] Comments added for complex logic
- [ ] Documentation updated
- [ ] Tests added/updated
- [ ] All tests passing
- [ ] No console errors or warnings
- [ ] Branch is up to date with main

---

## Branch Protection Rules

### Main Branch Protection

Enable these settings on GitHub:

1. **Require pull request reviews before merging**
   - Required approvals: 1 (for team projects)
   - Dismiss stale reviews when new commits are pushed

2. **Require status checks to pass**
   - CI/CD pipeline must pass
   - Linting must pass
   - Tests must pass

3. **Require branches to be up to date**
   - Branch must be current with main

4. **Do not allow bypassing the above settings**
   - Even admins should follow the process

5. **Require linear history**
   - Use squash merging for clean history

---

## Common Workflows

### Working on Multiple Features

```bash
# Feature 1
git checkout -b feature/feature-1
# ... work on feature 1 ...
git push origin feature/feature-1
# Create PR, but don't merge yet

# Switch to feature 2
git checkout main
git checkout -b feature/feature-2
# ... work on feature 2 ...
git push origin feature/feature-2
# Create PR

# Both PRs can be reviewed independently
```

### Updating Branch with Latest Main

```bash
# While on your feature branch
git checkout feature/your-feature

# Fetch latest main
git fetch origin main

# Rebase onto main (preferred)
git rebase origin/main

# Or merge main into your branch
git merge origin/main

# Push updated branch
git push origin feature/your-feature --force-with-lease
```

### Fixing Conflicts

```bash
# If conflicts occur during rebase/merge
# 1. Fix conflicts in your editor
# 2. Stage resolved files
git add .

# 3. Continue rebase
git rebase --continue

# Or complete merge
git commit

# 4. Push changes
git push origin feature/your-feature --force-with-lease
```

---

## GitHub CLI Shortcuts

### Create PR

```bash
# Interactive PR creation
gh pr create

# With details
gh pr create \
  --title "feat: add new feature" \
  --body "Description of changes"

# Draft PR
gh pr create --draft
```

### View PRs

```bash
# List all PRs
gh pr list

# View specific PR
gh pr view 123

# View PR in browser
gh pr view 123 --web
```

### Review PRs

```bash
# Checkout PR locally
gh pr checkout 123

# Approve PR
gh pr review 123 --approve

# Request changes
gh pr review 123 --request-changes --body "Please fix X"

# Comment on PR
gh pr review 123 --comment --body "Looks good!"
```

### Merge PRs

```bash
# Squash merge (recommended)
gh pr merge 123 --squash --delete-branch

# Merge commit
gh pr merge 123 --merge

# Rebase merge
gh pr merge 123 --rebase
```

---

## Best Practices

### 1. Keep Branches Small
- Focus on one feature/fix per branch
- Easier to review
- Faster to merge
- Less conflict potential

### 2. Update Frequently
- Pull main regularly
- Rebase your branch often
- Keep branches short-lived (< 1 week)

### 3. Write Good Commit Messages
- Clear and descriptive
- Follow conventional commits
- Explain the "why" not just the "what"

### 4. Review Your Own Code First
- Self-review before creating PR
- Check for console logs, commented code
- Verify tests pass
- Review the diff on GitHub

### 5. Respond to Review Comments
- Address all feedback
- Ask questions if unclear
- Mark conversations as resolved
- Thank reviewers

### 6. Clean Up After Merge
- Delete merged branches
- Close related issues
- Update documentation
- Celebrate! 🎉

---

## Emergency Procedures

### Reverting a Merge

```bash
# If a bad merge makes it to main
git checkout main
git pull origin main

# Create revert commit
git revert -m 1 <merge-commit-hash>

# Push revert
git push origin main
```

### Force Push (Use Carefully!)

```bash
# Only for feature branches, NEVER main
git push origin feature/your-feature --force-with-lease

# --force-with-lease is safer than --force
# It prevents overwriting others' work
```

---

## Tools & Automation

### Git Hooks

Use pre-commit hooks to enforce standards:

```bash
# .git/hooks/pre-commit
#!/bin/bash
npm run lint
npm run test
```

### GitHub Actions

Automate checks on PRs:

```yaml
name: PR Checks
on: [pull_request]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: npm ci
      - run: npm run lint
      - run: npm test
```

---

## Quick Reference

```bash
# Start new work
git checkout main && git pull && git checkout -b feature/name

# Save work
git add . && git commit -m "feat: description" && git push

# Create PR
gh pr create

# Update branch
git fetch origin main && git rebase origin/main

# Merge PR
gh pr merge --squash --delete-branch

# Clean up
git checkout main && git pull && git branch -d feature/name
```

---

## Resources

- [GitHub Flow](https://guides.github.com/introduction/flow/)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [GitHub CLI](https://cli.github.com/)
- [Git Best Practices](https://git-scm.com/book/en/v2)
