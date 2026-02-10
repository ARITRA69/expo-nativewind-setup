# Expo + NativeWind v5

A modern [Expo](https://expo.dev) project with [NativeWind v5](https://www.nativewind.dev/) and [Tailwind CSS v4](https://tailwindcss.com/), featuring file-based routing and automatic theming.

## Tech Stack

- **Expo ~54.0** - Universal React Native development platform
- **React 19.1.0** - Latest React with React Compiler enabled
- **NativeWind v5 (preview)** - Tailwind CSS for React Native
- **Tailwind CSS v4** - Utility-first CSS framework
- **Expo Router ~6.0** - File-based routing
- **TypeScript** - Type safety
- **React Native New Architecture** - Enabled by default

## Features

- Automatic dark/light theme switching based on system preferences
- Custom theme system with CSS variables
- File-based routing with Expo Router
- TypeScript support
- HugeIcons integration
- Automated Android emulator startup

## Get Started

1. **Install dependencies**

   ```bash
   bun install
   ```

2. **Start the development server**

   ```bash
   bun start
   ```

3. **Run on your platform**
   - **iOS**: `bun run ios`
   - **Android**: `bun run android` (automatically starts emulator if needed)
   - **Web**: `bun run web`

## Project Structure

```
├── app/                    # File-based routing
│   ├── _layout.tsx        # Root layout with theme provider
│   └── index.tsx          # Home screen
├── assets/                # Images, fonts, and other assets
├── utils/                 # Utilities and configuration
│   └── theme.ts           # Light/dark theme definitions
├── scripts/               # Custom scripts
│   └── start-android.sh   # Android emulator startup script
├── global.css             # Tailwind CSS and NativeWind styles
└── app.json               # Expo configuration

```

## Theming

This project uses a custom theme system with CSS variables:

- **Light/Dark mode**: Automatically switches based on system preferences
- **Theme variables**: Defined in `utils/theme.ts`
- **CSS variables**: Used in `global.css` via NativeWind

To customize the theme, edit the color values in `utils/theme.ts`.

## Available Scripts

- `bun start` - Start Expo development server
- `bun run android` - Start on Android (with automatic emulator launch)
- `bun run android:manual` - Start on Android without emulator auto-launch
- `bun run ios` - Start on iOS simulator
- `bun run web` - Start web version
- `bun run lint` - Run ESLint
- `bun run reset-project` - Reset to a blank project

## Learn More

- [Expo Documentation](https://docs.expo.dev/)
- [NativeWind v5 Documentation](https://www.nativewind.dev/)
- [Tailwind CSS v4 Documentation](https://tailwindcss.com/)
- [Expo Router Documentation](https://docs.expo.dev/router/introduction/)

## Community

- [Expo GitHub](https://github.com/expo/expo)
- [Expo Discord](https://chat.expo.dev)
