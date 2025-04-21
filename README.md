# DexAlarms+

An advanced alarm system for Dexcom One+ continuous glucose monitoring (CGM) users.

## Overview

DexAlarms+ addresses the alarm limitations of the Dexcom One+ CGM system by providing advanced, customizable alarm functionality that works directly with Dexcom One+ sensors via Bluetooth, without requiring internet connectivity.

While the Dexcom One+ provides essential glucose monitoring capabilities, it lacks the comprehensive alarm features found in the more expensive Dexcom G7. DexAlarms+ fills this gap with a focused, powerful alarm solution.

## Features

### Core Features

- **Comprehensive Alarm Types**:
  - High/low glucose alarms with customizable thresholds
  - Persistent condition alarms (high/low for specified duration)
  - Rate of change alarms
  - Connection status alarms

- **Alarm Customization**:
  - Sound selection
  - Volume control
  - Vibration patterns
  - Snooze options
  - Critical mode to override system settings

- **Profile Management**:
  - Time-based profiles (day/night)
  - Day-specific settings
  - Automatic profile switching
  - Manual override options

- **Sensor Connection**:
  - Direct Bluetooth connection to Dexcom One+
  - Offline operation
  - Background monitoring
  - Automatic reconnection

- **Data Visualization**:
  - Current glucose display
  - Simple trend graph
  - Alarm history

### Additional Features

- **Predictive Alerts**: Warn users before reaching critical levels
- **Smart Snooze**: Context-aware snooze functionality
- **Missed Reading Detection**: Alerts for skipped readings
- **Stealth Mode**: Discrete alerts for public situations
- **Insulin Dose Reminder**: Checks iOS Health for insulin doses
- **Hydration Reminders**: During prolonged high glucose
- **Emergency Contact Integration**: Quick access to emergency contacts
- **Apple Watch Complications**: Glanceable information
- **Widget Support**: iOS home screen widgets
- **Voice Announcements**: Spoken alerts
- **Glucose Statistics**: Basic time-in-range metrics

## Technical Details

DexAlarms+ is built as a native iOS application using Swift and SwiftUI. It leverages the G7SensorKit implementation from the iAPS project to establish and maintain a connection with Dexcom One+ sensors.

- **Minimum iOS Version**: 18.0
- **Frameworks**: CoreBluetooth, UserNotifications, HealthKit, CoreData
- **Dependencies**: G7SensorKit (forked from iAPS project)

## Installation

### Requirements
- iOS 18.0 or later
- iPhone with Bluetooth 4.0+ capability
- Dexcom One+ sensor

### Development Setup
1. Clone this repository
2. Open the project in Xcode
3. Build and run on your device

## Credits

This project builds upon the work of the diabetes DIY community, particularly:
- [iAPS](https://github.com/Artificial-Pancreas/iAPS) - For the G7SensorKit implementation
- [LoopKit](https://github.com/LoopKit/LoopKit) - For CGM management concepts

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Disclaimer

This software is not affiliated with or endorsed by Dexcom, Inc. This project is provided for educational and informational purposes only. It is not intended to be a substitute for professional medical advice, diagnosis, or treatment. Always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition or treatment.

Do not rely on this software for making medical decisions. The developers of this software are not responsible for any health outcomes related to its use.
