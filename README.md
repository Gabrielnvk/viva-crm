# Viva CRM

A modern Customer Relationship Management (CRM) system built with React Native and Expo.

## About

This project is built from the [init-template-project](https://github.com/techlibs/init-template-project) template, providing a solid foundation with modern tooling and best practices.

## Features

- 📱 Cross-platform mobile app (iOS & Android)
- 🌐 Web support
- 💾 Real-time database with Convex
- 🎨 Modern UI with NativeWind (Tailwind CSS)
- 🔧 TypeScript support
- ✅ Testing setup with Jest
- 🚀 CI/CD ready

## Tech Stack

- **Framework**: React Native with Expo
- **Language**: TypeScript
- **Styling**: NativeWind (Tailwind CSS)
- **Database**: Convex
- **Testing**: Jest
- **Linting**: ESLint
- **Formatting**: Prettier

## Getting Started

### Prerequisites

- Node.js (v18 or later)
- pnpm (recommended) or npm
- Expo CLI

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Gabrielnvk/viva-crm.git
   cd viva-crm
   ```

2. Install dependencies:
   ```bash
   pnpm install
   ```

3. Copy environment variables:
   ```bash
   cp env.example .env.local
   ```

4. Start the development server:
   ```bash
   pnpm start
   ```

## Available Scripts

- `pnpm start` - Start the Expo development server
- `pnpm android` - Run on Android
- `pnpm ios` - Run on iOS
- `pnpm web` - Run on web
- `pnpm test` - Run tests
- `pnpm lint` - Run ESLint
- `pnpm format` - Format code with Prettier

## Project Structure

```
├── src/                 # Source code
│   ├── components/      # Reusable components
│   ├── screens/         # Screen components
│   ├── hooks/           # Custom hooks
│   ├── utils/           # Utility functions
│   └── types/           # TypeScript type definitions
├── assets/              # Static assets
├── docs/                # Documentation
└── convex/              # Convex backend functions
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Built with [init-template-project](https://github.com/techlibs/init-template-project)
- Powered by [Expo](https://expo.dev/)
- Styled with [NativeWind](https://www.nativewind.dev/)