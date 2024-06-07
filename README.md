# react-native-skadnetwork

react-native-skadnetwork is a React Native module designed for use on the iOS platform. This module allows you to integrate SKAdNetwork features into your React Native projects seamlessly. It is fully compatible with third-party SDKs such as Firebase Analytics and Facebook Meta. The module is tailored for all iOS versions and currently supports a model with six events.

## Features

- **Seamless Integration**: Easily integrate SKAdNetwork features into your React Native projects.
- **Third-Party Compatibility**: Fully compatible with third-party SDKs like Firebase Analytics and Facebook Meta.
- **Comprehensive iOS Support**: Designed specifically for all iOS versions.
- **Event Model**: Currently supports a model with six distinct events.

## Installation

### Using Yarn

```sh
yarn add react-native-skadnetwork
```

### Using NPM

```sh
npm install react-native-skadnetwork
```

## Usage

```js
import { logEventSKAdNetwork } from 'react-native-skadnetwork';

const events = {
  SIGNUP: 0,
  LEVEL_1: 1,
  LEVEL_2: 2,
  AD_VIEW: 3,
  PURCHASE: 4,
  INSTALL: 5,
};

logEventSKAdNetwork(events.PURCHASE);  // conversion value = 16 / byte value = 0, 0, 0, 0, 1, 0

OR 

logEventSKAdNetwork(0); // conversion value = 1 / byte value = 1, 0, 0, 0, 0, 0

```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT

---


### Project Explanation


### Project Explanation

**Project Name:** react-native-skadnetwork

**Project Purpose:** This project is developed to integrate SKAdNetwork features into React Native projects for the iOS platform. SKAdNetwork is Apple's technology for advertising tracking and measurement, and this module allows you to easily integrate these features into your React Native projects.

**Technologies Used:**
- React Native
- iOS (Objective-C/Swift)
- CocoaPods

**Key Features:**
- Seamless integration with SKAdNetwork features.
- Full compatibility with third-party SDKs such as Firebase Analytics and Facebook Meta.
- Tailored for all iOS versions.
- Currently supports six distinct events.

**Key Files and Directories:**
- `src/`: Contains the TypeScript code.
- `ios/`: Contains the iOS-specific code.
- `example/`: Example project demonstrating how to use the module.
- `SKAdNetworkExtension.podspec`: Podspec file containing the necessary settings for CocoaPods integration.

This documentation provides essential information about using and developing the project. If you need any additional information or assistance, please let me know!


