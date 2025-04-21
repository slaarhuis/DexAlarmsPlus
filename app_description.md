# App Description: DexAlarms+

## Introduction

DexAlarms+ is a specialized iOS application designed to enhance the alarm capabilities of the Dexcom One+ Continuous Glucose Monitoring (CGM) system. While the Dexcom One+ provides essential glucose monitoring functionality, it lacks the comprehensive alarm features found in the more expensive Dexcom G7 model. DexAlarms+ bridges this gap by providing advanced, customizable alarm functionality that works directly with Dexcom One+ sensors via Bluetooth, without requiring internet connectivity.

## Core Purpose

The primary purpose of DexAlarms+ is to provide Type 1 diabetics using the Dexcom One+ with enhanced alarm capabilities that help them better manage their condition. By offering customizable alarms, time-based profiles, and critical alerts that can override system settings, DexAlarms+ aims to improve safety, increase peace of mind, and enhance quality of life for users.

## Target Users

DexAlarms+ is designed for:
- Type 1 diabetics using the Dexcom One+ CGM system
- Caregivers and family members of Type 1 diabetics
- Healthcare providers who recommend CGM systems to their patients

## Key Features

### 1. Comprehensive Alarm Types

- **High/Low Glucose Alarms**: Customizable threshold settings for high and low blood glucose levels
- **Persistent Condition Alarms**: Alerts when glucose levels remain high or low for a specified duration
- **Rate of Change Alarms**: Notifications for rapid increases or decreases in glucose levels
- **Connection Status Alarms**: Alerts when the connection to the Dexcom sensor is lost

### 2. Alarm Customization

- **Sound Selection**: Choose from a variety of alarm sounds or use custom sounds
- **Volume Control**: Adjust alarm volume independently from system volume
- **Vibration Patterns**: Customize vibration patterns for different alarm types
- **Snooze Options**: Configurable snooze durations for different alarm types
- **Critical Mode**: Option to override iOS "Do Not Disturb" settings for critical alarms

### 3. Profile Management

- **Time-based Profiles**: Create separate profiles for day and night with different alarm settings
- **Day-specific Settings**: Configure different settings for specific days of the week
- **Automatic Profile Switching**: Profiles activate automatically based on time
- **Manual Override**: Temporarily switch profiles when needed

### 4. Sensor Connection

- **Direct Bluetooth Connection**: Connects directly to Dexcom One+ sensor
- **Offline Operation**: Functions without internet connectivity
- **Background Monitoring**: Continues monitoring glucose levels when app is in background
- **Automatic Reconnection**: Attempts to reconnect automatically if connection is lost

### 5. Data Visualization

- **Current Glucose Display**: Clear, easy-to-read display of current glucose level
- **Trend Indicators**: Visual indicators of glucose trend direction
- **Simple Trend Graph**: Basic visualization of recent glucose history
- **Alarm History**: Log of recent alarms and user responses

## Technical Implementation

DexAlarms+ is built as a native iOS application using Swift and SwiftUI. It leverages the G7SensorKit implementation from the iAPS project to establish and maintain a connection with Dexcom One+ sensors.

- **Minimum iOS Version**: 18.0
- **Frameworks**: CoreBluetooth, UserNotifications, HealthKit, CoreData
- **Dependencies**: G7SensorKit (forked from iAPS project)
- **Architecture**: MVVM (Model-View-ViewModel)
- **Data Storage**: CoreData for glucose readings and alarm history, UserDefaults for settings

## User Experience

The DexAlarms+ user experience is designed to be:

1. **Simple and Intuitive**: Clear interface with essential information prominently displayed
2. **Accessible**: High contrast options and support for VoiceOver
3. **Reliable**: Stable performance with focus on reliability for this critical health application
4. **Customizable**: Extensive options for personalization while maintaining ease of use
5. **Non-intrusive**: Designed to run in the background with minimal interaction required

## Privacy and Security

DexAlarms+ prioritizes user privacy and data security:

- All glucose data is stored locally on the device
- No data is transmitted to external servers
- No user account or registration required
- Complies with relevant health data privacy regulations

## Limitations and Disclaimers

- DexAlarms+ is not a replacement for the official Dexcom app
- The app is not affiliated with or endorsed by Dexcom, Inc.
- Users should continue to follow their healthcare provider's recommendations
- The app is not intended to be used for making medical decisions
- Performance may vary based on device, iOS version, and sensor condition

## Future Development Roadmap

- Apple Watch companion app
- Enhanced data visualization and statistics
- Integration with other diabetes management tools
- Additional alarm types and customization options
- Support for additional languages and regions
