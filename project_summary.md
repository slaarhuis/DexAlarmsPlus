# Project Summary: DexAlarms+

## Project Overview

DexAlarms+ is an iOS application designed to enhance the alarm capabilities of the Dexcom One+ Continuous Glucose Monitoring (CGM) system. The app addresses the limitations of the Dexcom One+ by providing advanced, customizable alarm functionality that works directly with the sensor via Bluetooth, without requiring internet connectivity.

## Key Research Findings

### Dexcom One+ vs G7 Comparison
The Dexcom One+ provides essential CGM functionality but lacks several advanced alarm features found in the more expensive G7 model:
- No predictive alerts
- Limited alarm customization
- No ability to override Do Not Disturb
- No delayed alerts for persistent conditions
- No rate of change alerts

### Technical Implementation Approach
The most viable approach for connecting to Dexcom One+ sensors is to leverage the G7SensorKit implementation from the iAPS project. This provides:
- Direct Bluetooth connection to Dexcom sensors
- Background operation capability
- Reliable connection management
- Open-source implementation that can be adapted

### User Experience Design
The app follows these design principles:
- Clear presentation of critical information
- Accessibility as a priority
- Adherence to iOS design guidelines
- Focus on core functionality without clutter
- Extensive customization options

## Core Features

1. **Comprehensive Alarm Types**
   - High/low glucose alarms with customizable thresholds
   - Persistent condition alarms (high/low for specified duration)
   - Rate of change alarms
   - Connection status alarms

2. **Alarm Customization**
   - Sound selection
   - Volume control
   - Vibration patterns
   - Snooze options
   - Critical mode to override system settings

3. **Profile Management**
   - Time-based profiles (day/night)
   - Day-specific settings
   - Automatic profile switching
   - Manual override options

4. **Additional Features**
   - Predictive alerts
   - Smart snooze
   - Missed reading detection
   - Stealth mode
   - Insulin dose reminder (with Health app integration)
   - And more (see additional_features.md)

## Technical Architecture

DexAlarms+ follows the MVVM (Model-View-ViewModel) architecture pattern with these key components:

1. **Models**
   - Data structures for glucose readings and alarm settings
   - Business logic for alarm evaluation

2. **Views**
   - SwiftUI interface components
   - Reactive UI that updates based on data changes

3. **ViewModels**
   - Bridge between Models and Views
   - Data transformation for display

4. **Services**
   - Dexcom sensor connection service
   - Notification service
   - Profile management service
   - Data storage service

## Implementation Plan

1. **Setup Phase**
   - Create iOS project with SwiftUI
   - Set minimum iOS version to 18.0
   - Configure necessary permissions
   - Set up MVVM folder structure

2. **Core Functionality Phase**
   - Implement Dexcom sensor connection using G7SensorKit
   - Create basic glucose display
   - Implement alarm evaluation logic
   - Add notification system

3. **Profile Management Phase**
   - Implement profile data structures
   - Create profile management UI
   - Add time-based profile switching
   - Implement day-specific settings

4. **Additional Features Phase**
   - Add predictive alerts
   - Implement missed reading detection
   - Add other selected features in priority order

5. **Testing and Refinement Phase**
   - Test with actual Dexcom One+ sensors
   - Optimize battery usage
   - Refine user interface
   - Address edge cases

## Technical Requirements

- **Minimum iOS Version**: 18.0
- **Frameworks**: CoreBluetooth, UserNotifications, HealthKit, CoreData
- **Dependencies**: G7SensorKit (forked from iAPS project)
- **Permissions**: Bluetooth, Notifications, Health data access
- **Background Modes**: Bluetooth central

## Conclusion

DexAlarms+ addresses a clear need for Dexcom One+ users by providing enhanced alarm capabilities that are currently only available in more expensive CGM systems. By leveraging existing open-source implementations and focusing on a clean, user-friendly design, the app will provide significant value to Type 1 diabetics who use the Dexcom One+ system.

The project is technically feasible, with a clear implementation path using the G7SensorKit from the iAPS project. The MVVM architecture ensures a maintainable codebase that can be extended with additional features over time.
