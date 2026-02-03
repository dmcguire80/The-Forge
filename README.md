# 🔨 The Forge

**A hierarchical AI agent system for cost-optimized software development. Master craftsmen of code.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
![Agents](https://img.shields.io/badge/Agents-7-orange)
![Skills](https://img.shields.io/badge/Skills-6-green)
![Cost Savings](https://img.shields.io/badge/Cost%20Savings-75--90%25-brightgreen)

---

## What is The Forge?

The Forge is a hierarchical AI agent system that mirrors real software development teams. It uses specialized agents with different expertise levels and appropriate AI models to deliver high-quality code at **75-90% lower cost** than traditional approaches.

### The Team

```
Team Lead (Opus 4.5) - Strategic leadership & architecture
├── Senior Frontend Engineer (Opus 4.5) - React, TypeScript, UI/UX
├── Senior Backend Engineer (Opus 4.5) - Firebase, APIs, data modeling
├── DevOps Engineer (Sonnet 4.5) - CI/CD, deployment, automation
├── Security Engineer (Sonnet 4.5) - AppSec, security audits
└── Junior Engineer (Haiku) - Simple tasks, formatting, documentation
```

### Cost Optimization

| Model | Cost per 1M tokens | Use Case | Savings vs Opus |
|-------|-------------------|----------|-----------------|
| Haiku | $0.25 | Simple tasks | 98% (60x cheaper) |
| Sonnet 4.5 | $3.00 | Standard work | 80% (5x cheaper) |
| Opus 4.5 | $15.00 | Complex work | Baseline |

**Estimated annual savings: ~$9,360** for active development

---

## Quick Start

### Installation

```bash
# Clone The Forge
git clone https://github.com/dmcguire80/The-Forge.git

# Copy to your project
cd your-project
cp -r ../The-Forge/agents .agent/agents
cp -r ../The-Forge/skills .agent/skills

# Or use the setup script
bash ../The-Forge/scripts/setup-project.sh
```

### Using Agents

```bash
# Use a specific agent
"Use the senior-frontend-engineer agent to create a dashboard component"

# Let Team Lead delegate
"Use the team-lead agent to implement user authentication"

# Direct task (Antigravity chooses)
"Add a new bill template feature"
```

---

## What's Included

### 🤖 Agents (7)

- **Team Lead** - Strategic leadership, delegation, architectural decisions
- **Senior Frontend Engineer** - React, TypeScript, UI/UX expertise
- **Senior Backend Engineer** - Firestore, APIs, data modeling
- **DevOps Engineer** - CI/CD, deployment, automation
- **Security Engineer** - AppSec, security audits, vulnerability scanning
- **Project Manager** - Task planning, coordination, progress tracking
- **Junior Engineer** - Simple tasks, formatting, documentation

### 📚 Skills (6)

- **React TypeScript Development** - Component architecture, hooks, best practices
- **Firebase Authentication** - Email/password auth, password reset, protected routes
- **Firebase Hosting Deployment** - GitHub Actions, custom domains, SSL
- **Web UI Design System** - Dark theme, glassmorphism, component patterns
- **Firestore Data Modeling** - User-scoped collections, security rules, queries
- **Project Setup & Standards** - ESLint, Prettier, TypeScript configuration

### 📖 Documentation

- **Agent Hierarchy Guide** - How to use agents, task routing, examples
- **Getting Started** - Installation and setup
- **Cost Optimization** - Model selection strategies
- **Skill Development** - How to create new skills

### 🛠️ Templates

- **React + Firebase App** - Complete starter template
- **Vite + TypeScript** - Minimal TypeScript setup

### 📜 Scripts

- **setup-project.sh** - Install The Forge in any project
- **create-agent.sh** - Generate new agent definition
- **create-skill.sh** - Generate new skill

---

## Example Workflows

### New Feature Development

```
User: "Add bill templates feature"

1. Team Lead (Opus):
   - Analyzes requirements
   - Creates architectural plan
   - Delegates tasks

2. Senior Frontend Engineer (Opus):
   - Builds UI components
   - Implements forms
   - Uses web-ui-design-system skill

3. Senior Backend Engineer (Opus):
   - Designs Firestore schema
   - Creates security rules
   - Uses firestore-data-modeling skill

4. Junior Engineer (Haiku):
   - Formats code
   - Updates documentation

5. DevOps Engineer (Sonnet):
   - Updates CI/CD
   - Verifies deployment

6. Team Lead (Opus):
   - Reviews and approves

Cost: ~$50 (vs $200 if all Opus)
Savings: 75%
```

### Bug Fix

```
User: "Fix bill sorting bug"

1. Team Lead → Delegates to Junior Engineer (simple bug)
2. Junior Engineer (Haiku) → Fixes bug
3. Team Lead → Quick review

Cost: ~$2 (vs $15 if all Opus)
Savings: 87%
```

---

## Benefits

### For Development
- ✅ Specialized expertise for each domain
- ✅ Efficient task delegation
- ✅ Consistent code quality
- ✅ Faster development cycles

### For Cost Management
- ✅ 75-90% cost reduction on routine tasks
- ✅ Appropriate model for each task
- ✅ Measurable ROI on AI assistance
- ✅ Scalable cost structure

### For Teams
- ✅ Reusable patterns across projects
- ✅ Consistent design systems
- ✅ Standard deployment processes
- ✅ Shared knowledge base

---

## Documentation

- **[Agent Hierarchy Guide](docs/agent-hierarchy.md)** - Complete usage guide
- **[Getting Started](docs/getting-started.md)** - Installation and setup
- **[Cost Optimization](docs/cost-optimization.md)** - Model selection strategies
- **[Creating Skills](docs/creating-skills.md)** - Skill development guide
- **[Agent Definitions](agents/)** - Individual agent documentation

---

## Project Structure

```
The-Forge/
├── README.md                    # This file
├── LICENSE                      # MIT License
├── agents/                      # Agent definitions
│   ├── team-lead.md
│   ├── senior-frontend-engineer.md
│   ├── senior-backend-engineer.md
│   ├── devops-engineer.md
│   ├── security-engineer.md
│   ├── project-manager.md
│   └── junior-engineer.md
├── skills/                      # Reusable skills
│   ├── react-typescript-dev/
│   ├── firebase-auth/
│   ├── firebase-hosting-deployment/
│   ├── web-ui-design-system/
│   ├── firestore-data-modeling/
│   └── project-setup-standards/
├── templates/                   # Project templates
│   ├── react-firebase-app/
│   └── vite-typescript-starter/
├── docs/                        # Documentation
│   ├── agent-hierarchy.md
│   ├── getting-started.md
│   ├── cost-optimization.md
│   └── creating-skills.md
└── scripts/                     # Helper scripts
    ├── setup-project.sh
    ├── create-agent.sh
    └── create-skill.sh
```

---

## Contributing

Contributions are welcome! Whether it's:
- New agent definitions
- Additional skills
- Improved documentation
- Bug fixes
- Feature requests

Please feel free to open an issue or submit a pull request.

---

## License

MIT License - see [LICENSE](LICENSE) file for details.

---

## Acknowledgments

Built with ❤️ using:
- [Claude Code](https://code.claude.com) - AI-powered development
- [Anthropic Claude](https://anthropic.com) - Language models (Opus, Sonnet, Haiku)
- [Firebase](https://firebase.google.com) - Backend infrastructure
- [React](https://react.dev) - Frontend framework

---

## Support

- **Documentation:** [docs/](docs/)
- **Issues:** [GitHub Issues](https://github.com/dmcguire80/The-Forge/issues)
- **Discussions:** [GitHub Discussions](https://github.com/dmcguire80/The-Forge/discussions)

---

**The Forge** - *Where ideas are forged into reality* 🔨
