---
description: Standard operating procedure for Git workflow with branches and pull requests
---

# Git Workflow SOP

This workflow should be used for **all repositories** going forward. No direct commits to `main`.

## Daily Workflow

### Starting Your Day

```bash
# 1. Update main branch
git checkout main
git pull origin main

# 2. Create feature branch for today's work
git checkout -b feature/descriptive-name

# Examples:
# git checkout -b feature/add-user-dashboard
# git checkout -b bugfix/fix-login-timeout
# git checkout -b docs/update-api-docs
```

### During Development

```bash
# 1. Make changes to your code

# 2. Check status frequently
git status

# 3. Review your changes
git diff

# 4. Stage and commit (commit often!)
git add .
git commit -m "feat: add user dashboard component"

# 5. Push to remote (creates backup)
git push origin feature/descriptive-name
```

### End of Day / Ready for Review

```bash
# 1. Ensure all changes are committed and pushed
git status
git push origin feature/descriptive-name

# 2. Create pull request
gh pr create \
  --title "feat: Add user dashboard" \
  --body "Implements user dashboard with analytics.

## Changes
- Created dashboard component
- Added analytics charts
- Implemented data fetching

## Testing
- [x] Tested locally
- [x] All tests passing
- [x] Responsive design verified"

# 3. Request review (if working with team)
gh pr ready  # Marks draft PR as ready for review
```

### After PR Approval

```bash
# 1. Merge via GitHub CLI
gh pr merge --squash --delete-branch

# 2. Update local main
git checkout main
git pull origin main

# 3. Clean up local branch
git branch -d feature/descriptive-name

# 4. Start next feature
git checkout -b feature/next-feature
```

---

## Branch Naming Convention

### Format
```
<type>/<description>
```

### Types
- `feature/` - New features
- `bugfix/` - Bug fixes
- `hotfix/` - Critical production fixes
- `docs/` - Documentation
- `chore/` - Maintenance, refactoring
- `test/` - Adding tests

### Examples
```bash
feature/add-bill-templates
feature/export-to-csv
bugfix/fix-date-sorting
bugfix/authentication-timeout
hotfix/security-patch
docs/update-readme
docs/add-deployment-guide
chore/update-dependencies
chore/refactor-components
test/add-unit-tests
```

---

## Commit Message Format

### Structure
```
<type>: <subject>

<body (optional)>

<footer (optional)>
```

### Types
- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation
- `style:` - Formatting (no code change)
- `refactor:` - Code restructuring
- `perf:` - Performance improvement
- `test:` - Adding tests
- `chore:` - Maintenance
- `ci:` - CI/CD changes
- `security:` - Security improvements

### Examples

**Simple:**
```bash
git commit -m "feat: add bill export functionality"
git commit -m "fix: correct date calculation in sorting"
git commit -m "docs: update installation instructions"
```

**With body:**
```bash
git commit -m "feat: add bill template system

- Created template CRUD operations
- Implemented template selection UI
- Added template-to-bill conversion logic

Closes #45"
```

---

## Pull Request Process

### 1. Create PR

**Using GitHub CLI:**
```bash
gh pr create
```

**Or with details:**
```bash
gh pr create \
  --title "feat: Add bill templates" \
  --body "$(cat .github/PULL_REQUEST_TEMPLATE.md)"
```

### 2. PR Checklist

Before creating PR, verify:

- [ ] Code follows style guidelines
- [ ] Self-reviewed the changes
- [ ] Added comments for complex logic
- [ ] Updated documentation
- [ ] Added/updated tests
- [ ] All tests passing locally
- [ ] No console errors
- [ ] Branch up to date with main

### 3. During Review

- Respond to all comments
- Make requested changes
- Push updates to same branch
- Mark conversations as resolved
- Thank reviewers

### 4. After Approval

```bash
# Squash merge (preferred)
gh pr merge --squash --delete-branch

# Update local
git checkout main
git pull origin main
```

---

## Common Scenarios

### Scenario 1: Quick Bug Fix

```bash
# 1. Create bugfix branch
git checkout main
git pull origin main
git checkout -b bugfix/fix-login-issue

# 2. Fix the bug
# ... make changes ...

# 3. Commit and push
git add .
git commit -m "fix: resolve login timeout issue"
git push origin bugfix/fix-login-issue

# 4. Create PR
gh pr create --title "fix: Resolve login timeout issue"

# 5. After approval, merge
gh pr merge --squash --delete-branch

# 6. Clean up
git checkout main
git pull origin main
```

### Scenario 2: Large Feature

```bash
# 1. Create feature branch
git checkout -b feature/user-dashboard

# 2. Work in small commits
git commit -m "feat: add dashboard layout"
git push origin feature/user-dashboard

git commit -m "feat: add analytics charts"
git push origin feature/user-dashboard

git commit -m "feat: add data fetching logic"
git push origin feature/user-dashboard

# 3. Create PR when ready
gh pr create --title "feat: Add user dashboard"

# 4. Address review feedback
# ... make changes ...
git commit -m "refactor: improve chart performance"
git push origin feature/user-dashboard

# 5. Merge after approval
gh pr merge --squash --delete-branch
```

### Scenario 3: Update Branch with Latest Main

```bash
# Your feature branch is behind main
git checkout feature/your-feature
git fetch origin main
git rebase origin/main

# If conflicts, resolve them
# ... fix conflicts ...
git add .
git rebase --continue

# Force push (safe with --force-with-lease)
git push origin feature/your-feature --force-with-lease
```

### Scenario 4: Emergency Hotfix

```bash
# 1. Create hotfix from main
git checkout main
git pull origin main
git checkout -b hotfix/critical-security-fix

# 2. Make the fix
# ... fix the issue ...

# 3. Commit and push
git add .
git commit -m "security: patch authentication vulnerability"
git push origin hotfix/critical-security-fix

# 4. Create PR with urgency
gh pr create \
  --title "URGENT: Security patch for authentication" \
  --label "security,urgent"

# 5. After quick review, merge immediately
gh pr merge --squash --delete-branch

# 6. Verify deployment
# Check production to ensure fix is live
```

---

## AI Agent Workflow

### When Using Antigravity/Claude Code

**Always work in branches:**

```bash
# 1. Agent starts work
"Create a new feature branch for adding bill templates"

# 2. Agent makes changes
"Implement the bill template CRUD operations"

# 3. Agent commits
"Commit these changes with message: feat: add bill template CRUD"

# 4. Agent creates PR
"Create a pull request for this feature"

# 5. Human reviews PR
# Review on GitHub, approve or request changes

# 6. Agent merges (after approval)
"Merge the pull request and clean up the branch"
```

**Example conversation:**
```
You: "Add a feature to export bills to CSV"

Agent: "I'll create a feature branch and implement this."
[Creates feature/export-to-csv branch]
[Implements feature]
[Commits changes]
[Pushes to remote]
[Creates PR]

Agent: "Pull request created: #123. Ready for your review."

You: [Reviews on GitHub, approves]

You: "Please merge the PR"

Agent: [Merges PR, deletes branch, updates main]
```

---

## Protection Rules

### Enable on GitHub

For **all repositories**, enable these on the `main` branch:

1. **Settings → Branches → Add rule**

2. **Branch name pattern:** `main`

3. **Enable:**
   - ✅ Require a pull request before merging
   - ✅ Require approvals: 1 (for team) or 0 (for solo, but still use PRs)
   - ✅ Dismiss stale pull request approvals when new commits are pushed
   - ✅ Require status checks to pass before merging
   - ✅ Require branches to be up to date before merging
   - ✅ Require linear history
   - ✅ Do not allow bypassing the above settings

---

## Quick Reference Card

```bash
# === START NEW WORK ===
git checkout main && git pull
git checkout -b feature/name

# === SAVE WORK ===
git add .
git commit -m "type: description"
git push origin feature/name

# === CREATE PR ===
gh pr create

# === UPDATE BRANCH ===
git fetch origin main
git rebase origin/main
git push --force-with-lease

# === MERGE PR ===
gh pr merge --squash --delete-branch

# === CLEAN UP ===
git checkout main && git pull
git branch -d feature/name

# === VIEW STATUS ===
git status
gh pr list
gh pr view 123
```

---

## Troubleshooting

### "Branch is behind main"

```bash
git fetch origin main
git rebase origin/main
git push --force-with-lease
```

### "Merge conflicts"

```bash
# 1. Update branch
git fetch origin main
git rebase origin/main

# 2. Fix conflicts in editor
# Look for <<<<<<< HEAD markers

# 3. Stage resolved files
git add .

# 4. Continue rebase
git rebase --continue

# 5. Push
git push --force-with-lease
```

### "Accidentally committed to main"

```bash
# 1. Create branch from current state
git branch feature/oops-branch

# 2. Reset main to remote
git checkout main
git reset --hard origin/main

# 3. Switch to feature branch
git checkout feature/oops-branch

# 4. Push and create PR
git push origin feature/oops-branch
gh pr create
```

---

## Remember

✅ **DO:**
- Always work in feature branches
- Commit often with clear messages
- Create PRs for all changes
- Review your own code first
- Keep branches short-lived
- Update branch with main regularly

❌ **DON'T:**
- Commit directly to main
- Force push to main
- Create huge PRs (split them up)
- Leave branches open for weeks
- Skip the PR process
- Bypass protection rules

---

**Following this workflow ensures code quality, enables collaboration, and maintains a clean Git history!** 🚀
