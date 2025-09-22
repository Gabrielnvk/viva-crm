# React Native Expo + Convex Template

This is a production-ready [React Native](https://reactnative.dev/) project built with [Expo](https://expo.dev/), [Convex](https://convex.dev), and [React Native Reusables](https://reactnativereusables.com).

## 🚀 Quick Start Options

### CodeSandbox (Web Development)
[![Open in CodeSandbox](https://codesandbox.io/static/img/play-codesandbox.svg)](https://codesandbox.io/p/github/your-username/your-repo-name)

> **Note**: Replace `your-username/your-repo-name` with your actual GitHub repository details

Perfect for quick prototyping and web development. Mobile simulators not available, but you can test responsive web behavior.

### Local Development
```bash
npx react-native-reusables/cli@latest init -t my-app
```

For full mobile development with iOS/Android simulators.

## Scaffolding Your Project

This template includes a scaffolding system to rename the project. See [SCAFFOLDING.md](./SCAFFOLDING.md) for detailed instructions.

Quick start:

```bash
make scaffold PROJECT_NAME=your-app-name DISPLAY_NAME="Your App Name"
```

## Getting Started

To run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

This will start the Expo Dev Server. Open the app in:

- **iOS**: press `i` to launch in the iOS simulator _(Mac only)_
- **Android**: press `a` to launch in the Android emulator
- **Web**: press `w` to run in a browser

You can also scan the QR code using the [Expo Go](https://expo.dev/go) app on your device. This project fully supports running in Expo Go for quick testing on physical devices.

## Convex Quickstart

This template ships with [Convex](https://docs.convex.dev/) pre-integrated for data and auth. Follow these steps to get it running locally:

1) Start Convex (first time will prompt to log in and create/link a project):

```bash
pnpm convex:dashboard
# or
npx convex dev
```

- This launches the local Convex dev server and dashboard, and prints a deployment URL like `https://<slug>.convex.cloud`.

2) Configure the app to talk to your Convex deployment by setting the public URL:

```bash
# Create .env if you don't have one yet
printf "EXPO_PUBLIC_CONVEX_URL=\"https://<your-deployment>.convex.cloud\"\n" >> .env
printf "CONVEX_SITE_URL=\"https://<your-deployment>.convex.cloud\"\n" >> .env
printf "JWT_PRIVATE_KEY=\"<your-jwt-private-key>\"\n" >> .env
printf "JWKS=\"<your-jwks>\"\n" >> .env
printf "CONVEX_DEPLOYMENT=\"<your-deployment>\"\n" >> .env
```

- Only variables prefixed with `EXPO_PUBLIC_` are exposed to the client. The app reads this in `src/client/shared/providers/ConvexProvider.tsx`.

3) Run the app (in another terminal):

```bash
pnpm dev
```

4) (Optional) Initialize default roles and grant an initial admin:

- Open the Convex dashboard URL printed by step 1.
- In Functions, run `initialization:initializeSystem`.
- Sign up/sign in once via the app.
- Run `initialization:assignInitialAdminRole` to promote the first user.

5) When you change `src/server/schema.ts`, keep the Convex dev server running to regenerate types in `src/server/_generated/`. If needed, you can also run:

```bash
npx convex codegen
```

6) Deploying Convex (optional):

```bash
npx convex deploy
# Then update EXPO_PUBLIC_CONVEX_URL to the production deployment URL
```

## 🏗️ Architecture

This template follows a **Domain-Driven Design (DDD)** approach with clear separation of concerns:

```
src/
├── app/                  # Expo Router (routing only)
├── client/               # Client-side logic & UI (DDD by context)
│   ├── shared/
│   └── <boundedContext>/ # e.g., auth, projects
└── server/               # Convex backend (DDD by context)
    ├── shared/
    └── <boundedContext>/
```

## 📖 Documentation

Comprehensive documentation is available in the `docs/` folder:

- [Architecture Overview](docs/architecture/overview.md)
- [Client Architecture](docs/architecture/client.md)
- [Server Architecture](docs/architecture/server.md)
- [UI Guidelines](docs/ui/overview.md)

## Adding components

You can add more reusable components using the CLI:

```bash
npx react-native-reusables/cli@latest add [...components]
```

> e.g. `npx react-native-reusables/cli@latest add input textarea`

If you don't specify any component names, you'll be prompted to select which components to add interactively. Use the `--all` flag to install all available components at once.

## ✨ Features

- ⚛️ **Framework**: React Native with [Expo Router](https://expo.dev/router)
- 🗄️ **Backend**: [Convex](https://convex.dev) (realtime database + serverless functions)
- 🎨 **Styling**: [Tailwind CSS](https://tailwindcss.com/) via [Nativewind](https://www.nativewind.dev/)
- 🧩 **UI Components**: [React Native Reusables](https://github.com/founded-labs/react-native-reusables) (shadcn/ui inspired)
- 🔐 **Authentication**: Convex Auth with multiple providers
- 🏗️ **Architecture**: Domain-Driven Design (DDD)
- 🚀 **New Architecture**: Enabled for performance
- 🔥 **Edge to Edge**: Modern Android experience
- 📱 **Cross-Platform**: iOS, Android, and Web support
- 🧪 **Testing**: Jest + React Native Testing Library
- 📦 **Package Manager**: PNPM for faster installs

## Learn More

To dive deeper into the technologies used:

- [React Native Docs](https://reactnative.dev/docs/getting-started)
- [Expo Docs](https://docs.expo.dev/)
- [Nativewind Docs](https://www.nativewind.dev/)
- [React Native Reusables](https://reactnativereusables.com)

## Deploy with EAS

The easiest way to deploy your app is with [Expo Application Services (EAS)](https://expo.dev/eas).

- [EAS Build](https://docs.expo.dev/build/introduction/)
- [EAS Updates](https://docs.expo.dev/eas-update/introduction/)
- [EAS Submit](https://docs.expo.dev/submit/introduction/)

---

If you enjoy using React Native Reusables, please consider giving it a ⭐ on [GitHub](https://github.com/founded-labs/react-native-reusables). Your support means a lot!