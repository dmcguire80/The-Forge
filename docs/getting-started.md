# Getting Started with The Forge

Welcome to The Forge! This guide will help you set up and start using the hierarchical agent system in your projects.

## Prerequisites

- Git installed
- Claude Code or Antigravity
- A project to work on (or start a new one)

## Installation

### Method 1: Manual Installation

```bash
# 1. Clone The Forge
cd /path/to/your/projects
git clone https://github.com/dmcguire80/The-Forge.git

# 2. Navigate to your project
cd your-project

# 3. Create .agent directory if it doesn't exist
mkdir -p .agent

# 4. Copy agents and skills
cp -r ../The-Forge/agents .agent/
cp -r ../The-Forge/skills .agent/

# 5. Verify installation
ls .agent/agents
ls .agent/skills
```

### Method 2: Using the Setup Script

```bash
# 1. Clone The Forge
git clone https://github.com/dmcguire80/The-Forge.git

# 2. Run the setup script from your project
cd your-project
bash /path/to/The-Forge/scripts/setup-project.sh
```

## Verify Installation

Check that agents and skills are available:

```bash
# List agents
ls .agent/agents

# Should show:
# - team-lead.md
# - senior-frontend-engineer.md
# - devops-engineer.md
# - junior-engineer.md
# (and others)

# List skills
ls .agent/skills

# Should show:
# - react-typescript-dev/
# - firebase-auth/
# - firebase-hosting-deployment/
# - web-ui-design-system/
# (and others)
```

## First Steps

### 1. Understand the Hierarchy

The Forge uses a team structure:

- **Team Lead** - Handles complex features, delegates work
- **Senior Engineers** - Domain experts (Frontend, Backend)
- **Standard Engineers** - Solid execution (DevOps, Security)
- **Junior Engineers** - Simple, well-defined tasks

### 2. Try Your First Agent

Start with a simple task:

```
"Use the junior-engineer agent to format all TypeScript files"
```

Or let the Team Lead handle something complex:

```
"Use the team-lead agent to review the codebase and suggest improvements"
```

### 3. Let Agents Delegate

The Team Lead can automatically delegate to specialists:

```
"Use the team-lead agent to add a new user dashboard feature"
```

The Team Lead will:
1. Analyze the requirements
2. Delegate UI work to Senior Frontend Engineer
3. Delegate data work to Senior Backend Engineer
4. Coordinate the implementation
5. Review and approve

## Common Usage Patterns

### Pattern 1: Specific Agent for Specific Task

```
# UI work
"Use the senior-frontend-engineer agent to create a billing dashboard"

# Deployment
"Use the devops-engineer agent to set up Firebase Hosting"

# Simple tasks
"Use the junior-engineer agent to update the README"
```

### Pattern 2: Team Lead Coordination

```
# Complex features
"Use the team-lead agent to implement user authentication"

# Architecture decisions
"Use the team-lead agent to design the data model for invoices"

# Code reviews
"Use the team-lead agent to review this PR"
```

### Pattern 3: Let Antigravity Choose

```
# Just describe what you need
"Add a new feature to export bills to CSV"

# Antigravity will:
# 1. Assess complexity
# 2. Choose appropriate agent
# 3. Execute with right model
```

## Understanding Cost Optimization

The Forge automatically uses the right model for each task:

### Haiku ($0.25/M tokens) - 60x cheaper than Opus
- Code formatting
- Documentation updates
- Simple bug fixes
- Following established patterns

### Sonnet 4.5 ($3/M tokens) - 5x cheaper than Opus
- Standard feature development
- Deployment automation
- Security reviews
- Testing

### Opus 4.5 ($15/M tokens) - For complex work
- Architectural decisions
- Complex UI components
- Data modeling
- Integration work

**Example savings:**
- Format 100 files: $0.13 (Haiku) vs $7.50 (Opus) = **98% savings**
- Standard feature: $6 (Sonnet) vs $30 (Opus) = **80% savings**

## Customizing for Your Project

### Add Project-Specific Skills

Create a new skill in `.agent/skills/`:

```bash
mkdir .agent/skills/my-custom-skill
```

Create `SKILL.md`:

```markdown
---
name: My Custom Skill
description: Description of what this skill covers
---

# My Custom Skill

## Overview
[Your skill documentation]
```

### Modify Agent Behavior

Edit agent files in `.agent/agents/` to customize:
- Tools available
- Permission modes
- Skills assigned
- Behavior and approach

## Next Steps

1. **Read the docs:**
   - [Agent Hierarchy Guide](agent-hierarchy.md) - Detailed usage
   - [Cost Optimization](cost-optimization.md) - Save money
   - [Creating Skills](creating-skills.md) - Add your own

2. **Try it out:**
   - Start with simple tasks
   - Progress to complex features
   - Measure your cost savings

3. **Customize:**
   - Add project-specific skills
   - Adjust agent behaviors
   - Create new specialists

4. **Share:**
   - Contribute improvements
   - Share your skills
   - Help others

## Troubleshooting

### Agents not found

**Problem:** "Agent not found" error

**Solution:**
```bash
# Verify agents are in the right place
ls .agent/agents

# Should show .md files
# If not, re-run installation
```

### Skills not loading

**Problem:** Agent can't access skills

**Solution:**
```bash
# Verify skills directory
ls .agent/skills

# Each skill should have a SKILL.md file
# Check frontmatter is correct
```

### Wrong agent chosen

**Problem:** Antigravity picks wrong agent

**Solution:**
- Be more specific in your request
- Explicitly name the agent you want
- Update agent descriptions if needed

## Getting Help

- **Documentation:** Check [docs/](../)
- **Issues:** [GitHub Issues](https://github.com/dmcguire80/The-Forge/issues)
- **Discussions:** [GitHub Discussions](https://github.com/dmcguire80/The-Forge/discussions)

## What's Next?

Now that you're set up, explore:

- **[Agent Hierarchy Guide](agent-hierarchy.md)** - Deep dive into usage
- **[Cost Optimization](cost-optimization.md)** - Maximize savings
- **[Creating Skills](creating-skills.md)** - Build your own

Happy forging! 🔨
